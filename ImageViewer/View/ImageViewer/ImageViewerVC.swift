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
        self.tableView.bounces = false
        
    }
    func loadMoreData(at page : Int) {
        self.pageno = page + 1
        imageViewerVM.laodImages(pageno: self.pageno!, limit: self.limit!)
    }
    func didLoadData(tempImageData : [ImageViewerResponseElement]) {
        let count = tempImageData.count
        var startIndex = 0
        if self.imageData!.count != 0 {
            startIndex = self.imageData!.count - 1
        }
        let endIndex = count + startIndex
        
        var indices = [IndexPath]()
        for i in startIndex..<endIndex {
            indices.append(IndexPath(row: i, section: 0))
        }
        self.imageData?.append(contentsOf: tempImageData)
        self.tableView.beginUpdates()
        self.tableView.insertRows(at: indices,with: .none)
        self.tableView.endUpdates()
        tableView.scrollToRow(at: indices[1], at: UITableView.ScrollPosition.none, animated: true)
    }
}
