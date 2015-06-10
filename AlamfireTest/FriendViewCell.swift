//
//  FriendViewCell.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/9.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class FriendViewCell: UITableViewCell {

    @IBOutlet weak var nickname: UILabel!
    @IBOutlet weak var headImage: UIImageView!
    @IBAction func chatButtonPressed(sender: UIButton) {
        println("pressed")
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
