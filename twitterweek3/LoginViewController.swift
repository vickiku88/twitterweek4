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
        let client = TwitterClient.sharedInstance
        
        client?.login(success: {
            print("successful login")
            let appDelegate = UIApplication.shared.delegate!
            
           //self.performSegue(withIdentifier: "loginSegue", sender: nil)
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let menuViewController = storyboard.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
            let hamburgerViewController = storyboard.instantiateViewController(withIdentifier: "HamburgerViewController") as! HamburgerViewController
            menuViewController.hamburgerViewController = hamburgerViewController
            hamburgerViewController.menuViewController = menuViewController
            
            appDelegate.window??.rootViewController = hamburgerViewController

            
            
        }, failure: { (error: Error) in
            print("error \(error.localizedDescription)")
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
