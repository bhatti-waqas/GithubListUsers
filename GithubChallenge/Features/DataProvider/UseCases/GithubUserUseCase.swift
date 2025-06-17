//
//  GithubUserUseCase.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import Foundation

protocol GithubUserUseCase {
    func fetchGithubUsers() async throws -> [User]
}
