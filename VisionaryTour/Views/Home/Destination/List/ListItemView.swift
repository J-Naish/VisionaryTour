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
                        .aspectRatio(contentMode: .fill)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 120, height: 120)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .frame(width: 120, height: 120)
            }
            
            ZStack(alignment: .leading) {
                VStack(alignment: .leading) {
                    Text(landmark.name)
                        .font(.largeTitle)
                        .lineLimit(1)
                    Text(LocalizedStringKey(landmark.country.rawValue))
                        .fontWeight(.bold)
                        .opacity(0.7)
                }
                .padding(.leading, 24)
                
                Rectangle()
                    .background(.white)
                    .opacity(0.1)
                    .blur(radius: 4)
                    .frame(width: 720, height: 120)
            }
        }
        .overlay(
            CustomRoundedBorderShape(cornerRadius: 16, corners: [.topLeft, .bottomLeft, .topRight, .bottomRight])
                .stroke(Color(red: 1, green: 1, blue: 1, opacity: 0.6), lineWidth: 0.5)
        )
        .hoverEffect(.lift)
        .clipShape(RoundedRectangle(cornerRadius: 16))
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


#Preview {
    ListItemView(landmark: ViewModel().landmarks.first!)
}
