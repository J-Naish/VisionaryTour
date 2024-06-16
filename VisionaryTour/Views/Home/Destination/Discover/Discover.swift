//
//  MainDiscoverView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct Discover: View {
    var body: some View {
        ScrollView {
            VStack {
                RoundedSquareImage(image: Image("dummy"), size: .extraLarge, text: "Discover")
                
            }
        }
    }
}

#Preview {
    Discover()
}
