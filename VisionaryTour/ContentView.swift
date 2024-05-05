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
    
    @State private var selection: Tab = .list
    
    enum Tab {
        case list
        case map
    }
    
    var body: some View {
        TabView(selection: $selection) {
            ListView()
                .tabItem {
                    Label("List", systemImage: "list.bullet")
                }
                .tag(Tab.list)
            
            MapView()
                .tabItem {
                    Label("Map", systemImage: "map")
                }
                .tag(Tab.map)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
