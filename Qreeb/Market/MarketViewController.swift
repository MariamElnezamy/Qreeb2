//
//  MarketViewController.swift
//  Qreeb
//
//  Created by Admin on 8/5/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit
import MapKit

class MarketViewController: UIViewController,UITableViewDataSource,UITableViewDelegate ,UICollectionViewDelegate,UICollectionViewDataSource{
    
    var tasks = [Task]()
    var firms: Firms?
    var firmsNear:FirmNearResppose?
    var firmMap:FirmMap?
    var allFirmsOffer:AllFirmsOfferResponse?
    var allCategoryFirm:AllCategoryFirmResponse?
    
    
    lazy var refresher:UIRefreshControl={
        let refresher = UIRefreshControl()
        //        refresher.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        return refresher
    }()
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return allFirmsOffer?.data.firms.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! MarketCollectionViewCell
        if let afo = allFirmsOffer?.data.firms[indexPath.row] {
            cell.img.image=UIImage(named: afo.image)
            cell.title.text = afo.name
            cell.txtKG.text = "\(afo.fromYou)"
            cell.address.text = afo.address
            cell.txt.text = "\(afo.details)"
        }
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
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            checkLocationServices()
            
            MyHeight.constant=0
            MyView.isHidden=true
            mapView.isHidden=true
            
            allFirmsView.isHidden=false
            activeView.isHidden=true
            collectionviewView.isHidden=true
            firmsNearView.isHidden=true
            
            tabelView1.delegate=self
            tabelView1.dataSource=self
            tabelView2.delegate=self
            tabelView2.dataSource=self
            firmsNearTabelView.delegate=self
            firmsNearTabelView.dataSource=self
            
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
            firmMapFun()
            allFirmsOfferFun()
            AllCategoryFirms()
        }
        
        
        private func getFirms() {
            API.getFirms { firms, error in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    guard let firms = firms else { return }
                    self.firms = firms
                    self.tabelView1.reloadData()
                }
            }
        }
        
        
            private func firmsNearFun() {
                API.FirmsNearClassFunc { (firmsNear, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        guard let firmN = firmsNear else { return }
                        self.firmsNear = firmN
                        self.firmsNearTabelView.reloadData()
                    }
                }
            }
    
        
            private func firmMapFun() {
                API.FirmMapClassFunc { (firmMap, error) in
                    if let error = error {
                        print(error.localizedDescription)
                    } else {
                        guard let firms = firmMap else { return }
                        self.firmMap = firms
                        self.tabelView1.reloadData()
                    }
                }
            }
        
        
        private func allFirmsOfferFun() {
            API.AllFirmsOffersClassFunc { (allFirmsOffer, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    guard let firmsO = allFirmsOffer else { return }
                    self.allFirmsOffer = firmsO
                    self.myCollectionView.reloadData()
                }
            }
        }
        
        private func AllCategoryFirms() {
            API.AllCategoryFirmsClassFunc { (AllCategoryFirm, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else {
                    guard let firmsC = AllCategoryFirm else { return }
                    self.allCategoryFirm = firmsC
                    self.tabelView2.reloadData()
                }
            }
        }
    
    let locationManager = CLLocationManager()
    @IBOutlet var MyMap: MKMapView!

    func setupLocationManager(){
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    func checkLocationServices(){
        if CLLocationManager.locationServicesEnabled( ) {
            setupLocationManager()
            checkLocationServices()
        }
    }
    func checkLocationAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus(){
        case .authorizedWhenInUse:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .restricted:
            break
        case .authorizedAlways:
            break
        case .denied:
            break
        }
        
    }
}

extension MarketViewController:CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
    }
    
}

