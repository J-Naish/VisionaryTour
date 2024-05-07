//
//  SearchBar.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/07.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    
    var body: some View {
        VStack {
            ZStack {
                // 背景
                RoundedRectangle(cornerRadius: 8)
                    .fill(Color(red: 239 / 255,
                                green: 239 / 255,
                                blue: 241 / 255))
                    .frame(height: 36)
                
                HStack(spacing: 6) {
                    Spacer()
                        .frame(width: 0)
                    
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    
                    TextField("Search", text: $text)
                    
                    if !text.isEmpty {
                        Button {
                            text.removeAll()
                        } label: {
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.gray)
                        }
                        .padding(.trailing, 6)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
