//
//  LaunshViewController.swift
//  Qreeb
//
//  Created by Admin on 8/6/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class LaunshViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {            
            self.performSegue(withIdentifier: "x", sender: nil)
        }

    }
    

}
