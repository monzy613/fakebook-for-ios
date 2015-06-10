//
//  FriendViewCell.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/9.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class FriendViewCell: UITableViewCell {

    var friendArrID: Int = 0
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var headImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func p2pButtonPressed(sender: UIButton) {
        FriendsViewController.selectedFriendArrID = self.friendArrID
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
