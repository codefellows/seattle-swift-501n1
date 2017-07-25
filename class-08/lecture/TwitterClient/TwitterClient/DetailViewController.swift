//
//  DetailViewController.swift
//  TwitterClient
//
//  Created by Adam Wallraff on 7/18/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var usernameLabel: UILabel!
    var selectedTweet: Tweet!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernameLabel.text = selectedTweet.user?.name
        
    }

}
