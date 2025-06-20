//
//  DetailsViewController.swift
//  GithubChallenge
//
//  Created by apple on 18/06/2025.
//

import UIKit
import Combine
final class DetailsViewController: UIViewController {

    // MARK: - Private Properties
    private lazy var dataSource = makeDataSource()
    private let ui = DetailsUI()
    private let viewModel: DetailsViewModel
    private var bindingCancellable: AnyCancellable?
    
    init(with viewModel: DetailsViewModel) {
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
        viewModel.fetchUserTriggered()
    }
}

// MARK: - Private Methods
private extension DetailsViewController {
    
    func configureUI() {
        title = viewModel.screenTitle
        ui.tableView.delegate = self
    }
    
    func bindViewModel() {
        bindingCancellable = viewModel.$viewState.sink { [weak self] viewState in
            self?.render(viewState)
        }
    }
    
    func render(_ state: DetailsViewState) {
        switch state {
        case .idle:
            beginLoading()
        case .loading:
            beginLoading()
        case let .showMessageWithTitle(message):
            endLoading()
            presentAlert(message)
        case .showUser(let user, let repos):
            endLoading()
            show(user: user, repos: repos)
        }
    }
    
    func beginLoading() {
        ui.spinner.startAnimating()
    }
    
    func endLoading() {
        ui.spinner.stopAnimating()
    }
}

// MARK: - TableView Delegate
extension DetailsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let section = Section(rawValue: indexPath.section) else { return }
        guard section == .repositories else { return }
        viewModel.openUrlInBrowser(index: indexPath.row)
    }
}

// MARK: - TableView Diffable DataSource
extension DetailsViewController {
    
    enum Section: Int, CaseIterable {
        case userDetails
        case repositories
    }
    
    private func makeDataSource() -> UITableViewDiffableDataSource<Section, TableItem> {
        return UITableViewDiffableDataSource(
            tableView: ui.tableView,
            cellProvider: { tableView, indexPath, item in
                switch item {
                case .user(let userDetails):
                    let cell: DetailsUserCell = tableView.dequeue(for: indexPath)
                    cell.configure(with: userDetails)
                    return cell
                case .repository(let repository):
                    let cell: RepositoryCell = tableView.dequeue(for: indexPath)
                    cell.configure(with: repository)
                    return cell
                }
            })
    }
    /// We only need to show items as our model is struct/  value type
    /// it creates new instances so no need to update just need to insert new ones.
    private func show(user: UserDetailsRowViewModel,
                      repos: [RepositoryRowViewModel]) {
        ui.tableView.isHidden = false
        var snapshot = NSDiffableDataSourceSnapshot<Section, TableItem>()
        snapshot.appendSections(Section.allCases)
        snapshot.appendItems([.user(user)], toSection: .userDetails)
        snapshot.appendItems(repos.map { .repository($0) }, toSection: .repositories)
        dataSource.apply(snapshot, animatingDifferences: false)
    }
}
