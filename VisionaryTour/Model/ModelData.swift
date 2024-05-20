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
import WebKit


class ModelData: ObservableObject {
    
    // MARK: landmark data
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    
    
    // MARK: map web view data
    @Published var mapType: String = "roadmap"
    @Published var zoomLevel: Double = 10.0
    @Published var zoomLevelChanged = false
    @Published var pinnedPlace: PlaceInfo = defaultPlace
    
    var webView: WKWebView?
    
    func updateMapType(_ type: String) {
        if type == "satellite" {
            mapType = "hybrid"
        } else {
            mapType = type
        }
    }
    
    func zoomIn() {
        zoomLevel += 1
        zoomLevelChanged = true
    }
    
    func zoomOut() {
        zoomLevel -= 1
        zoomLevelChanged = true
    }
    
    func searchLocation(_ location: String) {
        let jsCode = "setLocation('\(location)')"
        if let webView = webView {
            webView.evaluateJavaScript(jsCode)
        } else {
            return
        }
    }
    
}

