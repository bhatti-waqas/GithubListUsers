//
//  MockUserDetailsCoordinator.swift
//  GithubChallengeTests
//
//  Created by apple on 22/06/2025.
//

import UIKit

@testable import GithubChallenge

final class MockUserDetailsCoordinator: URLNavigator {
    
    var openUrlInvoked: Bool = false
    
    func openURLInBroswer(with url: URL) {
        openUrlInvoked = true
    }
}
