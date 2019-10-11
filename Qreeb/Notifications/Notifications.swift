//
//  Notifications.swift
//  Qreeb
//
//  Created by Admin on 7/31/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class Notifications: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var user:Client?
    
    @IBOutlet var DeliveryTableView: UITableView!
    @IBOutlet var UserTableView: UITableView!
    
    @IBOutlet var DeliveryView: UIView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == UserTableView{
            return user?.data.firms.count ?? 0
        }else if tableView == DeliveryTableView{
            return 2
        }
      return  5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == UserTableView{
            let cell = UserTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! notificationTableViewCell
            if let u = user?.data.firms[indexPath.row] {
                cell.img.image = UIImage(named: u.image)
         //       cell.time.text = "\(u.)"
                cell.order.text = "\(u.details)"
            }
            return cell
        }else if tableView == DeliveryTableView{
            let cell = DeliveryTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! NotificationDeliveryCell
         //   if let D =
            
            return cell
            
        }
        return UITableViewCell()
    }
    

    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    
    @IBOutlet var view2: UIView!
    @IBOutlet var view1: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DeliveryView.isHidden=true
    }
    
    @IBAction func button(_ sender: UIButton) {
        
        
        if sender == btn1 {
            
            btn1.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            btn2.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: UIControl.State.normal)
            
            view1.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            view2.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            DeliveryView.isHidden=false
            
        } else if sender == btn2 {
            
            btn1.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: UIControl.State.normal)
            btn2.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            
            view2.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            view1.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            
            DeliveryView.isHidden=true

        }
    }
   
    private func UserNoti() {
        API.NotiClientClassFunc { (User, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let firms = User else { return }
                self.user = firms
                self.UserTableView.reloadData()
            }
        }
    }

}
