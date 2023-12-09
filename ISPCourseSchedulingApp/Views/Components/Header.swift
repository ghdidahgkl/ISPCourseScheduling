//
//  Header.swift
//  TimeMan
// ISPCourseSchedulingApp
//

import SwiftUI

struct Header: View {
    var body: some View {
        HStack {
            VStack {
                HStack {
                    Text("TimeMan")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                HStack {
                    Text("Track your Timetable")
                        .font(.callout)
                        .fontWeight(.thin)
                }
            }
            .padding(.leading)
            Spacer()
        }
    }
}
