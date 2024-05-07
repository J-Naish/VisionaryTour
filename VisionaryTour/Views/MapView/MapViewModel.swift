//
//  MapViewModel.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/07.
//

import Foundation
import Combine

class MapViewModel: ObservableObject {
    @Published var mapType: String = "roadmap"
    @Published var zoomLevel: Int = 10
    
    func updateMapType(_ type: String) {
        if type == "satellite" {
            mapType = "hybrid"
        } else {
            mapType = type
        }
    }
    
    func zoomIn() {
        zoomLevel += 1
    }
    
    func zoomOut() {
        zoomLevel -= 1
    }
    
}
