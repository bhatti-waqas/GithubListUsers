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
    let followers: Int?
    
    enum CodingKeys: String, CodingKey {
        case id
        case login
        case avatarUrl = "avatar_url"
        case reposUrl = "repos_url"
        case name
        case company
        case blog
        case location
        case followers
    }
}
