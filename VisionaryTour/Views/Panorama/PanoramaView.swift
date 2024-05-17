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
            content.add(immersiveViewModel.setupContentEntity())
        }
        .task {
            try? await immersiveViewModel.setSnapshot()
        }
        .onChange(of: immersiveViewModel.selectedPlaceInfo) { newValue, _ in
            Task {
                try? await immersiveViewModel.setSnapshot()
            }
        }
    }
}

#Preview {
    PanoramaView(immersiveViewModel: ImmersiveViewModel(placeInfo: PlaceInfo(locationCoordinate: CLLocationCoordinate2DMake(0, 0), panoId: nil)))
}
