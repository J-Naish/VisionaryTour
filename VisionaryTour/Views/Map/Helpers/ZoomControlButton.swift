//
//  ZoomControlButton.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/08.
//

import SwiftUI

struct ZoomControlButton: View {
    let modelData: ModelData
    var body: some View {
        HStack {
            Spacer(minLength: 16)
            Button(action: {
                modelData.zoomIn()
            }) {
                Image(systemName: "plus")
                    .font(.system(size: 24))
            }
            .frame(width: 48)
            .clipShape(Circle())

            Spacer(minLength: 16)

            Button(action: {
                modelData.zoomOut()
            }) {
                Image(systemName: "minus")
                    .font(.system(size: 24))
            }
            .frame(width: 48)
            .clipShape(Circle())
        }
    }
}
