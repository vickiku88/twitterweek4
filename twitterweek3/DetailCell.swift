//
//  DetailCell.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/9/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var detProfURL: UIImageView!
    @IBOutlet weak var detNameLabel: UILabel!
    @IBOutlet weak var detHandleLabel: UILabel!
    @IBOutlet weak var detNumFav: UILabel!
    @IBOutlet weak var detNumRetweet: UILabel!
    @IBOutlet weak var detTimeLabel: UILabel!
    @IBOutlet weak var detDateLabel: UILabel!
    @IBOutlet weak var detDesription: UILabel!
    
    var user: User?{
        didSet{
            detNameLabel.text = 
            detHandleLabel.text = User?.screenname
        detProfURL.setImageWithURL(User?.profileUrl)
        detDesription.text = User?.description
            
            
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
