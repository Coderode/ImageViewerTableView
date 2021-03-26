//
//  ImageViewerRestManager.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import Foundation
import Moya
class ImageViewerRestManager {
    static var shared = ImageViewerRestManager()
    private var apiProvider = MoyaProvider<ImageViewer>()
    func loadImages(pageno : Int, limit : Int, handler : ((Result<ImageViewerResponse,Error>)->Void)?){
        DispatchQueue.main.async {
            self.apiProvider.request(.laodImage(pageno: pageno, limit: limit)) { (response) in
                switch response {
                case .success(let result):
                    do{
                        let decoder = JSONDecoder()
                        let data = try decoder.decode(ImageViewerResponse.self, from: result.data)
                        handler?(.success(data))
                    }catch let error {
                        handler?(.failure(error))
                    }
                case .failure(let error):
                    handler?(.failure(error))
                }
            }
        }
        
    }
}
