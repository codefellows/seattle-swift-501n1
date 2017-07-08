//
//  JSONParser.swift
//  TwitterClient
//
//  Created by Adam Wallraff on 7/6/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import Foundation

typealias JSONParserCallback = (Bool, [Tweet]?)->()

class JSONParser {
    
    static var sampleTweetData : Data {
        
        guard let path = Bundle.main.url(forResource: "tweet", withExtension: "json") else { fatalError("The path for tweet.json is funky!")}
        
        do {
            let data = try Data(contentsOf: path)
            return data
        } catch {
            fatalError(error.localizedDescription)
        }
    }
    
    
    class func tweetsFrom(data: Data, callback: JSONParserCallback) {
        
        do {
            if let rootObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]]{
            
                var allTweets = [Tweet]()
                
                for tweetJSON in rootObject {
                    guard let newTweet = Tweet(json: tweetJSON) else { continue }
                    allTweets.append(newTweet)
                }
                
                callback(true, allTweets)
                
            }
        }catch {
            print(error)
        }
        
        
    }
    
    
    
    
    
}

    
    
    

