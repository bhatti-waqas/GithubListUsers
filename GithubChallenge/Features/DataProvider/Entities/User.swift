//
//  User.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import Foundation

struct User: Decodable, Hashable {
    let id: Int
    let login: String
    let avatarUrl: String
    let reposUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case reposUrl = "repos_url"
    }
    
    static func mock() -> User {
        .init(id: 1, login: "Bhatti", avatarUrl: "https://avatars.githubusercontent.com/u/5?v=4", reposUrl: "https://api.github.com/users/ezmobius/repos")
    }
    
    var avatarURL: URL {
        URL(string: avatarUrl)!
    }
}
