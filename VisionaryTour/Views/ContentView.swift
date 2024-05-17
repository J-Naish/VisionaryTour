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
    
    var modelData: ModelData
    
    @State private var showImmersiveSpace = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @State private var position: MapCameraPosition = .automatic
    
    var immersiveViewModel: ImmersiveViewModel
    
    var body: some View {
        
        @Bindable var immersiveViewModel = immersiveViewModel
        
        TabView(selection: $selection) {
            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "magnifyingglass")
                }
                .tag(Tab.discover)
                .environmentObject(modelData)
            
            MapView(immersiveViewModel: immersiveViewModel)
                .tabItem {
                    Label("Map", systemImage: "mappin.and.ellipse")
                }
                .tag(Tab.map)
        }
        .onChange(of: showImmersiveSpace) { _, newValue in
            Task {
                if newValue {
                    await openImmersiveSpace(id: "ImmersiveSpace")
                } else {
                    await dismissImmersiveSpace()
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView(modelData: ModelData(), immersiveViewModel: ImmersiveViewModel(placeInfo: PlaceInfo(locationCoordinate: CLLocationCoordinate2DMake(0, 0), panoId: nil)))
}
