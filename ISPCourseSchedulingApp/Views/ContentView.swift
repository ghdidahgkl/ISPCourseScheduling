//
//  ContentView.swift
//  TimeMan
// ISPCourseSchedulingApp
//

import SwiftUI

struct ContentView: View {
    @State var isPresented = false
    @State var selectedIndex = "Home"
    var body: some View {
        VStack {
            if selectedIndex == "Scroll" {
                ScrollScreen(isPresented: $isPresented)
            } else if selectedIndex == "Home" {
                HomeScreen()
            } else {
                GridScreen(isPresented: $isPresented)
            }
            TabBar(selectedTab: $selectedIndex, isPresented: $isPresented)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}
