//
//  ImageViewerUIVC.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import UIKit
protocol ImageViewerUIVCDataSource : class{
    var imageData : [ImageViewerResponseElement]? { get set }
}

protocol ImageViewerUIVCDelegate : class {
    func loadMoreData(at page : Int)
}

protocol ImageViewerUIVC {
    var view : ImageViewerView! { get set }
    func setUI()
}

class ImageViewerUIVCTableView : NSObject,ImageViewerUIVC {
    weak var view : ImageViewerView! {
        didSet {
            setUI()
        }
    }
    private var cellHeightCache = [IndexPath: CGFloat]()
    func setUI(){
        setTableView()
    }
    
    private func setTableView(){
        self.view.tableView.dataSource = self
        self.view.tableView.delegate = self
        self.view.tableView.register(UINib(nibName: "ImageViewCell", bundle: nil), forCellReuseIdentifier: "ImageViewCell")
        self.view.tableView.pagingDelegate = self
    }
    
}

extension ImageViewerUIVCTableView : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.view.imageData?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ImageViewCell", for: indexPath) as! ImageViewCell
        guard ((self.view.imageData?.indices.contains(indexPath.row)) != nil) else { return cell }
        cell.setData(imageUrl: self.view.imageData![indexPath.row].downloadURL,label: self.view.imageData![indexPath.row].author)
        return cell
    }
    
}
extension ImageViewerUIVCTableView : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = self.view.tableView.cellForRow(at: indexPath) as? ImageViewCell else { return }
        let showAlert = UIAlertController(title: "\(cell.authorNameLabel.text!)", message: nil, preferredStyle: .alert)
        showAlert.showImage(image: cell.leftImage.image!)
        let vc = self.view as? UIViewController
        vc?.present(showAlert, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
       return cellHeightCache[indexPath] ?? 50
    }

    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
       cellHeightCache[indexPath] = cell.bounds.height
    }
    
}
extension ImageViewerUIVCTableView : PagingTableViewDelegate{
    func paginate(_ tableView: PagingTableView, to page: Int) {
        self.view.loadMoreData(at : page)
    }
}
