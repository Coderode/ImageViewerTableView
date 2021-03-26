//
//  ImageViewerResponse.swift
//  ImageViewer
//
//  Created by Sandeep on 25/03/21.
//

import Foundation

// MARK: - ImageViewerResponseElement
struct ImageViewerResponseElement: Codable {
    let id, author: String
    let width, height: Int
    let url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}

typealias ImageViewerResponse = [ImageViewerResponseElement]
