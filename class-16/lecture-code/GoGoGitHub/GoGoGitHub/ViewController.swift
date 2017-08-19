//
//  ViewController.swift
//  GoGoGitHub
//
//  Created by Adam Wallraff on 8/15/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func requestTokenPressed(_ sender: Any) {
        
        let parameters = ["scope" : "email,user,repo"]
        
        GitHub.shared.requestAuthWith(parameters: parameters)
        
    }

    @IBAction func printTokenPressed(_ sender: Any) {
        
        let token = UserDefaults.standard.getAccessToken()
        
        print(token)
    }
    
    func dismissAuthController(){
        self.view.removeFromSuperview()
        self.removeFromParentViewController()
    }
    
}

