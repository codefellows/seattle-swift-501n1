//
//  ViewController.swift
//  TwitterClient
//
//  Created by Adam Wallraff on 7/3/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var allTweets = [Tweet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        
        JSONParser.tweetsFrom(data: JSONParser.sampleTweetData) { (success, allTweets) in
            guard let allTweets = allTweets else { return }
            
            self.allTweets = allTweets
            self.tableView.reloadData()
            
            
        }
    
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTweets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath)
        
        let currentTweet = self.allTweets[indexPath.row]
        
        cell.textLabel?.text = currentTweet.text
        cell.detailTextLabel?.text = currentTweet.id
        
        return cell
    }

}














