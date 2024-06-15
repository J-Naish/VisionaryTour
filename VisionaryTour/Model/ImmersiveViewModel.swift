//
//  ImmersiveViewModel.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/16.
//


import Observation
import MapKit
import RealityKit

@Observable
class ImmersiveViewModel {
    
    let apiKey = ProcessInfo.processInfo.environment["GoOGLE_MAPS_API_KEY"]!

    var selectedPlaceInfo: PlaceInfo {
        didSet {
            Task {
                try await setSnapshot()
            }
        }
    }
    
    var progress: Double = 1.0

    private let width = 4096
    private let height = 2048

    private var contentEntity = Entity()
    private var modelEntity: ModelEntity? = nil
    private var snapshotImage: UIImage = .init()
    
    
    init(placeInfo: PlaceInfo) {
        self.selectedPlaceInfo = placeInfo
    }

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
        let rotatation = Float.pi / 2
        modelEntity.transform.rotation *= simd_quatf(angle: rotatation, axis: SIMD3<Float>(0, 1, 0))

        contentEntity.addChild(modelEntity)
        self.modelEntity = modelEntity

        return contentEntity
    }

    func setSnapshot() async throws {
        guard let panoId = selectedPlaceInfo.panoId else { return }

        Task { @MainActor in
            snapshotImage = try await fetchImage(panoId: panoId)

            guard let cgImage = snapshotImage.cgImage else { return }
            guard let texture = try? await TextureResource.generate(from: cgImage, options: TextureResource.CreateOptions.init(semantic: nil)) else { return }

            var material = modelEntity?.model?.materials[0] as! UnlitMaterial
            material.color = .init(texture: MaterialParameters.Texture(texture))
            modelEntity?.model?.materials[0] = material
        }
    }


    private func createSession() -> String? {
        let url = URL(string: "https://tile.googleapis.com/v1/createSession?key=\(apiKey)")!
        let body = ["mapType": "streetview", "language": "en-US", "region": "US"]
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let semaphore = DispatchSemaphore(value: 0)
        var sessionId: String?
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            } else if let data = data {
                do {
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let session = json["session"] as? String {
                        sessionId = session
                    }
                } catch {
                    print("Error decoding response: \(error)")
                }
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return sessionId
    }

    
    private func fetchImage(panoId: String) async throws -> UIImage {
        var images: [UIImage] = []
        
        let yNum = 4
        let xNum = 8
        
        let totalImages = yNum * xNum
        var fetchedImages = 0

        var baseUrl = URL(string: "https://streetviewpixels-pa.googleapis.com/v1/tile")!
        let paramsCommon: [URLQueryItem] = [
            URLQueryItem(name: "cb_client", value: "maps_sv.tactile"),
            URLQueryItem(name: "panoid", value: panoId),
            URLQueryItem(name: "zoom", value: "\(3)")
        ]
        baseUrl.append(queryItems: paramsCommon)

        for y in 0 ..< yNum {
            for x in 0 ..< xNum {
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
                    fetchedImages += 1
                    progress = Double(fetchedImages) / Double(totalImages)
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
            let yIndex = index / xNum
            let xIndex = index % xNum
            let cgImage = image.cgImage?.cropping(to: CGRect(x: 0, y: 0, width: size, height: size))
            UIImage(cgImage: cgImage!).draw(at: CGPoint(x: CGFloat(xIndex * size), y: CGFloat(yIndex * size)))
        }

        if let uiImage = UIGraphicsGetImageFromCurrentImageContext() {
            return uiImage
        } else {
            return UIImage()
        }
    }
}


