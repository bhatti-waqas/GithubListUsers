//
//  DetailsViewModel.swift
//  GithubChallenge
//
//  Created by apple on 19/06/2025.
//
import Combine

enum TableItem: Hashable {
    case user(UserDetailsRowViewModel)
    case repository(RepositoryRowViewModel)
}

enum DetailsViewState: Equatable {
    case idle
    case loading
    case showUser(user: UserDetailsRowViewModel, repos: [RepositoryRowViewModel])
    case showMessageWithTitle(message: String)
}

final class DetailsViewModel {
    
    private var fetchingTask: Task<Void, Never>?
    private let useCase: UserDetailsUseCase
    private let coordinator: URLNavigator
    private let userId: Int
    var detailsRowViewModel: UserDetailsRowViewModel?
    var repositoryRowViewModels: [RepositoryRowViewModel] = []
    @Published private(set) var viewState: DetailsViewState = .idle
    
    let screenTitle = StringKey.Generic.detailsScreenTitle.get()
    
    init(useCase: UserDetailsUseCase, 
         userId: Int,
         coordinator: URLNavigator) {
        self.useCase = useCase
        self.userId = userId
        self.coordinator = coordinator
    }
    
    deinit {
        fetchingTask?.cancel()
    }
    
    func fetchUserDetailsTriggered() {
        fetchUserDetails()
    }
    
    func openUrlInBrowser(index: Int) {
        let repo = repositoryRowViewModels[index]
        guard let url = repo.url else { return }
        coordinator.openURLInBroswer(with: url)
    }
}
// MARK: - Private methods
private extension DetailsViewModel {
    
    func fetchUserDetails() {
        viewState = .loading
        fetchingTask = Task { @MainActor in
            do {
                let user = try await useCase.fetchDetails(with: userId)
                detailsRowViewModel = prepareUser(user: user)
                let repositories = try await useCase.fetchRepositories(with: user.login)
                repositoryRowViewModels = prepareRepositories(repos: repositories)
                guard let detailsRowViewModel else { return }
                viewState = .showUser(user: detailsRowViewModel, repos: repositoryRowViewModels)
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
    
    func prepareRepositories(repos: [Repository]) -> [RepositoryRowViewModel] {
        repos.map(makeRepoRowViewModel(with:))
    }
    
    func makeRepoRowViewModel(with repo: Repository) -> RepositoryRowViewModel {
        .init(with: repo)
    }
}
