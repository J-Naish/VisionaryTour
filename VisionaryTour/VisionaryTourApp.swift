//
//  VisionaryTourApp.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI
import MapKit

@main
struct VisionaryTourApp: App {
    @StateObject private var modelData = ModelData()
    
    @State private var immersiveViewModel = ImmersiveViewModel(placeInfo: PlaceInfo(locationCoordinate: CLLocationCoordinate2DMake(0, 0), panoId: nil))
    
    var body: some Scene {
        WindowGroup {
            ContentView(modelData: modelData, immersiveViewModel: immersiveViewModel)
        }
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            PanoramaView(viewModel: immersiveViewModel)
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
