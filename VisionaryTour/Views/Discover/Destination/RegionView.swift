//
//  RegionView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct RegionView: View {
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading) {
                RoundedSquareImage(image: Image("dummy"), size: .large, text: "Region")
                    .padding(.bottom, 72)
                HStack(spacing: 32) {
                    RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Asia")
                    RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Europe")
                }
                .padding(.bottom, 32)
                HStack(spacing: 32) {
                    RoundedSquareImage(image: Image("dummy"), size: .medium, text: "North America")
                    RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Latin America")
                }
                .padding(.bottom, 32)
                HStack(spacing: 32) {
                    RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Africa")
                    RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Oceania")
                }
                .padding(.bottom, 48)
            }
        }
    }
}

#Preview {
    RegionView()
}
