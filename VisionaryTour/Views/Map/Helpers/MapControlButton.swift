//
//  MapControlButton.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/08.
//

import SwiftUI

struct MapControlButton: View {
    @Binding var isMapSelected: Bool
    let viewModel: ViewModel
    
    var body: some View {
        ZStack {
            
            Capsule()
                .fill(Color(red:1.0, green: 1.0, blue: 1.0, opacity: 0.2))
                .frame(width: 280, height: 48)
            
            HStack {
                ForEach(0..<2) { _ in
                    Button(action: {
                        withAnimation {
                            viewModel.updateMapType(isMapSelected ? .hybrid : .roadmap)
                            isMapSelected.toggle()
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
                    .tint(Color.clear)
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
        .padding(.leading, 8)
    }
}

struct CapsuleBackground: View {
    @Binding var isMapSelected: Bool
    
    var body: some View {
        Capsule()
            .fill(Color.white)
            .frame(width: 136, height: 48)
            .offset(x: isMapSelected ? -72 : 72)
            .animation(.easeInOut(duration: 0.4), value: isMapSelected)
    }
}

//#Preview {
//    MapControlButton()
//}
