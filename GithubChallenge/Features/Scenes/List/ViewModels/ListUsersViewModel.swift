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
    case showUsers(users: [UserRowViewModel])
    case showMessageWithTitle(message: String)
}

final class ListUsersViewModel {
    
    private var fetchingTask: Task<Void, Never>?
    private let useCase: GithubUserUseCase
    let coordinator: DetailsCoordinator
    var userRowViewModels: [UserRowViewModel] = []
    @Published private(set) var viewState: ListUsersViewState = .idle
    
    let screenTitle = StringKey.Generic.listScreenTitle.get()
    
    init(useCase: GithubUserUseCase,
         coordinator: DetailsCoordinator) {
        self.useCase = useCase
        self.coordinator = coordinator
    }
    
    deinit {
        fetchingTask?.cancel()
    }
    
    func fetchUsersTriggered() {
        fetchUsers()
    }
    
    func showDetails(at index: Int) {
        let row = userRowViewModels[index]
        coordinator.navigateToDetails(with: row.id)
    }
}
// MARK: - Private methods
private extension ListUsersViewModel {
    
    func fetchUsers() {
        viewState = .loading
        fetchingTask = Task { @MainActor in
            do {
                let users = try await useCase.fetchGithubUsers()
                if users.isEmpty {
                    viewState = .showMessageWithTitle(message: StringKey.Error.emptyResultMessage.get())
                } else {
                    userRowViewModels = prepareUsers(users: users)
                    viewState = .showUsers(users: userRowViewModels)
                }
            } catch {
                viewState = .showMessageWithTitle(message: error.localizedDescription)
            }
        }
    }
    
    func prepareUsers(users: [User]) -> [UserRowViewModel] {
        users.map(makeUserRowViewModel(with:))
    }
    
    func makeUserRowViewModel(with user: User) -> UserRowViewModel {
        .init(with: user)
    }
}
