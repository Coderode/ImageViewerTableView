//
//  ImageViewCell.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import UIKit

class ImageViewCell: UITableViewCell {

    @IBOutlet weak var leftImage : UIImageView!
    @IBOutlet weak var authorNameLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    func setData(image : UIImage, label : String){
        leftImage.image = image
        authorNameLabel.text = label
    }
    func setUI(){
        leftImage.layer.cornerRadius = 10
        authorNameLabel.textColor = .black
        authorNameLabel.textAlignment = .left
    }
}
