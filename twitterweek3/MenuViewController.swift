//
//  MenuViewController.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/12/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit
import AFNetworking
import MBProgressHUD

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    @IBOutlet weak var tableView: UITableView!
    private var profileNavigationController: UIViewController!
    private var homeNavigationController: UIViewController!
    private var mentionNavigationController: UIViewController!
    var viewControllers: [UIViewController] = []
    var tweets: [Tweet]!
    var user: User!
    var hamburgerViewController: HamburgerViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 100

        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        profileNavigationController = storyboard.instantiateViewController(withIdentifier: "ProfileNavigationController")
        homeNavigationController = storyboard.instantiateViewController(withIdentifier: "TweetsNavigationController")
        mentionNavigationController = storyboard.instantiateViewController(withIdentifier: "MentionsNavigationController")
        
        viewControllers.append(profileNavigationController)
        viewControllers.append(mentionNavigationController)
        viewControllers.append(homeNavigationController)

        hamburgerViewController.contentViewController = homeNavigationController
        
        TwitterClient.sharedInstance?.currentAccount(success: {(user:User?)-> () in
            self.user = user
            self.tableView.reloadData()
        }, failure: { (error:Error) in
            print(error.localizedDescription)
            
        })

        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.section == 0 {
            
        } else if indexPath.section == 1 {
        hamburgerViewController.contentViewController = viewControllers[indexPath.row]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }*/
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
     public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0{
            return 1
        } else if section == 1{
            return 3
        }
        return 4
    }

    
     public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        var cell: UITableViewCell?
            if indexPath.section == 0 {

                let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as! MenuCellTableViewCell
                cell.user = user
                
                return cell
            } else if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "MiniMenuCell", for: indexPath) as! MiniMenuCell
                let titles = ["Profile","Mentions","Home"]
                cell.menuLinkLAbel.text = titles[indexPath.row]
                return cell
            }
            return cell!
    }
        
    
 

 

}
