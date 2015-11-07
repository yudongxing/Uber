//
//  UberGuidePageViewController.swift
//  Uber
//
//  Created by 于东兴 on 15/11/7.
//  Copyright © 2015年 EricYU. All rights reserved.
//

import UIKit
import AVFoundation
/*

    Uber Welcome Page 
    Welcome Aniamtion
    Welcome Video

*/
class UberGuidePageViewController: UberBaseViewController {
    
    
    @IBOutlet weak var imageView : UIImageView?
    @IBOutlet weak var backVideoView : UIView?

    private var player:AVPlayer?
    private var playerItem:AVPlayerItem?
    private var location :UberLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initPlayVideo()
        self.doAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK:private methods
    
    //Welcome Aniamtion
    private func doAnimation(){
    
        var imagesList : [UIImage] = []
        var imagesName : String?
        
        for index in 0...67{
            imagesName = "logo-" + String(format: "%03d",index)
            let image = UIImage(named: imagesName!)
            imagesList.insert(image!, atIndex: index)
        }
        
        //Animation
        imageView?.animationImages = imagesList
        imageView?.animationDuration = 5
        imageView?.animationRepeatCount = 1
        imageView?.startAnimating()
        
        UIView.animateWithDuration(0.7, delay: 5, options: .CurveEaseIn, animations: { () -> Void in
                self.imageView?.alpha = 0.5
                self.player!.play()
            }) { (bool) -> Void in
                
        }
    }
    
    //Welcome Video
    private func initPlayVideo(){
        let path = NSBundle.mainBundle().pathForResource("welcome_video", ofType: "mp4")
        let url = NSURL.fileURLWithPath(path!)
        
        playerItem = AVPlayerItem(URL: url)
        player = AVPlayer(playerItem: playerItem!)
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.backVideoView!.bounds
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        
        self.backVideoView?.layer.insertSublayer(playerLayer, atIndex: 0)
        
        //Recycle
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didFinishVideo:", name: AVPlayerItemDidPlayToEndTimeNotification, object: playerItem)
        
    }
    
    //MARK:Notitifaction
    func didFinishVideo(sender:NSNotification){
        let item = sender.object as! AVPlayerItem
        item.seekToTime(kCMTimeZero)
        self.player!.play()
    }
    
    //MARK:Action
    @IBAction func doLogin(){
        location = UberLocation()
        location?.getLocation()
        
    }
    
    @IBAction func doRegister(){
        let vcFromStoryboard = VCFromStoryboard()
        let vc = VCFromStoryboard.sharedInstance.getVCFromStoryboard("CreatAccount") as! UberCreatAccountPageViewController
        let navPage = UINavigationController(rootViewController:vc)
        
        self.presentViewController(navPage, animated: true) { () -> Void in
            
        }
    }

}
