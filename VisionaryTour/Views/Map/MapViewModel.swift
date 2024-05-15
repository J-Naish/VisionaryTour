//
//  MapViewModel.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/07.
//

import Foundation
import Combine
import WebKit

class MapViewModel: ObservableObject {
    @Published var mapType: String = "roadmap"
    @Published var zoomLevel: Double = 10.0
    @Published var zoomLevelChanged = false
    @Published var panoId: String? = nil
    
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
