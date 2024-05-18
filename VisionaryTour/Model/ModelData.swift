//
//  ModelData.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/06.
//

import Foundation
import Observation
import MapKit
import RealityKit

class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData.json")
}

