//
//  FoundationExtensions.swift
//  GoGoGitHub
//
//  Created by Adam Wallraff on 8/17/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import Foundation

extension UserDefaults {
    func getAccessToken() -> String? {
        
        guard let accessToken = string(forKey: "access_token") else {
            return nil
        }

        return accessToken
    }
    
    func save(accessToken: String) -> Bool {
        set(accessToken, forKey: "access_token")
        
        return synchronize()
    }
}

extension Collection {
    var count : Int {
        return self.characters.count
    }
}
