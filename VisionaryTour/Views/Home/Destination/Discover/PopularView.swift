//
//  PopularView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/06/17.
//

import SwiftUI

struct PopularView: View {
    var body: some View {
        HStack {
            Text("Popular")
                .font(.largeTitle)
            
            Image(systemName: "chevron.right")
                .font(.largeTitle)
        }
    }
}

#Preview {
    PopularView()
}
