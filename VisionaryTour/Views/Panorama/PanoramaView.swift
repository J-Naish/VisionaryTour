//
//  PanoramaView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/15.
//

import SwiftUI
import RealityKit
import MapKit

struct PanoramaView: View {
    
    var immersiveViewModel: ImmersiveViewModel
    
    @Environment(\.scenePhase) private var scenePhase
    
    var body: some View {
        RealityView { content in
            let contentEntity = immersiveViewModel.setupContentEntity()
            content.add(contentEntity)
        }
        .onChange(of: immersiveViewModel.selectedPlaceInfo) { newValue, _ in
            Task {
                try? await immersiveViewModel.setSnapshot()
            }
        }
//        .onChange(of: scenePhase) { phase, _ in
//            immersiveViewModel.reset()
//        }
    }
}

#Preview {
    PanoramaView(immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace))
}
