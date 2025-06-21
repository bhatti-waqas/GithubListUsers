//
//  ListUsersCoordinatorTests.swift
//  GithubChallengeTests
//
//  Created by apple on 21/06/2025.
//

import XCTest
@testable import GithubChallenge

final class ListUsersCoordinatorTests: XCTestCase {

    func testStart() {
        // Given
        let navigationController = AppNavigationController() // Instantiate a mock navigation controller
        let coordinator = ListUsersCoordinator(rootViewController: navigationController)
        
        // When
        coordinator.start()
        
        // Then
        // Add assertions to verify the expected behavior
        XCTAssertEqual(navigationController.viewControllers.count, 1, "One view controller should be pushed onto the stack")
        
        // Optionally, you can also assert specific properties or behaviors of the created view controller
        XCTAssertTrue(navigationController.viewControllers.first is ListUsersViewController, "The top view controller should be an instance of the Users list view controller")
    }
}
