//
//  loginViewController.swift
//  
//
//  Created by Admin on 8/8/19.
//

import UIKit

class loginViewController: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var nameArr:[String]=["صورة الرخصة الشخصية*","صورة الهوية*","صورة للمركبة (من الخلف)*","صورة للمركبة (من الامام)*","صورة شخصية*","صورة الاستمارة*"]

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! repPicCollectionViewCell
        cell.picName.text=nameArr[indexPath.row]
//        if cell.picName.text == "*" {
//            cell.picName.textColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
 //       }
        cell.Pic.image=UIImage(named: "photo")
        return cell
    }
    
    
    @IBOutlet var myCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var layout = self.myCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset  = UIEdgeInsets(top: 0,left: 20,bottom: 0,right: 30)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width:( self.myCollectionView.frame.size.width - 20)/2, height: self.myCollectionView.frame.size.height/3)
        

        
        
        MyView2.isHidden=true
        MyView1.isHidden=false
        
        
   
    }
    
    @IBOutlet var mySegmentController: UISegmentedControl!
    
    @IBOutlet var MyView1: UIView!
    @IBOutlet var MyView2: UIView!
    
    @IBAction func segmentTapped(_ sender: UISegmentedControl) {
        
        let getIndex = mySegmentController.selectedSegmentIndex
        
        switch getIndex {
        case 0:
            
            MyView1.isHidden=false
            MyView2.isHidden=true
            
        case 1:
            
            MyView1.isHidden=true
            MyView2.isHidden=false
        default:
            MyView1.isHidden=true
            MyView2.isHidden=false
        }
        
        
    }
    
    
    
    
    
}
