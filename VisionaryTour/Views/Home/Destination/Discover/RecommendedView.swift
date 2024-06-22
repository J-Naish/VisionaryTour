////
////  RecommendedView.swift
////  VisionaryTour
////
////  Created by JinNash on 2024/06/17.
////
//
//import SwiftUI
//
//struct RecommendedView: View {
//    
//    var viewModel: ViewModel
//    var immersiveViewModel: ImmersiveViewModel
//    @Binding var showImmersiveSpace: Bool
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            SectionTitle(title: "Recommended")
//            
//            ScrollView(.horizontal, showsIndicators: false) {
//                LazyHStack {
//                    let recommendedLandmarks = filterLandmarks(landmarks: viewModel.landmarks, by: .category(.recommended))
//                    ForEach(0 ..< recommendedLandmarks.count / 2 + recommendedLandmarks.count % 2, id: \.self) { index in
//                        VStack {
//                            if index * 2 < recommendedLandmarks.count {
//                                NavigationLink {
//                                    LandmarkDetailView(landmark: recommendedLandmarks[index * 2], immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
//                                } label: {
//                                    LandmarkCard(landmark: recommendedLandmarks[index * 2])
//                                }
//                                .buttonStyle(PlainButtonStyle())
//                                .padding(.bottom, 16)
//                            }
//                            if index * 2 + 1 < recommendedLandmarks.count {
//                                NavigationLink {
//                                    LandmarkDetailView(landmark: recommendedLandmarks[index * 2 + 1], immersiveViewModel: immersiveViewModel, showImmersiveSpace: $showImmersiveSpace)
//                                } label: {
//                                    LandmarkCard(landmark: recommendedLandmarks[index * 2 + 1])
//                                }
//                                .buttonStyle(PlainButtonStyle())
//                            }
//                        }
//                        .padding(.trailing, 40)
//                    }
//                }
//            }
//        }
//    }
//}
//
//#Preview {
//    RecommendedView(viewModel: ViewModel(), immersiveViewModel: ImmersiveViewModel(placeInfo: defaultPlace), showImmersiveSpace: .constant(false))
//}
