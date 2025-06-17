//
//  UIViewController.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import UIKit.UIViewController
import Utils

typealias SimpleAlertCall = ((UIAlertAction) -> Void)?
typealias completionWithValueAndIndex = (_ actionTitle: String, _ index: Int) -> Void

extension UIViewController {
    
    func presentAlert(_ message: String, 
                      okAction: SimpleAlertCall = nil) {
        Run.onMainThread {
            let alert = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: StringKey.Generic.ok.get(), style: .default, handler: okAction))
            self.present(alert, animated: false, completion: {})
        }
    }
}
