//
//  EmployeeListView.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-14.
//

import SwiftUI

struct EmployeeListView: View {
    @ObservedObject var vm = EmployeeListViewModel()

    var body: some View {
        NavigationStack {
            List(vm.findEmployees, id:\.self.id) { item in
                NavigationLink(destination: EmployeeDetail(employee: item)) {
                    HStack {
                        VStack {
                            if let url = URL(string: item.photoUrlSmall) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                } placeholder: {
                                    ProgressView()
                                }
                                .frame(width: 50, height: 50)
                                .clipShape(Circle())
                            }
                        }
                        VStack(alignment: .leading) {
                            Text(item.fullName)
                                .font(.headline)
                                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            Text(item.team)
                        }
                    }
                }
            }
            .navigationTitle("Employee")
            .font(.subheadline)
            .searchable(text: $vm.searchText, prompt:"Search for employee")
            .onAppear() {
                Task {
                    await vm.search(for: "")
                }
            }
            .onChange(of: vm.searchText) { oldvalue, newValue in
                Task {
                    await vm.search(for: newValue)
                }
            }
        }
    }
}

#Preview {
    EmployeeListView()
}
