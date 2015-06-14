//
//  FriendSearchViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/11.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit
import Alamofire

class FriendSearchViewController: UITableViewController{
    
    
    static var searchedUserNickname: String = ""

    @IBAction func dismissButtonPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
//        var searchInfo = [
//            "username": UserModel.sharedInstance.username,
//            "searchNickname": FriendSearchViewController.searchedUserNickname
//        ]
//        Alamofire.request(.POST, "http://localhost:3000/searchByNicknameFromIOS", parameters: searchInfo).responseJSON {(req, res, JSON, error) in
//            SearchResult.arr.removeAll(keepCapacity: false)
//            if JSON != nil {
//                println(JSON as! [AnyObject])
//                for tmp in (JSON as! [AnyObject]) {
//                    var IDtmp: AnyObject = tmp.objectForKey("_id")!
//                    var NICKNAMEtmp: AnyObject = tmp.objectForKey("nickname")!
//                    var dic = ["_id": "\(IDtmp)", "nickname": "\(NICKNAMEtmp)"]
//                    SearchResult.arr.append(dic)
//                    println(dic)
//                }
//
//            } else {
//                
//            }
//        }

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
        return SearchResult.arr.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var tmpnic = SearchResult.arr[indexPath.row]["nickname"]!
        let cell = tableView.dequeueReusableCellWithIdentifier("searchFriendCell", forIndexPath: indexPath) as! FriendAdderCell
        cell.nickname.text = "\(tmpnic)"
        cell.headImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: UserModel.sharedInstance.headImageURL)!)!)


        // Configure the cell...

        return cell
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
