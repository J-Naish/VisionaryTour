//
//  MapViewRepresentable.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI
import WebKit
import MapKit

struct MapViewRepresentable: UIViewRepresentable {
    @ObservedObject var viewModel: ViewModel
    
    // environment variable for google map api key
    private let apiKey = ProcessInfo.processInfo.environment["GOOGLE_MAPS_API_KEY"]!
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero)
        
        guard let html = Bundle.main.url(forResource: "index", withExtension: "html") else {
            return webView
        }
        guard var htmlString = try? String(contentsOf: html) else {
            return webView
        }
        
        // get language code en, ja, fr, de, zh, pt, es
        let languageCode = Locale.current.language.languageCode?.identifier ?? "en"
        
        // set api key in html
        htmlString = htmlString
            .replacingOccurrences(of: "GOOGLE_MAPS_API_KEY", with: apiKey)
            .replacingOccurrences(of: "LOCALE", with: languageCode)
        
        
        let baseURL = html.deletingLastPathComponent()
        
        webView.loadHTMLString(htmlString, baseURL: baseURL)
        
        viewModel.webView = webView
        
        webView.configuration.userContentController.add(context.coordinator, name: "zoomChanged")
        webView.configuration.userContentController.add(context.coordinator, name: "panoIdChanged")
        
        return webView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKScriptMessageHandler {
        var parent: MapViewRepresentable
        
        init(_ parent: MapViewRepresentable) {
            self.parent = parent
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            if message.name == "zoomChanged" {
                if let zoomLevel = message.body as? Double {
                    parent.viewModel.zoomLevel = zoomLevel
                }
            } else if message.name == "panoIdChanged" {
                if let body = message.body as? [String: Any],
                   let panoId = body["panoId"] as? String,
                   let latLngDict = body["latLng"] as? [String: Double],
                   let latitude = latLngDict["latitude"],
                   let longitude = latLngDict["longitude"] {
                    let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
                    DispatchQueue.main.async {
                        self.parent.viewModel.pinnedPlace.panoId = panoId
                        self.parent.viewModel.pinnedPlace.locationCoordinate = coordinate
                    }
                } else {
                    DispatchQueue.main.async {
                        self.parent.viewModel.pinnedPlace.panoId = nil
                        self.parent.viewModel.pinnedPlace.locationCoordinate = CLLocationCoordinate2D()
                    }
                }
            }
        }
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        DispatchQueue.main.async {
            uiView.evaluateJavaScript("map.setMapTypeId('\(viewModel.mapType.rawValue)')")
        }
        if viewModel.zoomLevelChanged {
            DispatchQueue.main.async {
                uiView.evaluateJavaScript("map.setZoom(\(viewModel.zoomLevel))")
                viewModel.zoomLevelChanged = false
            }
        }
    }
}
