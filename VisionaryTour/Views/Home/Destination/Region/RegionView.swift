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
            LazyVStack(alignment: .center) {
                ZStack(alignment: .leading) {
                    AsyncImage(url: getImageURL(imageId: "14ef8e6e-16a2-445c-01bc-9a17871aca00")) { image in
                        image.resizable()
                            .frame(width: 880, height: 280)
                            .aspectRatio(contentMode: .fill)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 880, height: 280)
                    
                    Text("Region")
                        .font(.system(size: 72))
                        .fontWeight(.bold)
                        .padding(.leading, 32)
                }
                .padding(.bottom, 72)
                
                let regions: [(Region, String, String)] = [
                    (.asia, "Asia", "7ef80a7f-b5a3-4184-f34e-79c27ab3c100"),
                    (.europe, "Europe", "3efd1212-4ee4-4af7-b8af-5a5d23eca200"),
                    (.northAmerica, "North America", "9e818f37-f598-47e1-9a99-8e8bd8fc2600"),
                    (.southAmerica, "South America", "772508f4-b291-4415-1fd9-01a270811200"),
                    (.africa, "Africa", "703a25a1-4692-4d17-ffe4-64d4c2fc6800"),
                    (.oceania, "Oceania", "852517f4-b88a-4f41-5242-3370d6b79a00")
                ]
                
                ForEach(Array(regions.enumerated()), id: \.element.0) { index, regionInfo in
                    let (region, imageName, imageId) = regionInfo
                    if index % 2 == 0 {
                        HStack(spacing: 32) {
                            createNavigationLink(for: region, name: imageName, imageId: imageId)
                            if index + 1 < regions.count {
                                let nextRegionInfo = regions[index + 1]
                                createNavigationLink(for: nextRegionInfo.0, name: nextRegionInfo.1, imageId: nextRegionInfo.2)
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
    private func createNavigationLink(for region: Region, name: String, imageId: String) -> some View {
        NavigationLink {
            LandmarkListView(
                navigationTitle: region.rawValue,
                immersiveViewModel: immersiveViewModel,
                landmarks: filterLandmarks(landmarks: viewModel.landmarks, by: .region(region)),
                showImmersiveSpace: $showImmersiveSpace
            )
        } label: {
            ZStack(alignment: .bottomLeading) {
                AsyncImage(url: getImageURL(imageId: imageId)) { image in
                    image.resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 420, height: 200)

                Text(name)
                    .font(.extraLargeTitle)
                    .padding(.leading, 32)
                    .padding(.bottom, 16)
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct RegionView_Previews: PreviewProvider {
    static var previews: some View {
        RegionView(viewModel: ViewModel(), immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace), showImmersiveSpace: .constant(false))
    }
}
