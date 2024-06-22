//
//  Loading.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/17.
//

import SwiftUI

struct Loading: View {
    
    @ObservedObject var immersiveViewModel: ImmersiveViewModel
    @Binding var showImmersiveSpace: Bool
    
    var body: some View {
        if immersiveViewModel.progress < 1.0 && immersiveViewModel.progress >= 0 {
            SmallWindow() {
                VStack {
                    ProgressView(value: immersiveViewModel.progress)
                        .scaleEffect(2.0)
                        .frame(width: 100, height: 100)
                        .progressViewStyle(.circular)
                    Text("Loading Panorama")
                        .font(.largeTitle)
                }
            }
        } else if immersiveViewModel.showError {
            
            SmallWindow() {
                VStack {
                    Text(LocalizedStringKey("Something went wrong."))
                        .font(.title)
                        .padding(.bottom, 24)
                        .foregroundColor(.red)
                    Text(LocalizedStringKey("Please try again later"))
                    Text(LocalizedStringKey("or choose another place."))
                }
            }
            .onAppear {
                showImmersiveSpace = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                    withAnimation {
                        immersiveViewModel.showError = false
                    }
                }
            }
        }
    }
}

fileprivate struct SmallWindow<Content: View>: View {
    let content: () -> Content
    
    var body: some View {
        ZStack {
            Color(hex: "#808080", opacity: 0.3)
                .blur(radius: 20)
            content()
        }
        .frame(width: 400, height: 240)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}


#Preview {
    Loading(immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace), showImmersiveSpace: .constant(false))
}
