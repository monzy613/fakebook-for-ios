//
//  FriendLGChatViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/18.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class FriendLGChatViewController: LGChatController, LGChatControllerDelegate {

    var socket = SocketIOClient(socketURL: "http://localhost:3000")
    
    @IBAction func dismiss(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    static var messageReceiverArrID: Int = 0
    static var messageReceiverID: String = ""
    
    override func viewDidLoad() {
        //temp
//        UserModel.sharedInstance.username = "monzy123"
//        Friend.messageReceiverID = "monzy613"
        //
        
        super.viewDidLoad()
        self.title = UserModel.sharedInstance.friendsNicknames[FriendLGChatViewController.messageReceiverArrID]
        self.delegate = self
        self.messages = []
        self.addHandler()
        self.socket.connect()
        // Do any additional setup after loading the view.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func chatController(chatController: LGChatController, didAddNewMessage message: LGChatMessage) {
        if message.sentBy == .User {
            sendMessage(message.content)
        }
        println("p2p: \(message.content)")
    }
    
    func shouldChatController(chatController: LGChatController, addMessage message: LGChatMessage) -> Bool {
        return true
    }
    
    

    func sendMessage(content: String) {
        if content != "" {
            println("sending")
            socket.emit("p2pchat", [
                "from_id": UserModel.sharedInstance.username,
                "to_id": FriendLGChatViewController.messageReceiverID,
                "msg": content])
        }
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
            
//            if from_id != username && from_id != self.messageReceiverID {
//            } else {
//                self.appendToChatView("\(from_id): \(msg)")
//            }
            
            if from_id == FriendLGChatViewController.messageReceiverID && to_id == username {
                self.addNewMessage(LGChatMessage(content: msg, sentBy: .Opponent))
            }
            
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
