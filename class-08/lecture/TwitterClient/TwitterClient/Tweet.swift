//
//  Tweet.swift
//  TwitterClient
//
//  Created by Adam Wallraff on 7/3/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import Foundation

class Tweet {
    let text: String
    let id: String
    
    var user: User?
    
    init?(json: [String: Any]) {
        print(json)
        if let tempText = json["text"] as? String,
            let tempID = json["id_str"] as? String,
            let tempUserJSON = json["user"] as? [String: Any] {
            
            self.text = tempText
            self.id = tempID
            
            let tempUser = User(json: tempUserJSON)
            
            self.user = tempUser
            
        } else {
            return nil
        }
    }
}









