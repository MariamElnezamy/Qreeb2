//
//  Usage&TermsVC.swift
//  Qreeb
//
//  Created by Admin on 10/2/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class UsageAndTermsVC: UIViewController {
    

    
    var usageAndTerms:UsageAndTerms? = nil
    
    @IBOutlet var MyTxtView: UITextView!
    
    private func UsageAndTermsFunc() {
        API.UsageAndTermsClassFunc { (UsageAndTerms, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let firms = UsageAndTerms else { return }
                self.usageAndTerms = firms
                if let  usageAndTerms = self.usageAndTerms {
                   self.MyTxtView.text = usageAndTerms.data 
                } else {
                     self.MyTxtView.text = "Empty" 
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UsageAndTermsFunc()
    }
    
}
