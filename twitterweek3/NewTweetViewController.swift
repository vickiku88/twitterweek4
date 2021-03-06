//
//  NewTweetViewController.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/9/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class NewTweetViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var user: User?
    
    @IBOutlet weak var tableView: UITableView!
    /*
    @IBOutlet weak var profileURLView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var handleLabel: UILabel!*/
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewTweetCell", for: indexPath) as! NewTweetCell
        cell.user = self.user
        //cell.delegate = self
        return cell
    }
    @IBAction func onCancelButton(_ sender: Any) {
        navigationController?.popViewController(animated: true)

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
