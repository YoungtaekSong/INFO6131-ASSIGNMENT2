//
//  EmployeeLookupService.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-12.
//

import Foundation

protocol EmployeeListServiceType {
    func getList(for searchText: String) async throws -> [Employee]
}

final class EmployeeListService: EmployeeListServiceType {
    
    private struct APIConstants {
        static let apiUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
        //static let apiUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
        //static let apiUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
    }
    
    func getList() async throws -> [Employee] {
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
        
        let employees: Employees = try JSONDecoder().decode(Employees.self, from: data)
        return employees.employees
    }
    
    func getList(for searchText: String) async throws -> [Employee] {
        var employeeList: [Employee] = []
        for employee in try await self.getList() {
            if searchText.isEmpty {
                employeeList.append(employee)
            } else if employee.fullName.lowercased().contains(searchText.lowercased()) {
                print("Add")
                employeeList.append(employee)
            }
        }
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
