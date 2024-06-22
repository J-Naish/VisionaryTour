////
////  ListView.swift
////  VisionaryTour
////
////  Created by JinNash on 2024/05/12.
////
//
//import SwiftUI
//
//struct ListView: View {
//    
//    var landmarks: [Landmark]
//    
//    var immersiveViewModel: ImmersiveViewModel
//    
//    @Binding var showImmersiveSpace: Bool
//    
//    var body: some View {
//        ScrollView {
//            LazyVStack {
//                ForEach(landmarks, id: \.self) { landmark in
//                    NavigationLink {
//                        LandmarkDetailView(landmark: landmark, immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
//                    } label: {
//                        ListItemView(landmark: landmark)
//                            .padding(.bottom, 16)
//                    }
//                    .buttonStyle(PlainButtonStyle())
//                }
//            }
//        }
//        .padding(.bottom, 32)
//    }
//}
//
//#Preview {
//    ListView(landmarks: ViewModel().landmarks, immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace), showImmersiveSpace: .constant(false))
//}
