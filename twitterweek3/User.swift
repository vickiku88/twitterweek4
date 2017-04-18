//
//  User.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/5/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit




class User: NSObject {
    var name: NSString?
    var screenname: NSString?
    var profileImg: URL?
    var tagline: NSString?
    var dictionary: NSDictionary?
    
    var followersCount: Int?
    var followingCount: Int?
    var created_at: NSString?
    var profileBackgroundImg: URL?
    var lcount: Int?
    
    init(dictionary: NSDictionary) {
        self.dictionary = dictionary
        name = dictionary["name"] as? NSString
        screenname = dictionary["screen_name"] as? NSString
        
        let profileUrlString  = dictionary["profile_image_url_https"] as? String
        if let profileUrlString = profileUrlString {
            profileImg = URL(string: profileUrlString)
            //print("y \(profileImg)")
        }else{
            profileImg = nil
        }
        let profileBackgroundString = dictionary["profile_background_image_url_https"] as? String
        if let profileBackgroundString = profileBackgroundString {
            profileBackgroundImg = URL(string: profileBackgroundString)
        } else {
            profileBackgroundImg = nil
        }
        
        
        tagline = dictionary["description"] as? NSString
        followersCount = dictionary["followers_count"] as? Int
        followingCount = dictionary["friends_count"] as? Int
        created_at = (dictionary["created_at"] as? NSString?)!
        lcount = dictionary["listed_count"] as? Int
        
    }
    
    static let UserDidLogoutNotification = "userDidLogout"
    static var _currentUser: User?
    static var currentUser: User? {
        get {
            if _currentUser == nil {
                let defaults = UserDefaults.standard
                let userData = defaults.object(forKey: "currentUserData") as? NSData
                
                if let userData = userData {
                    defaults.removeObject(forKey:"currentUserData")

                      let  dictionary = try! JSONSerialization.jsonObject(with: userData as Data, options: []) as! NSDictionary

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
                defaults.removeObject(forKey:"currentUserData")
            }
            
            defaults.synchronize()
        }
        
    }
    
   

    



}





