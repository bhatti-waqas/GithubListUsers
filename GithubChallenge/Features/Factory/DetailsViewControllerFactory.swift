//
//  DetailsViewControllerFactory.swift
//  GithubChallenge
//
//  Created by apple on 18/06/2025.
//

final class DetailsViewControllerFactory {
    
    // MARK: - Private Properties
    private let usersUseCase: UserDetailsUseCase
    
    init(usersUseCase: UserDetailsUseCase) {
        self.usersUseCase = usersUseCase
    }
    
    static func makeDetailsViewController(wit id: Int) -> DetailsViewController {
        
        //let listUsersViewController = ListUsersViewController(with: viewModel)
        //return listUsersViewController
        return DetailsViewController()
    }
}
