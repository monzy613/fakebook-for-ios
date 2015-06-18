//
//  FriendsViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/9.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit
import Alamofire

class FriendsViewController: UITableViewController {
    @IBAction func searchButtonPressed(sender: UIBarButtonItem) {
        println("searching")
        var searchInfo = [
            "username": UserModel.sharedInstance.username,
            "searchNickname": searchField.text
        ]
        Alamofire.request(.POST, "http://localhost:3000/searchByNicknameFromIOS", parameters: searchInfo).responseJSON {(req, res, JSON, error) in
            SearchResult.arr.removeAll(keepCapacity: false)
            
            if JSON != nil {
                println(JSON as! [AnyObject])
                for tmp in (JSON as! [AnyObject]) {
                    var IDtmp: AnyObject = tmp.objectForKey("_id")!
                    var NICKNAMEtmp: AnyObject = tmp.objectForKey("nickname")!
                    var dic = ["_id": "\(IDtmp)", "nickname": "\(NICKNAMEtmp)"]
                    SearchResult.arr.append(dic)
                    println(dic)
                    
                }
                
                let myStoryboard = self.storyboard
                let searchStoryboard: UIViewController = myStoryboard?.instantiateViewControllerWithIdentifier("searchStoryboard") as! UIViewController
                self.presentViewController(searchStoryboard, animated: true, completion: nil)
                
            } else {
                
            }
        }
    }
    @IBOutlet weak var searchField: UITextField!
    static var selectedFriendArrID: Int = 0
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "p2pChatIdentifier" {
            var selected: Int = FriendsViewController.selectedFriendArrID
            println("to p2p: \(selected)")
            FriendLGChatViewController.messageReceiverArrID = selected
            FriendLGChatViewController.messageReceiverID = UserModel.sharedInstance.friendsIDs[selected]
            //(segue.destinationViewController as! P2PChatViewController).messageReceiverArrID = selected
            //(segue.destinationViewController as! P2PChatViewController).messageReceiverID = UserModel.sharedInstance.friendsIDs[selected]
            
        } else if segue.identifier == "friendSearchIdentifier" {
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return UserModel.sharedInstance.friend_amount
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        

            let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! FriendViewCell
            
            // Configure the cell...
            cell.headImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: UserModel.sharedInstance.friendsHeadImages[indexPath.row])!)!)
            
            //cell.imageView?.image = UIImage(data: NSData(contentsOfURL: NSURL(string: UserModel.sharedInstance.friendsHeadImages[indexPath.row])!)!)
            cell.nickname.text = UserModel.sharedInstance.friendsNicknames[indexPath.row]
            cell.friendArrID = indexPath.row
            
            return cell
        
/*
        if indexPath.row != UserModel.sharedInstance.friend_amount {
            let cell = tableView.dequeueReusableCellWithIdentifier("friendCell", forIndexPath: indexPath) as! FriendViewCell
            
            // Configure the cell...
            cell.headImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: UserModel.sharedInstance.friendsHeadImages[indexPath.row])!)!)
            
            //cell.imageView?.image = UIImage(data: NSData(contentsOfURL: NSURL(string: UserModel.sharedInstance.friendsHeadImages[indexPath.row])!)!)
            cell.nickname.text = UserModel.sharedInstance.friendsNicknames[indexPath.row]
            cell.friendArrID = indexPath.row
            
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("searchFriendCell", forIndexPath: indexPath) as! FriendSearchTableViewCell
            return cell
        }
 */
        
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
