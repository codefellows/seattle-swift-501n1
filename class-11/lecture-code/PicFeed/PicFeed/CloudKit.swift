//
//  CloudKit.swift
//  PicFeed
//
//  Created by Adam Wallraff on 7/25/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import Foundation
import CloudKit

typealias PostCompletion = (Bool)->()

class CloudKit {
    
    static let shared = CloudKit()
    
    let container = CKContainer.default()
    
    var database : CKDatabase {
        //change to public if desired.
        return container.privateCloudDatabase
    }
    
    private init (){}
    
    func save(post: Post, completion: @escaping PostCompletion) {
        do {
            if let record = try post.record() {
                self.database.save(record, completionHandler: { (record, error) in
                    if error != nil {
                        print(error!)
                        completion(false)
                    }
                    
                    if let record = record {
                        print(record)
                        completion(true)
                    }
                    
                })
            }
        } catch {
            print(error)
        }
    }
    
}














