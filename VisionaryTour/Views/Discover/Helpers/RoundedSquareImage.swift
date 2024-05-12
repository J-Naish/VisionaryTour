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
        case extraLarge
        
        var width: CGFloat {
            switch self {
            case .small:
                return 200
            case .medium:
                return 420
            case .large:
                return 880
            case .extraLarge:
                return 880
            }
        }
        var height: CGFloat {
            switch self {
            case .extraLarge:
                return 280
            default:
                return 200
            }
        }
        var textFont: Font {
            switch self {
            case .small:
                return .system(size: 18)
            case .medium:
                return .system(size: 42)
            case .large:
                return .system(size: 64)
            case .extraLarge:
                return .system(size: 72)
            }
        }
    }
    var text: String? = nil
    
    var body: some View {
        ZStack(alignment: size == .large || size == .extraLarge ? .leading : .bottomLeading) {
            image
                .resizable()
                .aspectRatio(contentMode: .fill)
                .hoverEffect(.lift)
                .frame(width: size.width, height: size.height)
                .clipShape(Rectangle())
                .cornerRadius(20)
            
            if let text = text, size == .large || size == .medium || size == .extraLarge {
                Text(text)
                    .font(size.textFont)
                    .fontWeight(.bold)
                    .padding(.horizontal, 48)
                    .padding(.vertical, size == .medium ? 24 : 0)
            }
        }
    }
}

#Preview {
    RoundedSquareImage(image: Image("dummy"), size: .large, text: "Test")
}
