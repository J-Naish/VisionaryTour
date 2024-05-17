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
            VStack {
                ProgressView(value: immersiveViewModel.progress)
                    .scaleEffect(2.0)
                    .frame(width: 100, height: 100)
                    .progressViewStyle(.circular)
                Text("Loading Panorama")
                    .font(.largeTitle)
            }
        }
    }
}

//#Preview {
//    Loading()
//}
