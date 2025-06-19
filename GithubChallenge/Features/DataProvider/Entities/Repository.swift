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
    
    enum CodingKeys: CodingKey {
        case id
        case name
    }
}
