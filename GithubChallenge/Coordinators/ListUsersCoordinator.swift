//
//  ListUsersCoordinator.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import UIKit
import Coordinator

protocol DetailsCoordinator {
    func navigateToDetails(with id: Int)
}

final class ListUsersCoordinator: BaseCoordinator<AppNavigationController> {
    
    override func start() {
        let factory = ServiceLocator.listUsersViewControllersFactory()
        let currencyViewController = factory.makeListViewController(with: self)
        rootViewController.pushViewController(currencyViewController, animated: true)
    }
}

extension ListUsersCoordinator: DetailsCoordinator {
    func navigateToDetails(with id: Int) {
        let detailCoordinator = UserDetailsCoordinator(id: id, 
                                                       rootViewController: rootViewController)
        startChild(detailCoordinator)
    }
}
