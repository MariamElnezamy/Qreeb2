//
//  OrderNowVC.swift
//  Qreeb
//
//  Created by Admin on 8/22/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class OrderNowVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyHeight.constant=0
        

    }
    
    var isViewVisiable = false
    @IBOutlet var MyHeight: NSLayoutConstraint!
    
    
    
    @IBOutlet var MyView: UIView!
    
    @IBOutlet var arriveTime: UIButton!
    
   
    @IBAction func time(_ sender: UIButton) {
        
        arriveTime.setTitle("\(sender.tag) ساعة", for: UIControl.State.normal)
        self.isViewVisiable = false
        self.MyHeight.constant=0
    }
    
    
    @IBAction func dropDownBtn(_ sender: Any) {
        UIView.animate(withDuration: 0.4) {
            if self.isViewVisiable == false {
                self.MyHeight.constant=80
                self.isViewVisiable = true
            }else {
                self.isViewVisiable = false
                self.MyHeight.constant=0
            }
            self.view.layoutIfNeeded()
        }
    }
    


}
