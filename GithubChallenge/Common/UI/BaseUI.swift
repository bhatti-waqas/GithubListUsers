//
//  BaseUI.swift
//  MobileChallange
//
//  Created by apple on 17/06/2025.
//

import UIKit.UIViewController

protocol BaseUI {
    func layout(in viewController: UIViewController)
    func layout(in cell: UITableViewCell)
}

extension BaseUI {
    func layout(in viewController: UIViewController) {}
    func layout(in cell: UITableViewCell) {}
}
