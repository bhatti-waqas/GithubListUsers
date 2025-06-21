//
//  MockArticlesCoordinator.swift
//  iOSEvalutationTests
//
//  Created by Waqas Naseem on 10/01/2024.
//

import UIKit

@testable import iOSEvaluation

final class MockArticlesCoordinator: DetailCoordinator {
    
    var showDetailsInvoked: Bool = false

    func navigateToDetails(with viewModel: ArticleRowViewModel) {
        showDetailsInvoked = true
    }
}
