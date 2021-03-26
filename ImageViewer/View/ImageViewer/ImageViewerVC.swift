//
//  ViewController.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import UIKit
protocol ImageViewerView : ImageViewerVMDataSource,ImageViewerUIVCDataSource,ImageViewerVMDelegate,ImageViewerUIVCDelegate{
    var tableView : PagingTableView! { get }
    var viewerLabel : UILabel! { get }
}

class ImageViewerVC: UIViewController,ImageViewerView {
   
    
    @IBOutlet weak var tableView : PagingTableView!
    @IBOutlet weak var viewerLabel : UILabel!
    var imageViewerUIVC : ImageViewerUIVC!
    var imageViewerVM : ImageViewerVM!
    var pageno : Int? = 0
    var limit : Int? = 12
    var imageData: [ImageViewerResponseElement]? = [ImageViewerResponseElement]()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func loadMoreData(at page : Int) {
        self.pageno = page
        imageViewerVM.laodImages(pageno: page, limit: self.limit!)
    }
    func didLoadData() {
        self.tableView.reloadData()
    }
}
