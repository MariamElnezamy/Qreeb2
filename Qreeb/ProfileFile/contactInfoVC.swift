//
//  contactInfoVC.swift
//  Qreeb
//
//  Created by Admin on 8/31/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit


class contactInfoVC: UIViewController {
    
   var contactInfo:CotactInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contact()
    }
    
    @IBOutlet var number: UILabel!
    @IBOutlet var email: UILabel!
    private func contact() {
        API.ContactInfoClassFunc { (ContactInfo, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let firms = ContactInfo else { return }
                self.contactInfo = firms
                self.email.text = self.contactInfo?.data.email
                self.number.text = self.contactInfo?.data.phone

            }
        }
    }
    
    @IBAction func sendBtn(_ sender: UIButton) {
    }
    
}
