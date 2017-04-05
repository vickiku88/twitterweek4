//
//  LoginViewController.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/4/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit
import BDBOAuth1Manager

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let twitterClient = BDBOAuth1SessionManager(baseURL: NSURL(string: "https://api.twitter.com")! as URL!, consumerKey: "WvnXSkai0wQPAJcAI9DsW9mMF", consumerSecret: "2d21wci9pC5szzeYfQyJ31gcUm757KTtQ6ISX28qfZWlJIG6JK")
        twitterClient?.deauthorize()
        
        twitterClient?.fetchRequestToken(withPath: "oauth/request_token", method: "GET", callbackURL: nil, scope: nil, success: {(requestToken: BDBOAuth1Credential?) -> Void in
            print("I got a token")
            
            let url = NSURL(string: "https://api.twitter.com/oauth/authorize")!
            UIApplication.shared.openURL(url as URL)
        }, failure: { (error: Error?) in
            print("error: \(error!.localizedDescription)")
        })
    }
    



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
