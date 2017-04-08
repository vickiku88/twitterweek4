//
//  User.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/5/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class User: NSObject {
    var name: String?
    var screenname: NSString?
    var profileUrl: URL?
    var tagline: NSString?
    var dictionary: NSDictionary?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as? String
        screenname = dictionary["screen_name"] as? NSString
        let profileUrlString  = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileUrl = URL(string: profileUrlString)
        }
        tagline = dictionary["description"] as? NSString
    }
    
}

var _currentUser: User?
var currentUser: User? {
        get {
            if _currentUser == nil {
                let defaults = UserDefaults.standard
                let userData = defaults.object(forKey: "currentUserData") as? NSData
                
                if let userData = userData {
                    let dictionary = try! JSONSerialization.data(withJSONObject: userData, options: []) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
            return _currentUser
        }
        set (user){
            _currentUser = user
            let defaults = UserDefaults.standard
            if let user = user {
               let data =  try! JSONSerialization.data(withJSONObject: user.dictionary!, options : [])
                defaults.set(data, forKey: "currentUserData")
            } else {
                defaults.set(nil, forKey: "currentUserData")
            }
            
            defaults.set(user,forKey:"currentUser")
            defaults.synchronize()
        }

}



