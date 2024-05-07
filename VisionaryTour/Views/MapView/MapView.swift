//
//  MapView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/05.
//

import SwiftUI

struct MapView: View {
    @StateObject private var viewModel = MapViewModel()
    @State private var searchText = ""
    @State private var isMapSelected = true
    
    var body: some View {
        NavigationStack {
            MapViewRepresentable(viewModel: viewModel)
                .clipShape(RoundedRectangle(cornerRadius: 32))
                .padding(EdgeInsets(top: 0, leading: 32, bottom: 32, trailing: 32))
                .navigationBarItems(leading:
                    MapControlButton(isMapSelected: $isMapSelected, viewModel: viewModel)
                        .padding(.leading, 8)
                , trailing: HStack {
                    Button("map") {
                        viewModel.updateMapType("roadmap")
                    }
                    Button("satellite") {
                        viewModel.updateMapType("satellite")
                    }
                })
        }
        .searchable(text: $searchText)
    }
}


extension View {
    func innerShadow(color: Color, radius: CGFloat = 4, offsetX: CGFloat = 0, offsetY: CGFloat = 0) -> some View {
        modifier(ShadowModifier(color: color, radius: radius, offsetX: offsetX, offsetY: offsetY))
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

#Preview() {
    MapView()
}
