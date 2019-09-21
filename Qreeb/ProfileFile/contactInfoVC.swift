//
//  contactInfoVC.swift
//  Qreeb
//
//  Created by Admin on 8/31/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class contactInfoVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func sendBtn(_ sender: UIButton) {
        let headers = [
            "content-type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
            "X-localization": "ar",
            "cache-control": "no-cache",
            "Postman-Token": "980d6521-ccbc-4fe9-8fff-a4021e2fd2e7"
        ]
        let parameters = [
               "title": "عنوان الشكوى"
            ,"message": "نص الشكوى"
            ]
        
        let url =  "http://appqreeb.com/api/pages/contact"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: headers)
            .validate(statusCode : 200..<300)
            .responseJSON { response in
                
                switch response.result {
                case .success(let value) :
                    print(value)
                case .failure(let error) :
                    print(error)
                }
        }
    }
    
}
