//
//  ViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/4.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit
import Alamofire


class ViewController: UIViewController {
    
    var isLoginSuccess = false

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBAction func loginButtonPressed(sender: UIButton) {
        println("login button pressed")
        var loginInfo = [
            "username": idField.text,
            "password": passwordField.text
        ]
        Alamofire.request(.POST, "http://localhost:3000/personalPage", parameters: loginInfo).responseJSON { (request, response, JSON, error) in
            if JSON != nil {
                self.isLoginSuccess = true
                var username: AnyObject? = JSON?.objectForKey("username")
                var nickname: AnyObject? = JSON?.objectForKey("nickname")
                var qq: AnyObject? = JSON?.objectForKey("qq")
                var email: AnyObject? = JSON?.objectForKey("email")
                var headImageURL: AnyObject? = JSON?.objectForKey("headImageURL")
                
                var friends = (JSON?.objectForKey("friends"))! as! [AnyObject]
                var heads = (JSON?.objectForKey("headImageURLS"))! as! [AnyObject]
                var tmpGallery = (JSON?.objectForKey("gallery"))! as! [AnyObject]
                var tmpStates = (JSON?.objectForKey("states"))! as! [AnyObject]
                var friend_amount: AnyObject? = JSON?.objectForKey("friend_amount")
                
                var friendsIDs = [String]()
                var friendsNicknames = [String]()
                var friendsHeadImages = [String]()
                var gallery = [String]()
                var states = [String]()
                

                
                for ele in tmpGallery {
                    gallery.append("http://localhost:3000/\(ele)")
                }

                var tmpIndex = 0
                for ele in friends {
                    var f_username: AnyObject = ele.objectForKey("_id")!
                    var f_nickname: AnyObject = ele.objectForKey("nickname")!
                    var f_headImage: AnyObject = heads[tmpIndex]
                    friendsIDs.append("\(f_username)")
                    friendsNicknames.append("\(f_nickname)")
                    friendsHeadImages.append("\(f_headImage)")
                    tmpIndex++
                }
                
                for st in tmpStates {
                    states.append("\(st)")
                }

                
                
                UserModel.sharedInstance.setUser(
                    "\(username!)",
                    nickname: "\(nickname!)",
                    qq: "\(qq!)",
                    email: "\(email!)",
                    headImageURL: "\(headImageURL!)",
                    states: states,
                    gallery: gallery,
                    friendsIDs: friendsIDs,
                    friendsNicknames: friendsNicknames,
                    friendsHeadImages: friendsHeadImages,
                    friend_amount: "\(friend_amount!)".toInt()!)

                
                
                
                
                let myStoryboard = self.storyboard
                let homeStoryboard: UIViewController = myStoryboard?.instantiateViewControllerWithIdentifier("loginStoryboard") as! UIViewController
                self.presentViewController(homeStoryboard, animated: true, completion: nil)
                
                //read friends
//                var tmp: AnyObject = UserModel.sharedInstance.friendsIDs[0]["_id"]!!
//                var fn = "\(tmp)"
//                println("\(fn), \(UserModel.sharedInstance.friend_amount)")
                //read friends
                
                //read states
                
                
                //read states
            } else {
                self.isLoginSuccess = false
            }
        }
    }
    
    
    override func shouldPerformSegueWithIdentifier(identifier: String?, sender: AnyObject?) -> Bool {
        return isLoginSuccess
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

    }
    
    
    func register () {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loginButton.layer.cornerRadius = 4.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

