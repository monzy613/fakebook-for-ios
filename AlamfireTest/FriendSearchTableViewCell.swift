//
//  FriendSearchTableViewCell.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/11.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit
import Alamofire

class FriendSearchTableViewCell: UITableViewCell {


    

    
    @IBAction func searchButtonPressed(sender: UIButton) {
        FriendSearchViewController.searchedUserNickname = self.searchField.text
    }
    
    @IBOutlet weak var searchField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
