//
//  ProfileFileVC.swift
//  Qreeb
//
//  Created by Admin on 10/8/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class ProfileFileVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        UserTab()
    }
    
    var user:UserTabInfo?
    

    
    private func UserTab() {
        API.UserTabInfoClassFunc{ (UserTabInfo, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let firms = UserTabInfo else { return }
                self.user = firms

            }
        }
    }



}
