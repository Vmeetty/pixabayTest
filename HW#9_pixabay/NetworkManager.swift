//
//  NetworkManeger.swift
//  HW#9_pixabay
//
//  Created by vlad on 20.04.17.
//  Copyright © 2017 vladCh. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class NetworkManager {
    
    // singeltone var
    static var shared = NetworkManager()
    private init () {
    }
    
    // paths and params for requests
    private let baseURL = "https://pixabay.com/api/"
    private let key = "5081734-dba3cffad2bdd12a0e9a3fb0f"
    private let params: [String:Any] = ["key":"5081734-dba3cffad2bdd12a0e9a3fb0f", "q":"surf", "order":"popular", "per_page":100]
    
    // send, geting posts, requests
    func getPost (onSuccess: @escaping ([ImageModel])->(), onFail: @escaping (String)->()) {
        Alamofire.request(baseURL, method: .get, parameters: params).responseJSON { (response) in
            if let error = response.error {
                onFail(error.localizedDescription)
            } else {
                if let value = response.value {
                    onSuccess(ImageModel.parsJsonFromGetPosts(json: JSON(value)))
                }
            }
        }
    }
    
    // send, geting images, requests
    func getingImgWith (url _url: URL, onSuccess: @escaping (UIImage)->(), onFail: @escaping (String)->()) {
        Alamofire.request(_url).response { (response) in
            if let error = response.error {
                onFail(error.localizedDescription)
            } else if let data = response.data, let image = UIImage(data: data) {
                onSuccess(image)
            }
        }
    }
    
}
