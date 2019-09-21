//
//  MarketViewController.swift
//  Qreeb
//
//  Created by Admin on 8/5/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class MarketViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var tasks = [Task]()
    
    lazy var refresher:UIRefreshControl={
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refresher
    }()
    
    var txt:[String] = ["خصم 25% على جميع المشتريات لفترة محدودة","خصم 10% على جميع المشتريات لفترة محدودة","خصم 25% على جميع المشتريات لفترة محدودة","خصم 30% على جميع المشتريات لفترة محدودة","خصم 40% على جميع المشتريات لفترة محدودة","خصم 13% على جميع المشتريات لفترة محدودة","خصم 30% على جميع المشتريات لفترة محدودة","خصم 25% على جميع المشتريات لفترة محدودة","خصم 25% على جميع المشتريات لفترة محدودة","خصم 25% على جميع المشتريات لفترة محدودة","خصم 25% على جميع المشتريات لفترة محدودة","خصم 25% على جميع المشتريات لفترة محدودة"]

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return txt.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MarketCollectionViewCell
        
        cell.img.image=UIImage(named: "Group 376-1")
        cell.title.text=marketTitle1[indexPath.row]
        cell.txtKG.text="40KG"
        cell.address.text=marketTxt1[indexPath.row]
        cell.txt.text=txt[indexPath.row]
        return cell 
    }
        
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    
    var isViewVisiable = false
    @IBOutlet var MyHeight: NSLayoutConstraint!
    @IBOutlet var MyView: UIView!
    
    @IBAction func dropDownBtn(_ sender: UIButton) {
        UIView.animate(withDuration: 0.4) {
            if self.isViewVisiable == false {
                self.MyHeight.constant=60
                self.isViewVisiable = true
                self.MyView.isHidden=false
            }else {
                self.isViewVisiable = false
                self.MyHeight.constant=0
                self.MyView.isHidden=true
            }
            self.view.layoutIfNeeded()
        }
    }
   
    @IBAction func MapBtn(_ sender: Any) {
        button1.setTitle("الخريطة", for: UIControl.State.normal)
        view4.isHidden=false
        view1.isHidden=true
        view2.isHidden=true
        view3.isHidden=true
    }
    @IBAction func Button(_ sender: UIButton) {
        
        if sender == button1 {
            
            tabelView1.isHidden=false
            tabelView2.isHidden=true
            myCollectionView.isHidden=true
            view1.isHidden=false
            view2.isHidden=true
            view3.isHidden=true
            view4.isHidden=true

            button1.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
            button1.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            button2.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button2.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            button3.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button3.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)

        } else if sender == button2 {
            
            tabelView1.isHidden=true
            tabelView2.isHidden=false
            myCollectionView.isHidden=true
            view1.isHidden=true
            view2.isHidden=false
            view3.isHidden=true
            view4.isHidden=true
            
            button1.setTitle("متاجر بالقرب مني", for: UIControl.State.normal)

            button2.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
            button2.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            button1.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button1.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            button3.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button3.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
        }else if sender == button3 {
            
            tabelView1.isHidden=true
            tabelView2.isHidden=true
            myCollectionView.isHidden=false
            view1.isHidden=true
            view2.isHidden=true
            view3.isHidden=false
            view4.isHidden=true

            button1.setTitle("متاجر بالقرب مني", for: UIControl.State.normal)

            button3.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
            button3.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            button2.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button2.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            button1.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button1.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
        }
        
        
    }
  
    
    
    @IBOutlet var tabelView1: UITableView!
    @IBOutlet var tabelView2: UITableView!
    @IBOutlet var myCollectionView: UICollectionView!
    
    @IBOutlet var view1: UIView!
    @IBOutlet var view2: UIView!
    @IBOutlet var view3: UIView!
    @IBOutlet var view4: UIView!

    
    var marketTitle1:[String] = ["ماركت بندة","كارفور السعودية","مطعم كواترو","صن مول","ماركت بندة","كارفور السعودية","مطعم كواترو","صن مول","ماركت بندة","كارفور السعودية","مطعم كواترو","صن مول"]
    var marketTxt1:[String] = ["الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","ئسقيفبرللاتانىی","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية"]
    var txtKG1:[String] = ["40KG","20KG","70KG","50KG","40KG","20KG","70KG","40KG","20KG","70KG","50KG","40KG","20KG"]

    var marketTitle2:[String] = ["هايبر ماركت بنده","كارفور السعودية","مطعم كواترو","صن مول","ماركت بندة","كارفور السعودية","مطعم كواترو","صن مول","ماركت بندة","كارفور السعودية","مطعم كواترو","صن مول"]
    var marketTxt2:[String] = ["الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية","الوشام,الرياض,السعودية"]
    var txtKG2:[String] = ["40KG","20KG","70KG","50KG","40KG","20KG","70KG","40KG","20KG","70KG","50KG","40KG","20KG"]


    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == tabelView1 {
            return marketTitle1.count
        }else if tableView == tabelView2 {
            return marketTitle2.count
        }else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell1 = tabelView1.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! MarketTableViewCell1
        let cell2 = tabelView2.dequeueReusableCell(withIdentifier: "cell", for: indexPath ) as! MarketTableViewCell2

        cell1.img1.image=UIImage(named: "Group 376-1")
        
        //        cell1.title1.text=tasks[indexPath.row]
        //        cell1.txt1.text=tasks[indexPath.row]
        //        cell1.txtKG.text=tasks[indexPath.row]
        
        cell1.title1.text=marketTitle1[indexPath.row]
        cell1.txt1.text=marketTxt1[indexPath.row]
        cell1.txtKG.text=txtKG1[indexPath.row]
        
        cell2.img2.image=UIImage(named: "Group 376-1")
        cell2.title2.text=marketTitle2[indexPath.row]
        cell2.txt2.text=marketTxt2[indexPath.row]
        cell2.txtKG.text=txtKG2[indexPath.row]
        
        if tableView == tabelView1 {
            return cell1
        }else if tableView == tabelView2 {
            return cell2
        }
        return UITableViewCell()
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        MyHeight.constant=0
        MyView.isHidden=true
        view4.isHidden=true

        
        tabelView1.isHidden=false
        tabelView2.isHidden=true
        myCollectionView.isHidden=true
        
        view1.isHidden=false
        view2.isHidden=true
        view3.isHidden=true

        tabelView1.delegate=self
        tabelView1.dataSource=self
        tabelView2.delegate=self
        tabelView2.dataSource=self
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        
        var layout = self.myCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset  = UIEdgeInsets(top: 0,left: 20,bottom: 0,right: 30)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width:( self.myCollectionView.frame.size.width - 20)/2, height: self.myCollectionView.frame.size.height/2.5)
        
        tabelView1.addSubview(refresher)
       // tabelView2.addSubview(refresher)
        handleRefresh()
    }
    

    @objc private func handleRefresh(){
        self.refresher.endRefreshing()
        
        API.task { (error:Error?, tasks:[Task]?) in
            if let tasks = tasks{
                self.tasks = tasks
                self.tabelView1.reloadData()
            }
            
        }
    }
    

}
