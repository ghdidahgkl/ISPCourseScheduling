//
//  HomeScreen.swift
//  TimeMan
// ISPCourseSchedulingApp
//

import SwiftUI

struct HomeScreen: View {
    var body: some View {
        NavigationView {
            if #available(iOS 14.0, *) {
                ZStack {
                    Color("PrimaryBackground")
                    VStack(alignment: .leading) {
                        Spacer()
                        Image("Logo")
                            .renderingMode(.original)
                            .resizable()
                            .frame(width: 100, height: 100)
                            .padding(.leading)
                        Spacer()
                        Text("Upcoming Class in ISP Multan")
                            .font(
                                .system(size: 22, weight: .bold, design: .rounded)
                            )
                            .padding(.bottom, 5)
                            .padding(.leading, 30)
                        UpcomingClasses()
                        Spacer()
                    }
                    .frame(width: 320.0, height: 500.0)
                    .background(
                        Color("SecondaryBackground")
                            .clipShape(CustomShapeHome())
                    )
                }
                .navigationTitle("Course Scheduling")
            } 
        }
    }
}
