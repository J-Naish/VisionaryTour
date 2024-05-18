//
//  PlaceInfo.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/16.
//

import MapKit

struct PlaceInfo: Identifiable, Hashable {
    let id: String
    var locationCoordinate: CLLocationCoordinate2D
    var panoId: String?
    
    init(locationCoordinate:CLLocationCoordinate2D, panoId: String?) {
        self.locationCoordinate = locationCoordinate
        self.panoId = panoId
        self.id = panoId ?? UUID().uuidString
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: PlaceInfo, rhs: PlaceInfo) -> Bool {
        lhs.id == rhs.id
    }
}

let defaultPlace = PlaceInfo(locationCoordinate: CLLocationCoordinate2D(), panoId: nil)
