//
//  NewStateViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/14.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit
import Alamofire

class NewStateViewController: UIViewController {

    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        saveNewState()
    }
    
    @IBOutlet weak var stateContent: UITextView!
    
    private func saveNewState() {
        var parameters = [
            "state": stateContent.text
        ]
        Alamofire.request(.POST, "http://localhost:3000/sendState", parameters: parameters).response{(req, res, data, error) in
            println("uploadSuccess: \(data)")
            self.dismissViewControllerAnimated(true, completion: {})
            UserModel.sharedInstance.states.append(self.stateContent.text)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
