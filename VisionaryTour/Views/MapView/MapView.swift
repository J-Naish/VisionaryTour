//
//  MapView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

struct MapView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            MapViewRepresentable()
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(EdgeInsets(top: 0, leading: 32, bottom: 32, trailing: 32))
        }
        .searchable(text: $searchText)
    }
}

#Preview(windowStyle: .automatic) {
    MapView()
}
