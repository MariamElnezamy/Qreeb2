//
//  MarketViewController+CollectionView.swift
//  
//
//  Created by Admin on 10/12/19.
//
import UIKit

extension MarketViewController:  UICollectionViewDelegate,UICollectionViewDataSource {
    
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
    
}
