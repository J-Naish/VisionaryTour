//
//  ZoomControlButton.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/08.
//

import SwiftUI

struct ZoomControlButton: View {
    let viewModel: ViewModel
    var body: some View {
        HStack {
            Spacer(minLength: 16)
            Button(action: {
                DispatchQueue.main.async {
                    viewModel.zoomIn()
                }
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
            }
            .frame(width: 48)
            .clipShape(Circle())

            Spacer(minLength: 16)

            Button(action: {
                DispatchQueue.main.async {
                    viewModel.zoomOut()
                }
            }) {
                Image(systemName: "minus")
                    .font(.system(size: 24))
            }
            .frame(width: 48)
            .clipShape(Circle())
        }
    }
}
