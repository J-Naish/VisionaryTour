//
//  LandmarkCard.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/07.
//

import SwiftUI

struct LandmarkCard: View {
    var landmark: Landmark
    
    var body: some View {
        VStack(alignment: .leading) {
            Image("dummy")
                .resizable()
                .clipShape(Rectangle())
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200)
                .cornerRadius(20)
            Text(landmark.name)
                .padding(.leading, 8)
                .fontWeight(.bold)
            Text(landmark.country.rawValue)
                .padding(.leading, 8)
                .opacity(0.7)
        }
        .background(Color.clear)
        .hoverEffect(.lift)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    LandmarkCard(landmark: ViewModel().landmarks.first!)
}
