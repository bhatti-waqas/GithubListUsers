//
//  UIImageView.swift
//  GithubChallenge
//
//  Created by apple on 17/06/2025.
//

import SDWebImage

extension UIImageView {
  func setImage(with url: URL?) {
    if let imageURL = url {
      sd_setImage(with: imageURL,
                  placeholderImage: UIImage(resource: .placeHolder),
                  options: [.scaleDownLargeImages], completed: nil)
    } else {
        image = UIImage(resource: .placeHolder)
    }
  }
}
