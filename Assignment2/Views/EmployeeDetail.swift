//
//  EmployeeDetail.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-16.
//

import SwiftUI

struct EmployeeDetail: View {
    let employee: Employee
    
    init(employee: Employee) {
        self.employee = employee
    }
    
    var body: some View {
        Text(employee.fullName)
    }
}
