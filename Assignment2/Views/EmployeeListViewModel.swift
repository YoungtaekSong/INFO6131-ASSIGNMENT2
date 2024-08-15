//
//  EmployeeListViewModel.swift
//  Assignment2
//
//  Created by Andrew Song on 2024-08-14.
//

import SwiftUI

final class EmployeeListViewModel: ObservableObject {
    @Published var searchText: String = ""
    @Published var findEmployees: [EmployeeList] = []
    
    private let service: EmployeeListServiceType
    
    init(service: EmployeeListServiceType = EmployeeListService()) {
        self.service = service
    }
    
    @MainActor
    func search(for text: String) async {
        do {
            if text.isEmpty {
                findEmployees = []
            } else {
                findEmployees = try await service.getList()
            }
        } catch {
            print(error)
        }
    }
}
