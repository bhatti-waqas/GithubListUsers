//
//  UserListViewControllerFactory.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import Foundation
import UIKit

final class UserListViewControllerFactory {
    
    // MARK: - Private Properties
    private let usersUseCase: GithubUserUseCase
    
    // MARK: - Init
    init(usersUseCase: GithubUserUseCase) {
        self.usersUseCase = usersUseCase
    }
    
    func makeListViewController() -> ListUsersViewController {
        let viewModel = ListUsersViewModel(useCase: usersUseCase)
        let listUsersViewController = ListUsersViewController(with: viewModel)
        return listUsersViewController
    }
}

