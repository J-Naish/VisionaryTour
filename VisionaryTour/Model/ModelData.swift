//
//  ModelData.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/06.
//

import Foundation
import Observation
import MapKit
import RealityKit

class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    
    var selectedPlaceInfo: PlaceInfo?
    var placeInfoList: [PlaceInfo] {
        landmarks.map { landmark in
            PlaceInfo(id: landmark.id, coordinates: landmark.coordinates, panoId: landmark.panoId)
        }
    }
    
    private let width = 4096
    private let height = 2048
    
    private var contentEntity = Entity()
    private var modelEntity: ModelEntity? = nil
    private var snapshotImage: UIImage = .init()
    
    
    func setupContentEntity() -> Entity {
        if let modelEntity = self.modelEntity {
            modelEntity.removeFromParent()
        }

        let modelEntity = ModelEntity()

        let material = UnlitMaterial(color: .black)
        modelEntity.components.set(ModelComponent(
            mesh: .generateSphere(radius: 1E3),
            materials: [material]
        ))
        modelEntity.scale *= .init(x: -1, y: 1, z: 1)
        modelEntity.transform.translation += SIMD3<Float>(0.0, 1.0, 0.0)

        contentEntity.addChild(modelEntity)
        self.modelEntity = modelEntity

        return contentEntity
    }
    
    
    func setSnapshot() async throws {
        guard let placeInfo = selectedPlaceInfo else { return }

        Task { @MainActor in
            snapshotImage = try await fetchImage(panoId: placeInfo.panoId)

            guard let cgImage = snapshotImage.cgImage else { return }
            guard let texture = try? await TextureResource.generate(from: cgImage, options: TextureResource.CreateOptions.init(semantic: nil)) else { return }

            var material = modelEntity?.model?.materials[0] as! UnlitMaterial
            material.color = .init(texture: MaterialParameters.Texture(texture))
            modelEntity?.model?.materials[0] = material
        }
    }
    
    func updatePlaceInfo(id: UUID, coordinates: Coordinates, panoId: String) {
        self.selectedPlaceInfo = PlaceInfo(id: id, coordinates: coordinates, panoId: panoId)
    }
    
    
    private func fetchImage(panoId: String) async throws -> UIImage {
        
        var images: [UIImage] = []
        
        var baseUrl = URL(string: "https://streetviewpixels-pa.googleapis.com/v1/tile")!
        let paramsCommon: [URLQueryItem] = [
            URLQueryItem(name: "cb_client", value: "maps_sv.tactile"),
            URLQueryItem(name: "panoid", value: panoId),
            URLQueryItem(name: "zoom", value: "\(3)")
        ]
        baseUrl.append(queryItems: paramsCommon)
        
        for y in 0..<4 {
            for x in 0..<8 {
                var _url = baseUrl
                let params: [URLQueryItem] = [
                    URLQueryItem(name: "x", value: "\(x)"),
                    URLQueryItem(name: "y", value: "\(y)")
                ]
                _url.append(queryItems: params)

                let request = URLRequest(url: _url)
                let (data, response) = try await URLSession.shared.data(for: request)
                guard let httpResponse = response as? HTTPURLResponse,
                      (200...299).contains(httpResponse.statusCode) else {
                    throw APIError.networkError
                }

                if let image = UIImage(data: data) {
                    images.append(image)
                }
            }
        }

        UIGraphicsBeginImageContext(CGSize(width: width, height: height))
        defer { UIGraphicsEndImageContext() }

        guard let ctx = UIGraphicsGetCurrentContext() else { return UIImage() }

        ctx.setFillColor(UIColor.black.cgColor)
        ctx.fill(CGRect(x: 0, y: 0, width: width, height: height))

        let size = 512

        for (index, image) in images.enumerated() {
            let yIndex = index / 8
            let xIndex = index - yIndex * 8
            let cgImage = image.cgImage?.cropping(to: CGRect(x: 0, y: 0, width: size, height: size))
            UIImage(cgImage: cgImage!).draw(at: CGPoint(x: CGFloat(xIndex * size), y: CGFloat(yIndex * size)))
        }

        if let uiImage = UIGraphicsGetImageFromCurrentImageContext() {
            return uiImage
        } else {
            return UIImage()
        }
    }
    
    private func fetchImageWithCoordinates(coordinates: Coordinates) async throws -> UIImage {
        
        let streetViewMetaDataURL = "https://maps.googleapis.com/maps/api/streetview/metadata"
        let apiKey = "AIzaSyCvNpWrz0mA6MU_NgB7n-WzgD4LU3izPn8"
        
        var metadataUrlComponents = URLComponents(string: streetViewMetaDataURL)!
        metadataUrlComponents.queryItems = [
            URLQueryItem(name: "location", value: "\(coordinates.latitude),\(coordinates.longitude)"),
            URLQueryItem(name: "key", value: apiKey)
        ]
        
        let metadataRequest = URLRequest(url: metadataUrlComponents.url!)
        let (metadataData, metadataResponse) = try await URLSession.shared.data(for: metadataRequest)
        
        guard let metadataHttpResponse = metadataResponse as? HTTPURLResponse,
              (200...299).contains(metadataHttpResponse.statusCode) else {
            throw APIError.networkError
        }
        
        let metadataJson = try JSONSerialization.jsonObject(with: metadataData, options: []) as? [String: Any]
        guard let panoId = metadataJson?["pano_id"] as? String else {
            throw APIError.invalidResponse
        }
        
        return try await fetchImage(panoId: panoId)
    }
    
}



enum APIError: Error {
    case networkError
    case unknow
    case invalidResponse
    
    var title: String {
        switch self {
        case .networkError:
            return "network error"
        case .unknow:
            return "unknow error"
        case .invalidResponse:
            return "invalid response"
        }
    }
}


struct PlaceInfo: Identifiable, Hashable {
    static func == (lhs: PlaceInfo, rhs: PlaceInfo) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    let id: UUID
    let coordinates: Coordinates
    let panoId: String
}



func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
