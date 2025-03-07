//
//  MapView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

struct MapView: View {
    @StateObject var viewModel: ViewModel
    @State private var searchText = ""
    @State private var isMapSelected = true
    
    @Binding var showImmersiveSpace: Bool
    
    var immersiveViewModel: ImmersiveViewModel
    
    var body: some View {
        
        ZStack {
            NavigationStack {
                VStack {
                    MapViewRepresentable(viewModel: viewModel)
                        .clipShape(RoundedRectangle(cornerRadius: 32))
                        .padding(EdgeInsets(top: 0, leading: 32, bottom: 16, trailing: 32))
                        .navigationBarItems(
                            leading: MapControlButton(isMapSelected: $isMapSelected, viewModel: viewModel),
                            trailing: ZoomControlButton(viewModel: viewModel)
                        )
                    HStack(spacing: 32) {
                        Button(action: {
                            immersiveViewModel.selectedPlaceInfo = viewModel.pinnedPlace
                            immersiveViewModel.progress = 0.0
                            showImmersiveSpace = true
                        }) {
                            Text("Open Panorama")
                                .frame(width: 240)
                                .foregroundColor(viewModel.pinnedPlace.panoId == nil ? .red : .white)
                        }
                        .disabled(viewModel.pinnedPlace.panoId == nil)
                        
                        Button(action: {
                            showImmersiveSpace = false
                        }) {
                            Text("Close Panorama")
                                .frame(width: 240)
                        }
                        .disabled(!showImmersiveSpace)
                    }
                    .padding(.bottom, 24)
                }
            }
            .searchable(text: $searchText)
            .onSubmit(of: .search) {
                viewModel.searchLocation(searchText)
            }
            
            Loading(immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
            
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(viewModel: ViewModel(), showImmersiveSpace: .constant(false), immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace))
    }
}
