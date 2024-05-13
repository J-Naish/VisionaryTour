//
//  RegionListView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/13.
//

import SwiftUI

struct RegionListView: View {
    @EnvironmentObject var modelData: ModelData
    var region: Region
    
    var filteredLandmark: [Landmark] {
        modelData.landmarks.filter { $0.country.region == region }
    }
    
    var body: some View {
        ScrollView {
            ForEach(filteredLandmark, id: \.id) { landmark in
                Text(landmark.name)
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
