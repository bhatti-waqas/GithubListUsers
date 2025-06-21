//
//  UserDetailsUseCaseTests.swift
//  GithubChallengeTests
//
//  Created by apple on 22/06/2025.
//

import XCTest
@testable import GithubChallenge

final class UserDetailsUseCaseTests: XCTestCase {
    
    var mockNetworkService: MockNetworkService!
    
    override func setUp() {
        super.setUp()
        mockNetworkService = MockNetworkService()
    }
    
    override func tearDown() {
        mockNetworkService = nil
        super.tearDown()
    }

    func testFetchUserDetailsSuccess() async throws {
        // Given
        let mockData = MockResponseBuilder.getMockUsersDetailsData()
        mockNetworkService.result = .success(mockData)
        let useCase = DefaultUserDetailsUseCase(networkService: mockNetworkService)
        
        // When
        let userDetails = try await useCase.fetchDetails(with: 25)
        
        // Then
        // Verify Users are fetched from network service
        XCTAssertTrue(mockNetworkService.requestCalled)
        XCTAssertNotNil(userDetails)
    }
    
    func testFetchUserDetailsFailure() async throws {
        // Given
        struct ErrorMock: LocalizedError {
            var errorDescription: String? { "ErrorMock message description" }
        }
        let mockError = ErrorMock()
        mockNetworkService.result = .failure(mockError)
        let useCase = DefaultUserDetailsUseCase(networkService: mockNetworkService)
        
        // When
        do {
            _ = try await useCase.fetchDetails(with: 25)
            // This line should not be executed if the call fails
            XCTFail("Fetching user repos should fail but did not.")
        } catch {
            // Then
            guard let error = error as? ErrorMock else {
                return XCTFail("Fetching user repos should fail but did not.")
            }
            XCTAssertEqual(error.localizedDescription, mockError.localizedDescription, "Received error should match the expected error.")
        }
    }
    
    func testFetchReposSuccess() async throws {
        // Given
        let mockData = MockResponseBuilder.getMockUserReposData()
        mockNetworkService.result = .success(mockData)
        let useCase = DefaultUserDetailsUseCase(networkService: mockNetworkService)
        
        // When
        let userDetails = try await useCase.fetchRepositories(with: "octocat")
        
        // Then
        // Verify Users are fetched from network service
        XCTAssertTrue(mockNetworkService.requestCalled)
        XCTAssertNotNil(userDetails)
    }
    
    func testFetchReposFailure() async throws {
        // Given
        struct ErrorMock: LocalizedError {
            var errorDescription: String? { "ErrorMock message description" }
        }
        let mockError = ErrorMock()
        mockNetworkService.result = .failure(mockError)
        let useCase = DefaultUserDetailsUseCase(networkService: mockNetworkService)
        
        // When
        do {
            _ = try await useCase.fetchRepositories(with: "octocat")
            // This line should not be executed if the call fails
            XCTFail("Fetching user repos should fail but did not.")
        } catch {
            // Then
            guard let error = error as? ErrorMock else {
                return XCTFail("Fetching user repos should fail but did not.")
            }
            XCTAssertEqual(error.localizedDescription, mockError.localizedDescription, "Received error should match the expected error.")
        }
    }
}
