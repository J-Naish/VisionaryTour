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
                    HStack(spacing: 32) {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Asia")
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Europe")
                    }
                    HStack(spacing: 32) {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "North America")
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Latin America")
                    }
                    HStack(spacing: 24) {
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                    }
                    HStack(spacing: 24) {
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                    }
                    HStack(spacing: 24) {
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                        RoundedSquareImage(image: Image("dummy"), size: .small, text: nil)
                    }
                }
            }
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ListView()
}
