//
//  PlaceListItem.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

struct Landmark {
    var coordinate: Coordinate
    var isFavorite: Bool
    var country: Country
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
