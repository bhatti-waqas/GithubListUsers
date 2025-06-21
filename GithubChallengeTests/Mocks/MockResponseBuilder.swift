//
//  MockResponseBuilder.swift
//  GithubChallengeTests
//
//  Created by apple on 21/06/2025.
//

import Foundation
@testable import GithubChallenge

final class MockResponseBuilder {
    
    static func getMockUsersResponse() -> [User] {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "users_response", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode([User].self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
    
    static func getMockUsersResponseWithEmptyResults() -> [User] {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "users_response_empty", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode([User].self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
    
    static func getMockUserDetailsResponse() -> User {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "user_details_response", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode(User.self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
    
    static func getMockUserReposResponse() -> [Repository] {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "user_repos_response", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return try JSONDecoder().decode([Repository].self, from: data)
        } catch {
            fatalError("Error: \(error)")
        }
    }
    
    static func getMockUsersData() -> Data {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "users_response", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch {
            fatalError("Error: \(error)")
        }
    }
    
    static func getMockUsersDetailsData() -> Data {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "user_details_response", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch {
            fatalError("Error: \(error)")
        }
    }
    
    static func getMockUserReposData() -> Data {
        do {
            let path = Bundle(for: MockResponseBuilder.self).path(forResource: "user_repos_response", ofType: "json")!
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            return data
        } catch {
            fatalError("Error: \(error)")
        }
    }
}

extension UserRowViewModel {
    static func mocked() -> UserRowViewModel {
        .init(with: .mocked())
    }
}

extension User {
    static func mocked() -> User {
        .init(id: 1,
              login: "Bhatti",
              avatarUrl: "https://avatars.githubusercontent.com/u/5?v=4",
              reposUrl: "https://api.github.com/users/ezmobius/repos",
              name: "Waqas Naseem",
              company: "GitHub",
              blog: "https://github.com/blog",
              location: "San Francisco",
              followers: 100)
    }
}
