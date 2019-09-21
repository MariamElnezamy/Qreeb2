//
//  Notifications.swift
//  Qreeb
//
//  Created by Admin on 7/31/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class Notifications: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var orderArr:[String]=["قام المندوب محمد بتقديم عرض لتوصيل طلبك 123456 العرض ساري لمدة 5 دقايق","قام المندوب احمد بتقديم عرض لتوصيل طلبك 123456 العرض ساري لمدة 5 دقايق","قام المندوب محمود بتقديم عرض لتوصيل طلبك 123456 العرض ساري لمدة 5 دقايق","قام المندوب اسامة بتقديم عرض لتوصيل طلبك 123456 العرض ساري لمدة 5 دقايق"]
    var imgArr:[String]=["Ellipse 9","Ellipse -2","Ellipse -2","Ellipse -3"]

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return  imgArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! notificationTableViewCell
        
        cell.img.image=UIImage(named: imgArr[indexPath.row])
        cell.order.text=orderArr[indexPath.row]
        return cell
    }
    

    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    
    @IBOutlet var view2: UIView!
    @IBOutlet var view1: UIView!
    
    @IBAction func button(_ sender: UIButton) {
        
        if sender == btn1 {
            
            btn1.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            btn2.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: UIControl.State.normal)
            
            view1.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            view2.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
 
            
        } else if sender == btn2 {
            
            btn1.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: UIControl.State.normal)
            btn2.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            
            view2.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            view1.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
   
  

}
