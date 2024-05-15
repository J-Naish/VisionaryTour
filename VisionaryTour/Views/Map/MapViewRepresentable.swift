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
                parent.viewModel.panoId = message.body as? String
            }
        }
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        uiView.evaluateJavaScript("map.setMapTypeId('\(viewModel.mapType)')")
        
        if viewModel.zoomLevelChanged {
            uiView.evaluateJavaScript("map.setZoom(\(viewModel.zoomLevel))")
            viewModel.zoomLevelChanged = false
        }
    }
}
