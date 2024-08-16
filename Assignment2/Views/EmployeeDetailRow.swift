//
//  EmployeeDetailRow.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-16.
//

import SwiftUI

struct EmployeeDetailRow: View {
    let name: String
    let value: String
    
    var body: some View {
        HStack() {
            Text("\(name):").frame(width:100, alignment: .leading).foregroundColor(.black)
            Text("\(value)").foregroundColor(.gray)
        }
        Divider()
    }
}

#Preview {
    EmployeeDetailRow(name:"Phone", value:"5195554567")
}
