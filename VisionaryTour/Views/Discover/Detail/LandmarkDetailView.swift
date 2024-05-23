//
//  LandmarkDetailView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/22.
//

import SwiftUI
import MapKit

struct LandmarkDetailView: View {
    var landmark: Landmark
    
    var placeInfo: PlaceInfo {
        PlaceInfo(locationCoordinate: CLLocationCoordinate2DMake(landmark.coordinates.latitude, landmark.coordinates.longitude), panoId: landmark.panoId)
    }
    
    var body: some View {
        HStack(alignment: .top) {
            LandmarkDescriptionView(landmark: landmark)
                .frame(width: 420)
                .padding(.trailing, 24)
            
            VStack {
                LandmarkMapView(landmark: landmark)
                    .frame(width: 360, height: 420)
                    .padding(.bottom, 16)
                
                Button(action: {
                    // TODO:
                }) {
                    Text("Open Immersive View")
                        .frame(width: 240)
                }
            }
        }
    }
}

#Preview {
    LandmarkDetailView(landmark: ViewModel().landmarks.first!)
}
