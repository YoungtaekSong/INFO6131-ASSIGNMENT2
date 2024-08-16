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
                Text("test")
            }
        }
        Text("Hello World")
    }
}

struct EmployeeListSubRowView: View {
    let item: EmployeeList
    let onAction: (_ item: EmployeeList) -> Void
    
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
