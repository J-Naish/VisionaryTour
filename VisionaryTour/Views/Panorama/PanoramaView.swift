//
//  PanoramaView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/15.
//

import SwiftUI
import RealityKit

struct PanoramaView: View {
    
    var immersiveViewModel: ImmersiveViewModel
    
    var body: some View {
        RealityView { content in
            let contentEntity = immersiveViewModel.setupContentEntity()
            content.add(contentEntity)
        }
        .task {
            try? await immersiveViewModel.setSnapshot()
        }
    }
}

#Preview {
    PanoramaView(immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace))
}
