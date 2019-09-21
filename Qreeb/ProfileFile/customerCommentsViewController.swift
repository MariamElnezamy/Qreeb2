
//
//  customerCommentsViewController.swift
//  Qreeb
//
//  Created by Admin on 7/31/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class customerCommentsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var titleArr:[String] = ["محمد","ليث","محمد","سمير"]
    var contentArr:[String] = ["لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل","لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل","لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل","لوريم ايبسوم هو نموذج افتراضي يوضع في التصاميم لتعرض على العميل"]
    var dateArr:[String] = ["4:55م",
                            "5:22م",
                            "12:5م",
                            "6:10م"]
    var timeArr:[String] = ["11/5/2019","12/5/2019","13/5/2019","14/5/2019"]
    var img:[String] = ["pic","NoPath - Copy-3","NoPath - Copy-2","NoPath - Copy-1"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customerCommentsTableViewCell
        cell.img.image = UIImage(named: img[indexPath.row])
        cell.titleLb.text = titleArr[indexPath.row]
        cell.commentLb.text = contentArr[indexPath.row]
        cell.dateLb.text = dateArr[indexPath.row]
        cell.timeLb.text = timeArr[indexPath.row]
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    


}
