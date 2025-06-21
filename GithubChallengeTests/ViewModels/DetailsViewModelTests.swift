//
//  DetailsViewModelTests.swift
//  GithubChallengeTests
//
//  Created by apple on 22/06/2025.
//

import XCTest
import Combine
@testable import GithubChallenge

final class DetailsViewModelTests: XCTestCase {
    
    private var sut: DetailsViewModel!
    private var mockUseCase: MockUserDetailsUseCase!
    private var mockCoordinator: MockUserDetailsCoordinator!
    
    private var cancel: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancel = Set()
        mockUseCase = MockUserDetailsUseCase()
        mockCoordinator = MockUserDetailsCoordinator()
        sut = DetailsViewModel(useCase: mockUseCase, userId: 1, coordinator: mockCoordinator)
    }
    
    override func tearDown() {
        sut = nil
        mockUseCase = nil
        mockCoordinator = nil
        cancel = nil
        super.tearDown()
    }
    
    func test_viewModel_configuration() {
        XCTAssertEqual(sut.screenTitle, StringKey.Generic.detailsScreenTitle.get())
    }
    
    func testFetchUserTriggered_whenServerReturnSuccess_shouldHaveValidStates() {
        // Given
        let mockUserResponse = MockResponseBuilder.getMockUserDetailsResponse()
        let mockReposResponse = MockResponseBuilder.getMockUserReposResponse()
        mockUseCase.fetchUserDetailsResult = .success(mockUserResponse)
        mockUseCase.fetchReposResult = .success(mockReposResponse)
        
        // When
        sut.fetchUserDetailsTriggered()
        
        var login = ""
        var count: Int = 0
        
        sut.$viewState
            .dropFirst()
            .sink { viewState in
                if case .showUser(let user, repos: let repos) = viewState {
                    login = user.login
                    count = repos.count
                }
            }.store(in: &cancel)
        XCTExpect(toEventually: login == mockUserResponse.login)
        XCTExpect(toEventually: count == mockReposResponse.count)
    }
    
    func testFetchUsersTriggered_whenServerReturnFailure_shouldHaveValidStates() {
        // Given
        struct ErrorMock: LocalizedError {
            var errorDescription: String? { "ErrorMock message description" }
        }
        let mockError = ErrorMock()
        mockUseCase.fetchUserDetailsResult = .failure(mockError)
        var errorMessage = ""
        
        sut.$viewState
            .dropFirst()
            .sink { viewState in
                if case .showMessageWithTitle(let message) = viewState {
                    errorMessage = message
                }
            }.store(in: &cancel)
                
        // When
        sut.fetchUserDetailsTriggered()
        // Then
        XCTExpect(toEventually: errorMessage == mockError.localizedDescription)
    }
    
    func testShowRepoInBrowser() {
        // Given
        let mockUserReposResponse = MockResponseBuilder.getMockUserReposResponse()
        sut.repositoryRowViewModels = mockUserReposResponse.map { RepositoryRowViewModel(with: $0) }
        
        // When: Trigger the open browser method
        sut.openUrlInBrowser(index: 0)
        
        XCTExpect(toEventually: mockCoordinator.openUrlInvoked)
    }
}
