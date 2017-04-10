//
//  TweetCell.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/8/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    var user: User? {
        didSet{
            nameLabel.text = user?.name as String?
            if (user?.profileUrl) != nil{
                profileImg.setImageWith((user?.profileUrl)!)
            }
            handleLabel.text = user?.screenname as String?
            descriptionLabel.text = user?.tagline as String?
        }
    }
    var tweet: Tweet?{
        didSet{
            //timeLabel.text = (tweet?.timestampString)! as String
            
            
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImg.layer.cornerRadius = 3
        profileImg.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
