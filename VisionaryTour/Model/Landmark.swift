//
//  PlaceListItem.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import Foundation
import MapKit

struct Landmark: Identifiable, Codable, Hashable {
    var name: String
    var coordinates: Coordinates
    var isFavorite: Bool
    var country: Country
    var state: String
    var description: String
    var categories: [Category]
    var panoId: String
    var imageId: String
    var id: UUID {
        UUID(uuidString: panoId.hashStringToUUID())!
    }
    var placeInfo: PlaceInfo {
        PlaceInfo(locationCoordinate: CLLocationCoordinate2DMake(coordinates.longitude, coordinates.longitude), panoId: panoId)
    }
    var imageURL: URL {
        let apiKey = ProcessInfo.processInfo.environment["CLOUDFLARE_API_KEY"]!
        let imageUrlString = "https://imagedelivery.net/\(apiKey)/\(imageId)/public"
        guard let url = URL(string: imageUrlString) else {
            fatalError("Invalid URL string")
        }
        return url
    }
}
