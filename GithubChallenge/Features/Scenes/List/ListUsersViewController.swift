//
//  ListUsersViewController.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import UIKit
import Combine

final class ListUsersViewController: UIViewController {
    
    // MARK: - Private Properties
    private lazy var dataSource = makeDataSource()
    private let ui = ListUsersUI()
    private let viewModel: ListUsersViewModel
    private var bindingCancellable: AnyCancellable?
    
    init(with viewModel: ListUsersViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ui.layout(in: self)
        configureUI()
        bindViewModel()
        viewModel.fetchUsersTriggered()
    }
}

// MARK: - Private Methods
private extension ListUsersViewController {
    
    func configureUI() {
        title = viewModel.screenTitle
        ui.tableView.delegate = self
    }
    
    func bindViewModel() {
        bindingCancellable = viewModel.$viewState.sink { [weak self] viewState in
            self?.render(viewState)
        }
    }
    
    func render(_ state: ListUsersViewState) {
        switch state {
        case .idle:
            beginLoading()
        case .loading:
            beginLoading()
        case let .showMessageWithTitle(message):
            endLoading()
            presentAlert(message)
        case .showUsers(users: let users):
            endLoading()
            show(users: users)
        }
    }
    
    func beginLoading() {
        ui.spinner.startAnimating()
    }
    
    func endLoading() {
        ui.spinner.stopAnimating()
    }
}

// MARK: - TableView Diffable DataSource
extension ListUsersViewController {
    
    enum Section: CaseIterable {
        case users
    }
    
    private func makeDataSource() -> UITableViewDiffableDataSource<Section, UserRowViewModel> {
        return UITableViewDiffableDataSource(
            tableView: ui.tableView,
            cellProvider: { tableView, indexPath, user in
                let cell: UserCell = tableView.dequeue(for: indexPath)
                cell.configure(with: user)
                return cell
            })
    }
    /// We only need to show items as our model is struct/  value type
    /// it creates new instances so no need to update just need to insert new ones.
    private func show(users: [UserRowViewModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, UserRowViewModel>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems(users, toSection: .users)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}

// MARK: - UITableViewDelegate
extension ListUsersViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.showDetails(at: indexPath.row)
    }
}
