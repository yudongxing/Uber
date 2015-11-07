//
//  UberCreatAccountPageViewController.swift
//  Uber
//
//  Created by 于东兴 on 15/11/7.
//  Copyright © 2015年 EricYU. All rights reserved.
//

import UIKit

class UberCreatAccountPageViewController: UberBaseViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "创建账户"
        setNavigationItem("下一步", selector: "doRight", isRight: true)
        setNavigationItem("取消", selector: "doBack", isRight: false)
        
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func doRight(){
        let storyboardTools = VCFromStoryboard.sharedInstance
        let vc = storyboardTools.getVCFromStoryboard("UserInfo") as! UberUserInfoViewController
        let nav = UINavigationController(rootViewController: vc)
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    //MARK:Action
    @IBAction func jumpToSelectCountryPage(){
        let storyboardTools = VCFromStoryboard.sharedInstance
        let vc = storyboardTools.getVCFromStoryboard("selectCountry") as! SelectCountryPage
        let nav = UINavigationController(rootViewController: vc)
        self.presentViewController(nav, animated: true, completion: nil)
    }
}
