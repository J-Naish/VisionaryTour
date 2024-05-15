//
//  PanoramaView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/15.
//

import SwiftUI
import RealityKit

struct PanoramaView: View {
    
    var modelData: ModelData
    
    var body: some View {
        RealityView { content in
            content.add(modelData.setupContentEntity())
        }
        .task {
            try? await modelData.setSnapshot()
        }
    }
}

#Preview {
    PanoramaView(modelData: ModelData())
}
