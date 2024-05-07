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
                    ToggleButton(isMapSelected: $isMapSelected, viewModel: viewModel)
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

struct ToggleButton: View {
    @Binding var isMapSelected: Bool
    let viewModel: MapViewModel
    
    var body: some View {
        ZStack {
            
            Capsule()
                .fill(Color(red:1.0, green: 1.0, blue: 1.0, opacity: 0.45))
                .frame(width: 280, height: 48)
            
            HStack {
                Button(action: {
                    withAnimation {
                        viewModel.updateMapType("roadmap")
                        isMapSelected = true
                    }
                }) {
                    Text("")
                        .frame(width: 64, height: 14)
                        .padding()
                        .background(
                            Capsule()
                                .fill(Color.clear)
                        )
                        .contentShape(Capsule())
                }
                
                Button(action: {
                    withAnimation {
                        viewModel.updateMapType("satellite")
                        isMapSelected = false
                    }
                }) {
                    Text("")
                        .frame(width: 64, height: 14)
                        .padding()
                        .background(
                            Capsule()
                                .fill(Color.clear)
                        )
                        .contentShape(Capsule())
                }
            }
            
            Capsule()
                .fill(Color.clear)
                .innerShadow(color: Color.black.opacity(0.2), radius: 2)
                .frame(width: 280, height: 48)
                .allowsHitTesting(false)
            
            CapsuleBackground(isMapSelected: $isMapSelected)
                .allowsHitTesting(false)
            
            HStack {
                Text("Map")
                    .frame(width: 136, height: 14)
                    .foregroundColor(isMapSelected ? Color.black : Color.white)
                    .allowsHitTesting(false)
                Text("Satellite")
                    .frame(width: 136, height: 14)
                    .foregroundColor(!isMapSelected ? Color.black : Color.white)
                    .allowsHitTesting(false)
            }
            
        }
    }
}

struct CapsuleBackground: View {
    @Binding var isMapSelected: Bool
    
    var body: some View {
        Capsule()
            .fill(Color.white)
            .frame(width: 136, height: 48)
            .offset(x: isMapSelected ? -72 : 72)
            .onChange(of: isMapSelected) { newValue, _ in
                withAnimation(.easeInOut(duration: 0.15)) {}
            }
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
