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
    
    @State private var selection: Tab = .home
    enum Tab {
        case home
        case map
    }
    
    var viewModel: ViewModel
    
    var immersiveViewModel: ImmersiveViewModel
    
    @State private var showImmersiveSpace =  false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    @StateObject var networkDetector = NetworkDetector()
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        
        if networkDetector.isConnected {
            TabView(selection: $selection) {
                HomeView(viewModel: viewModel, immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
                    .tabItem {
                        Label("Home", systemImage: "house")
                    }
                    .tag(Tab.home)
                
                MapView(showImmersiveSpace: $showImmersiveSpace, immersiveViewModel: immersiveViewModel)
                    .tabItem {
                        Label("Map", systemImage: "mappin.and.ellipse")
                    }
                    .tag(Tab.map)
            }
            .onChange(of: scenePhase) { phase, _ in
                print(phase)
                if phase == .inactive || phase == .background {
                    showImmersiveSpace = false
                }
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
        } else {
            NoInternetConnectionView()
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView(viewModel: ViewModel(), immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace))
//        .environment(\.locale, .init(identifier: "ja"))
}
