//
//  UIExtensions.swift
//  TwitterClient
//
//  Created by Adam Wallraff on 7/22/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit

typealias ImageCompletion = (UIImage?)->()

extension UIImage {
    
    class func fetchImagewith(urlString: String, completion: @escaping ImageCompletion){
        OperationQueue().addOperation {
            if let url = URL(string: urlString) {
                do {
                    let data = try Data(contentsOf: url)
                    
                    OperationQueue.main.addOperation {
                        completion(UIImage(data: data))
                    }
                    
                } catch {
                    print("There was an error getting data from url: Error:\(error)")
                    OperationQueue.main.addOperation {
                        completion(nil)
                    }
                }
            }
        }
    }
    
}
