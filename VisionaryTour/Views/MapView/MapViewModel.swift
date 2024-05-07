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
    @Published var zoomLevel: Int = 10
    
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
    }
    
    func zoomOut() {
        zoomLevel -= 1
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
