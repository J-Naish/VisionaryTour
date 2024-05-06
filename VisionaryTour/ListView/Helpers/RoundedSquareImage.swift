//
//  RoundedSquareImage.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/06.
//

import SwiftUI

struct RoundedSquareImage: View {
    var image: Image
    var size: Size
    enum Size {
        case small
        case medium
        case large
        
        var width: CGFloat {
            switch self {
            case .small:
                return 200
            case .medium:
                return 420
            case .large:
                return 880
            }
        }
        var height: CGFloat {
            switch self {
            case .small:
                return 200
            case .medium:
                return 200
            case .large:
                return 200
            }
        }
    }
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: size.width, height: size.height)
            .clipShape(Rectangle())
            .cornerRadius(20)
    }
}

#Preview {
    RoundedSquareImage(image: Image("dummy"), size: .large)
}
