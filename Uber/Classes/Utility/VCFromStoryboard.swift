//
//  VCFromStoryboard.swift
//  Uber
//
//  Created by 于东兴 on 15/11/7.
//  Copyright © 2015年 EricYU. All rights reserved.
//

import UIKit

class VCFromStoryboard: NSObject {
    
    //Singleton
    static let sharedInstance : VCFromStoryboard = VCFromStoryboard()
    
    
    func getVCFromStoryboard(identity:String) -> UIViewController{
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        return storyboard.instantiateViewControllerWithIdentifier(identity)
    }
    
}
