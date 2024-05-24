//
//  RegionView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct RegionView: View {
    var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                RoundedSquareImage(image: Image("region"), size: .large, text: "Region", enableHoverEEffect: false)
                    .padding(.bottom, 72)
                
                
                HStack(spacing: 32) {
                    NavigationLink {
                        FilteredLandmarkListView(navigationTitle: "Asia", filteredLandmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.asia)))
                    } label: {
                        RoundedSquareImage(image: Image("asia"), size: .medium, text: "Asia")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink {
                        FilteredLandmarkListView(navigationTitle: "Europe", filteredLandmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.europe)))
                    } label: {
                        RoundedSquareImage(image: Image("europe"), size: .medium, text: "Europe")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, 32)
                
                
                HStack(spacing: 32) {
                    NavigationLink {
                        FilteredLandmarkListView(navigationTitle: "North America", filteredLandmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.northAmerica)))
                    } label: {
                        RoundedSquareImage(image: Image("north_america"), size: .medium, text: "North America")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink {
                        FilteredLandmarkListView(navigationTitle: "Latin America", filteredLandmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.latinAmerica)))
                    } label: {
                        RoundedSquareImage(image: Image("latin_america"), size: .medium, text: "Latin America")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, 32)
                
                
                HStack(spacing: 32) {
                    NavigationLink {
                        FilteredLandmarkListView(navigationTitle: "Africa", filteredLandmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.africa)))
                    } label: {
                        RoundedSquareImage(image: Image("africa"), size: .medium, text: "Africa")
                    }
                    .frame(width: 420)
                    
                    NavigationLink {
                        FilteredLandmarkListView(navigationTitle: "Oceania", filteredLandmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(.oceania)))
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
        RegionView(viewModel: ViewModel())
    }
}
