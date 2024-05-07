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
    
    func updateMapType(_ type: String) {
        if type == "satellite" {
            mapType = "hybrid"
        } else {
            mapType = type
        }
    }
}
