//
//  ListView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct ListView: View {
    
    var landmarks: [Landmark]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(landmarks, id: \.self) { landmark in
                    ListItemView(landmark: landmark)
                        .padding(.bottom, 16)
                }
            }
        }
        .padding(.bottom, 32)
    }
}

#Preview {
    ListView(landmarks: ViewModel().landmarks)
}
