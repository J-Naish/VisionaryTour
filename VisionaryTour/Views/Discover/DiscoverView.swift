//
//  DiscoverView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

struct DiscoverView: View {
    @State private var searchText = ""
    @State private var selection: Selection = .discover
    
    enum Selection: String, CaseIterable {
        case discover = "Discover"
        case region = "Region"
        case worldHeritage = "World Heritage"
        case featured = "Featured"
        case list = "List"
        
        var hasChild: Bool {
            switch self {
            case .region, .worldHeritage:
                return true
            default:
                return false
            }
        }
    }
    
    var body: some View {
        NavigationSplitView {
            List(Selection.allCases, id: \.self) { item in
                NavigationLink(value: item) {
                    HStack {
                        Text(item.rawValue)
                        if item.hasChild {
                            Spacer()
                            Image(systemName: "chevron.forward")
                        }
                    }
                }
            }
            .searchable(text: $searchText)
        } detail: {
            ScrollView {
                VStack {
                    
                }
            }
            .padding(EdgeInsets(top: 0, leading: 32, bottom: 32, trailing: 32))
        }
    }
}

#Preview {
    DiscoverView()
}
