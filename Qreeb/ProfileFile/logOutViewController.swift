//
//  logOutViewController.swift
//  Qreeb
//
//  Created by Admin on 8/10/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class logOutViewController: UIViewController {



    @IBAction func btn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    

    @IBAction func logOutBtn(_ sender: Any) {
        
        let headers = [
            "Authorization": "bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC8xMjcuMC4wLjE6ODAwMFwvYXBpXC9hdXRoXC9sb2dpbiIsImlhdCI6MTU0MDM4MDY5OSwiZXhwIjoxNTQxNTkwMjk5LCJuYmYiOjE1NDAzODA2OTksImp0aSI6IjRnWm9DT3p2TGszcnNodlQiLCJzdWIiOjE4LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0.5zHabPiDvuL4APseMdVN4ExA2Oh-Sk9nQXxVMhxUqFI",
            "cache-control": "no-cache",
            "Postman-Token": "4bbdb16a-93ed-4950-8eb4-2e340d89b517"
        ]
        
        let url =  "http://appqreeb.com/api/user/logout"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers)
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
