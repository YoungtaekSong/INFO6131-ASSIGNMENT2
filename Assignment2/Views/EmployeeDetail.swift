//
//  EmployeeDetail.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-16.
//

import SwiftUI

struct EmployeeDetail: View {
    @State private var imageURL: URL?
    let employee: Employee
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text(employee.fullName)
                .font(.largeTitle)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            
            if let url = imageURL {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 350, height: 350)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            }

            VStack(alignment: .leading) {
                EmployeeDetailRow(name: "Phone", value: employee.phoneNumber)
                EmployeeDetailRow(name: "Email", value: employee.emailAddress)
                EmployeeDetailRow(name: "Team", value: employee.team)
                EmployeeDetailRow(name: "Type", value: employee.employeeTypeStr)
                EmployeeDetailRow(name: "Biography", value: employee.biography)
            }.padding(20)
            Spacer()

        }
        .onAppear() {
            Task {
                imageURL = URL(string: employee.photoUrlLarge)
            }
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
