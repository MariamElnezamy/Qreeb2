//
//  MarketViewController.swift
//  Qreeb
//
//  Created by Admin on 8/5/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit
import MapKit

class MarketViewController: UIViewController {
    
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var MyHeight: NSLayoutConstraint!
    @IBOutlet var MyView: UIView!
    @IBOutlet var tabelView1: UITableView!
    @IBOutlet var tabelView2: UITableView!
    @IBOutlet var firmsNearTabelView: UITableView!
    @IBOutlet var myCollectionView: UICollectionView!
    @IBOutlet var allFirmsView: UIView!
    @IBOutlet var activeView: UIView!
    @IBOutlet var collectionviewView: UIView!
    @IBOutlet var mapView: UIView!
    @IBOutlet var firmsNearView: UIView!
    @IBOutlet var IDall: UIButton!
    @IBOutlet var IDrestaurants: UIButton!
    @IBOutlet var IDbeaker: UIButton!
    @IBOutlet var IDcofee: UIButton!
    @IBOutlet var MyMap: MKMapView!

    var tasks = [Task]()
    var firms: Firms?
    var firmsNear:FirmNearResppose?
    var firmMap:FirmMap?
    var allFirmsOffer:AllFirmsOfferResponse?
    var allCategoryFirm:AllCategoryFirmResponse?
    var isViewVisiable = false
    let locationManager = CLLocationManager()
    var locValue = CLLocationCoordinate2D(latitude: 0, longitude: 0)

    
    lazy var refresher:UIRefreshControl={
        let refresher = UIRefreshControl()
        //        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refresher
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //            checkLocationServices()
        
        MyHeight.constant=0
        MyView.isHidden=true
        mapView.isHidden=true
        
        allFirmsView.isHidden=false
        activeView.isHidden=true
        collectionviewView.isHidden=true
        firmsNearView.isHidden=true
        
       tableViewSetup()
        
        myCollectionView.delegate=self
        myCollectionView.dataSource=self
        
        let layout = self.myCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset  = UIEdgeInsets(top: 0,left: 20,bottom: 0,right: 30)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width:( self.myCollectionView.frame.size.width - 20)/2, height: self.myCollectionView.frame.size.height/2.5)
        
        tabelView1.addSubview(refresher)
        tabelView2.addSubview(refresher)
        firmsNearTabelView.addSubview(refresher)
        myCollectionView.addSubview(refresher)
        
        getFirms()
        firmsNearFun()
        allFirmsOfferFun()
        AllCategoryFirms()
        
         setupMap() 
    }
    
    
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
        allFirmsView.isHidden=true
        activeView.isHidden=true
        collectionviewView.isHidden=true
        mapView.isHidden=false
        firmsNearView.isHidden=true
        
        self.isViewVisiable = false
        self.MyHeight.constant=0
        self.MyView.isHidden=true
    }
    
    @IBAction func firmsNear(_ sender: Any) {
        button1.setTitle("المحلات القريبة", for: UIControl.State.normal)
        allFirmsView.isHidden=true
        activeView.isHidden=true
        collectionviewView.isHidden=true
        mapView.isHidden=true
        firmsNearView.isHidden=false
        
        self.isViewVisiable = false
        self.MyHeight.constant=0
        self.MyView.isHidden=true
    }
    
    @IBAction func AllFirms(_ sender: Any) {
        button1.setTitle("كل المتاجر", for: UIControl.State.normal)
        allFirmsView.isHidden=false
        activeView.isHidden=true
        collectionviewView.isHidden=true
        mapView.isHidden=true
        firmsNearView.isHidden=true
        
        self.isViewVisiable = false
        self.MyHeight.constant=0
        self.MyView.isHidden=true
    }
    
    @IBAction func Button(_ sender: UIButton) {
        
        if sender == button1 {
            
            allFirmsView.isHidden=false
            activeView.isHidden=true
            collectionviewView.isHidden=true
            mapView.isHidden=true
            firmsNearView.isHidden=true
            
            button1.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
            button1.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            button2.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button2.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            button3.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button3.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            
        } else if sender == button2 {
            
            allFirmsView.isHidden=true
            activeView.isHidden=false
            collectionviewView.isHidden=true
            mapView.isHidden=true
            firmsNearView.isHidden=true
            
            button1.setTitle("متاجر بالقرب مني", for: UIControl.State.normal)
            button2.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
            button2.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            button1.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button1.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            button3.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button3.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            
        }else if sender == button3 {
            
            allFirmsView.isHidden=true
            activeView.isHidden=true
            collectionviewView.isHidden=false
            mapView.isHidden=true
            firmsNearView.isHidden=true
            
            button1.setTitle("متاجر بالقرب مني", for: UIControl.State.normal)
            button3.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
            button3.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            button2.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button2.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            button1.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            button1.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
        }
        
        
    }
    
    @IBAction func IDBtn(_ sender: UIButton) {
        
        if sender == IDall {
            IDall.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
            IDall.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            IDrestaurants.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDrestaurants.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            IDbeaker.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDbeaker.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            IDcofee.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDcofee.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            
        } else if sender == IDrestaurants {
            IDrestaurants.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
            IDrestaurants.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            IDall.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDall.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            IDbeaker.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDbeaker.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            IDcofee.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDcofee.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            
        }else if sender == IDbeaker {
            IDbeaker.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
            IDbeaker.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            IDrestaurants.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDrestaurants.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            IDall.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDall.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            IDcofee.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDcofee.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
        }else if sender == IDcofee {
            IDcofee.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: UIControl.State.normal)
            IDcofee.backgroundColor = #colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1)
            IDrestaurants.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDrestaurants.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            IDall.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDall.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
            IDbeaker.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            IDbeaker.setTitleColor(#colorLiteral(red: 1, green: 0.6022020949, blue: 0.2425187706, alpha: 1), for: UIControl.State.normal)
        }
    }
    
}
