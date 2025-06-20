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
    let name: String
    let company: String
    let blog: String
    let location: String
    let followers: Int
    
    var imageUrl: URL? {
        URL(string: avatarUrl)
    }
    
    init(with user: User) {
        self.id = user.id
        self.login = user.login
        self.avatarUrl = user.avatarUrl
        self.reposUrl = user.reposUrl
        self.name = user.name ?? ""
        self.company = user.company ?? ""
        self.blog = user.blog ?? ""
        self.location = user.location ?? ""
        self.followers = user.followers ?? 0
    }
}
