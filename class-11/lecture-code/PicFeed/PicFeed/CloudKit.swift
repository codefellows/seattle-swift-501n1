//
//  CloudKit.swift
//  PicFeed
//
//  Created by Adam Wallraff on 7/25/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import Foundation
import CloudKit

class CloudKit {
    
    let instanceProperty = "instance"
    
    static let staticProperty = "lives on the TYPE, not instance"
    
    static let shared = CloudKit()
    
    let container = CKContainer.default()
    
    var database : CKDatabase {
        //change to public if desired.
        return container.privateCloudDatabase
    }
    
    private init (){}
    
}














