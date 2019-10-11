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
    
    class func HowToBeDelivryCF(completionHandler: @escaping (_ data: HowToBeDelivry?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/pages/how_to_be_delivery"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "e496c38b-8221-4549-813d-54c531e45bf3,e91d55b7-a6f7-4ce8-b81a-241a92ded736",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(HowToBeDelivry.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    class func UageAndTermsCF(completionHandler: @escaping (_ data: UageAndTerms?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/pages/usage"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "cf1d3070-9a2e-45ce-a54b-eee00d05d653,50b99ae3-2d1f-4067-8d1c-d86616dfdd95",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(UageAndTerms.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    class func ContactInfoCF(completionHandler: @escaping (_ data: ContactInfo?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/pages/contact"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "64b42022-ed3d-45ae-bf96-bf1c7d59c3d2,32046237-34c1-4c23-9127-6bd93b452d4a",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(ContactInfo.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    class func IntroPagesCF(completionHandler: @escaping (_ data: IntroPages?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/intro"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "b11fe44c-6107-4872-8552-a1ffb9e6eedf,b03594e1-e0f2-489e-b143-7d826b4a8a3b",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(IntroPages.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    class func ClientCommentCF(completionHandler: @escaping (_ data: ClientComment?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/user/client_rates"
        let headers = [
            "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI,Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2Njk0MTU2NSwibmJmIjoxNTY2OTQxNTY1LCJqdGkiOiJZV054bU5JRnY4VDZOaTFwIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.PRlgROR7yflnFFnOCXftT_Hao_kMuvyO6juZE0C3vcs",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "856607d5-a6da-4a32-a9d3-5bcdb382a54a,62df4c96-c186-48ab-90be-3b2f7c9a9247",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(ClientComment.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    
    class func UserTabInfoCF(completionHandler: @escaping (_ data: UserTabInfo?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/user/info"
        let headers = [
            "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI,Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2Njk0MTU2NSwibmJmIjoxNTY2OTQxNTY1LCJqdGkiOiJZV054bU5JRnY4VDZOaTFwIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.PRlgROR7yflnFFnOCXftT_Hao_kMuvyO6juZE0C3vcs",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "79bb3bc3-8840-48a4-a8d5-9d4381f23fb8,44ac3e91-fbb0-4482-84b7-02684fdbb6d5",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(UserTabInfo.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    
    class func AllBanksCF(completionHandler: @escaping (_ data: AllBanksAccount?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/bank_accounts"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "d3caedcc-305a-4fc5-8c8d-3610f38d1c79,2f898cff-1b8f-4648-8bc0-292ac2c73fc3",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(AllBanksAccount.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    class func ActiveUserCF(completionHandler: @escaping (_ data: ActiveUser?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/orders/client_orders?status=active"
        let headers = [
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI,Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NTcyODk2MSwibmJmIjoxNTY1NzI4OTYxLCJqdGkiOiJuN0I4QXdHYTZRRGNxOHVrIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.cxJB8pGhdHmbcjAOTeabScxqiw3NtWMk-_C5mKnlRnw",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "daac109c-f162-4f72-b6f8-ff5d4a95cad4,870313ee-4aff-4b31-a052-024b6e9192e0",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(ActiveUser.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }

    
    class func FinishUserCF(completionHandler: @escaping (_ data: FinishUser?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/orders/client_orders?status=finished"
        let headers = [
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI,Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NTcyODk2MSwibmJmIjoxNTY1NzI4OTYxLCJqdGkiOiJuN0I4QXdHYTZRRGNxOHVrIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.cxJB8pGhdHmbcjAOTeabScxqiw3NtWMk-_C5mKnlRnw",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "ddb75668-1e16-4c37-bf68-06b904aee95d,7eca0531-066a-406b-9376-94b85a784d17",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(FinishUser.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }

    
    class func ActiveDeliveryCF(completionHandler: @escaping (_ data: ActiveDelivery?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/orders/delivery_orders?status=active"
        let headers = [
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI,Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NTcyODk2MSwibmJmIjoxNTY1NzI4OTYxLCJqdGkiOiJuN0I4QXdHYTZRRGNxOHVrIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.cxJB8pGhdHmbcjAOTeabScxqiw3NtWMk-_C5mKnlRnw",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "47d489d6-bf2f-4ae9-a91f-4956412f27b1,410a14d1-6996-4961-ba17-36b179c5eee2",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(ActiveDelivery.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }

    
    class func FinishDeliveryCF(completionHandler: @escaping (_ data: FinishDelivery?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/orders/delivery_orders?status=finished"
        let headers = [
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI,Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NTcyODk2MSwibmJmIjoxNTY1NzI4OTYxLCJqdGkiOiJuN0I4QXdHYTZRRGNxOHVrIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.cxJB8pGhdHmbcjAOTeabScxqiw3NtWMk-_C5mKnlRnw",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "dfce3dcf-5274-4d73-9ce0-b52bc87d7cd2,3c4892cd-1829-474d-a471-3ab0c7d7a899",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(FinishDelivery.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }


    class func UserNotiCF(completionHandler: @escaping (_ data: User?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/user/notifications/user"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2Njk0MTU2NSwibmJmIjoxNTY2OTQxNTY1LCJqdGkiOiJZV054bU5JRnY4VDZOaTFwIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.PRlgROR7yflnFFnOCXftT_Hao_kMuvyO6juZE0C3vcs",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "0b5b3f17-7c55-4b4c-b258-42ee26e87095,a7094257-4d22-49c5-8f45-70faf50f9696",
            "Host": "appqreeb.com",
            "Accept-Encoding": "gzip, deflate",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]

        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let firms = try JSONDecoder().decode(User.self, from: data)
                        completionHandler(firms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }

    
}

