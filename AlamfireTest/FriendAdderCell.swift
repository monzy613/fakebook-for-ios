//
//  FriendAdderCell.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/11.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class FriendAdderCell: UITableViewCell {

    @IBAction func addFriendButtonPressed(sender: UIButton) {
    }
    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var headImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
