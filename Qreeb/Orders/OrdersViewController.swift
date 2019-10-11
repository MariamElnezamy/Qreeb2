//
//  OrdersViewController.swift
//  Qreeb
//
//  Created by Admin on 8/6/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {    
    
    var activeUser:ActiveOrderClient?
    var finishUser:FinishOrderClient?
    var activeDelivery:ActiveOrderDelivery?
    var finishDelivery:FinishOrderDelivery?
    
    
    @IBOutlet var activeUserTableView: UITableView!
    @IBOutlet var tableView1: UITableView!
    @IBOutlet var tableView2: UITableView!
    @IBOutlet var finishDeliveryTableVieww: UITableView!
    
    
    @IBOutlet var activeViewUser: UIView!
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var finishViewDelivery: UIView!
    
    
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    
    @IBOutlet var UserView: UIView!
    @IBOutlet var DeliveryView: UIView!
    
    @IBOutlet var HeightDeliveryView: NSLayoutConstraint!
    @IBOutlet var HeightUserView: NSLayoutConstraint!
    
    var isViewVisiableUser = false
    var isViewVisiableDelivery = false

    
    @IBAction func DeliveryDropDownBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            if self.isViewVisiableDelivery == false {
                self.HeightDeliveryView.constant=50
                self.isViewVisiableDelivery = true
                self.DeliveryView.isHidden=false
            }else {
                self.isViewVisiableDelivery = false
                self.HeightDeliveryView.constant=0
                self.DeliveryView.isHidden=true
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func UserDropDownBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            if self.isViewVisiableUser == false {
                self.HeightUserView.constant=50
                self.isViewVisiableUser = true
                self.UserView.isHidden=false
            }else {
                self.isViewVisiableUser = false
                self.HeightUserView.constant=0
                self.UserView.isHidden=true
            }
            self.view.layoutIfNeeded()
        }
    }
    
    @IBOutlet var Button:UIButton!
    
    
         func ActiveOrderUserFunc(){
            API.ActiveOrderClientClassFunc { (ActiveUser, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    guard let firms = ActiveUser else { return }
                    self.activeUser = firms
                    self.tableView1.reloadData()
                }
            }
        }
    
        func FinishOrderUserFunc(){
            API.FinishOrderClientClassFunc { (FinishUser, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    guard let firms = FinishUser else { return }
                    self.finishUser = firms
                    self.tableView2.reloadData()
                }
            }
        }

        func ActiveOrderDeliveryFunc(){
            API.ActiveOrderDeliveryClassFunc { (ActiveDelivery, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    guard let firms = ActiveDelivery else { return }
                    self.activeDelivery = firms
                    self.tableView1.reloadData()
                }
            }
        }

        func FinishOrderDeliveryFunc(){
            API.FinishOrderDeliveryClassFunc { (FinishDelivery, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    guard let firms = FinishDelivery else { return }
                    self.finishDelivery = firms
                    self.tableView2.reloadData()
                }
            }
        }
        
    
    
    
    
    @IBAction func button(_ sender: UIButton) {
        
        if sender == btn1 {
            
            btn1.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            btn2.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: UIControl.State.normal)

            tableView1.isHidden=false
            tableView2.isHidden=true
            view1.isHidden=false
            view2.isHidden=true
            
        } else if sender == btn2 {
            
            btn1.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: UIControl.State.normal)
            btn2.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)

            tableView1.isHidden=true
            tableView2.isHidden=false
            view1.isHidden=true
            view2.isHidden=false
        }
    }

    
    
    
    
    
    var PicArr:[String]=["NoPath - Copy (4)","NoPath - Copy (3)","NoPath - Copy (2)"]
    var titleArr:[String]=["هايبر بنده ماركت","كارفور السعودية","اسواق العثيم"]
    var orderArr:[String]=["ربع زيتون","ربع زيتون","ربع زيتون"]
    var orderArr2:[String]=["ربع زيتون","ربع زيتون","ربع زيتون"]

    var PicArr2:[String]=["NoPath - Copy-1","NoPath - Copy-2","NoPath - Copy-3"]
    var titleAr2r:[String]=["هايبر بنده ماركت","كارفور السعودية","اسواق العثيم"]
    var orderAr2r:[String]=["ربع زيتون و نص جبنة تلاجة","ربع زيتون","ربع زيتون"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tableView1 {
            if Button.tag == 1{
                return 1
            }
        }else if tableView == tableView2 {
            if Button.tag == 3{
                return 3
            }
        }else if tableView == activeUserTableView{
            if Button.tag == 2{
                return 2
            }
        }else if tableView == finishDeliveryTableVieww{
            if Button.tag == 4{
                return 4
            }
        }
        return 10
    }
        
        

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        if tableView == tableView1 {
            if Button.tag == 1 {
                let cell1 = activeUserTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrdersTableViewCell1
             //   if let FU = finishUser?.data.orders[indexPath.row] {
                    //            cell1.img.image=UIImage(named: FU.)
                    //            cell1.title.text=FU.
                    //            cell1.order.text=FU.
                    //            cell1.order2.text=FU.
                    //  cell1.selectionStyle = .none
               // }
                    return cell1
            }else if Button.tag == 2 {
                    let cell1 = tableView1.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrdersTableViewCell1
//                    if let FD = finishDelivery?.data.orders[indexPath.row]{
//                    }
                    return cell1
        }else if tableView == tableView2 {
            if Button.tag == 3 {
                let cell2 = tableView2.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderTableViewCell2
                //if let AU = activeUser?.data.orders[indexPath.row] {
                    
                    //                cell2.img.image=UIImage(named: AD.)
                    //                cell2.title.text=AD.
                    //                cell2.order.text=AD.
                    //  cell2.selectionStyle = .none
               // }
                    return cell2
            }else if Button.tag == 4 {
                    let cell2 = finishDeliveryTableVieww.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderTableViewCell2
//                    if let AU = activeUser?.data.orders[indexPath.row] {
//                    }
                    return cell2
                }
            }
        }
        return UITableViewCell()
    }

       override func viewDidLoad() {
            super.viewDidLoad()
        
        tableView1.isHidden=false
        tableView2.isHidden=true
        
        activeViewUser.isHidden=true
        view1.isHidden=false
        view2.isHidden=true
        finishViewDelivery.isHidden=true
        
        tableView1.delegate=self
        tableView1.dataSource=self
        tableView2.delegate=self
        tableView2.dataSource=self
        
        HeightUserView.constant=0
        UserView.isHidden=true
        
        HeightDeliveryView.constant=0
        DeliveryView.isHidden=true

    }
    
}
