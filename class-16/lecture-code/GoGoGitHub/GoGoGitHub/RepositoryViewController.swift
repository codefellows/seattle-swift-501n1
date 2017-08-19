//
//  RepositoryViewController.swift
//  GoGoGitHub
//
//  Created by Adam Wallraff on 8/19/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit

class RepositoryViewController: UIViewController {
    
    //LAB: SETUP TABLEVIEW TO DISPLAY REPOS

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        GitHub.shared.getRepos { (repositories) in
            OperationQueue.main.addOperation {
                
            }
            
        }
        
    }
    

}
