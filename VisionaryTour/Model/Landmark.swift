//
//  PlaceListItem.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import Foundation

struct Landmark: Identifiable, Codable {
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
    }
}
