//
//  ListView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct ListView: View {
    
    var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            ListItemView(landmark: viewModel.landmarks.first!)
        }
    }
}

#Preview {
    ListView(viewModel: ViewModel())
}
