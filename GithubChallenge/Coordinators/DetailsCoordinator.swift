//
//  DetailsCoordinator.swift
//  GithubChallenge
//
//  Created by apple on 18/06/2025.
//

import Coordinator
import UIKit

final class UserDetailsCoordinator: BaseCoordinator<AppNavigationController> {
    
    let id: Int
    
    init(id: Int, rootViewController: AppNavigationController) {
        self.id = id
        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        let factory = ServiceLocator.detailsViewControllerFactory()
        let detailsViewController = factory.makeDetailsViewController(wit: id)
        rootViewController.pushViewController(detailsViewController, animated: true)
    }
}

