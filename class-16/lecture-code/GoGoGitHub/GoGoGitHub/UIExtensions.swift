//
//  UIExtensions.swift
//  GoGoGitHub
//
//  Created by Adam Wallraff on 8/19/17.
//  Copyright © 2017 Adam Wallraff. All rights reserved.
//

import UIKit

extension UIResponder {
    static var identifier: String {
        return String(describing: self)
    }
}
