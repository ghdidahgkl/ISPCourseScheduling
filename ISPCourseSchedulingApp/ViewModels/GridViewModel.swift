//
//  GridViewModel.swift
//  TimeMan
//
// ISPCourseSchedulingApp
//

import SwiftUI

class GridViewModel {
    private var colorCodes = ColorCodes()
    private let calendar = Calendar.current

    private func getClassType(course: Course) -> String {
        if course.isLecture {
            return course.lectureNumber ?? ""
        } else if course.isTutorial {
            return course.tutorialNumber ?? ""
        } else if course.isPractical {
            return course.practicalNumber ?? ""
        }
        return ""
    }
    
    private func shouldCourseBeIncluded(course: Course, index: Int) -> Bool {
        let weekDayName = longWeekDaySymbols[index]
        let converted = course.weekDayRepeat
        if converted!.contains(weekDayName) {
            return true
        }
        return false
    }

    func gridBackground(
        list: FetchedResults<Course>,
        gridTime: Int,
        weekDay: Int
    ) -> Color {
        let colorCodeIndex = self.getCourseForGrid(
            list: list,
            gridTime: gridTime,
            weekDay: weekDay)[2]
        return  colorCodes.colorNumbers[Int(colorCodeIndex)!]
    }

    func getCourseForGrid(
        list: FetchedResults<Course>,
        gridTime: Int,
        weekDay: Int
    ) -> [String] {
        var gridCourse = Course()
        let gridLowerLimit = gridTime * 60
        let gridUpperLimit = gridLowerLimit + 60
        var isIncluded = false

        // To find if a course is at the Grid Position
        // If the courseTime which is in minutes is in the Grid Limits
        // gridCourse is assigned
        // isIncluded is the variable utilised to check if any course is present in that position or not

        for courseItem in list {
            if self.shouldCourseBeIncluded(course: courseItem, index: weekDay) {
                let courseTime = courseItem.time
                let courseHour = calendar.component(.hour, from: courseTime!)
                let courseMinute = calendar.component(.minute, from: courseTime!)
                let classTime = courseHour * 60 + courseMinute
                if classTime >= gridLowerLimit {
                    if classTime < gridUpperLimit {
                        gridCourse = courseItem
                        isIncluded = true
                    }
                }
            }
        }
        if !isIncluded {
            return ["Error"]
        }
        return [
            gridCourse.courseCode!,
            gridCourse.courseID!,
            String(gridCourse.colorNum),
            self.getClassType(course: gridCourse)
        ]
    }
}
