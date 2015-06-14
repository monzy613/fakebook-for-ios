//
//  GalleryScrollViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/13.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class GalleryScrollViewController: UIViewController {
    
    var startID: Int = 0
    
    @IBOutlet weak var galleryScroller: UIScrollView!
    
    private var imageViews: [UIImageView] = []
    
    private func loadImages() {
        galleryScroller.contentSize = CGSize(width: view.frame.width * CGFloat(UserModel.sharedInstance.gallery.count), height: 0.0)
        
        galleryScroller.contentOffset = CGPoint(x: view.frame.width * CGFloat(startID), y: 0.0)
        
        var i = 0
        for path in UserModel.sharedInstance.gallery {
            if let url = NSURL(string: path) {
                if let imageData = NSData(contentsOfURL: url) {
                    var image = UIImage(data: imageData)
                    var singlePhotoView = SinglePhotoScrollView()
                    singlePhotoView.setImage(image!, frame: CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height))
                    galleryScroller.addSubview(singlePhotoView)
                    /*
                    
                    var imageView = UIImageView(frame: CGRect(x: view.frame.width * CGFloat(i), y: 0, width: view.frame.width, height: view.frame.height))
                    imageView.image = image
                    imageView.contentMode = .ScaleAspectFit
                    galleryScroller.addSubview(imageView)
                    */
                    i++
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        println("gallery scroll view")
        loadImages()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        galleryScroller.reloadInputViews()
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
