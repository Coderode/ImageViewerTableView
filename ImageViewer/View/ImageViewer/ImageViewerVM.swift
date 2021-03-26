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
    func didLoadData()
}

protocol ImageViewerVM {
    var view : ImageViewerView! { get set }
    func laodImages(pageno : Int, limit : Int)
}
class TableImageViewerVM: NSObject,ImageViewerVM {
    weak var view : ImageViewerView!
    func laodImages(pageno: Int, limit: Int) {
        view.tableView.isLoading = true
        ImageViewerRestManager.shared.loadImages(pageno: pageno, limit: limit) { (response) in
            self.view.tableView.isLoading = false
            switch response {
            case .success(let result):
                for element in result {
                    self.view.imageData!.append(element)
                }
                self.view.didLoadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
}
