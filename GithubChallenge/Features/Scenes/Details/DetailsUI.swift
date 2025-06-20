//
//  DetailsUI.swift
//  GithubChallenge
//
//  Created by apple on 19/06/2025.
//
import UIKit
import SnapKit

final class DetailsUI: BaseUI {
    
    lazy var spinner: UIActivityIndicatorView = {
        return UIActivityIndicatorView(style: .large)
    }()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.backgroundColor = UIColor.clear
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 90
        tableView.backgroundView = spinner
        spinner.startAnimating()
        tableView.register(cell: DetailsUserCell.self)
        tableView.register(cell: RepositoryCell.self)
        return tableView
    }()
    
    func layout(in viewController: UIViewController) {
        viewController.view.backgroundColor = .white
        addSubViews(in: viewController)
        setupConstraints()
    }
}

// MARK: - Private Methods
private extension DetailsUI {
    
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
