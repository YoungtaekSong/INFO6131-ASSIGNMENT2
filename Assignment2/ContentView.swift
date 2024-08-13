//
//  ContentView.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-11.
//

import SwiftUI

struct ContentView: View {

    @AppStorage("showOnboardingScreen") var showOnboardingScreen: Bool = true

    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .fullScreenCover(isPresented: $showOnboardingScreen) {
            showOnboardingScreen = false
        } content: {
            OnboardingView(showOnboardingScreen: $showOnboardingScreen)
        }
        .padding()
    }
}

struct OnboardingView: View {
    @Binding var showOnboardingScreen: Bool

    var body: some View {
        VStack {
            Spacer()
            Text("Onboarding Screen")
            Spacer()
            Button {
                showOnboardingScreen = true
            } label: {
                Text("Continue")
                    .font(.headline)
                    .frame(maxWidth: .infinity)
            }
        }
    }
}

#Preview {
    ContentView()
}
