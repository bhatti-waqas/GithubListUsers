

import Foundation
import Networking
import UIKit

let ServiceLocator = AppServiceLocator.shared

/// AppServiceLocator` is responsible to create/manage all dependencies of the application.
final class AppServiceLocator {
    
    // MARK: - Class Property
    static let shared = AppServiceLocator()
    
    // MARK: - private Property
    private let usersUseCase: GithubUserUseCase
    
    // MARK: - Init
    private init() {
        /// Register dependencies
        let networkService: NetworkService = NetworkService()
        usersUseCase =  DefaultUsersUseCase(networkService: networkService)
    }
    
    func userListViewControllersFactory() -> UserListViewControllerFactory {
        UserListViewControllerFactory(usersUseCase: usersUseCase)
    }
}
