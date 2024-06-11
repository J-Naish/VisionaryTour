//
//  RegionView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct RegionView: View {
    var viewModel: ViewModel
    var immersiveViewModel: ImmersiveViewModel
    
    @Binding var showImmersiveSpace: Bool
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                RoundedSquareImage(image: Image("region"), size: .large, text: "Region", enableHoverEEffect: false)
                    .padding(.bottom, 72)
                
                
                HStack(spacing: 32) {
                    NavigationLink {
                        LandmarkListView(navigationTitle: "Asia", immersiveViewModel: immersiveViewModel, landmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.asia)), showImmersiveSpace: $showImmersiveSpace)
                    } label: {
                        RoundedSquareImage(image: Image("asia"), size: .medium, text: "Asia")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink {
                        LandmarkListView(navigationTitle: "Europe", immersiveViewModel: immersiveViewModel, landmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.europe)), showImmersiveSpace: $showImmersiveSpace)
                    } label: {
                        RoundedSquareImage(image: Image("europe"), size: .medium, text: "Europe")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, 32)
                
                
                HStack(spacing: 32) {
                    NavigationLink {
                        LandmarkListView(navigationTitle: "North America", immersiveViewModel: immersiveViewModel, landmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.northAmerica)), showImmersiveSpace: $showImmersiveSpace)
                    } label: {
                        RoundedSquareImage(image: Image("north_america"), size: .medium, text: "North America")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink {
                        LandmarkListView(navigationTitle: "Latin America", immersiveViewModel: immersiveViewModel, landmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.latinAmerica)), showImmersiveSpace: $showImmersiveSpace)
                    } label: {
                        RoundedSquareImage(image: Image("latin_america"), size: .medium, text: "Latin America")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, 32)
                
                
                HStack(spacing: 32) {
                    NavigationLink {
                        LandmarkListView(navigationTitle: "Africa", immersiveViewModel: immersiveViewModel, landmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.africa)), showImmersiveSpace: $showImmersiveSpace)
                    } label: {
                        RoundedSquareImage(image: Image("africa"), size: .medium, text: "Africa")
                    }
                    .frame(width: 420)
                    
                    NavigationLink {
                        LandmarkListView(navigationTitle: "Oceania", immersiveViewModel: immersiveViewModel, landmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.oceania)), showImmersiveSpace: $showImmersiveSpace)
                    } label: {
                        RoundedSquareImage(image: Image("oceania"), size: .medium, text: "Oceania")
                    }
                    .frame(width: 420)
                }
                .padding(.bottom, 48)
            }
        }
    }
}

struct RegionView_Previews: PreviewProvider {
    static var previews: some View {
        RegionView(viewModel: ViewModel(), immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace), showImmersiveSpace: .constant(false))
    }
}
