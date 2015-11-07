//
//  AppDelegate.swift
//  Uber
//
//  Created by 于东兴 on 15/11/7.
//  Copyright © 2015年 EricYU. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        
       self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.makeKeyAndVisible()
//        self.window?.backgroundColor = UIColor.redColor()
//        let guidePage = UberBaseViewController()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let guidePage = storyboard.instantiateViewControllerWithIdentifier("guidePage") as! UberGuidePageViewController
        self.window?.rootViewController = guidePage
        
        return true
    }

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {

    }

    func applicationWillEnterForeground(application: UIApplication) {

    }

    func applicationDidBecomeActive(application: UIApplication) {

    }

    func applicationWillTerminate(application: UIApplication) {

    }


}

