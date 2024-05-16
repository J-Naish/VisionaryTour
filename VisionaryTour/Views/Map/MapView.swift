//
//  MapView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var searchText = ""
    @State private var isMapSelected = true
    
    @State private var position: MapCameraPosition = .automatic
    
    var body: some View {
        NavigationStack {
            ZStack {
                MapViewRepresentable(viewModel: viewModel)
                    .clipShape(RoundedRectangle(cornerRadius: 32))
                    .padding(EdgeInsets(top: 0, leading: 32, bottom: 32, trailing: 32))
                    .navigationBarItems(
                        leading: MapControlButton(isMapSelected: $isMapSelected, viewModel: viewModel),
                        trailing: ZoomControlButton(viewModel: viewModel)
                )
                VStack {
                    Button(action: {
                        // do something
                    }) {
                        Text("Open Immersive View")
                            .frame(width: 240)
                            .foregroundColor(viewModel.placeInfo.panoId == nil ? .red : .white)
                    }
                    .disabled(viewModel.placeInfo.panoId == nil)
                    .padding(.top, -66)
                    Spacer()
                }
            }
        }
        .searchable(text: $searchText)
        .onSubmit(of: .search) {
            viewModel.searchLocation(searchText)
        }
        .onChange(of: viewModel.placeInfo) { oldValue, newValue in
            let camera = MapCamera(centerCoordinate: newValue.locationCoordinate, distance: 400, heading: 0, pitch: 60)
            let cameraPosition = MapCameraPosition.camera(camera)
            self.position = cameraPosition
        }
    }
}

#Preview() {
    MapView()
}
