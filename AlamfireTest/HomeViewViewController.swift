//
//  HomeViewViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/6.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class HomeViewViewController: UIViewController {
    
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var qqLabel: UILabel!
    @IBOutlet weak var headImage: UIImageView!
    var headImageURL: NSURL = NSURL(string: UserModel.sharedInstance.headImageURL)!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var data: NSData = NSData(contentsOfURL:
            headImageURL)!
        var image = UIImage(data:data, scale: 1.0)
        headImage.image = image
        
        nicknameLabel.text = UserModel.sharedInstance.nickname
        emailLabel.text = UserModel.sharedInstance.email
        qqLabel.text = UserModel.sharedInstance.qq
        // Do any additional setup after loading the view.
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
