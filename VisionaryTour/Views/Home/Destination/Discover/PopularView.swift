//
//  PopularView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/06/17.
//

import SwiftUI

struct PopularView: View {
    
    var viewModel: ViewModel
    var immersiveViewModel: ImmersiveViewModel
    @Binding var showImmersiveSpace: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Popular")
                    .font(.largeTitle)
                
                Image(systemName: "chevron.right")
                    .font(.largeTitle)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    let popularLandmarks = filterLandmarks(landmarks: viewModel.landmarks, by: .category(.popular))
                    ForEach(popularLandmarks, id: \.self) { landmark in
                        NavigationLink {
                            LandmarkDetailView(landmark: landmark, immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
                        } label: {
                            LandmarkCard(landmark: landmark)
                                .padding(.trailing, 40)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
            }
        }
    }
}

#Preview {
    PopularView(viewModel: ViewModel(), immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace), showImmersiveSpace: .constant(false))
}
