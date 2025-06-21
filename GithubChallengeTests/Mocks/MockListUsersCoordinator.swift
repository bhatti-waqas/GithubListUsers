//
//  MockListUsersCoordinator.swift
//  GithubChallengeTests
//
//  Created by apple on 21/06/2025.
//

import UIKit

@testable import GithubChallenge

final class MockListUsersCoordinator: DetailsCoordinator {
    
    var showDetailsInvoked: Bool = false
    
    func navigateToDetails(with id: Int) {
        showDetailsInvoked = true
    }
}
