//
//  DoneVC.swift
//  Qreeb
//
//  Created by Admin on 8/19/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class DoneVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.dismiss(animated: true) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                
             //   self.performSegue(withIdentifier: "A", sender: nil)
            }
        }
        
    }
    



}
