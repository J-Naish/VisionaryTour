//
//  MainDiscoverView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct DiscoverView: View {
    
    var viewModel: ViewModel
    var immersiveViewModel: ImmersiveViewModel
    @Binding var showImmersiveSpace: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ZStack(alignment: .leading) {
                    Image("dummy")
                        .resizable()
                        .frame(width: 880, height: 280)
                        .aspectRatio(contentMode: .fill)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .frame(width: 880, height: 280)
                    
                    Text("Discover")
                        .font(.system(size: 72))
                        .fontWeight(.bold)
                        .padding(.leading, 32)
                }
                .padding(.bottom, 72)
                
                RecommendedView(viewModel: viewModel, immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
                    .padding(.bottom, 64)
                
                FamousView(viewModel: viewModel, immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
            }
            .padding(.horizontal, 48)
            .padding(.bottom, 72)
        }
    }
}

#Preview {
    DiscoverView(viewModel: ViewModel(), immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace), showImmersiveSpace: .constant(false))
}
