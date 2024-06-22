////
////  LandmarkCard.swift
////  VisionaryTour
////
////  Created by JinNash on 2024/05/07.
////
//
//import SwiftUI
//
//struct LandmarkCard: View {
//    var landmark: Landmark
//    @State private var shouldLoadImage = false
//    
//    var language = Locale.current.language.languageCode?.identifier ?? "en"
//    
//    var body: some View {
//        VStack(alignment: .leading) {
//            if shouldLoadImage {
//                AsyncImage(url: landmark.imageURL) { image in
//                    image.resizable()
//                        .clipShape(RoundedRectangle(cornerRadius: 20))
//                        .aspectRatio(contentMode: .fill)
//                } placeholder: {
//                    ProgressView()
//                }
//                .frame(width: 200, height: 200)
//            } else {
//                Rectangle()
//                    .fill(Color.gray.opacity(0.3))
//                    .frame(width: 200, height: 200)
//                    .clipShape(RoundedRectangle(cornerRadius: 20))
//            }
//            Text(landmark.name[language] ?? landmark.name.en)
//                .padding(.leading, 8)
//                .fontWeight(.bold)
//                .lineLimit(1)
//                .truncationMode(.tail)
//            Text(LocalizedStringKey(landmark.country.rawValue))
//                .padding(.leading, 8)
//                .opacity(0.7)
//        }
//        .frame(width: 200)
//        .background(Color.clear)
//        .hoverEffect(.lift)
//        .clipShape(RoundedRectangle(cornerRadius: 20))
//        .onAppear {
//            shouldLoadImage = true
//        }
//        .onDisappear {
//            shouldLoadImage = false
//        }
//    }
//}
//
//#Preview {
//    LandmarkCard(landmark: ViewModel().landmarks.first!)
//}
