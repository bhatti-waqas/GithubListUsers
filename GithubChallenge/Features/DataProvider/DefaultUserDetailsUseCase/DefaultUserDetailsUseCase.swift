//
//  DefaultUserDetailsUseCase.swift
//  GithubChallenge
//
//  Created by apple on 18/06/2025.
//

import Foundation

final class DefaultUserDetailsUseCase: UserDetailsUseCase {
    func fetchDetails(with id: Int) async throws -> User {
        User.mock()
    }
}
