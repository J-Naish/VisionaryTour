//
//  PlaceListItem.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import Foundation
import MapKit

struct Landmark: Identifiable, Codable, Hashable {
    var id = UUID()
    var name: String
    var coordinates: Coordinates
    var isFavorite: Bool
    var country: Country
    var state: String
    var description: String

    var categories: [Category]
    enum Category: String, CaseIterable, Codable {
        case religious
        case historical
        case woods
        case wilderness
        case sea
        case river
        case lake
        case glacier
        case worldHeritage
        case park
        case mountain
        case cultural
        case nature
        case city
        case architecture
        case desert
        case crowd
    }
    
    var panoId: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decodeIfPresent(UUID.self, forKey: .id) ?? UUID()
        name = try container.decode(String.self, forKey: .name)
        coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        isFavorite = try container.decode(Bool.self, forKey: .isFavorite)
        country = try container.decode(Country.self, forKey: .country)
        state = try container.decode(String.self, forKey: .state)
        description = try container.decode(String.self, forKey: .description)
        categories = try container.decode([Category].self, forKey: .categories)
        panoId = try container.decode(String.self, forKey: .panoId)
    }
    
    var placeInfo: PlaceInfo {
        PlaceInfo(locationCoordinae: CLLocationCoordinate2DMake(coordinates.longitude, coordinates.longitude), panoId: panoId)
    }
    
}
