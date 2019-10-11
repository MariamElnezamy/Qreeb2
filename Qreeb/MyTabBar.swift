//
//  MyTabBar.swift
//  Qreeb
//
//  Created by Admin on 10/1/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class MyTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tabBar.barTintColor = #colorLiteral(red: 0.1280460352, green: 0.1365567188, blue: 0.1501229378, alpha: 1)
        tabBar.clipsToBounds = true
        tabBar.layer.masksToBounds = true
        tabBar.isTranslucent = true
        tabBar.barStyle = .blackOpaque
        tabBar.layer.cornerRadius = 30
        tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
    }
    


}
