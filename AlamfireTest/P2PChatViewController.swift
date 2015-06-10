//
//  P2PChatViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/11.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class P2PChatViewController: UIViewController {
    
    var socket = SocketIOClient(socketURL: "http://localhost:3000")
    
    var messageReceiverArrID: Int = 0
    var messageReceiverID: String = ""

    @IBOutlet weak var friendNicknameLabel: UILabel!
    @IBAction func sendButtonPressed(sender: UIButton) {
        sendMessage()
    }
    
    func sendMessage() {
        if comment.text != "" && comment.text != nil {
            println("sending")
            socket.emit("p2pchat", [
                "from_id": UserModel.sharedInstance.username,
                "to_id": messageReceiverID,
                "msg": comment.text])
            comment.text = ""
        }
    }
    
    @IBOutlet weak var comment: UITextField!
    @IBOutlet weak var chatView: UITextView!
    @IBAction func dismissButton(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        friendNicknameLabel.text = UserModel.sharedInstance.friendsNicknames[messageReceiverArrID]
        self.addHandler()
        self.socket.connect()
    }
    
    func addHandler() {
        var username: String = UserModel.sharedInstance.username
        socket.on ("getMessage-\(username)") {data, ack in

            var from_id: String
            var msg: String
            var to_id: String
            
            var tmp: AnyObject? = data![0].objectForKey("from_id")
            from_id = "\(tmp!)"
            
            tmp = data![0].objectForKey("msg")
            msg = "\(tmp!)"
            
            tmp = data![0].objectForKey("to_id")
            to_id = "\(tmp!)"
            
            if from_id != username && from_id != self.messageReceiverID {
            } else {
                self.appendToChatView("\(from_id): \(msg)")
            }
            
        }
    }
    
    func appendToChatView(message: String) {
        var chatViewContent = chatView.text
        if chatViewContent == "" || chatViewContent == nil {
            chatViewContent = message
        } else {
            chatViewContent = (chatViewContent + "\n\(message)")
        }
        chatView.text = chatViewContent
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
