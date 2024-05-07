//
//  LandmarkCard.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/07.
//

import SwiftUI

struct LandmarkCard: View {
    var landmarkName: String
    var region: String
    
    var body: some View {
        VStack(alignment: .leading) {
            RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
            Text(landmarkName)
                .padding(.leading, 8)
                .fontWeight(.bold)
            Text(region)
                .padding(.leading, 8)
                .opacity(0.7)
        }
    }
}

#Preview {
    LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
}
