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
                , trailing: HStack {
                    Text("sample")
                    Text("sample")
                })
        }
        .searchable(text: $searchText)
    }
}

struct ToggleButton: View {
    @Binding var isMapSelected: Bool
    let viewModel: MapViewModel
    
    var body: some View {
        HStack {
            Button("Map") {
                viewModel.updateMapType("roadmap")
                isMapSelected = true
            }
            .buttonStyle(CustomButtonStyle(isSelected: isMapSelected, width: 80))
            .foregroundColor(isMapSelected ? Color.black : Color.white)
            
            Button("Satellite") {
                viewModel.updateMapType("satellite")
                isMapSelected = false
            }
            .buttonStyle(CustomButtonStyle(isSelected: !isMapSelected, width: 80))
            .foregroundColor(!isMapSelected ? Color.black : Color.white)

        }
        .background(
            Capsule()
                .fill(Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.05))
        )
    }
}

struct CustomButtonStyle: ButtonStyle {
    let isSelected: Bool
    let width: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width)
            .padding()
            .background(
                Capsule()
                    .fill(isSelected ? Color.white : Color.clear)
            )
    }
}

#Preview() {
    MapView()
}
