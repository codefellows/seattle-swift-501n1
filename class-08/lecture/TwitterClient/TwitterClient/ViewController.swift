//
//  ViewController.swift
//  TwitterClient
//
//  Created by Adam Wallraff on 7/3/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    @IBOutlet weak var tableView: UITableView!
    
    var allTweets = [Tweet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        //Used for working with Nib Cells
        let nib = UINib(nibName: "TweetCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "tweetCell")
        
        //For dynamic cell height
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 75
        
        //API Call for tweets
        API.shared.getTweets { (tweets) in
            if let tweets = tweets {
                OperationQueue.main.addOperation {
                    self.allTweets = tweets
                    self.tableView.reloadData()
                    self.activityIndicator.stopAnimating()
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        if segue.identifier == "DetailViewController"{
            if let selectedIndex = self.tableView.indexPathForSelectedRow {
                let selectedTweet = self.allTweets[selectedIndex.row]
                
                if let destinationController = segue.destination as? DetailViewController {
                    destinationController.selectedTweet = selectedTweet
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "", for: indexPath) as! TweetCell
        
        let currentTweet = self.allTweets[indexPath.row]
        
        //cell.usernameLabel.text = currentTweet.user?.name
        //cell.tweetLabel.text = currentTweet.text

        cell.tweet = currentTweet
        
        
        return cell
    }

}

extension UIResponder {
    static var identifier: String {
        return String(describing: self)
    }
}













