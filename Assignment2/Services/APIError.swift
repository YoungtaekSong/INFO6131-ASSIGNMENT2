//
//  APIError.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-12.
//

enum ApiError: Error {
    case invalidRequest(String)
    case invalidResponse(String)
    case sessionTimeout
    case unauthorized
}
