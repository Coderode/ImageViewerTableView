//
//  ImageViewerUIVC.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import UIKit

class ImageViewerUIVC: NSObject {
    weak var view : ImageViewerView!
    
    func setUI(){
        setTableView()
    }
    
    private func setTableView(){
        self.view.tableView.delegate = self
        self.view.tableView.dataSource = self
    }
    
}

extension ImageViewerUIVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
}
