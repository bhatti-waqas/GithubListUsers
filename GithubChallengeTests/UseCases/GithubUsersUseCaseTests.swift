//
//  GithubUsersUseCaseTests.swift
//  GithubChallengeTests
//
//  Created by apple on 21/06/2025.
//

import XCTest
@testable import GithubChallenge

final class GithubUsersUseCaseTests: XCTestCase {
    
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
    }
    
    override func tearDown() {
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchUsersSuccess() async throws {
        // Given
        let mockData = MockResponseBuilder.getMockUsersData()
        mockNetworkService.result = .success(mockData)
        let useCase = DefaultUsersUseCase(networkService: mockNetworkService)
        
        // When
        let users = try await useCase.fetchGithubUsers()
        
        // Then
        // Verify Users are fetched from network service
        XCTAssertTrue(mockNetworkService.requestCalled)
        XCTAssertNotNil(users)
    }
    
    func testFetchUsersFailure() async throws {
        // Given
        struct ErrorMock: LocalizedError {
            var errorDescription: String? { "ErrorMock message description" }
        }
        let mockError = ErrorMock()
        mockNetworkService.result = .failure(mockError)
        let useCase = DefaultUsersUseCase(networkService: mockNetworkService)
        
        // When
        do {
            _ = try await useCase.fetchGithubUsers()
            // This line should not be executed if the call fails
            XCTFail("Fetching users should fail but did not.")
        } catch {
            // Then
            guard let error = error as? ErrorMock else {
                return XCTFail("Fetching users should fail but did not.")
            }
            XCTAssertEqual(error.localizedDescription, mockError.localizedDescription, "Received error should match the expected error.")
        }
    }
}
