//
//  DiscoverView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

struct DiscoverView: View {
    @State private var searchText = ""
    @State private var selectedItem: Selection = .discover

    enum Selection: String, CaseIterable {
        case discover = "Discover"
        case region = "Region"
        case featured = "Featured"
        case list = "List"
    }
    
    var viewModel: ViewModel
    var immersiveViewModel: ImmersiveViewModel
    
    @Binding var showImmersiveSpace: Bool
    
    var body: some View {
        NavigationSplitView {
            List(Selection.allCases, id: \.self) { item in
                NavigationLink(value: item) {
                    HStack {
                        Text(item.rawValue)
                    }
                }
                .navigationTitle("Discover")
                .tag(item)
            }
            .searchable(text: $searchText)
            .navigationDestination(for: Selection.self) { item in
                switch item {
                case .discover:
                    MainDiscoverView()
                        .onAppear {
                            selectedItem = .discover
                        }
                case .region:
                    RegionView(viewModel: viewModel, immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
                        .onAppear {
                            selectedItem = .region
                        }
                case .featured:
                    FeaturedView()
                        .onAppear {
                            selectedItem = .featured
                        }
                case .list:
                    ListView()
                        .onAppear {
                            selectedItem = .list
                        }
                }
            }
        } detail: {
            NavigationStack {
                switch selectedItem {
                case .discover:
                    MainDiscoverView()
                case .region:
                    RegionView(viewModel: viewModel, immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
                case .featured:
                    FeaturedView()
                case .list:
                    ListView()
                }
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView(viewModel: ViewModel(), immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace), showImmersiveSpace: .constant(false))
    }
}
