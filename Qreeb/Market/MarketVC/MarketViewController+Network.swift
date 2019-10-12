//
//  MarketViewController+Network.swift
//  
//
//  Created by Admin on 10/12/19.
//


import UIKit

extension MarketViewController {
     func getFirms() {
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
    
    
     func firmsNearFun() {
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
    
    
     func firmMapFun(lat: String, lng: String) {
        
        API.FirmMapClassFunc(lat: lat, lng: lng) { (firmMap, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let firms = firmMap else { return }
                self.firmMap = firms
                self.showPins()
            }
        }
    }
    
    
     func allFirmsOfferFun() {
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
    
     func AllCategoryFirms() {
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
}
