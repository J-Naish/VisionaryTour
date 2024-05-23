//
//  LandmarkMapViewRepresentable.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/23.
//

import SwiftUI
import WebKit
import MapKit

struct LandmarkMapViewRepresentable: UIViewRepresentable {
    
    // environment variable for google map api key
    private let apiKey = ProcessInfo.processInfo.environment["GOOGLE_MAPS_API_KEY"]!
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero)
        
        guard let html = Bundle.main.url(forResource: "landmark", withExtension: "html") else {
            return webView
        }
        guard var htmlString = try? String(contentsOf: html) else {
            return webView
        }
        
        // set api key in html
        htmlString = htmlString.replacingOccurrences(of: "GOOGLE_MAPS_API_KEY", with: apiKey)
        
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
