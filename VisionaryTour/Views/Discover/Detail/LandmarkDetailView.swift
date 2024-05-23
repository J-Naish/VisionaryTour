//
//  LandmarkDetailView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/22.
//

import SwiftUI

struct LandmarkDetailView: View {
    var landmark: Landmark
    
    var body: some View {
        HStack(alignment: .top) {
            LandmarkDescriptionView(landmark: landmark)
                .frame(width: 420)
                .padding(.trailing, 24)
            
            LandmarkMapView(landmark: landmark)
                .frame(width: 360, height: 420)
        }
    }
}

#Preview {
    LandmarkDetailView(landmark: ViewModel().landmarks.first!)
}
