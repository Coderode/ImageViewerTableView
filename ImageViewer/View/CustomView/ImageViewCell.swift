//
//  ImageViewCell.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import UIKit
import Nuke
class ImageViewCell: UITableViewCell {

    @IBOutlet weak var leftImage : UIImageView!
    @IBOutlet weak var authorNameLabel : UILabel!
    let activityIndicator = UIActivityIndicatorView()
    override func awakeFromNib() {
        super.awakeFromNib()
        setUI()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        
    }
    func setData(imageUrl : String, label : String){
        self.activityIndicator.isHidden = false
        self.leftImage.imageFromUrl(urlString: imageUrl){ result in
            if result {
                self.activityIndicator.isHidden = true
            }else{
                self.authorNameLabel.text = "Failed to load data!"
                self.leftImage.isHidden = true
            }
        }
        authorNameLabel.text = label
    }
    func setUI(){
        self.activityIndicator.frame = CGRect(x: self.frame.size.width - 20, y: 10, width: 50, height: 50)
        activityIndicator.style = .medium
        activityIndicator.color = .darkGray
        activityIndicator.isHidden = false
        self.addSubview(activityIndicator)
        leftImage.layer.cornerRadius = 10
        authorNameLabel.textColor = .black
        authorNameLabel.textAlignment = .left
    }
}
