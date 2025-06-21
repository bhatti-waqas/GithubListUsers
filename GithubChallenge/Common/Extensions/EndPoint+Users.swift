//
//  EndPoint+Users.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import Networking
import Utils

extension Endpoint {
    
    static let baseUrl = AppConfig.Keys.apiBaseURL.stringValue
    
    static func users() -> Self {
        .init(baseURL: baseUrl,
              path: "/users")
    }
    
    static func user(with id: Int) -> Self {
        .init(baseURL: baseUrl,
              path: "/user/\(id)")
    }
    
    static func repositories(with username: String) -> Self {
        .init(baseURL: baseUrl,
              path: "/users/\(username)/repos")
    }
}
