//
//  MarketViewController+TableView.swift
//  
//
//  Created by Admin on 10/12/19.
//

import UIKit

extension MarketViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableViewSetup() {
        tabelView1.delegate=self
        tabelView1.dataSource=self
        tabelView2.delegate=self
        tabelView2.dataSource=self
        firmsNearTabelView.delegate=self
        firmsNearTabelView.dataSource=self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tabelView1 {
            return firms?.data.firms.count ?? 0
        }else if tableView == tabelView2 {
            return allCategoryFirm?.data.firms.count ?? 0
        }else if tableView == firmsNearTabelView {
            return firmsNear?.data.firms.count ?? 0
        }else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tabelView1 {
            let cell1 = tabelView1.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! MarketTableViewCell1
            if let Al = firms?.data.firms[indexPath.row] {
                cell1.img1.image = UIImage(named: Al.image)
                cell1.title1.text = Al.name
                cell1.txt1.text = Al.address
                cell1.txtKG.text = "\(Al.fromYou) kg"
            }
            
            return cell1
        }else if tableView == tabelView2 {
            let cell2 = tabelView2.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! MarketTableViewCell2
            if let ACF = allCategoryFirm?.data.firms[indexPath.row] {
                cell2.img2.image=UIImage(named: ACF.image)
                cell2.title2.text=ACF.name
                cell2.txt2.text=ACF.address
                cell2.txtKG.text="\(ACF.fromYou) "
            }
            return cell2
            
        }else if tableView == firmsNearTabelView {
            let cell3 = firmsNearTabelView.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! firmsNearCell
            if let fn = firmsNear?.data.firms[indexPath.row] {
                cell3.img.image=UIImage(named: fn.image)
                cell3.title.text=fn.name
                cell3.txt.text=fn.address
                cell3.txtKG.text="\(fn.fromYou) kg"
            }
            return cell3
            
        }else {
            return UITableViewCell()
        }
    }
}
