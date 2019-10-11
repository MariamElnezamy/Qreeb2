//
//  helper.swift
//  Qreeb
//
//  Created by Admin on 9/3/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class helper: NSObject {
    
//    class func restartApp () {
//        guard let window = UIApplication.shared.keyWindow else {return}
//        let sb = UIStoryboard(name: "Main", bundle: nil)
//        var vc : UIViewController
//        if getApiToken() == nil {
//            // go to auth screen
//            vc = sb.instantiateInitialViewController()!
//        }else{
//            // go to main screen
//            vc = sb.instantiateViewController(withIdentifier: "MyTab")
//        }
//        window.rootViewController=vc
//        UIView.transition(with: window, duration: 0.5, options: .transitionFlipFromTop, animations: nil, completion: nil)
//    }
//    
//    class func saveApiToken(token:String){
//        // save api token to userDefaults
//        let def = UserDefaults.standard
//        if let api_token = def.object(forKey: "token") as? String {
//            print("token: \(token)")
//        }
//    }
//
//    class func getApiToken() -> String? {
//        let def = UserDefaults.standard
//        return def.object(forKey: "token") as? String
//    }
}
