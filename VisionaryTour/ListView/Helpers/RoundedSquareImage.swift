//
//  RoundedSquareImage.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/06.
//

import SwiftUI

struct RoundedSquareImage: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 200, height: 200)
            .clipShape(Rectangle())
            .cornerRadius(20)
    }
}

#Preview {
    RoundedSquareImage(image: Image("dummy"))
}
