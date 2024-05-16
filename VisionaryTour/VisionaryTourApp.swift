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
    
    var body: some Scene {
        WindowGroup {
            ContentView(modelData: modelData)
        }
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            PanoramaView(viewModel: ImmersiveViewModel(placeInfo: PlaceInfo(locationCoordinate: CLLocationCoordinate2DMake(0, 0), panoId: nil)))
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
