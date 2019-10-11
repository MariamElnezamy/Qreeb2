
//
//  customerCommentsViewController.swift
//  Qreeb
//
//  Created by Admin on 7/31/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class customerCommentsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var ClientComment:ClientComment?
    
    private func clientC() {

        API.ClientsCommentClassFunc { (ClientComment, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let firms = ClientComment else { return }
                self.ClientComment = firms
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3 //ClientComment?.data.rates[indexPath.row].count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! customerCommentsTableViewCell
//        cell.img.image = UIImage(named: img[indexPath.row])
//        cell.titleLb.text =
//        cell.commentLb.text =
//        cell.dateLb.text =
//        cell.timeLb.text =
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        clientC()
    }
    


}
