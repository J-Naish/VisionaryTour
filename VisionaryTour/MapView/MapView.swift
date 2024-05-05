//
//  MapView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

struct MapView: View {
    var body: some View {
        MapViewRepresentable()
            .clipShape(RoundedRectangle(cornerRadius: 48))
    }
}

#Preview(windowStyle: .automatic) {
    MapView()
}
