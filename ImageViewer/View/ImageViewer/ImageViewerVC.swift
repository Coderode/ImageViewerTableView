//
//  ViewController.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import UIKit
protocol ImageViewerView : class{
    var tableView : UITableView! { get }
    var viewerLabel : UILabel! { get }
}

class ImageViewerVC: UIViewController,ImageViewerView {
    @IBOutlet weak var tableView : UITableView!
    @IBOutlet weak var viewerLabel : UILabel!
    private var imageViewerUIVC : ImageViewerUIVC!
    private var imageViewerVM : ImageViewerVM!
    override func viewDidLoad() {
        super.viewDidLoad()
        imageViewerUIVC = ImageViewerUIVC()
        imageViewerUIVC.view = self
        imageViewerUIVC.setUI()
        imageViewerVM = ImageViewerVM()
        imageViewerVM.view = self
    }
}

