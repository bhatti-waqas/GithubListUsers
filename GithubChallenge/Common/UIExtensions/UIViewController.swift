//
//  UIViewController.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import UIKit.UIViewController

typealias SimpleAlertCall = ((UIAlertAction) -> Void)?
typealias completionWithValueAndIndex = (_ actionTitle: String, _ index: Int) -> Void

extension UIViewController {
    
    func presentAlert(_ message: String, okAction: SimpleAlertCall = nil) {
        Run.onMainThread {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: StringKey.Generic.ok.get(), style: .default, handler: okAction))
            self.present(alert, animated: false, completion: {})
        }
    }
    
    func showActionSheet(title: String, message: String, buttonsTitle: [String], completion: completionWithValueAndIndex? = nil) {
            let alert = UIAlertController(  title: title,  message: message, preferredStyle: .alert)
            let handler = { (action: UIAlertAction) -> Void in
                let index = alert.actions.firstIndex { $0 == action}
                completion?(action.title ?? "", index ?? 0)
            }
            for i in 0..<buttonsTitle.count {
                alert.addAction(UIAlertAction(title: buttonsTitle[i], style: .default, handler: handler))
            }
            present(alert, animated: true, completion: nil)
     }
}
