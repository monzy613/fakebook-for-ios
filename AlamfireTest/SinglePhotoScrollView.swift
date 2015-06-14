//
//  SinglePhotoScrollView.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/14.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class SinglePhotoScrollView: UIScrollView, UIScrollViewDelegate {
    var imageView: UIImageView = UIImageView()
    
    func scrollSetter() {
        self.sizeToFit()
        self.scrollEnabled = true
        
        //required for zoom
        self.delegate = self
        self.minimumZoomScale = 1
        self.maximumZoomScale = 3.0
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func setImage (image: UIImage, frame: CGRect) {
        self.scrollSetter()
        self.frame = frame
        self.imageView = UIImageView(frame: CGRect(x: 0.0, y: 0.0, width: self.frame.width, height: self.frame.height))
        imageView.contentMode = .ScaleAspectFit
        self.imageView.image = image
        self.addSubview(imageView)
    }
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
