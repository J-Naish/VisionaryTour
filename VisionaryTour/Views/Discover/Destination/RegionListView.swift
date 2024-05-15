//
//  RegionListView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/13.
//

import SwiftUI

struct RegionListView: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.dismiss) var dismiss
    
    var region: Region
    
    var filteredLandmarks: [Landmark] {
        modelData.landmarks.filter { $0.country.region == region }
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
                            LandmarkCard(landmarkName: landmark.name, region: landmark.country.rawValue)
                                .onTapGesture {
                                    modelData.updatePlaceInfo(id: landmark.id, coordinates: landmark.coordinates, panoId: landmark.panoId)
                                }
                        }
                    }
                    .padding(.bottom, 48)
                }
                .navigationTitle(region.rawValue)
            }
        }
    }
}

struct RegionListView_Previews: PreviewProvider {
    static var previews: some View {
        RegionListView(region: .asia)
            .environmentObject(ModelData())
    }
}
