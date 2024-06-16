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
                
                let regions: [(Region, String)] = [
                    (.asia, "Asia"),
                    (.europe, "Europe"),
                    (.northAmerica, "North America"),
                    (.latinAmerica, "Latin America"),
                    (.africa, "Africa"),
                    (.oceania, "Oceania")
                ]
                
                ForEach(Array(regions.enumerated()), id: \.element.0) { index, regionInfo in
                    let (region, imageName) = regionInfo
                    if index % 2 == 0 {
                        HStack(spacing: 32) {
                            createNavigationLink(for: region, name: imageName)
                            if index + 1 < regions.count {
                                let nextRegionInfo = regions[index + 1]
                                createNavigationLink(for: nextRegionInfo.0, name: nextRegionInfo.1)
                            }
                        }
                        .padding(.bottom, 32)
                    }
                }
            }
            .padding(.bottom, 48)
        }
    }
    
    @ViewBuilder
    private func createNavigationLink(for region: Region, name: String) -> some View {
        NavigationLink {
            LandmarkListView(
                navigationTitle: region.rawValue,
                immersiveViewModel: immersiveViewModel,
                landmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(region)),
                showImmersiveSpace: $showImmersiveSpace
            )
        } label: {
            RoundedSquareImage(image: Image(convertToLowerCaseWithUnderscore(name)), size: .medium, text: region.rawValue)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct RegionView_Previews: PreviewProvider {
    static var previews: some View {
        RegionView(viewModel: ViewModel(), immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace), showImmersiveSpace: .constant(false))
    }
}
