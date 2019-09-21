//
//  editProfileVC.swift
//  Qreeb
//
//  Created by Admin on 8/21/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit
import Foundation


class editProfileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func EditProfileBtn(_ sender: Any) {
        
        let headers = [
            "content-type": "multipart/form-data; boundary=----WebKitFormBoundary7MA4YWxkTrZu0gW",
            "cache-control": "no-cache",
            "Postman-Token": "26088aa0-4465-41dd-945e-39d9deb19109"
        ]
        let parameters = [
            ["name": "name"],
            ["name": "email"],
            ["name": "phone"],
            [
                "name": "job",
                "value": "Doctor"
            ],
            [
                "name": "nationality",
                "value": "Egyption"
            ],
            [
                "name": "company_name",
                "value": "Panorama"
            ]
        ]
        
        let boundary = "----WebKitFormBoundary7MA4YWxkTrZu0gW"
        
        var body = ""
        var error: NSError? = nil
        for param in parameters {
            let paramName = param["name"]!
            body += "--\(boundary)\r\n"
            body += "Content-Disposition:form-data; name=\"\(paramName)\""
            if let filename = param["fileName"] {
                let contentType = param["content-type"]!
                let fileContent = try? String(contentsOfFile: filename, encoding: String.Encoding.utf8)
                if (error != nil) {
                    print(error)
                }
                body += "; filename=\"\(filename)\"\r\n"
                body += "Content-Type: \(contentType)\r\n\r\n"
                body += fileContent!
            } else if let paramValue = param["value"] {
                body += "\r\n\r\n\(paramValue)"
            }
        }
        
        let request = NSMutableURLRequest(url: NSURL(string: "http://{{qareeb}}/user/update/profile")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = headers
        guard let postData = try? JSONSerialization.data(withJSONObject: parameters, options: [ ]) else {
            return
        }
        request.httpBody = postData as Data
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error)
            } else {
                let httpResponse = response as? HTTPURLResponse
                print(httpResponse)
            }
        })
        
        dataTask.resume()
    }
    


}
