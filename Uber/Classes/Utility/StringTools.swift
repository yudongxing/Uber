//
//  StringTools.swift
//  Uber
//
//  Created by 于东兴 on 15/11/7.
//  Copyright © 2015年 EricYU. All rights reserved.
//

import UIKit

class StringTools: NSObject {

    func firstCharactor(str:String)->String{
        let str2 = CFStringCreateMutableCopy(nil, 0, str)
        CFStringTransform(str2, nil, kCFStringTransformMandarinLatin, false)
        
        CFStringTransform(str2, nil, kCFStringTransformStripDiacritics, false)
        return (str.capitalizedString as NSString).substringToIndex(1)
    }
    
}