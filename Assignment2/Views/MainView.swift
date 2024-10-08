//
//  MainView.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-15.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 1
    
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack {
                EmployeeListView()
            }
            .tabItem {
                Label("Employee", systemImage: "person.3")
            }
            VStack {
                SettingsView()
            }
            .tabItem {
                Label("Settings", systemImage: "gear")
            }
        }
    }
}

#Preview {
    MainView()
}
