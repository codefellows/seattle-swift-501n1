//
//  User.swift
//  TwitterClient
//
//  Created by Adam Wallraff on 7/3/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import Foundation

class User {
    
    let name: String
    let profileImageURL: String
    let location: String
    let screenName: String
    
    init?(json: [String: Any]){
        if let name = json["name"] as? String,
            let profileImageURL = json["profile_image_url_https"] as? String,
            let location = json["location"] as? String,
            let screenName = json["screen_name"] as? String {
            
            self.name = name
            self.profileImageURL = profileImageURL
            self.location = location
            self.screenName = screenName
            
        } else {
            return nil
        }
    }
}











