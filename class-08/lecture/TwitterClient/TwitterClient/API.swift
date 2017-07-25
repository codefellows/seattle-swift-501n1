//
//  API.swift
//  TwitterClient
//
//  Created by Adam Wallraff on 7/11/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import Foundation
import Accounts
import Social

typealias AccountsCompletion = (ACAccount?)->()
typealias TweetsCompletion = ([Tweet]?)->()

class API {

    static let shared = API()
    
    var account : ACAccount?

    private init() {}
    
    private func login(completion: @escaping AccountsCompletion){
        let accountStore = ACAccountStore()
        
        let accountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccounts(with: accountType, options: nil) { (success, error) in
            
            print("Hello! This will print after the user selects an option")
            
            if error != nil {
                print("ERROR: \(error!)")
                completion(nil)
                return
            }
            
            if success {
                print("Success getting access to Twitter Accounts!")
                if let accounts = accountStore.accounts(with: accountType) as? [ACAccount] {
                    completion(accounts.first) //come back to for stretch goal
                    return
                }
            }
            
            print("No Eror, but success is FALSE")
            completion(nil)
        }
        
        print("The login func is complete and being cleared from memory")
    }
    
    private func updateTimeline(url: URL ,completion: @escaping TweetsCompletion){
        
        let request = SLRequest(forServiceType: SLServiceTypeTwitter,
                                requestMethod: .GET,
                                url: url,
                                parameters: nil)
        
        print("The service type constant for Twitter: \(SLServiceTypeTwitter)")
        
        
        request?.account = self.account
        
        request?.perform(handler: { (data, response, error) in
            
            if error != nil {
                print("Error fetching HomeTimeline: \(error!.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let response = response else {
                completion(nil)
                return
            }
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            switch response.statusCode {
            case 200...299:
                print("Success!!!")
                JSONParser.tweetsFrom(data: data, callback: { (success, tweets) in
                    completion(tweets)
                })
            case 400...499:
                print("Client-side error, this is our fault... \(response.statusCode)")
            case 500...599:
                print("Server-side error, this is NOT our fault! \(response.statusCode)")
            default:
                print("Unrecognized Status code: \(response.statusCode)")
            }
        })
    }
    
    func getTweets(completion: @escaping TweetsCompletion) {
        if self.account == nil {
            self.login(completion: { (account) in
                self.account = account
                if let url = URL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json") {
                    self.updateTimeline(url: url, completion: { (tweets) in
                        completion(tweets)
                    })
                }
            })
        } else {
            if let url = URL(string: "https://api.twitter.com/1.1/statuses/home_timeline.json") {
                self.updateTimeline(url: url, completion: { (tweets) in
                    completion(tweets)
                })
            }
        }
    }
    
    func getTweetsFor(username: String, completion: @escaping TweetsCompletion){
        if let url = URL(string: "https://api.twitter.com/1.1/statuses/user_timeline.json?screen_name=\(username)") {
            
            self.updateTimeline(url: url, completion: { (tweets) in
                completion(tweets)
            })
        }
    }
    
}















