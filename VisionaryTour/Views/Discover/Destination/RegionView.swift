//
//  RegionView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct RegionView: View {
    var body: some View {
        NavigationStack {
            RoundedSquareImage(image: Image("dummy"), size: .large, text: "Region")
        }
    }
}

#Preview {
    RegionView()
}
