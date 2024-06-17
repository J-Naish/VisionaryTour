//
//  TitleView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/06/17.
//

import SwiftUI

struct SectionTitle: View {
    var title: LocalizedStringResource

    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle)
            
            Image(systemName: "chevron.right")
                .font(.largeTitle)
        }
    }
}

#Preview {
    SectionTitle(title: "Famous")
}
