//
//  LandmarkDescriptionView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/23.
//

import SwiftUI

struct LandmarkDescriptionView: View {
    var landmark: Landmark
    
    var language = Locale.current.language.languageCode?.identifier ?? "en"
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    AsyncImage(url: landmark.imageURL) { image in
                        image.resizable()
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 160, height: 160)
                    
                    VStack(alignment: .leading) {
                        Text(landmark.name[language] ?? landmark.name.en)
                            .font(.largeTitle)
                        Text(LocalizedStringKey(landmark.country.rawValue))
                    }
                    .padding(.leading, 24)
                }
                .padding(.bottom, 32)
                
                Text("Description")
                    .font(.title)
                    .padding(.bottom, 16)
                
                Text(landmark.description[language] ?? landmark.description.en)
            }
            .padding(.bottom, 48)
        }
    }
}

#Preview {
    LandmarkDescriptionView(landmark: ViewModel().landmarks.first!)
}
