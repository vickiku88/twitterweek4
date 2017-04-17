//
//  MenuViewController.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/12/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController  {
    
    
    private var profileNavigationController: UIViewController!
    private var homeNavigationController: UIViewController!
    private var mentionNavigationController: UIViewController!
    var viewControllers: [UIViewController] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        profileNavigationController = storyboard.instantiateViewController(withIdentifier: "profileNavigationController")
        homeNavigationController = storyboard.instantiateViewController(withIdentifier: "homeNavigationController")
        mentionNavigationController = storyboard.instantiateViewController(withIdentifier: "mentionNavigationController")
        
        viewControllers.append(profileNavigationController)
        viewControllers.append(homeNavigationController)
        viewControllers.append(mentionNavigationController)
        
        
        
        
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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MiniMenuCell", for: indexPath) as! MiniMenuCell
        let titles = ["Profile","Mentions","Home"]
        cell.menuLinkLAbel.text = titles[indexPath.row]
        // Configure the cell...

        return cell
    }
 

 

}
