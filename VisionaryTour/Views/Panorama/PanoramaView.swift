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
    }
}

#Preview {
    PanoramaView(immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace))
}
