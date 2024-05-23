//
//  RegionListView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/13.
//

import SwiftUI

struct RegionListView: View {
    @EnvironmentObject var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    
    var region: Region
    
    var filteredLandmarks: [Landmark] {
        viewModel.landmarks.filter { $0.country.region == region }
    }
    
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
                                LandmarkCard(landmarkName: landmark.name, region: landmark.country.rawValue)
                            }
                                
                        }
                    }
                    .padding(.bottom, 48)
                }
                .navigationTitle(region.rawValue)
            }
        }
        .padding(.horizontal, 24)
    }
}

struct RegionListView_Previews: PreviewProvider {
    static var previews: some View {
        RegionListView(region: .asia)
            .environmentObject(ViewModel())
    }
}
