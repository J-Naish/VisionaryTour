//
//  MainDiscoverView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct MainDiscoverView: View {
    var body: some View {
        ScrollView {
            RoundedSquareImage(image: Image("dummy"), size: .extraLarge, text: "Discover")
        }
    }
}

#Preview {
    MainDiscoverView()
}
