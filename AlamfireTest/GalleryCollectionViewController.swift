//
//  GalleryCollectionViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/10.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit
import Alamofire

let reuseIdentifier = "Cell"

class GalleryCollectionViewController: UICollectionViewController{
    
    @IBAction func uploadPhoto(sender: UIBarButtonItem) {
        
    }
    
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            if (identifier == "imageDetail") {
                (segue.destinationViewController as! GalleryScrollViewController).startID = (sender as! GalleryCollectionViewCell).imageID
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        updateUI()
    }
    
    
    private func updateUI() {
        Alamofire.request(.POST, "http://localhost:3000/renewGalleryFromIOS", parameters: ["username": UserModel.sharedInstance.username]).responseJSON {
            (req, res, JSON, error) in
            var tmpGallery = (JSON?.objectForKey("gallery"))! as! [AnyObject]
            var gallery = [String]()
            for ele in tmpGallery {
                gallery.append("http://localhost:3000/\(ele)")
            }
            
            UserModel.sharedInstance.gallery = gallery
            self.collectionView!.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        //#warning Incomplete method implementation -- Return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //#warning Incomplete method implementation -- Return the number of items in the section
        return UserModel.sharedInstance.gallery.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("galleryCell", forIndexPath: indexPath) as! GalleryCollectionViewCell
        println(UserModel.sharedInstance.gallery[indexPath.row])
    
        // Configure the cell
        cell.image.image = UIImage(data: NSData(contentsOfURL: NSURL(string: UserModel.sharedInstance.gallery[indexPath.row])!)!)
        cell.imagePath = UserModel.sharedInstance.gallery[indexPath.row]
        cell.imageID = indexPath.row
        
        
        return cell
    }

    // MARK: UICollectionViewDelegate


    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }


    
    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */



    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */


}
