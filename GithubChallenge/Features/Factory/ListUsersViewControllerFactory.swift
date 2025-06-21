//
//  ListUsersViewControllerFactory.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import Foundation
import UIKit

final class ListUsersViewControllerFactory {
    
    // MARK: - Private Properties
    private let usersUseCase: GithubUserUseCase
    
    // MARK: - Init
    init(usersUseCase: GithubUserUseCase) {
        self.usersUseCase = usersUseCase
    }
    
    func makeListViewController(with coordinator: DetailsCoordinator) -> ListUsersViewController {
        let viewModel = ListUsersViewModel(useCase: usersUseCase,
                                           coordinator: coordinator)
        let listUsersViewController = ListUsersViewController(with: viewModel)
        return listUsersViewController
    }
}
