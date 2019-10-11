//
//  cellCV.swift
//  Qreeb
//
//  Created by Admin on 8/18/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import Foundation
import UIKit

class cellCV: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    var detailsByFirmId:DetailsByFirmID?
    var waitingListOrdersForFirm:WaitingListOrdersForFirm?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return waitingListOrdersForFirm?.data.firms.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! waitingListCell
        if let data = waitingListOrdersForFirm?.data.firms[indexPath.row] {
            cell.name.text=data.name
            cell.img.image=UIImage(named: data.image)
           // cell.time.text=data.
            cell.content.text="\(data.details)"
            cell.distance.text="\(data.fromYou)"
        }
        return cell
    }
    
    
  
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var MyView: UIView!
    
    @IBOutlet var btn1: UIButton!
    @IBOutlet var btn2: UIButton!
    
    
    @IBOutlet var marketName: UILabel!
    @IBOutlet var content: UILabel!
    @IBOutlet var timePM: UILabel!
    @IBOutlet var timeAM: UILabel!
    @IBOutlet var DeliveryNumber: UILabel!
    
    @IBOutlet var MyTableView: UITableView!
    
  
    
    @IBAction func Button(_ sender: UIButton) {
        if sender == btn1 {
            self.MyView.isHidden=true
            btn1.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            btn2.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: UIControl.State.normal)
            view1.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            view2.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        } else if sender == btn2 {
            self.MyView.isHidden=false
            btn1.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: UIControl.State.normal)
            btn2.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            view2.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            view1.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
    private func detailsByFirmIdFun() {
        API.SingleFirmDetailsByFirmIdClassFunc { (detailsByFirmId, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let DBI = detailsByFirmId else { return }
                self.detailsByFirmId = DBI
                if let SFD = detailsByFirmId?.data {
                    self.title = SFD.name
                    self.DeliveryNumber.text = "\(String(describing: SFD.availableDeliveries))"
                    self.marketName.text = SFD.name
                    self.content.text = SFD.dataDescription
                    self.timeAM.text = detailsByFirmId?.data.openedFrom
                    self.timePM.text = detailsByFirmId?.data.openedTo
                }
            }
        }
    }
    
    private func waitingListOrdersForFirmFun() {
        API.tWaitingListOrdersForFirmClassFunc { (waitingListOrdersForFirm, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let firms = waitingListOrdersForFirm else { return }
                self.waitingListOrdersForFirm = firms
                self.MyTableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.MyView.isHidden=true
        detailsByFirmIdFun()
        waitingListOrdersForFirmFun()
      

    }
}
