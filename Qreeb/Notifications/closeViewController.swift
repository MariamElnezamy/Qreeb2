//
//  closeViewController.swift
//  Qreeb
//
//  Created by Admin on 8/16/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class closeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func closeBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    

}
