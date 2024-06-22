//
//  LandmarkMapViewRepresentable.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/23.
//

import SwiftUI
import WebKit

struct LandmarkMapViewRepresentable: UIViewRepresentable {
    
    let landmark: Landmark
    
    // environment variable for google map api key
    private let apiKey = EnvironmentVariables.googleMapsApiKey
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero)
        
        guard let html = Bundle.main.url(forResource: "landmark", withExtension: "html") else {
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
        
        // init map with the coordinates of the landmark
        let coordinesInjectionScript = "initMap(\(landmark.coordinates.latitude), \(landmark.coordinates.longitude));"
        htmlString = htmlString.replacingOccurrences(of: "</body>", with: "<script>\(coordinesInjectionScript)</script></body>")
        
        
        let baseURL = html.deletingLastPathComponent()
        
        webView.loadHTMLString(htmlString, baseURL: baseURL)
        
        return webView
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKScriptMessageHandler {
        var parent: LandmarkMapViewRepresentable
        
        init(_ parent: LandmarkMapViewRepresentable) {
            self.parent = parent
        }
        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {}
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
}
