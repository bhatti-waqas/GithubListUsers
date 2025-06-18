//
//  UserDetailsRowViewModel.swift
//  GithubChallenge
//
//  Created by apple on 19/06/2025.
//

import Foundation

struct UserDetailsRowViewModel: Hashable {
    
    let id: Int
    let login: String
    let avatarUrl: String
    let reposUrl: String
    
    var imageUrl: URL? {
        URL(string: avatarUrl)
    }
    
    init(with user: User) {
        self.id = user.id
        self.login = user.login
        self.avatarUrl = user.avatarUrl
        self.reposUrl = user.reposUrl
    }
}
