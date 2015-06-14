//
//  StateTableViewCell.swift
//  AlamfireTest
//
//  Created by Monzy on 15/6/14.
//  Copyright (c) 2015年 Monzy. All rights reserved.
//

import UIKit

class StateTableViewCell: UITableViewCell {

    @IBOutlet weak var stateView: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
