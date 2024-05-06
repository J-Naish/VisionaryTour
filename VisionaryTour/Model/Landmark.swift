//
//  PlaceListItem.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import Foundation

struct Landmark: Identifiable {
    var id = UUID()
    var name: String
    var coordinates: Coordinates
    var isFavorite: Bool
    var country: Country
    var state: String
    var description: String

    var tags: [Tag]
    enum Tag: String, CaseIterable, Codable {
        case forest = "Forest"
        case seaside = "Seaside"
        case city = "City"
        case countryside = "Countryside"
        case birds = "Birds"
        case cars = "Cars"
    }
}
