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
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Image("dummy")
                            .resizable()
                            .frame(width: 120, height: 120)
                            .cornerRadius(12)

                        VStack(alignment: .leading) {
                            Text(landmark.name)
                                .font(.largeTitle)
                            Text("\(landmark.state) / \(landmark.country.rawValue)")
                        }
                        .padding(.leading, 24)
                    }
                    .padding(.bottom, 32)
                    
                    Text("Description")
                        .font(.title)
                        .padding(.bottom, 16)
                    
                    Text(landmark.description)
                }
            }
            .frame(width: 420)
            .padding(.trailing, 24)
            
            LandmarkMapView(landmark: landmark)
            
        }
    }
}

#Preview {
    LandmarkDetailView(landmark: ViewModel().landmarks.first!)
}
