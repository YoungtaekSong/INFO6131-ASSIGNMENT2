//
//  EmployeeDetail.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-16.
//

import SwiftUI

struct EmployeeDetail: View {
    let employee: Employee
   
    var body: some View {
        VStack(alignment: .center) {
            if let url = URL(string: employee.photoUrlLarge) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 300, height: 300)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }
            
            Text(employee.fullName)
            Spacer()
        }
    }
}

#Preview {
     EmployeeDetail(employee: Employee(
        id: "0d8fcc12-4d0c-425c-8355-390b312b909c",
        fullName: "Justine Mason",
        phoneNumber: "5553280123",
        emailAddress: "jmason.demo@squareup.com",
        biography: "Engineer on the Point of Sale team.",
        photoUrlSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg",
        photoUrlLarge: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg",
        team: "Point of Sale",
        employeeType: "FULL_TIME"
     ))
}
