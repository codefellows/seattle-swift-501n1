//
//  CloudKit.swift
//  PicFeed
//
//  Created by Adam Wallraff on 7/25/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit
import CloudKit

typealias PostCompletion = (Bool)->()
typealias GetPostsCompletion = ([Post]?)->()

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
    
    func getPosts(completion: @escaping GetPostsCompletion){
        
        let query = CKQuery(recordType: "Post", predicate: NSPredicate(value: true))
        

        self.database.perform(query, inZoneWith: nil) { (records, error) in
            if error != nil {
                print(error!.localizedDescription)
                completion(nil)
            }
            
            if let records = records {
                
                var allPosts = [Post]()
                
                for record in records {
                    
                    guard let asset = record["image"] as? CKAsset else { continue }
                    
                    let path = asset.fileURL.path
                    
                    guard let image = UIImage(contentsOfFile: path) else { continue }
                    
                    let newPost = Post(image: image)
                    
                    allPosts.append(newPost)
                    
                }
                
                OperationQueue.main.addOperation {
                    completion(allPosts)
                }
                
                
            } else {
                completion(nil)
            }
            
        }
        
    }
}




















