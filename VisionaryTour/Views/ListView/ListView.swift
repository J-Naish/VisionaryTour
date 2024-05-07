//
//  ListView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

struct ListView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            List {
                
            }
            .navigationTitle("List")
        } detail: {
            ScrollView {
                VStack {
                    RoundedSquareImage(image: Image("dummy"), size: .large, text: "Region")
                    Spacer(minLength: 48)
                    HStack(spacing: 32) {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Asia")
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Europe")
                    }
                    Spacer(minLength: 32)
                    HStack(spacing: 32) {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "North America")
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Latin America")
                    }
                    Spacer(minLength: 48)
                    HStack(spacing: 24) {
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                    }
                    HStack(spacing: 24) {
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                    }
                    HStack(spacing: 24) {
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                        LandmarkCard(landmarkName: "Kinkakuji", region: "Japan")
                    }
                }
                .padding(EdgeInsets(top: 0, leading: 32, bottom: 32, trailing: 32))
            }
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ListView()
}
