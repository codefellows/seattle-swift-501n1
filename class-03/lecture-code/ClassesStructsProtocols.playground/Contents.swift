////: Playground - noun: a place where people can play

import UIKit

//var str = "Hello, playground"
//
//class Person {
//    var name: String
//    let age: Int
//    var height: Int?
//    
//    init(name: String = "Unknown", age: Int) {
//        self.name = name
//        self.age = age
//    }
//    
//    init(json: [String: Any]) {
//        self.name = json["name"] as! String
//        self.age = json["age"] as! Int
//    }
//    
//    init?(name: Any, age: Int) {
//        self.age = age
//        
//        if let name = name as? String {
//            self.name = name
//        } else {
//            return nil
//        }
//    }
//    
//    func sayHello(){
//        print("Hello! My Name is \(name).")
//    }
//    
//}
//
//
//let adam = Person(name: "Adam", age: 31)
//var otherPerson = adam
//
//if adam === otherPerson {
//    print("These are the same person!")
//}
//
//
//struct Tweet {
//    var userName: String
//    var text: String
//}
//
//let firstTweet = Tweet(userName: "awallraff", text: "This is my first tweet")
//
//let copyOfFirstTweet = firstTweet
//
//
//
//class Animal {
//    var legs : Int?
//    var wings: Int?
//    
//    init(legs: Int?, wings: Int?) {
//        self.legs = legs
//        self.wings = wings
//    }
//}
//
//class Bird : Animal {
//    var beakSize: Int?
//    var color: UIColor
//    
//    init(beakSize: Int?, color: UIColor, legs : Int) {
//        self.beakSize = beakSize
//        self.color = color
//        
//        super.init(legs: legs, wings: 2)
//        
//        
//    }
//    
//    func setupBird(){
//        //install bird fixture
//    }
//    
//}
//
//
//let bird = Bird(beakSize: 5, color: .blue, legs: 4)
//
//bird.setupBird()
//
//
//
//protocol OtherProtocol {
//    
//}
//
//
//protocol Identity {
//    var id: String { set get }
//    
//    associatedtype Description
//    
//    func description() -> Description
//    func id() -> String
//    
//    func requiredMethod(description: Description)
//    func optionalMethod()
//}
//
//extension Identity where Self :Animal {
//    func id() -> String {
//        return "123123123123"
//    }
//    
//    func optionalMethod() {
//        print("Optional Method called on Animal")
//    }
//}
//
//
//
//extension Identity where Self :OtherProtocol {
//    func id() -> String {
//        return "123123123123"
//    }
//    
//    func optionalMethod() {
//        print("Optional Method called")
//    }
//}
//
//class User : Identity, OtherProtocol {
//    var id: String
//    
//    typealias Description = String
//    
//    var userName: String
//    var password: String
//    var email: String
//    
//    init(userName: String, password: String, email: String) {
//        self.userName = userName
//        self.password = password
//        self.email = email
//        self.id = UUID().uuidString
//    }
//
//    func description() -> String {
//        return "Username:\(userName), email:\(email)"
//    }
//    
//    func requiredMethod(description: String) {
//        //do stuff
//    }
//}
//
//let user = User(userName: "awallraff", password: "asdf", email: "adam@adam.com")
//
//user.id
//
//
//user.optionalMethod()


func with2Parameters(a: String, b: String) {
    
}

func takeTuple(tuple: (a: String,b: Int)){
    
}


var array = ["Earth","Mars","Earth","Jupiter"]

var planetSet = Set(array)




