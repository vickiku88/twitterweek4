//
//  TweetsViewController.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/5/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit
import AFNetworking

class TweetsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var tweets: [Tweet]!
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120

        
        TwitterClient.sharedInstance?.homeTimeline(success: { (tweets: [Tweet]) -> () in
            self.tweets = tweets
                for tweet in tweets{
                    //print("t1 \(tweet.text)")
                }
            self.tableView.reloadData()
        }, failure: { (error: Error) -> () in
                print(error.localizedDescription)
            })

        // Do any additional setup after loading the view.
        TwitterClient.sharedInstance?.currentAccount(success: {(user:User?)-> () in
            self.user = user
        }, failure: { (error:Error) in
                print(error.localizedDescription)
        })
        

    }
    @IBAction func onNew(_ sender: Any) {
        TwitterClient.sharedInstance?.currentAccount(success: {(user: User) -> () in
            self.user = user
            print("xx \(user)")
        }, failure: { (error:Error) in
            print(error.localizedDescription)
        })
        let newTweetViewController = storyboard?.instantiateViewController(withIdentifier: "NewTweetViewController") as! NewTweetViewController
        newTweetViewController.user = user
        navigationController?.pushViewController(newTweetViewController, animated: true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onLogoutButton(_ sender: Any) {
        TwitterClient.sharedInstance?.logout()
        
    }
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailViewController = storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        detailViewController.tweet = tweets[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)

    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 4
        //print("printrows")
        if let tweets = tweets {
           // print("ok:\(tweets.count)")

            return tweets.count
        } else {
            return 0
        }

    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "TweetCell", for: indexPath) as! TweetCell
        //cell.delegate = self
        //print(tweets[1])
        cell.tweet = tweets[indexPath.row]
        cell.layoutIfNeeded()
            //print("try:\(cell.tweet)")
        //print("cell")
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
