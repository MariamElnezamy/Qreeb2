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
    
    class func login(phone:String, completion: @escaping (_ data: Login?, _ error: Error? , _  success:Bool  )->Void) {
        let parameters =
            [
                "phone": phone
        ]
        let url =  "http://appqreeb.com/api/auth/login"
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode : 200..<300)
            .responseData { response in
                request(url, headers: nil)
                switch response.result {
                case .success(let data):
                    do {
                        let User = try JSONDecoder().decode(Login.self, from: data)
                        completion(User, nil,User.value)
                    } catch {
                        completion(nil, error,false)
                    }
                case .failure(let error):
                    completion(nil, error,false)
                }
        }
    }
    
    
    class func loginAsClient(name:String,phone:String,email:String,image: String,token:String,city_id:String,lat:String,lng:String,device:String,addresse:String, completion: @escaping (_ data: RegisterClientResponse?, _ error: Error? , _  success:Bool  )->Void) {
        
        let parameters:[String : Any] = [
            "name": name
            ,"phone": phone
            ,"email": email
            ,"image": image
            ,"lat": lat
            ,"lng": lng
            ,"city_id": city_id
            ,"device":device
            ,"addresses[]":addresse
        ]
        let url =  "http://appqreeb.com/api/auth/register/client"
        Alamofire.request(url, method: .post, parameters: parameters, encoding: JSONNull.default, headers: nil)
        .responseData { response in
            request(url, headers: nil)
            switch response.result {
            case .success(let data):
                do {
                    let User = try JSONNull().decode(RegisterClientResponse.self, from: data)
                    completion(User, nil,User.value)
                } catch {
                    completion(nil, error,false)
                }
            case .failure(let error):
                completion(nil, error,false)
            }
        }
    }
    
    
    
    
    class func loginAsDelivery(name:String,phone:String,image: String,token:String,city_id:String,lat:String,lng:String,device:String,bank_name:String,account_name:String,bank_no:String,form_image:String,car_back_image:String,license_image:String,identity_image:String,  completion: @escaping (_ data: RegisterDeliveryResponse?, _ error: Error? , _  success:Bool  )->Void) {
        let parameters:[String : Any] = [
            "name" : name,
            "phone" : phone,
            "bank_no" : bank_no,
            "account_name": account_name,
            "bank_name": bank_name
            ,"image":image
            ,"token":token
            ,"city_id":city_id
            ,"lat":lat
            ,"lng":lng
            ,"device":device
            ,"form_image":form_image
            ,"car_back_image":car_back_image
            ,"license_image":license_image
            ,"identity_image":identity_image
        ]

        let url =  "http://appqreeb.com/api/auth/register/delivery"
        Alamofire.request(url, method: .post, parameters: parameters, encoding: URLEncoding.default, headers: nil)
            .validate(statusCode : 200..<300)
            .responseData { response in
                request(url, headers: nil)
                switch response.result {
                case .success(let data):
                    do {
                        let User = try JSONDecoder().decode(RegisterDeliveryResponse.self, from: data)
                        completion(User, nil,User.value)
                    } catch {
                        completion(nil, error,false)
                    }
                case .failure(let error):
                    completion(nil, error,false)
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
    
    class func FirmsNearClassFunc(completionHandler: @escaping (_ data: FirmNearResppose?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/firms/near?lat=16.00&lng=18.00"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "9e458ea2-577f-4c09-8fc4-3b8850dd1290,d012aba4-0e86-4377-8f8a-e03794afced9",
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
                        let firmsNear = try JSONDecoder().decode(FirmNearResppose.self, from: data)
                        completionHandler(firmsNear, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }

    class func FirmMapClassFunc(lat: String,lng: String,  completionHandler: @escaping (_ data: FirmMap?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/firms/map/all?lat=\(lat)&lng=\(lng)"

        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "cc679f05-8eee-4d4a-92ef-ba75a9a578fe,e9be4f3a-6122-41c8-af10-db5ca85d36cc",
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
                        let firmMap = try JSONDecoder().decode(FirmMap.self, from: data)
                        completionHandler(firmMap, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    class func AllFirmsOffersClassFunc(completionHandler: @escaping (_ data:  FirmsOffer?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/firms/offers/all/?lat=16.00&lng=18.00"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "f62d1575-82a0-42c9-9b65-7019a094de1a,f7b9fe20-2b5d-4c14-8a57-d72baa9c52a5",
            "Accept-Encoding": "gzip, deflate",
            "Referer": "http://appqreeb.com/api/firms/offers/all/?lat=16.00&lng=18.00",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let  allFirmsOffer = try JSONDecoder().decode( FirmsOffer.self, from: data)
                        completionHandler(allFirmsOffer, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }

    class func SingleFirmDetailsByFirmIdClassFunc(completionHandler: @escaping (_ data: DetailsByFirmID?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/firms/single/3/?lat=16.00&lng=18.00"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "68f13819-48e4-45a4-ab9b-ec6feb82ada9,453b117a-aaac-44e4-948d-39ecd3e1a484",
            "Accept-Encoding": "gzip, deflate",
            "Referer": "http://appqreeb.com/api/firms/single/3/?lat=16.00&lng=18.00",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let singleFirmDetailsByFirmId = try JSONDecoder().decode(DetailsByFirmID.self, from: data)
                        completionHandler(singleFirmDetailsByFirmId, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    class func tWaitingListOrdersForFirmClassFunc(completionHandler: @escaping (_ data: WaitingList?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/orders/waiting_orders/3"
        let headers = [
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI"
        ]
        
        request(url, headers: headers)
//            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let waitingListOrdersForFirm = try JSONDecoder().decode(WaitingList.self, from: data)
                        completionHandler(waitingListOrdersForFirm, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    
    
    class func ActiveOrderClientClassFunc(completionHandler: @escaping (_ data: ActiveOrderClient?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/orders/client_orders?status=active"
        let headers = [
            "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI,Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2NTcyODk2MSwibmJmIjoxNTY1NzI4OTYxLCJqdGkiOiJuN0I4QXdHYTZRRGNxOHVrIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.cxJB8pGhdHmbcjAOTeabScxqiw3NtWMk-_C5mKnlRnw",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "3b0694b3-c031-46e9-9c52-e7bfb8251f35,225d6409-a29b-45bd-a053-cd78772af876",
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
                        let activeOrderClient = try JSONDecoder().decode(ActiveOrderClient.self, from: data)
                        completionHandler(activeOrderClient, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
        
    }
    
    
    class func FinishOrderClientClassFunc(completionHandler: @escaping (_ data: FinishOrderClient?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/orders/client_orders?status=finished"
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
                        let finishOrderClient = try JSONDecoder().decode(FinishOrderClient.self, from: data)
                        completionHandler(finishOrderClient, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    
    class func ActiveOrderDeliveryClassFunc(completionHandler: @escaping (_ data: ActiveOrderDelivery?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/orders/delivery_orders?status=active"
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
                        let activeOrderDelivery = try JSONDecoder().decode(ActiveOrderDelivery.self, from: data)
                        completionHandler(activeOrderDelivery, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    
    class func FinishOrderDeliveryClassFunc(completionHandler: @escaping (_ data: FinishOrderDelivery?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/orders/delivery_orders?status=finished"
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
                        let finishOrderDelivery = try JSONDecoder().decode(FinishOrderDelivery.self, from: data)
                        completionHandler(finishOrderDelivery, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    

    class func introPagesClassFunc(completionHandler: @escaping (_ data: IntroPages?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/intro"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "e7af5684-b979-4beb-8958-df1ef270eb34,b20f3fc6-ed2c-4f67-bfa1-a7f10c5d9e21",
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
                        let introPage = try JSONDecoder().decode(IntroPages.self, from: data)
                        completionHandler(introPage, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    
    class func ContactInfoClassFunc(completionHandler: @escaping (_ data: CotactInfo?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/pages/contact"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "30680a59-26fb-46b0-b676-df22e1518ed9,0704b07f-d347-422a-ac04-333d51b67a2b",
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
                        let cotactInfo = try JSONDecoder().decode(CotactInfo.self, from: data)
                        completionHandler(cotactInfo, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    
    class func NotiDeliveryClassFunc(completionHandler: @escaping (_ data: Delivery?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/user/notifications/delivery"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2Njk0MTU2NSwibmJmIjoxNTY2OTQxNTY1LCJqdGkiOiJZV054bU5JRnY4VDZOaTFwIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.PRlgROR7yflnFFnOCXftT_Hao_kMuvyO6juZE0C3vcs",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "ba6c5444-a956-4e86-80b7-84e8222aee38,af7d9f90-3193-42b1-a274-fb46f401449b",
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
                        let delivery = try JSONDecoder().decode(Delivery.self, from: data)
                        completionHandler(delivery, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }

    class func NotiClientClassFunc(completionHandler: @escaping (_ data: Client?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/user/notifications/user"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2Njk0MTU2NSwibmJmIjoxNTY2OTQxNTY1LCJqdGkiOiJZV054bU5JRnY4VDZOaTFwIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.PRlgROR7yflnFFnOCXftT_Hao_kMuvyO6juZE0C3vcs",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "96dccdde-9ee2-4ac5-aa88-93d74aad35de,810df4be-81f0-4d62-803a-6fb241a26835",
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
                        let client = try JSONDecoder().decode(Client.self, from: data)
                        completionHandler(client, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    class func HowToBeDelivery(completionHandler: @escaping (_ data: HowtoBeDelivery?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/pages/how_to_be_delivery"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "29d9c45c-4ebe-41ef-8e3f-52a5fdf32e0c,d1a9d82f-b85a-467c-a24e-9efcd41ac1ae",
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
                        let howtoBeDelivery = try JSONDecoder().decode(HowtoBeDelivery.self, from: data)
                        completionHandler(howtoBeDelivery, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    class func UsageAndTermsClassFunc(completionHandler: @escaping (_ data: UsageAndTerms?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/pages/usage"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "dddd4dd6-3e32-44a3-b784-cc42fa9c77d7,f745aff8-54b2-42cb-bea5-3aa529c19869",
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
                        let usageAndTerms = try JSONDecoder().decode(UsageAndTerms.self, from: data)
                        completionHandler(usageAndTerms, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    
    

    
    class func AllCategoryFirmsClassFunc(completionHandler: @escaping (_ data: AllCategoryFirmResponse?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/firms/firms_by_category/all/?lat=16.00&lng=18.00"
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "744800d9-8028-4e68-844b-2a699b89614c,a7637175-5b71-4c58-8aba-e5b47a2975da",
            "Accept-Encoding": "gzip, deflate",
            "Referer": "http://appqreeb.com/api/firms/firms_by_category/all/?lat=16.00&lng=18.00",
            "Connection": "keep-alive",
            "cache-control": "no-cache"
        ]
        
        request(url, headers: headers)
            .validate(statusCode: 200 ..< 300)
            .responseData { response in
                switch response.result {
                case .success(let data):
                    do {
                        let allCategoryFirmResponse = try JSONDecoder().decode(AllCategoryFirmResponse.self, from: data)
                        completionHandler(allCategoryFirmResponse, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    class func ClientsCommentClassFunc(completionHandler: @escaping (_ data: ClientsComment?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/user/client_rates"
        let headers = [
            "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI"
            ,
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "40526b73-4663-4b9f-8bed-c24cff91b7ca,8f81a57c-50d8-40ab-99db-78142e7ddcd6",
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
                        let clientComment = try JSONDecoder().decode(ClientsComment.self, from: data)
                        completionHandler(clientComment, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    
    class func AllBanksAccountClassFunc(completionHandler: @escaping (_ data: AllBanksAccount?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/bank_accounts"
  
        let headers = [
            "X-localization": "ar",
            "Authorization": "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU1NzgwMjQzNiwibmJmIjoxNTU3ODAyNDM2LCJqdGkiOiJuSWs1OHR1WUlsdlpGQXNyIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.iYdKsds-wCnkbq2Yq-cv_WVV8zI7LHPiFtri_t1BRAg",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "d3caedcc-305a-4fc5-8c8d-3610f38d1c79,4241ea88-6026-4dc6-82f1-3046721f17f8",
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
                        let allBanksAccont = try JSONDecoder().decode(AllBanksAccount.self, from: data)
                        completionHandler(allBanksAccont, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    class func UserTabInfoClassFunc(completionHandler: @escaping (_ data: UserTabInfo?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/user/info"

        let headers = [
            "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI,Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU2Njk0MTU2NSwibmJmIjoxNTY2OTQxNTY1LCJqdGkiOiJZV054bU5JRnY4VDZOaTFwIiwic3ViIjoxLCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.PRlgROR7yflnFFnOCXftT_Hao_kMuvyO6juZE0C3vcs",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "79bb3bc3-8840-48a4-a8d5-9d4381f23fb8,1658420c-744a-4759-aec2-17eca8552320",
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
                        let profileFile = try JSONDecoder().decode(UserTabInfo.self, from: data)
                        completionHandler(profileFile, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }
    
    
    class func logOutClassFunc(completionHandler: @escaping (_ data: LogOut?, _ error: Error?) -> ()) {
        let url = "http://appqreeb.com/api/user/logout"
        let headers = [
            "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI",
            "User-Agent": "PostmanRuntime/7.15.2",
            "Accept": "*/*",
            "Cache-Control": "no-cache",
            "Postman-Token": "be3d7aae-c911-4f4b-aed7-593c3aa62541,c4b84c27-8c87-4a33-b2b0-74957db36491",
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
                        let profileFile = try JSONDecoder().decode(LogOut.self, from: data)
                        completionHandler(profileFile, nil)
                    } catch {
                        completionHandler(nil, error)
                    }
                case .failure(let error):
                    completionHandler(nil, error)
                }
        }
    }

}

