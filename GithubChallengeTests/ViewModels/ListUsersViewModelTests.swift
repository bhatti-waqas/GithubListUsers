//
//  ListUsersViewModelTests.swift
//  GithubChallengeTests
//
//  Created by apple on 22/06/2025.
//

import XCTest
import Combine
@testable import GithubChallenge

final class ListUsersViewModelTests: XCTestCase {
    
    private var sut: ListUsersViewModel!
    private var mockUseCase: MockUsersUseCase!
    private var mockCoordinator: MockListUsersCoordinator!
    
    private var cancel: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancel = Set()
        mockUseCase = MockUsersUseCase()
        mockCoordinator = MockListUsersCoordinator()
        sut = ListUsersViewModel(useCase: mockUseCase, coordinator: mockCoordinator)
    }
    
    override func tearDown() {
        sut = nil
        mockUseCase = nil
        mockCoordinator = nil
        cancel = nil
        super.tearDown()
    }
    
    func test_viewModel_configuration() {
        XCTAssertEqual(sut.screenTitle, StringKey.Generic.listScreenTitle.get())
    }
    
    func testFetchUsersTriggered_whenServerReturnSuccess_shouldHaveValidStates() {
        // Given
        let mockUsersResponse = MockResponseBuilder.getMockUsersResponse()
        mockUseCase.fetchUsersResult = .success(mockUsersResponse)
                
        // When
        sut.fetchUsersTriggered()
        
        // Then
        XCTAssertEqual(sut.viewState, .loading)
        XCTExpect(toEventually: sut.viewState == .showUsers(users: sut.userRowViewModels))
    }
    
    func testFetchUsersTriggered_whenServerReturnFailure_shouldHaveValidStates() {
        // Given
        struct ErrorMock: LocalizedError {
            var errorDescription: String? { "ErrorMock message description" }
        }
        let mockError = ErrorMock()
        mockUseCase.fetchUsersResult = .failure(mockError)
        var errorMessage = ""
        
        sut.$viewState
            .dropFirst()
            .sink { viewState in
                if case .showMessageWithTitle(let message) = viewState {
                    errorMessage = message
                }
            }.store(in: &cancel)
                
        // When
        sut.fetchUsersTriggered()
        // Then
        XCTExpect(toEventually: errorMessage == mockError.localizedDescription)
    }
    
    func testFetchUsersTriggered_EmptyResult() {
        // Given
        let mockUsersEmptyResults = MockResponseBuilder.getMockUsersResponseWithEmptyResults()
        // Mock usecase with an response with empty results
        mockUseCase.fetchUsersResult = .success(mockUsersEmptyResults)
        
        // When
        sut.fetchUsersTriggered()
        
        // Assert that the view state transitions to .loading and then to .showMessageWithTitle with the correct message
        XCTAssertEqual(sut.viewState, .loading)
        XCTExpect(toEventually: sut.viewState == .showMessageWithTitle(message: StringKey.Error.emptyResultMessage.get()), timeout: 2.0)
    }
    
    func testShowUserDetails() {
        // Given
        let mockUsersResponse = MockResponseBuilder.getMockUsersResponse()
        sut.userRowViewModels = mockUsersResponse.map { UserRowViewModel(with: $0) }
        
        // When: Trigger the showArticleDetails method
        sut.showDetails(at: 0)
        
        XCTExpect(toEventually: mockCoordinator.showDetailsInvoked)
    }
}
