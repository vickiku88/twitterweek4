//
//  TweetCell.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/8/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit
import AFNetworking

class TweetCell: UITableViewCell {

    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
   /* var user: User? {
        didSet{
     nameLabel.text = user?.name as String?
     if (user?.profileUrl) != nil{
     profileImg.setImageWith((user?.profileUrl)!)
     }
     handleLabel.text = user?.screenname as String?
     descriptionLabel.text = user?.tagline as String?

        }
    }*/
    
    var tweet: Tweet?{
        didSet{
            
            if let tweet = tweet{
                if let timestampString = tweet.timestampString{
                    //timeLabel.text = timestampString
                }
                if let text = tweet.text {
                    descriptionLabel.text = text as String
                }
                if let name = tweet.name {
                    print(name)
                    nameLabel.text = name
                }
                if let screenname = tweet.screenname{
                    print(screenname)
                    handleLabel.text = "@" + screenname
                }
                if let profileImgURL = tweet.profileImg{
                    //print(profileImgURL)
                    profileImgView.setImageWith(profileImgURL)
                    //print(profileImgView)
                }

            }
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        profileImgView.layer.cornerRadius = 3
        profileImgView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
