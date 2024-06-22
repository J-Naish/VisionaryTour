//
//  VisionaryTourApp.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

@main
struct VisionaryTourApp: App {
    @StateObject private var viewModel = ViewModel()
    
    @StateObject private var immersiveViewModel = ImmersiveViewModel(placeInfo: defaultPlace)
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel, immersiveViewModel: immersiveViewModel)
        }
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            PanoramaView(immersiveViewModel: immersiveViewModel)
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
