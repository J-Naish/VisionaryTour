//
//  MapView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI
import MapKit

struct MapView: View {
    @StateObject private var viewModel = ViewModel()
    @State private var searchText = ""
    @State private var isMapSelected = true
    
    @State private var position: MapCameraPosition = .automatic
    
    @State private var showImmersiveSpace = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var immersiveViewModel: ImmersiveViewModel
    
    var body: some View {
        
        ZStack {
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
                            immersiveViewModel.selectedPlaceInfo = viewModel.pinnedPlace
                            immersiveViewModel.progress = 0.0
                            let camera = MapCamera(centerCoordinate: immersiveViewModel.selectedPlaceInfo.locationCoordinate, distance: 400, heading: 0, pitch: 60)
                            let cameraPosition = MapCameraPosition.camera(camera)
                            self.position = cameraPosition
                            showImmersiveSpace = true
                        }) {
                            Text("Open Immersive View")
                                .frame(width: 240)
                                .foregroundColor(viewModel.pinnedPlace.panoId == nil ? .red : .white)
                        }
                        .disabled(viewModel.pinnedPlace.panoId == nil)
                        .padding(.top, -66)
                        Spacer()
                    }
                }
            }
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                viewModel.searchLocation(searchText)
            }
            .onChange(of: showImmersiveSpace) { _, newValue in
                Task {
                    if newValue {
                        await openImmersiveSpace(id: "ImmersiveSpace")
                    } else {
                        await dismissImmersiveSpace()
                    }
                }
            }
            
            Loading(immersiveViewModel: immersiveViewModel)
            
        }
    }
}

#Preview() {
    MapView(immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace))
}
