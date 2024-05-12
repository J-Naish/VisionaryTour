//
//  WorldHeritageView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct WorldHeritageView: View {
    var body: some View {
        NavigationStack {
            RoundedSquareImage(image: Image("dummy"), size: .large, text: "World Heritage")
        }
    }
}

#Preview {
    WorldHeritageView()
}
