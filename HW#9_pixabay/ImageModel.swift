//
//  ImageModel.swift
//  HW#9_pixabay
//
//  Created by vlad on 20.04.17.
//  Copyright © 2017 vladCh. All rights reserved.
//

import Foundation
import SwiftyJSON

class ImageModel {
    var name: String
    var tags: String
    var previewURL: String
    var imgURL: String
    
    init?(json: JSON) {
        guard let n   = json["user"].string,
              let t   = json["tags"].string,
              let pw  = json["previewURL"].string,
              let img = json["webformatURL"].string else {
                return nil
        }
        name = n
        tags = t
        previewURL = pw
        imgURL = img
    }
    
    static func parsJsonFromGetPosts (json: JSON) -> [ImageModel] {
        var result = [ImageModel]()
        
        if let postArray = json["hits"].array {
            for post in postArray {
                if let unwrapedJson = ImageModel(json: post) {
                   result.append(unwrapedJson)
                } 
            }
        }
        return result
    }
    
}
