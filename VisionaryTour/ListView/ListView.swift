//
//  ListView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

struct ListView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationSplitView {
            List {
                
            }
            .navigationTitle("List")
        } detail: {
            
        }
        .searchable(text: $searchText)
    }
}

#Preview {
    ListView()
}
