//
//  RepositoryCell.swift
//  GithubChallenge
//
//  Created by apple on 19/06/2025.
//

import UIKit
import SnapKit
import Extensions

final class RepositoryCell: UITableViewCell {
    
    private lazy var labelsStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirDemiBold, size: .standard(.h3))
        return label
    }()
    
    private lazy var developmentLanguageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirRegular, size: .standard(.h3))
        return label
    }()
    
    private lazy var numberOfStarzLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirRegular, size: .standard(.h3))
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.font = UIFont(.avenirRegular, size: .standard(.h3))
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with repo: RepositoryRowViewModel) {
        nameLabel.text = repo.name
        
        developmentLanguageLabel.text = "\(StringKey.Generic.language.get()) \(repo.language)"
        numberOfStarzLabel.text = "\(StringKey.Generic.stars.get()) \(repo.starGazersCount)"
        descriptionLabel.text = repo.description
    }
}
// MARK: - Private Methods
private extension RepositoryCell {
    
    func addSubViews() {
        contentView.addSubview(labelsStack)
        [nameLabel, developmentLanguageLabel, numberOfStarzLabel, descriptionLabel].forEach(labelsStack.addArrangedSubview)
    }
    
    func setupConstraints() {
        labelsStack.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(10)
        }
    }
}
