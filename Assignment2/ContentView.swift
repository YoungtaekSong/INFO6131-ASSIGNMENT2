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
            MainView()
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
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            VStack {
                Spacer()
                Text("Employee List").font(.system(size: 40, weight: .bold))
                Spacer()
                Image(systemName: "person.text.rectangle")
                    .font(.system(size: 100))
                    .fontWeight(.semibold)
                Spacer()
                Spacer()
                Button {
                    showOnboardingScreen = false
                } label: {
                    Text("Continue")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .controlSize(.large)
                .padding([.horizontal], 40)
            }
        }
    }
}

#Preview {
    ContentView()
}
