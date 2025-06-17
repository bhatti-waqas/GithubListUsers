//
//  EndPoint+Users.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import Networking

struct Config {
    // To-Do need to keep this token into plist file
    static let token: String = "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"
}

extension Endpoint {
    
    static let baseUrl = "https://api.github.com"
    static func users() -> Self {
        .init(baseURL: baseUrl,
              path: "/users",
              headers: ["Authorization": "Bearer \(Config.token)"]
        )
    }
}
