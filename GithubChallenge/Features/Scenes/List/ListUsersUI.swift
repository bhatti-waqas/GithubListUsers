//
//  ListUsersUI.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import UIKit
import SnapKit

final class ListUsersUI: BaseUI {
    
    lazy var spinner: UIActivityIndicatorView = {
        return UIActivityIndicatorView(style: .large)
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 30
        tableView.backgroundView = spinner
        spinner.startAnimating()
        tableView.register(cell: UserCell.self)
        return tableView
    }()
    
    func layout(in viewController: UIViewController) {
        viewController.view.backgroundColor = .white
        addSubViews(in: viewController)
        setupConstraints()
    }
}

// MARK: - Private Methods
private extension ListUsersUI {
    
    func addSubViews(in viewController: UIViewController) {
        [tableView].forEach(viewController.view.addSubview)
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(20)
            make.top.equalToSuperview().offset(50)
        }
    }
}
