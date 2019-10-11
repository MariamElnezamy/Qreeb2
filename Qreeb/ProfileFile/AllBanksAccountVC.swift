//
//  AllBanksAccountVC.swift
//  Qreeb
//
//  Created by Admin on 10/8/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class AllBanksAccountVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var allBanks:AllBanksAccount?

    @IBOutlet var MyTableView: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allBanks?.data.bankAccounts.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! AllBanksCell
        if let ABC = allBanks?.data.bankAccounts[indexPath.row]{
            cell.accountNumber.text = ABC.accountNumber
            cell.bianNumer.text = ABC.iban
            cell.owner.text = ABC.ownerName
            cell.img.image = UIImage(named: ABC.bankImage)
        }
        return cell
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        MyTableView.delegate=self
        MyTableView.dataSource=self
        AllBanks()
    }

    private func AllBanks(){
        API.AllBanksAccountClassFunc { (AllBanksAccount, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let firms = AllBanksAccount else { return }
                self.allBanks = firms
                self.MyTableView.reloadData()
            }
        }
    }

 

}
