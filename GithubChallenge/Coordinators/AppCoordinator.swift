//
//  AppCoordinator.swift
//  MobileChallange
//
//  Created by Waqas Naseem on 30/08/2023.
//

import UIKit
import Coordinator

/// `AppCoordinator` is responsible to manage transition at windows level.
final class AppCoordinator: BaseCoordinator<AppNavigationController> {
    
    // MARK: - Private Properties
    private let window: UIWindow
    
    // MARK: - Init
    init(window: UIWindow) {
        self.window = window
        super.init(rootViewController: .init())
    }
    
    override func start() {
        let coordinator = ListUsersCoordinator(rootViewController: rootViewController)
        startChild(coordinator)
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
    }
}
