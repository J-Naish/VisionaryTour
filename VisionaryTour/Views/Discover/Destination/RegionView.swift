//
//  RegionView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct RegionView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                RoundedSquareImage(image: Image("dummy"), size: .large, text: "Region")
                    .padding(.bottom, 72)
                HStack(spacing: 32) {
                    NavigationLink(destination: RegionListView(region: .asia)) {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Asia")
                    }
                    NavigationLink(destination: RegionListView(region: .europe)) {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Europe")
                    }
                }
                .padding(.bottom, 32)
                HStack(spacing: 32) {
                    NavigationLink(destination: RegionListView(region: .northAmerica)) {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "North America")
                    }
                    NavigationLink(destination: RegionListView(region: .latinAmerica)) {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Latin America")
                    }
                }
                .padding(.bottom, 32)
                HStack(spacing: 32) {
                    NavigationLink(destination: RegionListView(region: .africa)) {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Africa")
                    }
                    NavigationLink(destination: RegionListView(region: .oceania)) {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Oceania")
                    }
                }
                .padding(.bottom, 48)
            }
        }
    }
}

struct RegionView_Previews: PreviewProvider {
    static var previews: some View {
        RegionView()
            .environmentObject(ModelData())
    }
}
