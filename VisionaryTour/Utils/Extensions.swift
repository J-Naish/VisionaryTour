//
//  Extensions.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/08.
//

import SwiftUI
import Foundation

extension View {
    func innerShadow(color: Color, radius: CGFloat = 4, offsetX: CGFloat = 0, offsetY: CGFloat = 0) -> some View {
        modifier(ShadowModifier(color: color, radius: radius, offsetX: offsetX, offsetY: offsetY))
    }
}

extension View {
    @ViewBuilder
    func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

struct ShadowModifier: ViewModifier {
    let color: Color
    let radius: CGFloat
    let offsetX: CGFloat
    let offsetY: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Capsule()
                    .stroke(color, lineWidth: 4)
                    .blur(radius: radius)
                    .offset(x: offsetX, y: offsetY)
                    .mask(
                        Capsule()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.black, Color.clear]), startPoint: .top, endPoint: .bottom))
                    )
            )
            .overlay(
                Capsule()
                    .stroke(color, lineWidth: 4)
                    .blur(radius: radius)
                    .offset(x: offsetX, y: offsetY)
                    .mask(
                        Capsule()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black]), startPoint: .top, endPoint: .bottom))
                    )
            )
    }
}
