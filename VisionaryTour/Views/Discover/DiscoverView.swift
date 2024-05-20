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
        case worldHeritage = "World Heritage"
        case featured = "Featured"
        case list = "List"
    }
    
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
                    RegionView()
                        .onAppear {
                            selectedItem = .region
                        }
                case .worldHeritage:
                    WorldHeritageView()
                        .onAppear {
                            selectedItem = .worldHeritage
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
            switch selectedItem {
            case .discover:
                MainDiscoverView()
            case .region:
                RegionView()
            case .worldHeritage:
                WorldHeritageView()
            case .featured:
                FeaturedView()
            case .list:
                ListView()
            }
        }
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
            .environmentObject(ViewModel())
    }
}
