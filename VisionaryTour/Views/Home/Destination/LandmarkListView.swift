//
//  LandmarkListView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/24.
//

import SwiftUI

struct LandmarkListView: View {
    var navigationTitle: String
    var immersiveViewModel: ImmersiveViewModel
    
    var landmarks: [Landmark]
    
    var rows: [[Landmark]] {
        stride(from: 0, to: landmarks.count, by: 4).map {
            Array(landmarks[$0..<min($0 + 4, landmarks.count)])
        }
    }
    
    @Binding var showImmersiveSpace: Bool
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .center, spacing: 48) {
                ForEach(rows, id: \.self) { row in
                    HStack(alignment: .top, spacing: 32) {
                        ForEach(row) { landmark in
                            NavigationLink {
                                LandmarkDetailView(landmark: landmark, immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
                            } label: {
                                LandmarkCard(landmark: landmark)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                        if row.count < 4 {
                            Spacer()
                        }
                    }
                }
                .navigationTitle(navigationTitle)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding(.bottom, 48)
        }
        .padding(.horizontal, 32)
    }
}

struct LandmarkListView_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkListView(navigationTitle: "Asia", immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace), landmarks: ViewModel().landmarks, showImmersiveSpace: .constant(false))
    }
}
