//
//  PlaceListItem.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import Foundation
import MapKit

struct Landmark: Identifiable, Codable, Hashable {
    var name: Localization
    var coordinates: Coordinates
    var country: Country
    var description: Localization
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
        let apiKey = EnvironmentVariables.cloudflareApiKey
        let imageUrlString = "https://imagedelivery.net/\(apiKey)/\(imageId)/public"
        guard let url = URL(string: imageUrlString) else {
            fatalError("Invalid URL string")
        }
        return url
    }
}
