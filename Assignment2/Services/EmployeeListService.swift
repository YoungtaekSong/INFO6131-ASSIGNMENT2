//
//  EmployeeLookupService.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-12.
//

import Foundation

protocol EmployeeListServiceType {
    func getList() async throws -> [Employee]
}

final class EmployeeListService: EmployeeListServiceType {
    
    private struct APIConstants {
        static let apiUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
        //static let apiUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
        //static let apiUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
    }
    
    func getList() async throws -> [Employee] {
        
        print("call getList")
        
        guard let urlComponents = URLComponents(string: APIConstants.apiUrl) else {
            throw ApiError.invalidRequest("Invalid api request")
        }
        
        guard let url = urlComponents.url else {
            throw ApiError.invalidRequest("Invalid api url")
        }
        
        let request = createRequestHeader(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw ApiError.invalidResponse("Unexpected server response")
        }
        
        if statusCode > 299 {
            throw ApiError.invalidResponse("Sever error code \(statusCode)")
        }
        
        print(">>>>>>>>>>>>>>>>>>>>>>")
        
        let employees: Employees = try JSONDecoder().decode(Employees.self, from: data)
        var employeeList: [Employee] = []
        
        for employee in employees.employees {
            employeeList.append(employee)
        }
        print(">>>>>>>>>>>>>>>>>>>>>>")
        
        return employeeList
    }
    
    private func createRequestHeader(url: URL) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"

        return request
    }
}
