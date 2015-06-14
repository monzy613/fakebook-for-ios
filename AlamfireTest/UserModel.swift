//
//  UserModel.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/5.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

class UserModel {
    
    class var sharedInstance: UserModel {
        struct Static {
            static let instance = UserModel ()
        }
        return Static.instance
    }
    
    var username: String
    var nickname: String
    var qq: String
    var email: String
    var states: [String]
    var headImageURL: String
    var gallery: [String]
    var friendsIDs: [String]
    var friendsNicknames: [String]
    var friendsHeadImages: [String]
    var friend_amount: Int
    
    init () {
        self.username = ""
        self.nickname = ""
        self.qq = ""
        self.email = ""
        self.headImageURL = ""
        self.states = []
        self.gallery = []
        self.friendsIDs = []
        self.friendsNicknames = []
        self.friendsHeadImages = []
        friend_amount = 0
    }
    
    func setUser (
        username: String,
        nickname: String,
        qq: String,
        email: String,
        headImageURL: String,
        states: [String],
        gallery: [String],
        friendsIDs: [String],
        friendsNicknames: [String],
        friendsHeadImages: [String],
        friend_amount: Int
        ) {
        self.username = username
        self.nickname = nickname
        self.qq = qq
        self.email = email
        self.headImageURL = headImageURL
        self.states = states
        self.gallery = gallery
        self.friendsIDs = friendsIDs
        self.friendsNicknames = friendsNicknames
        self.friendsHeadImages = friendsHeadImages
        self.friend_amount = friend_amount
    }
}