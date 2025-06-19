//
//  User.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import Foundation

struct User: Decodable {
    
    let id: Int
    let login: String
    let avatarUrl: String
    let reposUrl: String
    let name: String?
    let company: String?
    let blog: String?
    let location: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case reposUrl = "repos_url"
        case name
        case company
        case blog
        case location
    }
    
    static func mock() -> User {
        .init(id: 1, 
              login: "Bhatti",
              avatarUrl: "https://avatars.githubusercontent.com/u/5?v=4",
              reposUrl: "https://api.github.com/users/ezmobius/repos",
              name: "Waqas Naseem",
              company: "GitHub",
              blog: "https://github.com/blog",
              location: "San Francisco")
    }
}
