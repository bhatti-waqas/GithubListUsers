
import Networking

let ServiceLocator = AppServiceLocator.shared

/// AppServiceLocator` is responsible to create/manage all dependencies of the application.
final class AppServiceLocator {
    
    // MARK: - Class Property
    static let shared = AppServiceLocator()
    
    // MARK: - private Property
    
    private lazy var networkService: NetworkService = {
        NetworkService()
    }()
    
    private lazy var usersUseCase: GithubUserUseCase = {
        DefaultUsersUseCase(networkService: networkService)
    }()
    
    //private lazy var userDetailsUseCase: 
    
    
    // MARK: - Init
    private init() {
        /// Register dependencies
        let networkService: NetworkService = NetworkService()
        usersUseCase =  DefaultUsersUseCase(networkService: networkService)
    }
    
    func listUsersViewControllersFactory() -> ListUsersViewControllerFactory {
        ListUsersViewControllerFactory(usersUseCase: usersUseCase)
    }
    
    func detailsViewControllerFactory() -> DetailsViewControllerFactory {
        DetailsViewControllerFactory()
    }
}
