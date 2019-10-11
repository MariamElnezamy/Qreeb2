//
//  loginVC.swift
//  Qreeb
//
//  Created by Admin on 8/20/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class RegisterPhoneVC: UIViewController {

    @IBOutlet var phoneTF: UITextField!
    @IBAction func loginBtn(_ sender: UIButton) {
        
        guard let phone = phoneTF.text, !phone.isEmpty else {
            let alert = UIAlertController(title: "عذرا !", message: "لم يتم ادخال رقم", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler:nil))
            self.present(alert, animated: true)
            
            return
        }
    
        API.login(phone: phone) { (error:Error?, success:Bool) in
            if success{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "next")
                self.present(controller, animated: true, completion: nil)
            }
            else {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "registerVCs")
                self.present(controller, animated: true, completion: nil)
            }
        }
    }

}
