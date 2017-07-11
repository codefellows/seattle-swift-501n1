//: Playground - noun: a place where people can play

import UIKit

var function: (Int) -> (Void)

let name = "Mars"
let number = 4

if number == 4 {
    function = { (position) in
        if number == position {
            print("We are talking about \(name).")
        }
    }
} else {
    function = { (position) in
        print("We are NOT talking about \(name), because the position is \(position).")
    }
}

function(10)

