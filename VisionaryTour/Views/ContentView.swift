//
//  ContentView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI
import RealityKit
import RealityKitContent
import MapKit

struct ContentView: View {
    
    @State private var selection: Tab = .discover
    enum Tab {
        case discover
        case map
    }
    
    var viewModel: ViewModel
    
    var immersiveViewModel: ImmersiveViewModel
    
    var body: some View {
        
        TabView(selection: $selection) {
            DiscoverView(viewModel: viewModel, immersiveViewModel: immersiveViewModel)
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
                }
                .tag(Tab.discover)
            
            MapView(immersiveViewModel: immersiveViewModel)
                .tabItem {
                    Label("Map", systemImage: "mappin.and.ellipse")
                }
                .tag(Tab.map)
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView(viewModel: ViewModel(), immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace))
}
