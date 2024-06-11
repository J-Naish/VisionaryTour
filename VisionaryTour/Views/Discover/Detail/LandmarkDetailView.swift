//
//  LandmarkDetailView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/22.
//

import SwiftUI
import MapKit

struct LandmarkDetailView: View {
    var landmark: Landmark
    var immersiveViewModel: ImmersiveViewModel
    
    var placeInfo: PlaceInfo {
        PlaceInfo(locationCoordinate: CLLocationCoordinate2DMake(landmark.coordinates.latitude, landmark.coordinates.longitude), panoId: landmark.panoId)
    }
    
    @State private var position: MapCameraPosition = .automatic
    
    @State private var showImmersiveSpace = false
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    @Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
    
    var body: some View {
        ZStack {
            HStack(alignment: .top) {
                LandmarkDescriptionView(landmark: landmark)
                    .frame(width: 480)

                Spacer()
                
                VStack {
                    LandmarkMapView(landmark: landmark)
                        .frame(width: 360, height: 420)
                        .padding(.bottom, 16)
                    
                    Button(action: {
                        immersiveViewModel.selectedPlaceInfo = landmark.placeInfo
                        immersiveViewModel.progress = 0.0
                        let camera = MapCamera(centerCoordinate: immersiveViewModel.selectedPlaceInfo.locationCoordinate, distance: 400, heading: 0, pitch: 60)
                        let cameraPosition = MapCameraPosition.camera(camera)
                        self.position = cameraPosition
                        showImmersiveSpace = true
                    }) {
                        Text("Open Immersive View")
                            .frame(width: 240)
                    }
                }
                .padding(.trailing, 16)
            }
            .padding(.horizontal, 24)
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

#Preview {
    LandmarkDetailView(landmark: ViewModel().landmarks.first!, immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace))
}
