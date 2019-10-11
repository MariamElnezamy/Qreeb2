//
//  ChatVC.swift
//  Qreeb
//
//  Created by Admin on 8/16/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    @IBAction func MapBtn(_ sender: Any) {
        
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let controller = storyboard.instantiateViewController(withIdentifier: "MyMap")
                    self.present(controller, animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myHeight.constant=0
        myView.isHidden=true
        
        
    }
    
    var isViewVisiable = false
    
    @IBAction func dropDownBtn(_ sender: Any) {
    
    UIView.animate(withDuration: 0.4) {
    if self.isViewVisiable == false {
    self.myHeight.constant=80
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


@IBAction func btn1(_ sender: Any) {
    self.myView.isHidden=true
}

@IBAction func btn2(_ sender: Any) {
    self.myView.isHidden=true
}

@IBAction func btn3(_ sender: Any) {
    self.myView.isHidden=true
}

}
