//
//  FeaturedView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct PupularView: View {
    var body: some View {
        ScrollView {
            RoundedSquareImage(image: Image("dummy"), size: .large, text: "Featured")
        }
    }
}

#Preview {
    PupularView()
}
