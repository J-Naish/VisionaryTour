//
//  PanoramaView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/15.
//

import SwiftUI
import RealityKit

struct PanoramaView: View {
    
    var viewModel: ImmersiveViewModel
    
    var body: some View {
        RealityView { content in
            content.add(viewModel.setupContentEntity())
        }
        .task {
            try? await viewModel.setSnapshot()
        }
    }
}

#Preview {
    PanoramaView(viewModel: ImmersiveViewModel())
}
