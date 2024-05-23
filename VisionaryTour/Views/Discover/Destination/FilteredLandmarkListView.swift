//
//  LandmarkListView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/24.
//

import SwiftUI

struct FilteredLandmarkListView: View {
    var navigationTitle: String
    
    var filteredLandmarks: [Landmark]
    
    var rows: [[Landmark]] {
        stride(from: 0, to: filteredLandmarks.count, by: 4).map {
            Array(filteredLandmarks[$0..<min($0 + 4, filteredLandmarks.count)])
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
                                LandmarkCard(landmarkName: landmark.name, country: landmark.country.rawValue)
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
    FilteredLandmarkListView(navigationTitle: "Asia", filteredLandmarks: ViewModel().landmarks)
}
