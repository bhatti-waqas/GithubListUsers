//
//  RepositoryRowViewModel.swift
//  GithubChallenge
//
//  Created by apple on 19/06/2025.
//

import Foundation

struct RepositoryRowViewModel: Hashable {
    let id: Int
    let name: String
    let language: String
    let starGazersCount: Int
    let description: String
    let fork: Bool
    
    init(with repo: Repository) {
        self.id = repo.id
        self.name = repo.name
        self.language = repo.language ?? ""
        self.starGazersCount = repo.starGazersCount ?? 0
        self.description = repo.description ?? ""
        self.fork = repo.fork
    }
}
