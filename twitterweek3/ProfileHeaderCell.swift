//
//  ProfileHeaderCell.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/12/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class ProfileHeaderCell: UITableViewCell {

    @IBOutlet weak var headerPhoto: UIImageView!
    @IBOutlet weak var backgroundPhoto: UIImageView!
    @IBOutlet weak var nameLabel: UIImageView!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetNum: UILabel!
    @IBOutlet weak var followerNum: UILabel!
    @IBOutlet weak var followingNum: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
