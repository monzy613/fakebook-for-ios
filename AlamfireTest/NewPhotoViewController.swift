//
//  NewPhotoViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/14.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit


class NewPhotoViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var uploadButton: UIButton!
    

    @IBOutlet weak var previewImageView: UIImageView!
    
    
    
    @IBAction func uploadButtonPressed() {
        var imageData = UIImageJPEGRepresentation(previewImageView.image, 1.0)
        
        var fieldName = "\(UserModel.sharedInstance.gallery.count)_\(UserModel.sharedInstance.username)"
        SRWebClient.POST("http://localhost:3000/galleryUploaderIOS").data(imageData, fieldName: fieldName, data: ["days": "1", "title": "SRWebClient"]).send({(response: AnyObject!, status: Int) -> Void in
            println("success: \(status)")
            self.dismissViewControllerAnimated(true, completion: {})
            }, failure: {(error: NSError!) -> Void in
                
        })

    }
    
    @IBAction func cancelButtonPressed() {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        var picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(picker, animated: true, completion: {})
        
        cancelButton.layer.cornerRadius = 4.0
        uploadButton.layer.cornerRadius - 4.0
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        println("picture chosen")
        previewImageView.image = image

        previewImageView.contentMode = .ScaleAspectFit
        //ASIFormDataRequest third party library
        dismissViewControllerAnimated(true, completion: {})
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
