//
//  LandmarkDescriptionView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/23.
//

import SwiftUI

struct LandmarkDescriptionView: View {
    var landmark: Landmark
    
    var body: some View {
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
    }
}

#Preview {
    LandmarkDescriptionView(landmark: ViewModel().landmarks.first!)
}
