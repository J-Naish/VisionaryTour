//
//  PopularView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/06/17.
//

import SwiftUI

struct PopularView: View {
    
    var viewModel: ViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Popular")
                    .font(.largeTitle)
                
                Image(systemName: "chevron.right")
                    .font(.largeTitle)
            }
            
            ScrollView(.horizontal) {
                LazyHStack {
                    let popularLandmarks = filterLandmarks(landmarks: viewModel.landmarks, by: .category(.popular))
                    ForEach(popularLandmarks, id: \.self) { landmark in
                        LandmarkCard(landmark: landmark)
                            .padding(.trailing, 40)
                    }
                }
            }
        }
    }
}

#Preview {
    PopularView(viewModel: ViewModel())
}
