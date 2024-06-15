//
//  ListItemView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/06/16.
//

import SwiftUI

struct ListItemView: View {
    
    var landmark: Landmark
    @State private var shouldLoadImage = false
    
    var body: some View {
        HStack {
            if shouldLoadImage {
                AsyncImage(url: landmark.imageURL) { image in
                    image.resizable()
                        .clipShape(CustomRoundedShape(cornerRadius: 16))
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200, height: 200)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 200, height: 200)
                    .cornerRadius(20)
            }
        }
        .onAppear {
            shouldLoadImage = true
        }
        .onDisappear {
            shouldLoadImage = false
        }
    }
}

struct CustomRoundedShape: Shape {
    var cornerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        path.addArc(
            center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: -180),
            endAngle: Angle(degrees: -90),
            clockwise: false
        )
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        path.addArc(
            center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
            radius: cornerRadius,
            startAngle: Angle(degrees: 90),
            endAngle: Angle(degrees: 180),
            clockwise: false
        )
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        
        return path
    }
}

#Preview {
    ListItemView(landmark: ViewModel().landmarks.first!)
}
