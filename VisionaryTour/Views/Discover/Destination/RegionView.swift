//
//  RegionView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct RegionView: View {
    @EnvironmentObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                RoundedSquareImage(image: Image("dummy"), size: .large, text: "Region", enableHoverEEffect: false)
                    .padding(.bottom, 72)
                
                
                HStack(spacing: 32) {
                    NavigationLink {
                        RegionListView(region: .asia)
                            .environmentObject(viewModel)
                    } label: {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Asia")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink {
                        RegionListView(region: .europe)
                            .environmentObject(viewModel)
                    } label: {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Europe")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, 32)
                
                
                HStack(spacing: 32) {
                    NavigationLink {
                        RegionListView(region: .northAmerica)
                            .environmentObject(viewModel)
                    } label: {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "North America")
                    }
                    .buttonStyle(PlainButtonStyle())
                    
                    NavigationLink {
                        RegionListView(region: .latinAmerica)
                            .environmentObject(viewModel)
                    } label: {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Latin America")
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.bottom, 32)
                
                
                HStack(spacing: 32) {
                    NavigationLink {
                        RegionListView(region: .africa)
                            .environmentObject(viewModel)
                    } label: {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Africa")
                    }
                    .frame(width: 420)
                    
                    NavigationLink {
                        RegionListView(region: .oceania)
                            .environmentObject(viewModel)
                    } label: {
                        RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Oceania")
                    }
                    .frame(width: 420)
                }
                .padding(.bottom, 48)
            }
        }
    }
}

struct RegionView_Previews: PreviewProvider {
    static var previews: some View {
        RegionView()
            .environmentObject(ViewModel())
    }
}
