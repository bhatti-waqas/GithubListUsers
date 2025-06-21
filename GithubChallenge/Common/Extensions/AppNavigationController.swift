//
//  AppNavigationController.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import DesignSystem
import UIKit

final class AppNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
            
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - Private Methods
    private func configureUI() {
        navigationBar.tintColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationBar.titleTextAttributes =
            [NSAttributedString.Key.foregroundColor: UIColor.black,
             NSAttributedString.Key.font: UIFont(.avenirDemiBold, size: .standard(.h3))]
    }
}
