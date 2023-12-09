//
//  FloatingActionButton.swift
//  TimeMan
// ISPCourseSchedulingApp
//

import SwiftUI

struct FloatingActionButton: View {
    @Binding var isPresented: Bool
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button {
                    self.isPresented.toggle()
                } label: {
                    Text("+")
                        .font(.system(.largeTitle))
                        .frame(width: 50, height: 45)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 7)
                }
                .background(Color("CourseCardSecondaryAccent"))
                .cornerRadius(25)
                .padding()
                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
            }
        }
    }
}
