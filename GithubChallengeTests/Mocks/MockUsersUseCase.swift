//
//  MockUsersUseCase.swift
//  GithubChallengeTests
//
//  Created by apple on 21/06/2025.
//

import Foundation
@testable import GithubChallenge

final class MockUsersUseCase: GithubUserUseCase {
    
    var fetchUsersResult: Result<[User], Error>!
    
    func fetchGithubUsers() async throws -> [User] {
        switch fetchUsersResult {
        case .success(let users):
            return users
        case .failure(let error):
            throw error
        default:
            preconditionFailure("The mock result for the function shall be populated.")
        }
    }
}
