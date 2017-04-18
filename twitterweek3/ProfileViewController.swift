//
//  ProfileViewController.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/12/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var tableView: UITableView!
    var user: User!
    var tweets: [Tweet]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
        
        TwitterClient.sharedInstance?.currentAccount(success: {(user:User?)-> () in
            self.user = user
            self.tableView.reloadData()
        }, failure: { (error:Error) in
            print(error.localizedDescription)
            
        })
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }// Default is 1 if not implemented

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{

        let cell = tableView.dequeueReusableCell(withIdentifier: "profileCell", for: indexPath) as! ProfileHeaderCell
          cell.user = user
        
        return cell
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
