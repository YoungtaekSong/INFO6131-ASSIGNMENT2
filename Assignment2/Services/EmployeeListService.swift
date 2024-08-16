//
//  EmployeeLookupService.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-12.
//

import Foundation

protocol EmployeeListServiceType {
    func getList() async throws -> [EmployeeList]
}

final class EmployeeListService: EmployeeListServiceType {
    
    private struct APIConstants {
        static let apiUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees.json"
        //static let apiUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees_malformed.json"
        //static let apiUrl = "https://s3.amazonaws.com/sq-mobile-interview/employees_empty.json"
    }
    
    func getList() async throws -> [EmployeeList] {
        
        
        print("call getList")
        
        guard var urlComponents = URLComponents(string: APIConstants.apiUrl) else {
            throw ApiError.invalidRequest("Invalid api request")
        }
        
        guard let url = urlComponents.url else {
            throw ApiError.invalidRequest("Invalid api url")
        }
        
        
        let request = createRequestHeader(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
            throw ApiError.invalidRequest("Unexpected server response")
        }
        
        print (data)
        
        return try JSONDecoder().decode([EmployeeList].self, from: data)
    }
    
    private func createRequestHeader(url: URL) -> URLRequest {
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"

        return request
    }
}
