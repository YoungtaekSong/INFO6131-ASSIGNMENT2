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
                /*
                 EmployeeListSubRowView(item: item) { [self] item in
                 vm.searchText = item.fullName
                 }
                 */
                NavigationLink(destination: EmployeeDetail(employee: item)) {
                    HStack {
                        Image(item.photoUrlSmall).imageScale(.large)
                        VStack {
                            Text(item.fullName)
                            Text(item.team)
                        }
                    }
                }
            }
        }
        .navigationDestination(for: Employee.self) { item in
            EmployeeDetail(employee: item)
        }
        .searchable(text: $vm.searchText, prompt:"Search for employee")
        .onChange(of: vm.searchText) { oldvalue, newValue in
            Task {
                await vm.search(for: newValue)
            }
        }
        .onAppear() {
            Task {
                await vm.search(for: "")
            }
        }
        .font(.subheadline)
        .navigationTitle("Employee")
    }
}

struct EmployeeListSubRowView: View {
    let item: Employee
    let onAction: (_ item: Employee) -> Void
    
    var body: some View {
        HStack {
            Image(item.photoUrlSmall).imageScale(.large)
            VStack {
                Text(item.fullName)
                Text(item.team)
            }
        }
        .onTapGesture {
            onAction(item)
        }
    }
}

#Preview {
    EmployeeListView()
}
