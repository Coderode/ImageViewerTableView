//
//  UIImageView+urlImage.swift
//  ImageViewer
//
//  Created by Sandeep on 26/03/21.
//

import Foundation
import UIKit
extension UIImageView {
    func imageFromUrl(urlString: String, handler : ((Bool)-> Void)?) -> URLSessionDataTask? {
        self.image = UIImage(named: "thumbnail")
        if let url = URL(string: urlString) {
            //checking in the file manager
            if let cachedImage = ImageViewerDataSource.shared.getImage(id: urlString ) {
                self.image = cachedImage.imageWith(newSize: CGSize(width: 200, height: 200))
                handler?(true)
                return nil
            }
            //if not in file manager then go for downloading the image from url
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { (data, res, err) in
                if let imageData = data {
                    if let downloadedimage = UIImage(data: imageData){
                        DispatchQueue.main.async {
                            let image = downloadedimage.imageWith(newSize: CGSize(width: 200, height: 200))
                            self.image = image
                            handler?(true)
                        }
                        ImageViewerDataSource.shared.saveImageDocumentDirectory(id: urlString, image: downloadedimage)
                    }
                }else{
                    handler?(false)
                }
            }
            task.resume()
            return task
        }
        return nil
    }
}
