//
//  VisionaryTourApp.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

@main
struct VisionaryTourApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView(modelData: modelData)
        }
        
        ImmersiveSpace(id: "ImmersiveSpace") {
            PanoramaView(modelData: modelData)
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
