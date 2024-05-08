//
//  ZoomControlButton.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/08.
//

import SwiftUI

struct ZoomControlButton: View {
    let viewModel: MapViewModel
    var body: some View {
        HStack {
            Spacer(minLength: 16)
            Button(action: {
                viewModel.zoomIn()
            }) {
                Image(systemName: "plus")
            }
            Spacer(minLength: 16)
            Button(action: {
                viewModel.zoomOut()
            }) {
                Image(systemName: "minus")
            }
        }
    }
}
