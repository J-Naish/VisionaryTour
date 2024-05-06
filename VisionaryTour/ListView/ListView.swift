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
            VStack {
                RoundedSquareImage(image: Image("dummy"), size: .large)
                HStack(spacing: 32) {
                    RoundedSquareImage(image: Image("dummy"), size: .medium)
                    RoundedSquareImage(image: Image("dummy"), size: .medium)
                }
                HStack(spacing: 24) {
                    RoundedSquareImage(image: Image("dummy"), size: .small)
                    RoundedSquareImage(image: Image("dummy"), size: .small)
                    RoundedSquareImage(image: Image("dummy"), size: .small)
                    RoundedSquareImage(image: Image("dummy"), size: .small)
                }
            }
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ListView()
}
