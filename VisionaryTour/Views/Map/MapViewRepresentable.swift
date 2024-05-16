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
                if let body = message.body as? [String: Any],
                   let panoId = body["panoId"] as? String,
                   let latLngDict = body["latLng"] as? [String: Double],
                   let latitude = latLngDict["latitude"],
                   let longitude = latLngDict["longitude"] {
                    let coordinate = CLLocationCoordinate2DMake(latitude, longitude)
                    parent.viewModel.placeInfo.panoId = panoId
                    parent.viewModel.placeInfo.locationCoordinae = coordinate
                } else {
                    parent.viewModel.placeInfo.panoId = nil
                    parent.viewModel.placeInfo.locationCoordinae = CLLocationCoordinate2D()
                }
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
