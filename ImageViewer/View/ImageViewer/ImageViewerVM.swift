//
//  ImageViewerVM.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import UIKit

protocol ImageViewerVMDataSource : class {
    var pageno : Int? { get set }
    var limit : Int? { get set}
}
protocol ImageViewerVMDelegate : class {
    func didLoadData(tempImageData : [ImageViewerResponseElement] )
}

protocol ImageViewerVM {
    var view : ImageViewerView! { get set }
    func laodImages(pageno : Int, limit : Int)
}
class TableImageViewerVM: NSObject,ImageViewerVM {
    weak var view : ImageViewerView!
    
    func laodImages(pageno: Int, limit: Int) {
        view.tableView.isLoading = true
        var tempImageData = [ImageViewerResponseElement]()
        ImageViewerRestManager.shared.loadImages(pageno: pageno, limit: limit) { (response) in
            self.view.tableView.isLoading = false
            switch response {
            case .success(let result):
                for element in result {
                    tempImageData.append(element)
                }
                self.view.didLoadData(tempImageData : tempImageData)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
