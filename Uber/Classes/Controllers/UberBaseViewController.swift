//
//  UberBaseViewController.swift
//  Uber
//
//  Created by 于东兴 on 15/11/7.
//  Copyright © 2015年 EricYU. All rights reserved.
//

import UIKit

class UberBaseViewController: UIViewController {

    @IBOutlet var backView:UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //setting navigationItem
    
    func setNavigationItem(title:String,selector:Selector,isRight:Bool){
        let item : UIBarButtonItem?
        
        if title.hasSuffix("png"){
            item = UIBarButtonItem(image: UIImage(named: title), style: .Plain, target: self, action: selector)
        }else{
            item = UIBarButtonItem(title: title, style: .Plain, target: self, action: selector)
        }
        
        if isRight {
            self.navigationItem.rightBarButtonItem = item
        }else{
            self.navigationItem.leftBarButtonItem = item 
        }
    }
    
    //MARK:Action
    func doRight(){
        
    }
    
    func doBack(){
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


}
