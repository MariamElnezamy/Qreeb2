//
//  howToBeDeliveryVC.swift
//  Qreeb
//
//  Created by Admin on 8/31/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit
import Foundation
import Alamofire
import SwiftyJSON

class howToBeDeliveryVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        HowToBe()
    }
    
    var delivery:HowtoBeDelivery?
//
    @IBOutlet var MtTxtView: UITextView!
//
    private func HowToBe() {
        API.HowToBeDelivery { (HowToBeDelivry, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let firms = HowToBeDelivry else { return }
                self.delivery = firms
                self.MtTxtView.text = self.delivery?.data
            }
        }

    }
    
}





