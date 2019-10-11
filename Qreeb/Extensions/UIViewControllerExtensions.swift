//
//  UIViewControllerExtensions.swift
//  SMM
//
//  Created by Vortex on 1/5/18.
//  Copyright © 2018 Vortex. All rights reserved.
//

import UIKit
import Localize_Swift
extension UIViewController {
    
    
    func makeNavigationBarTransparent(color : UIColor = UIColor.white) {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = color
        navigationController?.navigationBar.topItem?.title = ""
    }
    

    func changeAppLanguge(){
        
        
        let title = "To Change the app languge".localized()
        let message = "it will need to exite and reopen it again in 1 second open your app".localized()
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OkayAlertAction = UIAlertAction(title: "I Agree".localized(), style: .default, handler: {(action)-> Void in
            UserDefaultsHelper().switchLanguage()
            UserDefaults.standard.synchronize()
            DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(500)) {
                exit(0)
            }
        })
        let CancelAlertAction = UIAlertAction(title: "I am not Agree".localized(), style: .cancel, handler:nil)
        
        alertController.addAction(OkayAlertAction)
        alertController.addAction(CancelAlertAction)
        present(alertController, animated: true, completion: nil)
        
        
    }
    
}
