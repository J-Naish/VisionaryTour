//
//  Loading.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/17.
//

import SwiftUI

struct Loading: View {
    
    var immersiveViewModel: ImmersiveViewModel
    
    var body: some View {
        if immersiveViewModel.progress < 1.0 {
            ZStack {
                Color(hex: "#808080", opacity: 0.3)
                    .blur(radius: 20)
                
                VStack {
                    ProgressView(value: immersiveViewModel.progress)
                        .scaleEffect(2.0)
                        .frame(width: 100, height: 100)
                        .progressViewStyle(.circular)
                    Text("Loading Panorama")
                        .font(.largeTitle)
                }
            }
            .frame(width: 400, height: 240)
            .clipShape(RoundedRectangle(cornerRadius: 24))
        }
    }
}

#Preview {
    Loading(immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace))
}
