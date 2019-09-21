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
}

    

