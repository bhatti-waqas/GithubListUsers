//
//  Repository.swift
//  GithubChallenge
//
//  Created by apple on 19/06/2025.
//

import Foundation

struct Repository: Decodable {
    let id: Int
    let name: String
    let language: String?
    let starGazersCount: Int?
    let description: String?
    let fork: Bool
    let htmlUrl: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case language
        case description
        case fork
        case starGazersCount = "stargazers_count"
        case htmlUrl = "html_url"
    }
}
