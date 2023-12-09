//
//  UpcomingClasses.swift
//  TimeMan
// ISPCourseSchedulingApp
//

import SwiftUI

struct UpcomingClasses: View {
    var viewModel = UpcomingClassViewModel()
    @FetchRequest(
        entity: Course.entity(),
        sortDescriptors: [NSSortDescriptor(key: "time", ascending: true)]
    ) var coursesList: FetchedResults<Course>
    var body: some View {
        VStack {
            if !viewModel.areUpcomingClassesAvailable(list: coursesList) {
                NoUpcomingClasses()
            } else {
                UpcomingCourseCard(course: viewModel.getUpcomingClass(list: coursesList))
            }
        }
        .padding(20)
    }
}

struct NoUpcomingClasses: View {
    var body: some View {
        VStack {
            VStack {
                Text("No Upcoming Classes in ISP Multan")
                    .font(.system(size: 22, weight: .bold, design: .rounded))
                    .padding(.bottom, 5)
            }
        }
        .padding(20)
    }
}
