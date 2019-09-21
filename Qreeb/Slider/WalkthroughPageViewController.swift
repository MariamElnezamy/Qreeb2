//
//  WalkthroughPageViewController.swift
//  Qreeb
//
//  Created by Admin on 7/25/19.
//  Copyright © 2019 mariamelnezamy. All rights reserved.
//

import UIKit

    class WalkthroughPageViewController:  UIPageViewController,
    UIPageViewControllerDataSource{
        
        func pageViewController(_ pageViewController: UIPageViewController,
                                viewControllerBefore viewController: UIViewController) -> UIViewController? {
            var index = (viewController as! WalkthroughContentViewController).index
            index -= 1
            return contentViewController(at: index)
        }
        func pageViewController(_ pageViewController: UIPageViewController,
                                viewControllerAfter viewController: UIViewController) -> UIViewController? {
            var index = (viewController as! WalkthroughContentViewController).index
            index += 1
            return contentViewController(at: index)
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Set the data source to itself
            dataSource = self
            // Create the first walkthrough screen
            if let startingViewController = contentViewController(at: 0) {
                setViewControllers([startingViewController], direction: .forward,
                                   animated: true, completion: nil)
            }
            
        }
        
        var pageHeadings = ["حيّاك في Qreeb"
            ,"اطلب بكل سهولة"
            ,"عروض بأفضل الأسعار"
            ,"تواصل مباشر"
            ,"رحلة مع قريب (فيديو)"]
        
        
        var pageImages = ["Rectangle 5","Rectangle 5","Rectangle 5","Rectangle 5","Rectangle 5"]
        
        var pageContent = [
            "قربنالك كل المتاجر وصارت في مكان واحد. كل اللي عليك تختار متجرك المفضل مباشرة او تقدر تستخدم خيار البحث",
            "ضع طلباتك باختيار *اطلب الان* وتقدر توصل الطلبات من خلال التطبيق عن طريق *سجلني كمندوب قريب*",
            "اختار العرض المناسب لك",
            "تواصل مباشرة مع المندوب من خلال التطبيق",
            ""
        ]
        
        
        var sliderPic:[String]=["نقط حياك فى قريب","نقط اطلب بكل سهولة","نقط عروض بافضل الاسعار","نقط تواصل مباشر","نقط رحلة مع قريب"]
        var screenshotPic:[String]=["حياك ف قريب","اطلب بكل سهولة","عروض بافضل الاسعار","تواصل مباشر","رحلة مع قريب"]
        
        
        
        
        
        func contentViewController(at index: Int) -> WalkthroughContentViewController?
        {
            if index < 0 || index >= pageHeadings.count {
                return nil
            }
            // Create a new view controller and pass suitable data.
            if let pageContentViewController =
                storyboard?.instantiateViewController(withIdentifier:
                    "WalkthroughContentViewController") as? WalkthroughContentViewController {
                pageContentViewController.imageFile = pageImages[index]
                pageContentViewController.heading = pageHeadings[index]
                pageContentViewController.index = index
               pageContentViewController.pagerPic = sliderPic[index]
                pageContentViewController.ScreenShotPic = screenshotPic[index]
                pageContentViewController.content = pageContent[index]

                return pageContentViewController
            }
            return nil
        }
        
        func forward(index: Int) {
            if let nextViewController = contentViewController(at: index + 1) {
                setViewControllers([nextViewController], direction: .forward, animated:
                    true, completion: nil)
            }
        }
        


}
