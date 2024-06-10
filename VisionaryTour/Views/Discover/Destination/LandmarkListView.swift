//
//  LandmarkListView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/24.
//

import SwiftUI

struct LandmarkListView: View {
    var navigationTitle: String
    
    var landmarks: [Landmark]
    
    var rows: [[Landmark]] {
        stride(from: 0, to: landmarks.count, by: 4).map {
            Array(landmarks[$0..<min($0 + 4, landmarks.count)])
        }
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(rows, id: \.self) { row in
                    HStack(spacing: 32) {
                        ForEach(row) { landmark in
                            NavigationLink {
                                LandmarkDetailView(landmark: landmark)
                            } label: {
                                LandmarkCard(landmark: landmark)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.bottom, 48)
                }
                .navigationTitle(navigationTitle)
            }
        }
        .padding(.horizontal, 24)
    }
}

#Preview {
    LandmarkListView(navigationTitle: "Asia", landmarks: ViewModel().landmarks)
}
