//
//  DefaultUsersUseCase.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import Foundation
import Networking

final class DefaultUsersUseCase {
    
    // MARK: - Private Properties
    private let networkService: NetworkServiceProtocol
    
    init(networkService: NetworkServiceProtocol) {
        self.networkService = networkService
    }
}
// MARK: - Currency Usecase implementation
extension DefaultUsersUseCase: GithubUserUseCase {
    
    func fetchGithubUsers() async throws -> [User] {
        try await networkService.request(with: .users())
    }
}
