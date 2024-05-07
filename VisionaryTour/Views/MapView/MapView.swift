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
    @State private var isMapSelected = true
    
    var body: some View {
        NavigationStack {
            MapViewRepresentable(viewModel: viewModel)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(EdgeInsets(top: 0, leading: 32, bottom: 32, trailing: 32))
                .navigationBarItems(leading:
                    MapControlButton(isMapSelected: $isMapSelected, viewModel: viewModel)
                        .padding(.leading, 8)
                , trailing: HStack {
                    Button(action: {
                        viewModel.zoomIn()
                    }) {
                        Image(systemName: "plus")
                    }
                    Button(action: {
                        viewModel.zoomOut()
                    }) {
                        Image(systemName: "minus")
                    }
                })
        }
        .searchable(text: $searchText)
    }
}

#Preview() {
    MapView()
}
