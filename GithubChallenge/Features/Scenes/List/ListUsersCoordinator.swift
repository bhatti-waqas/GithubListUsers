//
//  ListUsersCoordinator.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import UIKit
import Coordinator

final class ListUsersCoordinator: BaseCoordinator<AppNavigationController> {
    
    override func start() {
        let factory = ServiceLocator.userListViewControllersFactory()
        let currencyViewController = factory.makeListViewController()
        rootViewController.pushViewController(currencyViewController, animated: true)
    }
}
