//
//  DetailsViewControllerFactory.swift
//  GithubChallenge
//
//  Created by apple on 18/06/2025.
//

final class DetailsViewControllerFactory {
    
    // MARK: - Private Properties
    private let detailsUseCase: UserDetailsUseCase
    
    init(detailsUseCase: UserDetailsUseCase) {
        self.detailsUseCase = detailsUseCase
    }
    
    func makeDetailsViewController(wit id: Int, coordinator: URLNavigator) -> DetailsViewController {
        let viewModel = DetailsViewModel(useCase: detailsUseCase, 
                                         userId: id,
                                         coordinator: coordinator)
        return DetailsViewController(with: viewModel)
    }
}
