//
//  MarketViewController+Map.swift
//  Qreeb
//
//  Created by Admin on 10/12/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

extension MarketViewController : CLLocationManagerDelegate, MKMapViewDelegate {
    
    
    func setupMap() {
        self.locationManager.requestAlwaysAuthorization()
        
        // For use in foreground
        self.locationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
        }
        
        MyMap.delegate = self
        MyMap.mapType = .standard
        MyMap.isZoomEnabled = true
        MyMap.isScrollEnabled = true
        
        if let coor = MyMap.userLocation.location?.coordinate{
            MyMap.setCenter(coor, animated: true)
        }
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
         locValue = manager.location!.coordinate
        let lat = locValue.latitude
        let lng = locValue.longitude
        
        firmMapFun(lat: "\(lat)",lng: "\(lng)")
        
        MyMap.mapType = MKMapType.standard
        
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        let region = MKCoordinateRegion(center: locValue, span: span)
        MyMap.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title  = "current location"
        MyMap.addAnnotation(annotation)
        
    }
    
    func showPins() {
        locationManager.stopUpdatingLocation()
        self.MyMap.annotations.forEach {
            if !($0 is MKUserLocation) {
                self.MyMap.removeAnnotation($0)
            }
        }
        firmMap?.data?.forEach {
            let annotation = MKPointAnnotation()
            annotation.coordinate.latitude = Double( $0.lat ?? "0.0" ) ??  0.0
            annotation.coordinate.longitude = Double( $0.lng  ?? "0.0" ) ??  0.0
            MyMap.addAnnotation(annotation)
        }
        let annotation = MKPointAnnotation()
        annotation.coordinate = locValue
        annotation.title  = "current location"
        MyMap.addAnnotation(annotation)
        
    }
    
    
}
