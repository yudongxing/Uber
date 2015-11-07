//
//  UberUserInfoViewController.swift
//  Uber
//
//  Created by 于东兴 on 15/11/7.
//  Copyright © 2015年 EricYU. All rights reserved.
//

import UIKit

class UberUserInfoViewController: UberBaseViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet var avatar:UIImageView!
    @IBOutlet var backUserView:UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "建立基本资料"
        setNavigationItem("下一步", selector: "doRight", isRight: true)
        setNavigationItem("取消", selector: "doBack", isRight: false)
        
        backView.layer.masksToBounds = true
        backView.layer.cornerRadius = 2
        
        backUserView.layer.masksToBounds = true
        backUserView.layer.cornerRadius = 2

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
 
    @IBAction func doPicture(){
        let page = UIImagePickerController()
        page.sourceType = .PhotoLibrary
        page.delegate = self
        self.presentViewController(page, animated: true, completion: nil)
    }

    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        self.avatar.image = image
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}
