//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

enum CarError : Error {
    case noFuel
    case engineTrouble
    case blownTire
}

class Car {
    var gasMeter = 0
    
    func drive() throws -> Int {
        if self.gasMeter >  0 {
            
            if self.gasMeter == 3 {
                throw CarError.engineTrouble
            }
            
            self.gasMeter -= 10
            print("Car is driving!")
            return gasMeter
        } else {
            throw CarError.noFuel
        }
    }
    
}



let myCar = Car()
myCar.gasMeter = 0

do {
    try myCar.drive()
    print("Car is driving!")
    try myCar.drive()
    print("Car is still driving!")

} catch CarError.noFuel  {
    
    print("Error: \(CarError.noFuel) - Get more gas!")
    
} catch CarError.blownTire  {
    
    print("Error: \(CarError.blownTire) - Fix Tire!")
    
}catch CarError.engineTrouble  {
    
    print("Error: \(CarError.engineTrouble) - Fix Engine!")
}

myCar.gasMeter = 3

let gasRemaining = try? myCar.drive()
gasRemaining


enum TweetError : Error {
    case noUserForTweet
}




class StringStore {
    private var objects = [String]()
    
    func addString(string: String){
        objects.append(string)
    }
    
    func allObjects() -> [String] {
        return objects
    }
}

class IntStore {
    private var objects = [Int]()
    
    func addInt(number: Int){
    objects.append(number)
    }
    
    func allObjects() -> [Int] {
        return objects
    }
}


//let store = StringStore()
//
//store.addString(string: "Adam")
//store.addString(string: "Wallraff")
//store.addString(string: "123345234")
//
//store.allObjects()
//
//let store StringStore()
//store.addString(string: 123)



class GenericStore<T: Hashable, U> {
    private var objects = [T : U]()
    
    func add(object: U, key: T) {
        objects[key] = object
    }
    
    func allObjects() -> [T : U] {
        return objects
    }
}

let intStore = GenericStore<String, Any>()
let otherStore = GenericStore<String, String>()

let name = "Adam"

let otherAdam = "Adam"

name.hash
otherAdam.hash


var dictionary = [String: Int]()
var genericDictionary = Dictionary<String,Int>()



let someView = UIView()

if name == otherAdam {
    let somethingElse = "123"
}





