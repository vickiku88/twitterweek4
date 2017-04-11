//
//  NewTweetCell.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/9/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit
import AFNetworking

class NewTweetCell: UITableViewCell {
    
    @IBOutlet weak var profileImgView: UIImageView!
    @IBOutlet weak var detHandleLabel: UILabel!
    @IBOutlet weak var detNameLabel: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var user: User?{
        didSet{
            if let user = user{
                    self.detNameLabel.text = user.name as String?
                
            if let screenname = user.screenname{
                   self.detHandleLabel.text = "@" + (screenname as String)
                }
            if let profileImg = user.profileImg{
                    profileImgView.setImageWith(profileImg)
                }
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        textView.becomeFirstResponder()
        profileImgView.layer.cornerRadius = 5
        /*
        let toolbarView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 50))
        textView.inputAccessoryView = toolbarView
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow(notification:)), name: Notification.Name("UIKeyboardDidShowNotification"), object: nil)*/

    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
