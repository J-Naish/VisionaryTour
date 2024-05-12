//
//  FeaturedView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct FeaturedView: View {
    var body: some View {
        NavigationStack {
            RoundedSquareImage(image: Image("dummy"), size: .large, text: "Featured")
        }
    }
}

#Preview {
    FeaturedView()
}
