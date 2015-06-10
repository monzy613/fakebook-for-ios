//
//  ChatRoomViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/10.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit
import Alamofire

class ChatRoomViewController: UIViewController {
 
    
    
    var socket = SocketIOClient(socketURL: "http://localhost:3000")
    
    @IBAction func sendButton(sender: UIButton) {
        sendMessage()
    }

    @IBAction func disMissButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    @IBOutlet weak var comment: UITextField!
    @IBOutlet weak var chatView: UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.addHandler()
        self.socket.connect()
    }
    
    func sendMessage() {
        if comment.text != "" && comment.text != nil {
            socket.emit("comment", UserModel.sharedInstance.username + ": " + comment.text)
            comment.text = ""
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addHandler() {
        socket.on ("comment") {data, ack in
            var tmp: AnyObject = data![0]
            println("\(tmp)")
            self.chatView.text = self.chatView.text + "\n\(tmp)"
        }
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
