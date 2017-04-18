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
    @IBOutlet weak var handleLabel: UILabel!
    @IBOutlet weak var tweetNum: UILabel!
    @IBOutlet weak var followerNum: UILabel!
    @IBOutlet weak var followingNum: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var gearBtn: UIButton!
    @IBOutlet weak var pplBtn: UIButton!
    
    var user: User?{
        didSet{
            
            if let user = user{
                self.nameLabel.text = user.name as String?
                
                if let handleLabel = user.screenname{
                    self.handleLabel.text = "@" + (handleLabel as String)
                }
                
                if let profileImg = user.profileImg{
                    headerPhoto.setImageWith(profileImg)
                }
                if let profileBackgroundImg = user.profileBackgroundImg {
                    backgroundPhoto.setImageWith(profileBackgroundImg)
                }
                if let tweetNum = user.lcount {
                    self.tweetNum.text = "\(tweetNum)"

                }
                if let followerNum = user.followersCount {
                    self.followerNum.text = "\(followerNum)"
                }
                if let followingNum = user.followingCount {
                    self.followingNum.text = "\(followingNum)"
                }
                
                
            }
        }
    }
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        headerPhoto.clipsToBounds = true
        headerPhoto.layer.cornerRadius = 3
        
        pplBtn.setImage(UIImage(named: "add-user-16"), for: UIControlState.normal)
        gearBtn.setImage(UIImage(named:"gear-16"), for: UIControlState.normal)
        
        gearBtn.frame = CGRect(x: 0, y: 0, width: 53, height: 31)
        pplBtn.frame = CGRect(x: 0, y: 0,width: 53,height: 31)
        gearBtn.layer.borderColor = UIColor.lightGray.cgColor
        gearBtn.layer.borderWidth = 0.5
        pplBtn.layer.borderColor = UIColor.lightGray.cgColor
        pplBtn.layer.borderWidth = 0.5
        gearBtn.layer.cornerRadius = 3
        pplBtn.layer.cornerRadius = 3
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
