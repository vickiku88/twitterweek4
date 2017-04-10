//
//  Tweet.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/5/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    var text: NSString?
    var timestamp: NSDate?
    var retweetCount: Int = 0
    var favoriteCount: Int = 0
    var timestampString: String?
    
    init(dictionary: NSDictionary) {
        text = dictionary["text"] as? NSString
        favoriteCount = (dictionary["favourites_count"] as? Int) ?? 0
        retweetCount = (dictionary["retweet_count"] as? Int) ?? 0
        timestampString = dictionary["created_at"] as? String
        let formatter = DateFormatter()
        formatter.dateFormat = "EEE MMM d HH:mm:ss Z y"
        
        if let timestampString = timestampString {
            timestamp = formatter.date(from: timestampString) as NSDate?
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
