//
//  UIAlertView+Viewer.swift
//  ImageViewer
//
//  Created by Sandeep on 26/03/21.
//

import Foundation
import UIKit
extension UIAlertController {
    func showImage(image : UIImage){
        let imageView = UIImageView(frame: CGRect(x: 10, y: 50, width: 250, height: 250))
        imageView.image = image
        self.view.addSubview(imageView)
        let height = NSLayoutConstraint(item: self.view as Any, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 350)
        let width = NSLayoutConstraint(item: self.view as Any, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 250)
        self.view.addConstraint(height)
        self.view.addConstraint(width)
        self.addAction(UIAlertAction(title: "Close", style: .destructive, handler: nil))
    }
}
