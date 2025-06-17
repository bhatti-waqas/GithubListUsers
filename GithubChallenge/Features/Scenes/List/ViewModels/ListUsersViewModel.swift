//
//  ListUsersViewModel.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import Foundation
import Combine

enum ListUsersViewState: Equatable {
    case idle
    case loading
    case showUsers(users: [User])
    case showMessageWithTitle(message: String)
}

final class ListUsersViewModel {
    
    private var fetchingTask: Task<Void, Never>?
    private let useCase: GithubUserUseCase
    
    @Published private(set) var viewState: ListUsersViewState = .idle
    let screenTitle = StringKey.Generic.screenTitle.get()
    
    init(useCase: GithubUserUseCase) {
        self.useCase = useCase
    }
    
    deinit {
        fetchingTask?.cancel()
    }
    
    func fetchUsersTriggered() {
        viewState = .loading
        fetchingTask = Task { @MainActor in
            do {
                let users = try await useCase.fetchGithubUsers()
                viewState = .showUsers(users: users)
            } catch {
                viewState = .showMessageWithTitle(message: error.localizedDescription)
            }
        }
    }
}
