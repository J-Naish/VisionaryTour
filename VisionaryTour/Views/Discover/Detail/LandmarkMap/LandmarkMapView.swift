//
//  LandmarkMapView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/23.
//

import SwiftUI

struct LandmarkMapView: View {
    var landmark: Landmark
    
    var body: some View {
        LandmarkMapViewRepresentable(landmark: landmark)
            .frame(width: 360, height: 420)
            .cornerRadius(24)
    }
}

#Preview {
    LandmarkMapView(landmark: ViewModel().landmarks.first!)
}
