//
//  API+Tasks.swift
//  Qreeb
//
//  Created by Admin on 9/7/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

extension API {
    class func task(completion: @escaping (_ error:Error? , _ tasks:[Task]?)->Void){
        let parameters:[String : Any] = [:]

        let url =  "http://appqreeb.com/api/auth/register/client"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode : 200..<300)
            .responseJSON { response in
                
                switch response.result {
                case .success(let value ) :
                    let json = JSON(value)
                    guard let dataArr = json["data"].array else{
                        completion(nil,nil)
                        return
                    }
                    
                    var tasks = [Task]()
                    for data in dataArr {
                        guard let data = data.dictionary else {return}
                        if let title = data[""]?.string , let txt = data[""]?.string , let txtKG = data[""]?.string {
                            let task = Task()
                            task.title = title
                            task.txt = txt
                            task.txtKG = txtKG
                            tasks.append(task)
                        }
                     
                    }
                    completion(nil,tasks)
                    
                    print(value)

                case .failure(let error) :
                    completion(error,nil)
                    print(error)
                }
        }
        
    }
}
