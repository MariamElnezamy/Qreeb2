//
//  WalkingContentViewController.swift
//  Qreeb
//
//  Created by Admin on 7/25/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

class WalkthroughContentViewController: UIViewController {
    
    @IBOutlet var viewForBtn: UIView!
    @IBOutlet var headingLabel: UILabel!
        @IBOutlet var contentLabel: UILabel!
        @IBOutlet var contentImageView: UIImageView!
        @IBOutlet var pageControl: UIPageControl!
        @IBOutlet var PicPager: UIImageView!
        @IBOutlet var PicScreenShot: UIImageView!
    
    @IBAction func urlBtn(_ sender: UIButton) {
        guard let url = URL(string: "https://www.youtube.com/watch?v=GVzgARJvTG8&list=LLGrpLLc_gWMwZmOB0BjFjdA&index=17&t=11s") else {return}
        
        if #available(iOS 10.0, *) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
    
    
        var index = 0
        var imageFile = ""
        var content = ""
        var heading = ""
        var ScreenShotPic = ""
        var pagerPic = ""
        var pressToTurnLb=""
    
    
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            viewForBtn.isHidden = index != 4
            pageControl.currentPage = index
            headingLabel.text = heading
            contentLabel.text = content
            contentImageView.image = UIImage(named: imageFile)
            PicScreenShot.image = UIImage(named: ScreenShotPic)
            PicPager.image = UIImage(named: pagerPic)
            
            if index == 1 {
                let myRange = NSRange(location: 3, length: 9)
                let anotherAttribute = [ NSAttributedString.Key.backgroundColor: UIColor.orange ]
                let myAttribute = [ NSAttributedString.Key.font: UIFont(name: "Amin", size: 18.0)! ]
                let myString = NSMutableAttributedString( string: "اطلب الان", attributes: myAttribute )
                myString.addAttributes(anotherAttribute, range: myRange)
                contentLabel.attributedText = myString
                
                let myRange2 = NSRange(location: 3, length: 17)
                let anotherAttribute2 = [ NSAttributedString.Key.backgroundColor: UIColor.orange ]
                let myAttribute2 = [ NSAttributedString.Key.font: UIFont(name: "Amin", size: 18.0)! ]
                let myString2 = NSMutableAttributedString( string: "سجلني كمندوب قريب", attributes: myAttribute2 )
                myString.addAttributes(anotherAttribute2, range: myRange2)
                contentLabel.attributedText = myString2
            }
            
        }
    
    @IBAction func nextButtonTapped(sender: UIButton) {
        switch index {
        case 0...3:
            let pageViewController = parent as! WalkthroughPageViewController
            pageViewController.forward(index: index)
        case 4:
            let controller = storyboard?.instantiateViewController(withIdentifier: "logInViewController")
            self.present(controller!, animated: true, completion: nil)

        default: break
        }
    }
 
    
    }



