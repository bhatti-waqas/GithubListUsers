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
              path: "/users",
              headers: ["Authorization": "Bearer: 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"]
        )
    }
    
    static func user(with id: Int) -> Self {
        .init(baseURL: baseUrl,
              path: "/user/\(id)",
              headers: ["Authorization": "Bearer: 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"]
        )
    }
    
    static func repositories(with username: String) -> Self {
        .init(baseURL: baseUrl,
              path: "/users/\(username)/repos",
              headers: ["Authorization": "Bearer: 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"]
              )
    }
}
