//
//  DetailsViewModel.swift
//  GithubChallenge
//
//  Created by apple on 19/06/2025.
//
import Combine

enum DetailsViewState: Equatable {
    case idle
    case loading
    case showUser(user: UserDetailsRowViewModel)
    case showMessageWithTitle(message: String)
}

final class DetailsViewModel {
    
    private var fetchingTask: Task<Void, Never>?
    private let useCase: UserDetailsUseCase
    var detailsRowViewModel: UserDetailsRowViewModel?
    @Published private(set) var viewState: DetailsViewState = .idle
    
    let screenTitle = StringKey.Generic.screenTitle.get()
    
    init(useCase: UserDetailsUseCase) {
        self.useCase = useCase
    }
    
    deinit {
        fetchingTask?.cancel()
    }
    
    func fetchUsersTriggered() {
        fetchUsers()
    }
}
// MARK: - Private methods
private extension DetailsViewModel {
    
    func fetchUsers() {
        viewState = .loading
        fetchingTask = Task { @MainActor in
            do {
                let user = try await useCase.fetchDetails(with: 1)
                detailsRowViewModel = prepareUser(user: user)
                guard let detailsRowViewModel else { return }
                viewState = .showUser(user: detailsRowViewModel)
            } catch {
                viewState = .showMessageWithTitle(message: error.localizedDescription)
            }
        }
    }
    
    func prepareUser(user: User) -> UserDetailsRowViewModel {
        makeUserRowViewModel(with: user)
    }
    
    func makeUserRowViewModel(with user: User) -> UserDetailsRowViewModel {
        .init(with: user)
    }
}

