//
//  EmployeeListViewModel.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-14.
//

import SwiftUI

final class EmployeeListViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var findEmployees: [Employee] = []
    
    private let service: EmployeeListServiceType
    
    init(service: EmployeeListServiceType = EmployeeListService()) {
        self.service = service
    }
    
    @MainActor
    func search(for searchText: String) async {
        do {
            if searchText.isEmpty {
                findEmployees = try await service.getList(for: "")
            } else {
                findEmployees = try await service.getList(for: searchText)
            }
        } catch {
            print(error)
        }
    }
}
