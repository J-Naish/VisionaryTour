//
//  RoundedSquareImage.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/06.
//

import SwiftUI

struct RoundedSquareImage: View {
    var image: Image
    var isWide: Bool
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 200, maxWidth: isWide ? 880 : 200, minHeight: 200, maxHeight: isWide ? 240 : 200, alignment: .center)
            .clipShape(Rectangle())
            .cornerRadius(20)
    }
}

#Preview {
    RoundedSquareImage(image: Image("dummy"), isWide: true)
}
