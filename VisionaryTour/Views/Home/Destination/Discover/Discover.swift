//
//  MainDiscoverView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct Discover: View {
    
    var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                RoundedSquareImage(image: Image("dummy"), size: .extraLarge, text: "Discover")
                    .padding(.bottom, 72)
                
                PopularView(viewModel: viewModel)
            }
            .padding(.horizontal, 48)
        }
    }
}

#Preview {
    Discover(viewModel: ViewModel())
}
