//
//  TestView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/06/20.
//

import SwiftUI

struct NoInternetConnectionView: View {
    var body: some View {
        NavigationStack {
            ContentUnavailableView(
                "No Internet Connection",
                systemImage: "wifi.exclamationmark",
                description: Text("Please check your connection and try again.")
            )
        }
    }
}

#Preview {
    NoInternetConnectionView()
}
