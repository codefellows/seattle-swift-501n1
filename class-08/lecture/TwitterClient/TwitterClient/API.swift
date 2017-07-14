//
//  API.swift
//  TwitterClient
//
//  Created by Adam Wallraff on 7/11/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import Foundation
import Accounts

typealias AccountsCompletion = (ACAccount?)->()

class API {

    static let shared = API()
    
    var account : ACAccount?

    private init() {}
    
    private func login(completion: @escaping AccountsCompletion){
        let accountStore = ACAccountStore()
        
        let accountType = accountStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)
        
        accountStore.requestAccessToAccounts(with: accountType) { (success, error) in
            
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
    
    
}












