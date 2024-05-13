//
//  RegionView.swift
//  VisionaryTour
//
//  Created by JinNash on 2024/05/12.
//

import SwiftUI

struct RegionView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    RoundedSquareImage(image: Image("dummy"), size: .large, text: "Region", enableHoverEEffect: false)
                        .padding(.bottom, 72)
                    
                    
                    HStack(spacing: 32) {
                        NavigationLink {
                            RegionListView(region: .asia)
                                .environmentObject(modelData)
                        } label: {
                            RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Asia")
                        }
                        .frame(width: 420)

                        NavigationLink {
                            RegionListView(region: .europe)
                                .environmentObject(modelData)
                        } label: {
                            RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Europe")
                        }
                        .frame(width: 420)
                    }
                    .padding(.bottom, 32)
                    
                    
                    HStack(spacing: 32) {
                        NavigationLink {
                            RegionListView(region: .northAmerica)
                                .environmentObject(modelData)
                        } label: {
                            RoundedSquareImage(image: Image("dummy"), size: .medium, text: "North America")
                        }
                        .frame(width: 420)

                        NavigationLink {
                            RegionListView(region: .latinAmerica)
                                .environmentObject(modelData)
                        } label: {
                            RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Latin America")
                        }
                        .frame(width: 420)
                    }
                    .padding(.bottom, 32)
                    
                    
                    HStack(spacing: 32) {
                        NavigationLink {
                            RegionListView(region: .africa)
                                .environmentObject(modelData)
                        } label: {
                            RoundedSquareImage(image: Image("dummy"), size: .medium, text: "Africa")
                        }
                        .frame(width: 420)

                        NavigationLink {
                            RegionListView(region: .oceania)
                                .environmentObject(modelData)
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
}

struct RegionView_Previews: PreviewProvider {
    static var previews: some View {
        RegionView()
            .environmentObject(ModelData())
    }
}
