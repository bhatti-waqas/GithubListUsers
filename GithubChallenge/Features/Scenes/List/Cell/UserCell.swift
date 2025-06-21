//
//  UserCell.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import UIKit
import Extensions

final class UserCell: UITableViewCell {
    
    private lazy var containerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(.avenirDemiBold, size: .standard(.h3))
        return label
    }()
    
    private lazy var iconView: UIImageView = {
        let icon = UIImageView()
        return icon
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
    
    func configure(with user: UserRowViewModel) {
        nameLabel.text = user.login
        iconView.setImage(with: user.imageUrl)
    }
}
// MARK: - Private Methods
private extension UserCell {
    
    func addSubViews() {
        contentView.addSubview(containerView)
        [nameLabel, iconView].forEach(containerView.addSubview)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(10)
        }
        
        iconView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(10)
            make.width.equalTo(50)
            make.height.equalTo(iconView.snp.width)
            make.centerY.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(iconView.snp.trailing).offset(10)
            make.top.bottom.equalToSuperview().inset(10)
        }
    }
}
