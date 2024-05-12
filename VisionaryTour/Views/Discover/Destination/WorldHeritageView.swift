//
//  WorldHeritageView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct WorldHeritageView: View {
    var body: some View {
        ScrollView {
            VStack {
                RoundedSquareImage(image: Image("dummy"), size: .large, text: "World Heritage")
                    .padding(.bottom, 72)
                HStack(spacing: 32) {
                    RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Natural")
                    RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Cultural")
                }
            }
        }
    }
}

#Preview {
    WorldHeritageView()
}
