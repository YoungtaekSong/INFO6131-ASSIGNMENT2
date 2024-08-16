//
//  File.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-12.
//

import Foundation

struct Employees: Codable {
    var employees: [Employee]
    
    private enum codingKeys: String, CodingKey {
        case employees = "employees"
    }
    
    init(employees: [Employee]) {
        self.employees = employees
    }
}

struct Employee: Codable, Hashable {
    var id: String
    var fullName: String
    var phoneNumber: String
    var emailAddress: String
    var biography: String
    var photoUrlSmall: String
    var photoUrlLarge: String
    var team: String
    var employeeType: String

    var employeeTypeStr: String {
        switch employeeType {
            case "FULL_TIME":
                "Full Time"
            case "PART_TIME":
                "Part Time"
            case "CONTRACTOR":
                "Contractor"
            default:
                "UNKNOWN"
        }
    }
    
    private enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case fullName = "full_name"
        case phoneNumber = "phone_number"
        case emailAddress = "email_address"
        case biography = "biography"
        case photoUrlSmall = "photo_url_small"
        case photoUrlLarge = "photo_url_large"
        case team = "team"
        case employeeType = "employee_type"
    }
    
    init(id: String, fullName: String, phoneNumber: String, emailAddress: String, biography: String, photoUrlSmall: String, photoUrlLarge: String, team: String, employeeType: String) {
        self.id = id
        self.fullName = fullName
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
        self.biography = biography
        self.photoUrlSmall = photoUrlSmall
        self.photoUrlLarge = photoUrlLarge
        self.team = team
        self.employeeType = employeeType
    }
}
