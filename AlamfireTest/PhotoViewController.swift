//
//  PhotoViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/10.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var imageDetailView: UIImageView!
    var photoPath: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        imageDetailView.image = UIImage(data: NSData(contentsOfURL: NSURL(string: photoPath)!)!)
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
