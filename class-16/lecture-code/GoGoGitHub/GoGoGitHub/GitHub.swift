//
//  GitHub.swift
//  GoGoGitHub
//
//  Created by Adam Wallraff on 8/15/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit

typealias GitHubAuthCompletion = (Bool)->()
typealias ReposCompletion = ([Repository]?)->()

class GitHub {
    
    enum OAuthError: Error {
        case extractingTemporaryCode(String)
    }
    
    //Both of these values come from registering on GITHUB.COM
    var clientID = "57a52a70b7e50346c097"
    var clientSecret = "ad755d5a9923e2afd2359670cb70c13f541851fa"
    
    static let baseURL = "https://github.com/login/oauth"
    
    static let shared = GitHub()
    
    private var session: URLSession
    private var urlCompontents: URLComponents
    
    private init() {
        
        session = URLSession(configuration: .default)
        
        self.urlCompontents = URLComponents()
        
        self.urlCompontents.scheme = "https"
        self.urlCompontents.host = "api.github.com"
        
        if let token = UserDefaults.standard.getAccessToken() {
            
            let queryItem = URLQueryItem(name: "access_token", value: token)
            
            self.urlCompontents.queryItems = [queryItem]
            
        }
    
    }
    
    func getRepos(completion: @escaping ReposCompletion){
        
        self.urlCompontents.path = "/user/repos"
        
        guard let url = self.urlCompontents.url else {
            completion(nil)
            return
        }
        
        print(url)
        
        self.session.dataTask(with: url) { (data, response, error) in
            
            //LAB: HANDLE ERROR
            //LAB: CHECK RESPONSE CODE
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            do {
                if let rootObject = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [[String: Any]]{
                    
                    var allRepositories = [Repository]()
                    
                    for repoJSON in rootObject {
                        guard let repo = Repository(json: repoJSON) else { continue }
                        allRepositories.append(repo)
                    }
                 
                    completion(allRepositories)
                    
                }
            } catch {
                print(error)
                completion(nil)
            }
            
        }.resume()
        
        
    }
    
    func requestAuthWith(parameters: [String: String]){
        var parametersString = ""
        
        for (key, value) in parameters {
            parametersString += "&\(key)=\(value)"
        }
        
        if let requestUrl = URL(string: "\(GitHub.baseURL)/authorize?client_id=\(self.clientID)\(parametersString)") {
            print(requestUrl)
            UIApplication.shared.open(requestUrl, options: [:], completionHandler: nil)
        }
        
    }
    
    func tokenRequestFor(url: URL, completion: @escaping GitHubAuthCompletion) {
        
        do {
            let code = try codeFrom(url: url)
            
            let requestString = "\(GitHub.baseURL)/access_token?client_id=\(clientID)&client_secret=\(clientSecret)&code=\(code)"
            
            if let requestTokenURL = URL(string: requestString) {
                
                let session = URLSession.shared
                
                session.dataTask(with: requestTokenURL, completionHandler: { (data, response, error) in
                    
                    if error != nil {
                        print(error!)
                        completion(false)
                    }
                    
                    guard let data = data else {
                        completion(false)
                        return
                    }
                    
                    if let dataString = String(data: data, encoding: .utf8) {
                        
                        if let token = self.accessTokenFrom(string: dataString) {
                            
                            let success = UserDefaults.standard.save(accessToken: token)
                            completion(success)
                            
                        }
                        
                    }
                    
                    
                    
                }).resume()
                
            }
            
        } catch {
            print(error)
            completion(false)
        }
    }
    
    
    
    
    func codeFrom(url: URL) throws -> String {
        guard let code = url.absoluteString.components(separatedBy: "=").last else {
            throw GitHub.OAuthError.extractingTemporaryCode("GITHUB.swift: Error Extracting Code.")
        }
        
        return code
    }
    
    
    func accessTokenFrom(string: String) -> String? {
        
        if string.contains("access_token"){
            let components = string.components(separatedBy: "&")
            
            for component in components {
                if component.contains("access_token"){
                    let token = component.components(separatedBy: "=").last
                    
                    return token
                }
                
            }
        }
        
        return nil
    }
}

















