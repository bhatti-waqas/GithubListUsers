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
              path: "/users"
              //headers: ["Authorization": "Bearer \(AppConfig.Keys.personalAccessToken.stringValue)"]
        )
    }
    
    static func user(with id: String) -> Self {
        .init(baseURL: baseUrl,
              path: "/user",
              queryItems: [.init(name: "", value: id)]
        )
    }
}
