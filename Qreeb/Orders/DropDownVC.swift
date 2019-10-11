//
//  DismissVC.swift
//  Qreeb
//
//  Created by Admin on 8/19/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class DropDownVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                myHeight.constant=0
                myView.isHidden=true
        
        
    }
    
    var isViewVisiable = false
    
    @IBAction func dropDownBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            if self.isViewVisiable == false {
                self.myHeight.constant=70
                self.isViewVisiable = true
                self.myView.isHidden=false

            }else {
                self.isViewVisiable = false
                self.myHeight.constant=0
                self.myView.isHidden=true

            }
            self.view.layoutIfNeeded()

        }
    }
    @IBOutlet var myHeight: NSLayoutConstraint!
    @IBOutlet var myView: UIView!
    
    @IBAction func btn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btn1(_ sender: Any) {
        self.myView.isHidden=true
        MyTextField.text = "سعر التوصيل مرتفع"

    }
    
    @IBAction func btn2(_ sender: Any) {
        self.myView.isHidden=true
        MyTextField.text = "لم اعد اريد الطلب"
    }
    
    @IBAction func btn3(_ sender: Any) {
        self.myView.isHidden=true
        MyTextField.text = "سبب اخر"

    }
    
    @IBOutlet var MyTextField: UITextField!
    
}
