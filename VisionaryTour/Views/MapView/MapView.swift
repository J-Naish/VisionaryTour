//
//  MapView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var searchText = ""
    
    var body: some View {
        NavigationStack {
            MapViewRepresentable(viewModel: viewModel)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(EdgeInsets(top: 0, leading: 32, bottom: 32, trailing: 32))
                .navigationBarItems(leading: Text("Map"), trailing: HStack {
                    Button("Map") {
                        viewModel.updateMapType("roadmap")
                    }
                    Button("Satellite") {
                        viewModel.updateMapType("satellite")
                    }
                })
        }
        .searchable(text: $searchText)
    }
}

#Preview() {
    MapView()
}
