//
//  DeletOrderVC.swift
//  Qreeb
//
//  Created by Admin on 8/16/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class DeletOrderVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            
            self.performSegue(withIdentifier: "MySegue2", sender: nil)
        }
    }



}
