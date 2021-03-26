//
//  ImageViewerAPIProvider.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import Foundation
import Moya
enum ImageViewer {
    case laodImage(pageno : Int,limit : Int)
}

extension ImageViewer : TargetType {
    var baseURL: URL {
        switch self {
        case .laodImage(pageno : let pageno, limit : let limit):
            return URL(string :"https://picsum.photos/v2/list?page=\(pageno)&limit=\(limit)")!
        }
    }
    
    var path: String {
        switch self {
        case .laodImage(pageno : _ ,limit : _) :
            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
