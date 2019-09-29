//
//  API.swift
//  Qreeb
//
//  Created by Admin on 9/7/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class API: NSObject {
    
    class func login(phone:String, completion: @escaping (_  error: Error? , _  success:Bool  )->Void) {
        
        let parameters =
            [
                "phone": phone
        ]
        
        let url =  "http://appqreeb.com/api/auth/login"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode : 200..<300)
            .responseJSON { response in
                
                switch response.result {
                case .success(let value ) :
                    completion(nil,true)
                    print(value)
                    let json = JSON(value)
                    let isRegister = json["is_register"].boolValue
                    print(isRegister)
                case .failure(let error) :
                    completion(error,false)
                    print(error)
                }
        }
    }
    
    
    class func loginAsClient(name:String,phone:String,email:String,addresses: String, completion: @escaping (_  error: Error? , _  success:Bool  )->Void) {
        
        let parameters:[String : Any] = [
            "name": name
            ,"phone": phone
            ,"email": email
            ,"addresses[]": addresses
            ,"lat": "17.0"
            ,"lng": "18.20"
            ,"city_id": "1"
        ]
        
        
        let url =  "http://appqreeb.com/api/auth/register/client"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode : 200..<300)
            .responseJSON { response in
                
                switch response.result {
                case .success(let value ) :
                    completion(nil,true)
                    print(value)
                    //                    let json = JSON(value)
                    //                    let isRegister = json["is_register"].boolValue
                //                    print(isRegister)
                case .failure(let error) :
                    completion(error,false)
                    print(error)
                }
        }
    }
    
    
    
    
    class func loginAsDelivery(name:String,phone:String,bank_no:String,account_name: String,bank_name: String, completion: @escaping (_  error: Error? , _  success:Bool  )->Void) {
        
        let parameters:[String : Any] = [
            "name" : name,
            "phone" : phone,
            "bank_no" : bank_no,
            "account_name": account_name,
            "bank_name": bank_name
        ]
        
        
        let url =  "http://appqreeb.com/api/auth/register/delivery"
        
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode : 200..<300)
            .responseJSON { response in
                
                switch response.result {
                case .success(let value ) :
                    completion(nil,true)
                    print(value)
                    //                    let json = JSON(value)
                    //                    let isRegister = json["is_register"].boolValue
                //                    print(isRegister)
                case .failure(let error) :
                    completion(error,false)
                    print(error)
                }
                
        }
    }
    
    
    class func getFirms(completionHandler: @escaping (_ data: Firms?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/firms/all"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg"
        ]
        
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(Firms.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
//        let request = NSMutableURLRequest(url: NSURL(string: "http://appqreeb.com/api/firms/all")! as URL,
//                                          cachePolicy: .useProtocolCachePolicy,
//                                          timeoutInterval: 10.0)
//        request.httpMethod = "GET"
//        request.allHTTPHeaderFields = headers
//
//        let session = URLSession.shared
//        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
//            if (error != nil) {
//                print(error)
//            } else {
//                let httpResponse = response as? HTTPURLResponse
//                print(httpResponse)
//            }
//        })
//
//        dataTask.resume()
//    }
    
}

