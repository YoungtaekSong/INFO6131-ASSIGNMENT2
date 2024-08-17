//
//  SettingsView.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-16.
//

import SwiftUI

struct SettingsView: View {
    @State private var imageURL: URL?
    
    var body: some View {
        VStack(alignment: .leading) {
            if let url = imageURL {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 350, height: 350)
                .clipShape(Circle())
            }
            VStack(alignment: .leading) {
                EmployeeDetailRow(name: "Name", value: "Young Taek Song")
                EmployeeDetailRow(name: "StudentID", value: "1122390")
             
            }.padding()
            Spacer()
        }
        .onAppear() {
            Task {
                imageURL = URL(string: "https://gravatar.com/avatar/debfb8d6545fe86d2b69248cbf97d0da?size=256&cache=1723855058900")
            }
        }
        .padding()
    }
}

#Preview {
    SettingsView()
}
