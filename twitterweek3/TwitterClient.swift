//
//  TwitterClient.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/5/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class TwitterClient: BDBOAuth1SessionManager {
       static let sharedInstance = TwitterClient(baseURL: URL(string: "https://api.twitter.com")! as URL!, consumerKey: "WvnXSkai0wQPAJcAI9DsW9mMF", consumerSecret: "2d21wci9pC5szzeYfQyJ31gcUm757KTtQ6ISX28qfZWlJIG6JK")
    
    var loginSuccess: (() -> ())?
    var loginFailure: ((Error) -> ())?
    
    func homeTimeline(success: @escaping ([Tweet]) -> (), failure: @escaping (Error) -> ()) {
        get("1.1/statuses/home_timeline.json", parameters: nil, progress: nil, success: { (task:URLSessionDataTask, response: Any?) in
            let dictionaries = response as! [NSDictionary]
            ///////look this up make sure you understand
            let tweets = Tweet.tweetsWithArray(dictionaries: dictionaries)
            //print("tw: \(tweets)")
            for tweet in tweets{
                //print("\(tweet.text!)")
            }
            success(tweets)
        }, failure: { (task: URLSessionDataTask?, error: Error) in
            print("error1: \(error.localizedDescription)")
            failure(error)
        })
    }
    
    func currentAccount(success:@escaping (User)->(), failure: @escaping (Error) ->()) {
        get("1.1/account/verify_credentials.json", parameters: nil, progress: nil, success: { (task: URLSessionDataTask, response: Any) in
            let userDictionary = response as! NSDictionary
            let user = User(dictionary:userDictionary)
            success(user)
            print("user \(user)")
            print("stuff: \(user)")
            print("name: \(user.name)")
            print("screenname: \(user.screenname)")
            print("profileURL: \(user.profileUrl)")
            print("des: \(user.tagline)")
            
        }, failure: { (task: URLSessionDataTask?, error: Error) in
            print("error: \(error)")
            failure(Error.self as! Error)
        })
    }
    
    func logout(){
        User.currentUser = nil
        deauthorize()
        //notify that the user did logout
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: User.UserDidLogoutNotification), object: nil)

        //(name: "UserDidLogout", object: AnyObject)
    }
    
    
    func login(success: @escaping ()->() , failure: @escaping (Error)->()) {
        loginSuccess = success
        loginFailure = failure
        TwitterClient.sharedInstance?.deauthorize()
        TwitterClient.sharedInstance?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: URL(string: "twitterdemo://oath"), scope: nil, success: {(requestToken: BDBOAuth1Credential?) -> Void in
            
            
            if let token = requestToken?.token {
                if let url = URL(string: "https://api.twitter.com/oauth/authorize?oauth_token=\(token)") {
                    
                    UIApplication.shared.openURL(url)
                }
            }
        }, failure: { (error: Error?) in
            print("error: \(error?.localizedDescription)")
            self.loginFailure?((error!))
        })
    }
    
    func handleOpenUrl(url: URL) {
        let requestToken = BDBOAuth1Credential(queryString: url.query)
        
        fetchAccessToken(withPath: "oauth/access_token"
            , method: "POST", requestToken: requestToken, success: { (accessToken: BDBOAuth1Credential?) in
                //print("I got the access token")
                self.currentAccount(success: { (user: User) in
                    print(user)
                    User.currentUser = user
                    self.loginSuccess?()
                }, failure: { (error: Error) in
                    self.loginFailure?(error)

                })
                self.loginSuccess?()
        }, failure: { (error: Error?) in
            print("error: \(error?.localizedDescription)")
            if let error = error {
            self.loginFailure?(error)
            }
        })
    }
    
    
    
    
    
    
    }
