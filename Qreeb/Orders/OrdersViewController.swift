//
//  OrdersViewController.swift
//  Qreeb
//
//  Created by Admin on 8/6/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class OrdersViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet var tableView1: UITableView!
    @IBOutlet var tableView2: UITableView!

    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    
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
            return PicArr.count
        }else if tableView == tableView2 {
            return PicArr.count
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tableView1.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrdersTableViewCell1
        let cell2 = tableView2.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! OrderTableViewCell2
        
        cell1.img.image=UIImage(named: PicArr[indexPath.row])
        cell1.title.text=titleArr[indexPath.row]
        cell1.order.text=orderArr[indexPath.row]
        cell1.order2.text=orderArr2[indexPath.row]

        cell2.img.image=UIImage(named: PicArr2[indexPath.row])
        cell2.title.text=titleArr[indexPath.row]
        cell2.order.text=orderArr[indexPath.row]
        
        cell1.selectionStyle = .none
        cell2.selectionStyle = .none
        
        if tableView == tableView1 {
            return cell1
        }else if tableView == tableView2 {
            return cell2
        }
        return UITableViewCell()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView1.isHidden=false
        tableView2.isHidden=true
        
        view1.isHidden=false
        view2.isHidden=true
        
        tableView1.delegate=self
        tableView1.dataSource=self
        tableView2.delegate=self
        tableView2.dataSource=self
    }
    
    

}
