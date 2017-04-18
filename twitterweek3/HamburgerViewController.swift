//
//  HamburgerViewController.swift
//  twitterweek3
//
//  Created by Victoria Ku on 4/16/17.
//  Copyright © 2017 Codepath. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {
    @IBOutlet var tableView: UITableView!

    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var leftMarginConstraint: NSLayoutConstraint!
    var originalLeftMargin: CGFloat!
    var tweets: [Tweet]!
    var user: User!
    
    
    var menuViewController: UIViewController!{
        didSet{
            view.layoutIfNeeded()
            menuView.addSubview(menuViewController.view)
            
        }
    }
    var contentViewController: UIViewController! {
        didSet(oldcontentViewController){
            view.layoutIfNeeded()
            if oldcontentViewController != nil {
                oldcontentViewController.willMove(toParentViewController: nil)
                oldcontentViewController.view.removeFromSuperview()
                oldcontentViewController.didMove(toParentViewController: nil)
            }
            contentViewController.willMove(toParentViewController: self)
            contentView.addSubview(contentViewController.view)
            contentViewController.didMove(toParentViewController: self)
            UIView.animate(withDuration: 0.3) { 
                self.leftMarginConstraint.constant = 0
                self.view.layoutIfNeeded()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("load")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = 
        
        // Do any additional setup after loading the view.
        TwitterClient.sharedInstance?.currentAccount(success: {(user:User?)-> () in
            self.user = user
        }, failure: { (error:Error) in
            print(error.localizedDescription)
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  
    @IBAction func onPanGesture(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        let velocity = sender.velocity(in: view)
        
        if sender.state == UIGestureRecognizerState.began {
            originalLeftMargin = leftMarginConstraint.constant
            
        } else if sender.state == UIGestureRecognizerState.changed {
            leftMarginConstraint.constant = originalLeftMargin + translation.x
            
        } else if sender.state == UIGestureRecognizerState.ended {
            
            UIView.animate(withDuration: 0.3, animations: {
                if velocity.x > 0 {
                    //opening
                    self.leftMarginConstraint.constant = self.view.frame.size.width - 50
                } else {
                    //closing
                    self.leftMarginConstraint.constant = 0
                }
                self.view.layoutIfNeeded()
            })
        
        }
        
    }
 

  

}
