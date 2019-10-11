//
//  UseAndTermVC.swift
//  Qreeb
//
//  Created by Admin on 10/8/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class UseAndTermVC: UIViewController {
    
    var useANDterm:UageAndTerms?

    override func viewDidLoad() {
        super.viewDidLoad()

UageAndTerms()
        
    }
    

    @IBOutlet var MyTxtView: UITextView!
    
    private func UageAndTerms() {
        API.UageAndTermsCF { (UageAndTerms, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let firms = UageAndTerms else { return }
                self.useANDterm = firms
                self.MyTxtView.text = self.useANDterm?.data
            }
        }
        
    }

    
}
