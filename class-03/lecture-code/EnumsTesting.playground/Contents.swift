//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

struct User {
    let userName: String
    let email: String
    var tweets: [Tweet]?
}

struct Tweet {
    let text: String
    let user: User
}


enum Closure {
    indirect case completed(()->())
    indirect case completedWithTweets(([Tweet?])->())
    
    func execute() {
        switch self {
        case .completed(let finish):
            finish()
        default:
            print("hit default case")
        }
    }
}

func executeSomething(completion: @escaping Closure){
    
}




