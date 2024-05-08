//
//  MapViewRepresentable.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI
import WebKit

struct MapViewRepresentable: UIViewRepresentable {
    @ObservedObject var viewModel: MapViewModel
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView(frame: .zero)
        
        guard let html = Bundle.main.url(forResource: "index", withExtension: "html") else {
            return webView
        }
        guard let htmlString = try? String(contentsOf: html) else {
            return webView
        }
        
        let baseURL = html.deletingLastPathComponent()
        
        webView.loadHTMLString(htmlString, baseURL: baseURL)
        
        viewModel.webView = webView
        
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.evaluateJavaScript("map.setMapTypeId('\(viewModel.mapType)')")
        
        if viewModel.zoomLevelChanged {
            uiView.evaluateJavaScript("map.setZoom(\(viewModel.zoomLevel))")
            viewModel.zoomLevelChanged = false
        }
    }
}
