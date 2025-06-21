//
//  DefaultUserDetailsUseCase.swift
//  GithubChallenge
//
//  Created by apple on 18/06/2025.
//

import Foundation
import Networking

final class DefaultUserDetailsUseCase {
    
    // MARK: - Private Properties
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}
// MARK: - Currency Usecase implementation
extension DefaultUserDetailsUseCase: UserDetailsUseCase {
    
    func fetchDetails(with id: Int) async throws -> User {
        try await networkService.request(with: .user(with: id))
    }
    
    func fetchRepositories(with userName: String) async throws -> [Repository] {
        try await networkService.request(with: .repositories(with: userName))
    }
}
