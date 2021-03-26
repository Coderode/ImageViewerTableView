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
    
    func setUI(){
        setTableView()
    }
    
    private func setTableView(){
        self.view.tableView.dataSource = self
        self.view.tableView.delegate = self
        self.view.tableView.register(UINib(nibName: "ImageViewCell", bundle: nil), forCellReuseIdentifier: "ImageViewCell")
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: self.view.tableView.bounds.width, height: CGFloat(44))
        self.view.tableView.tableFooterView = spinner
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
        
        let alert = UIAlertController(title: "\(cell.authorNameLabel.text!)", message: "", preferredStyle: .alert)
        var imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 300))
        imageView.image = cell.leftImage.image
        alert.view.addSubview(imageView)
        alert.addAction(UIAlertAction(title: "Close", style: .destructive, handler: nil))
        let vc = self.view as? UIViewController
        vc?.present(alert, animated: true, completion: nil)
        
    }
}
extension ImageViewerUIVCTableView : PagingTableViewDelegate{
    func paginate(_ tableView: PagingTableView, to page: Int) {
        self.view.loadMoreData(at : page)
    }
}
