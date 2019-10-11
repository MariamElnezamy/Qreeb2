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
    
    var introRespose:IntroPages?
    
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
            self.viewForBtn.isHidden = self.index != 4

           // IntroPagesFun()
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

//    private func IntroPagesFun() {
//        API.introPagesClassFunc { (introStruc, error) in
//            if let error = error {
//                print(error.localizedDescription)
//            } else {
//                guard let firms = introStruc else { return }
//                self.introRespose = firms
//                if let respose = introStruc?.data{
//                    self.pageControl.currentPage = respose.
//              //      self.headingLabel.text = self.intro
//                    self.contentLabel.text = self.content
//                    self.contentImageView.image = UIImage(named: self.imageFile)
//                    self.PicScreenShot.image = UIImage(named: self.ScreenShotPic)
//                    self.PicPager.image = UIImage(named: self.pagerPic)
//
//                    if self.index == 1 {
//                        let firstRang = NSRange(location: 19, length: 9)
//                        let secondRang = NSRange(location: 74, length: 17)
//                        let attributedString = NSMutableAttributedString(string: self.content)
//                        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], range: firstRang)
//                        attributedString.addAttributes([NSAttributedString.Key.foregroundColor: UIColor.orange], range: secondRang)
//                        self.contentLabel.attributedText = attributedString
//                }
//
//
//                }
//            }
//        }
//    }
    
    }



