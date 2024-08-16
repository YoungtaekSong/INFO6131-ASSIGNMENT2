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
                Text(item.fullName)
            }
        }
        .searchable(text: $vm.searchText, prompt:"Search for employee")
        .onChange(of: vm.searchText) { oldvalue, newValue in
            Task {
                await vm.search(for: newValue)
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
            Image(systemName: "plus.magnifyingglass")
                .imageScale(.large)
            Spacer()
            Text("test")
        }
        .onTapGesture {
            onAction(item)
        }
    }
}

#Preview {
    EmployeeListView()
}
