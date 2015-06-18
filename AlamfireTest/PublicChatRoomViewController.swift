//
//  TestViewController.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/18.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class PublicChatRoomViewController: UIViewController, LGChatControllerDelegate {
    
    var viewHasLoad = false
    
    @IBAction func dismiss(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: {})
    }
    var socket = SocketIOClient(socketURL: "http://localhost:3000")
    var chatController = LGChatController()

    override func viewDidLoad() {
        println("viewdidload")
        viewHasLoad = true
        super.viewDidLoad()
        self.addHandler()
        self.socket.connect()
        launchChatController()
        // Do any additional setup after loading the view.
    }
    
    func launchChatController() {
        chatController.opponentImage = UIImage(named: "isFriend")
        chatController.title = "Public Chat Room"
        chatController.messages = []
        chatController.delegate = self
//        chatController(chatController, didAddNewMessage: LGChatMessage(content: "hi", sentBy: .Opponent))
        self.navigationController?.pushViewController(chatController, animated: true)
    }
    
    func chatController(chatController: LGChatController, didAddNewMessage message: LGChatMessage) {
        if message.sentBy == .User {
            sendMessage(message.content)
        }
        println("Did add message: \(message.content)")
    }
    
    
    
    func shouldChatController(chatController: LGChatController, addMessage message: LGChatMessage) -> Bool {
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewDidAppear(animated: Bool) {
        if !viewHasLoad {
            self.dismissViewControllerAnimated(true, completion: {})
        } else {
            viewHasLoad = !viewHasLoad
        }
    }
    
    
    
    
    
    //socket io config
    func addHandler() {
        socket.on("comment") {
            data, ack in
            
            //
            //
            var tmp: AnyObject = data![0]
            var usernameTmp: AnyObject? = tmp.objectForKey("username")
            var contentTmp: AnyObject? = tmp.objectForKey("content")
            
            var username = "\(usernameTmp!)"
            var content = "\(contentTmp!)"
            println("\(username): \(content)")
            
            var message: LGChatMessage
            
            if username == UserModel.sharedInstance.username {

            } else {
                message = LGChatMessage(content: "[\(username)]: \(content)", sentBy: .Opponent)
                self.chatController.addNewMessage(message)
            }
            
        }
    }
    
    
    func sendMessage(content: String) {
        println("sending to server")
        socket.emit("comment", ["username": UserModel.sharedInstance.username, "content": content])
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
