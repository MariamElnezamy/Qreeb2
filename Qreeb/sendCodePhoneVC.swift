//
//  sendCodePhoneVC.swift
//  Qreeb
//
//  Created by Admin on 8/21/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class sendCodePhoneVC: UIViewController {
    
    @IBOutlet var MyCode: UITextField!
    @IBOutlet var myTimer: UILabel!
    
    var timer = Timer()
    var time = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
           
          //  self.timer = Timer(timeInterval: 1, target: self, selector: #selector(self.handleTimer(action:)) , userInfo: nil, repeats: true)
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.handleTimer(action:)) , userInfo: nil, repeats: true)
        
          //  self.timer.fire()
        }
    

    @objc func handleTimer(action: Timer) {
        if time == 0 {
            
         // todo message
            if self.presentedViewController == nil {
            let alert = UIAlertController(title: "عذرا !", message: "حاول مرة اخرئ", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.time = 5
               // self.timer.fire()
            }))
            self.present(alert, animated: true, completion: nil)
                
            }
            
        } else {
            self.time -= 1
            self.myTimer.text = "00:\(self.time)"
        }
    }
    @IBAction func sendCodeBtn(_ sender: Any) {
//        if MyCode.text==() {
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let controller = storyboard.instantiateViewController(withIdentifier: "registerVCs")
//            self.present(controller, animated: true, completion: nil)
//        }else{
//            let alert = UIAlertController(title: "عذرا !", message: "الكود خطأ , حاول مرة اخرى", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
//            self.present(alert, animated: true)
//        }       


    }
    

}


