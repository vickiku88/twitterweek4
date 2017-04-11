//
//  Tweet.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/5/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: String?
    var timestamp: Date?
    var retweetCount: Int = 0
    var favoriteCount: Int = 0
    var timestampString: String?
    var screenname: String?
    var name: String?
    var profileImg: URL?
    
    init(dictionary: NSDictionary) {
        //print(dictionary)
        text = dictionary["text"] as? String
        favoriteCount = (dictionary["favorite_count"] as? Int) ?? 0
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        timestampString = dictionary["created_at"] as? String
        screenname = dictionary.value(forKeyPath:"user.screen_name") as? String
        name = dictionary.value(forKeyPath: "user.name") as? String
        //profileImg = dictionary.value(forKeyPath: "profile_image_url_https") as? URL
        
        let profileImgString = dictionary.value(forKeyPath: "user.profile_image_url_https") as? String
        if profileImgString != nil {
            profileImg = URL(string: profileImgString!)
            //print(profileImg!)
        } else {
            profileImg = nil
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        
        if let timestampString = timestampString {
            timestamp = formatter.date(from: timestampString) as Date?
        }
        
    }
    
    class func tweetsWithArray(dictionaries: [NSDictionary]) -> [Tweet] {
        var tweets = [Tweet]()
        for dictionary in dictionaries {
            let tweet = Tweet(dictionary: dictionary)
            tweets.append(tweet)
        }
        return tweets
    }

}
