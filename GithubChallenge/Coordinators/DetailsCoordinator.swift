//
//  DetailsCoordinator.swift
//  GithubChallenge
//
//  Created by apple on 18/06/2025.
//

import Coordinator
import UIKit
import SafariServices

protocol URLNavigator {
    func openURLInBroswer(with url: URL)
}

final class UserDetailsCoordinator: BaseCoordinator<AppNavigationController> {
    
    let id: Int
    
    init(id: Int, rootViewController: AppNavigationController) {
        self.id = id
        super.init(rootViewController: rootViewController)
    }
    
    override func start() {
        let factory = ServiceLocator.detailsViewControllerFactory()
        let detailsViewController = factory.makeDetailsViewController(wit: id, coordinator: self)
        rootViewController.pushViewController(detailsViewController, animated: true)
    }
}

extension UserDetailsCoordinator: URLNavigator {
    func openURLInBroswer(with url: URL) {
        let safariVC = SFSafariViewController(url: url)
        safariVC.modalPresentationStyle = .formSheet
        rootViewController.present(safariVC, animated: true)
    }
}

