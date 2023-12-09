//
//  TabBar.swift
//  TimeMan
// ISPCourseSchedulingApp
//

import SwiftUI

struct TabBar: View {
    @Binding var selectedTab: String
    @Binding var isPresented: Bool
    var body: some View {
        HStack {
            TabButton(title: "Scroll", image: "lineweight", selectedTab: $selectedTab)
            Spacer(minLength: 0)
            TabButton(title: "Home", image: "house", selectedTab: $selectedTab)
            Spacer(minLength: 0)
            TabButton(title: "Grid", image: "calendar", selectedTab: $selectedTab)
        }
        .padding(.vertical)
        .padding(.horizontal, 20)
        .background(Color("SecondaryBackground"))
        .shadow(color: Color.black.opacity(0.05), radius: 5, x: 0, y: -5)
    }
}

struct TabButton: View {
    var title: String
    var image: String
    @Binding var selectedTab: String
    var body: some View {
        Button {
            selectedTab = title
        } label: {
            HStack(spacing: 10) {
                Image(systemName: image)
                    .renderingMode(.template)
                if title != "Home" {
                    Text(title)
                    .fontWeight(.semibold)
                }
            }
            .foregroundColor(selectedTab == title ? Color("TabButton") : .gray)
            .padding(.vertical)
            .padding(.horizontal, 15)
            .background(Color.yellow.opacity(selectedTab == title ? 0.10 : 0))
            .clipShape(Capsule())
        }
    }
}
