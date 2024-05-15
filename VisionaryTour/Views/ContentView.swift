//
//  ContentView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    
    @State private var selection: Tab = .discover
    
    var modelData: ModelData
    
    enum Tab {
        case discover
        case map
    }
    
    var body: some View {
        TabView(selection: $selection) {
            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
                }
                .tag(Tab.discover)
                .environmentObject(modelData)
            
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
                .tag(Tab.map)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView(modelData: ModelData())
}
