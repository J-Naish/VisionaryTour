//
//  DiscoverView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State private var selectedItem: Selection = .discover

    enum Selection: LocalizedStringResource, CaseIterable {
        case discover = "Discover"
        case region = "Region"
        case list = "List"
    }
    
    var viewModel: ViewModel
    var immersiveViewModel: ImmersiveViewModel
    
    @Binding var showImmersiveSpace: Bool
    
    var body: some View {
        NavigationSplitView {
            List(Selection.allCases, id: \.self) { item in
                NavigationLink(value: item) {
                    Text(item.rawValue)
                }
                .navigationTitle("Home")
                .tag(item)
            }
            .searchable(text: $searchText)
            .navigationDestination(for: Selection.self) { item in
                switch item {
                case .discover:
                    DiscoverView(viewModel: viewModel, immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
                        .onAppear {
                            selectedItem = .discover
                        }
                case .region:
                    RegionView(viewModel: viewModel, immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
                        .onAppear {
                            selectedItem = .region
                        }
                case .list:
                    ListView(landmarks: viewModel.landmarks, immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
                        .onAppear {
                            selectedItem = .list
                        }
                }
            }
        } detail: {
            NavigationStack {
                if searchText.isEmpty {
                    selectedView
                } else {
                    LandmarkListView(navigationTitle: "", immersiveViewModel: immersiveViewModel, landmarks: viewModel.searchLandmark(searchText), showImmersiveSpace: $showImmersiveSpace)
                }
            }
        }
    }
    
    @ViewBuilder
    private var selectedView: some View {
        switch selectedItem {
        case .discover:
            DiscoverView(viewModel: viewModel,
                         immersiveViewModel: immersiveViewModel,
                         showImmersiveSpace: $showImmersiveSpace)
        case .region:
            RegionView(viewModel: viewModel,
                       immersiveViewModel: immersiveViewModel,
                       showImmersiveSpace: $showImmersiveSpace)
        case .list:
            ListView(landmarks: viewModel.landmarks,
                     immersiveViewModel: immersiveViewModel,
                     showImmersiveSpace: $showImmersiveSpace)
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: ViewModel(), immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace), showImmersiveSpace: .constant(false))
    }
}
