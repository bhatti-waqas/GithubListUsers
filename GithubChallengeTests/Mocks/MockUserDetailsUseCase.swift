//
//  MockUserDetailsUseCase.swift
//  GithubChallengeTests
//
//  Created by apple on 22/06/2025.
//

import Foundation
@testable import GithubChallenge

final class MockUserDetailsUseCase: UserDetailsUseCase {
    
    var fetchUserDetailsResult: Result<User, Error>!
    var fetchReposResult: Result<[Repository], Error>!
    
    func fetchDetails(with id: Int) async throws -> User {
        switch fetchUserDetailsResult {
        case .success(let user):
            return user
        case .failure(let error):
            throw error
        default:
            preconditionFailure("The mock result for the function shall be populated.")
        }
    }
    
    func fetchRepositories(with userName: String) async throws -> [Repository] {
        switch fetchReposResult {
        case .success(let repos):
            return repos
        case .failure(let error):
            throw error
        default:
            preconditionFailure("The mock result for the function shall be populated.")
        }
        
    }
}
