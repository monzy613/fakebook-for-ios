//
//  TestBubbleViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/10.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class TestBubbleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        var imageview01 = UIImageView(frame: CGRectMake(90, 190, 120, 180))
        imageview01.image = UIImage(named: "style.jpg")
        self.view.addSubview(imageview01)
        
        var imageview02 = UIImageView(frame: imageview01.frame)
        imageview02.image = UIImage(named: "icon_chat_right_bg")?.stretchableImageWithLeftCapWidth(15, topCapHeight: 15)
        
        var layer = imageview02.layer
        layer.frame = CGRect(origin: CGPointZero,size: imageview02.layer.frame.size)
        imageview01.layer.mask = layer
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
