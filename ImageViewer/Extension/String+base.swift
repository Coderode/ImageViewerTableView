//
//  String+base.swift
//  ImageViewer
//
//  Created by Sandeep on 26/03/21.
//

import Foundation
extension String {
    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }
}
