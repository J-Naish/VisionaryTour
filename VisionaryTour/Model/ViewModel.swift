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

extension String {
    func containsIgnoringCase(_ find: String) -> Bool {
        return self.range(of: find, options: .caseInsensitive) != nil
    }
}

class ViewModel: ObservableObject {
    
    // MARK: landmark data
    @Published var landmarks: [Landmark] = load("landmarkData.json")
    
    // function to search landmarks
    func searchLandmark(_ searchText: String) -> [Landmark] {
        let lowercasedSearchText = searchText.lowercased()
        
        return landmarks.filter { landmark in
            let nameContains = landmark.name.en.containsIgnoringCase(lowercasedSearchText) ||
                landmark.name.zh.containsIgnoringCase(lowercasedSearchText) ||
                landmark.name.fr.containsIgnoringCase(lowercasedSearchText) ||
                landmark.name.de.containsIgnoringCase(lowercasedSearchText) ||
                landmark.name.ja.containsIgnoringCase(lowercasedSearchText) ||
                landmark.name.pt.containsIgnoringCase(lowercasedSearchText) ||
                landmark.name.es.containsIgnoringCase(lowercasedSearchText)
            let descriptionContains = landmark.description.en.containsIgnoringCase(lowercasedSearchText) ||
                landmark.description.zh.containsIgnoringCase(lowercasedSearchText) ||
                landmark.description.fr.containsIgnoringCase(lowercasedSearchText) ||
                landmark.description.de.containsIgnoringCase(lowercasedSearchText) ||
                landmark.description.ja.containsIgnoringCase(lowercasedSearchText) ||
                landmark.description.pt.containsIgnoringCase(lowercasedSearchText) ||
                landmark.description.es.containsIgnoringCase(lowercasedSearchText)
            
            let countryContains = landmark.country.rawValue.containsIgnoringCase(lowercasedSearchText)
                    
            return nameContains || descriptionContains || countryContains
        }
    }
    
    
    // MARK: map web view data
    @Published var mapType: MapType = .roadmap
    enum MapType: String {
        case roadmap
        case hybrid
    }
    @Published var zoomLevel: Double = 10.0
    @Published var zoomLevelChanged = false
    @Published var pinnedPlace: PlaceInfo = defaultPlace
    
    var webView: WKWebView?
    
    func updateMapType(_ type: MapType) {
        mapType = type
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

