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
        HStack(spacing: 0) {
            if shouldLoadImage {
                AsyncImage(url: landmark.imageURL) { image in
                    image.resizable()
                        .clipShape(CustomRoundedShape(cornerRadius: 16, corners: [.topLeft, .bottomLeft]))
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 120, height: 120)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 120, height: 120)
                    .clipShape(CustomRoundedShape(cornerRadius: 16, corners: [.topLeft, .bottomLeft]))
            }
            
            ZStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.largeTitle)
                        .lineLimit(1)
                    Text(landmark.country.rawValue)
                        .fontWeight(.bold)
                        .opacity(0.7)
                }
                .padding(.leading, 24)
                
                Rectangle()
                    .background(.white)
                    .opacity(0.1)
                    .blur(radius: 4)
                    .frame(width: 720, height: 120)
                    .clipShape(CustomRoundedShape(cornerRadius: 16, corners: [.topRight, .bottomRight]))
                
            }
            
        }
        .overlay(
            CustomRoundedBorderShape(cornerRadius: 16, corners: [.topLeft, .bottomLeft, .topRight, .bottomRight])
                .stroke(Color(red: 1, green: 1, blue: 1, opacity: 0.6), lineWidth: 0.5)
        )
        .onAppear {
            shouldLoadImage = true
        }
        .onDisappear {
            shouldLoadImage = false
        }
    }
}

struct CustomRoundedBorderShape: Shape {
    var cornerRadius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        return Path(path.cgPath)
    }
}

struct CustomRoundedShape: Shape {
    var cornerRadius: CGFloat
    var corners: UIRectCorner
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
        
        if corners.contains(.topLeft) {
            path.addArc(
                center: CGPoint(x: rect.minX + cornerRadius, y: rect.minY + cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: -180),
                endAngle: Angle(degrees: -90),
                clockwise: false
            )
        } else {
            path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        }
        
        path.addLine(to: CGPoint(x: rect.maxX - (corners.contains(.topRight) ? cornerRadius : 0), y: rect.minY))
        
        if corners.contains(.topRight) {
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY + cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: -90),
                endAngle: Angle(degrees: 0),
                clockwise: false
            )
        } else {
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        }
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - (corners.contains(.bottomRight) ? cornerRadius : 0)))
        
        if corners.contains(.bottomRight) {
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 90),
                clockwise: false
            )
        } else {
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        }
        
        path.addLine(to: CGPoint(x: rect.minX + (corners.contains(.bottomLeft) ? cornerRadius : 0), y: rect.maxY))
        
        if corners.contains(.bottomLeft) {
            path.addArc(
                center: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - cornerRadius),
                radius: cornerRadius,
                startAngle: Angle(degrees: 90),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
        } else {
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + (corners.contains(.topLeft) ? cornerRadius : 0)))
        
        return path
    }
}


#Preview {
    ListItemView(landmark: ViewModel().landmarks.first!)
}
