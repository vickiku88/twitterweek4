//
//  MenuCellTableViewCell.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/12/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class MenuCellTableViewCell: UITableViewCell {
    @IBOutlet weak var profileURL: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    var user: User?{
        didSet{
            if let user = user{
                self.nameLabel.text = user.name as String?
                
                if let screenname = user.tagline{
                    self.descriptionLabel.text = screenname as String
                }
                if let profileImg = user.profileImg{
                    profileURL.setImageWith(profileImg)
                }
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
