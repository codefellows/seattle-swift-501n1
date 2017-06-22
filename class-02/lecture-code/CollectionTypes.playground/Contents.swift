//: Playground - noun: a place where people can play

import UIKit

var myName = String()

var name = ""

let array = [1, 2, 3, 10, 4, 5, 0]

array.count

if !array.isEmpty {
    print("array is not empty!")
}

var firstNumber = array.first
var lastNumber = array.last


var maxNumber = array.max()
var minNumber = array.min()


var subArray = array[1..<5]
var backHalfNumbers = array[array.count/2..<array.count]



//var names = ["Adam", "Mika", "Amanda", "Duncan"]
//
//names.append("Brook")
//
//var removedName = names.remove(at: 4)
//
//names
//removedName
//
//
//names[0] = "Brook" //inserting over previous value
//
//var personAtIndex = names[3]
//
//names.removeLast()
//
//for (index, name) in names.enumerated() {
//    print("Name: \(name) at Index: \(index)")
//}

var names = ["Adam", "Mika", "Amanda", "Duncan"]
names.insert("Brook", at: 0)

let reducedNames = names.reduce("Names: ",{$0 + $1})
reducedNames

var numbers = [1,2,3,4,5,6,7,8]

let total = numbers.reduce(0, {$0 + $1})
total

let greetingNames = names.map({"Hello, \($0)"})
greetingNames


var numbersMultiplied = numbers.map({$0 % 3})

numbersMultiplied
numbers

let filteredNumbers = numbers.filter({$0 % 3 == 0})
filteredNumbers

let filteredNames = names.filter({!$0.contains("d") && !$0.contains("Brook")})
filteredNames

names

let greetingsFiltered = greetingNames.filter({!$0.contains("Brook")})
greetingsFiltered



names = names.filter({!$0.contains("Brook")}).map({"Hello, \($0)"})

names





//var person = [String : String]()

var person = ["firstName":"Adam",
              "lastName":"Wallraff",
              "favoriteLanguage":"Swift"]

var firstName = person["firstName"]

person.updateValue("Scott", forKey: "doppleganger")

var fullName : String?

if let firstName = person["firstName"], let lastName = person["lastName"] {
    fullName = firstName + " " + lastName
}

person["fullName"] = "Adam Wallraff"
person["fullName"] = nil
person["fullName"] = "Adam Wallraff"

person

for(key, value) in person {
    print("Key: \(key), Value: \(value)")
}

for key in person.keys {
    print(key)
}

for value in person.values {
    print(value)
}




let setA : Set = [0,1,6,7,8,9]
let setB : Set = [0,1,2,3,4,5]


setA.union(setB)

let setC = setA.intersection(setB)

let setD = setA.symmetricDifference(setB)

let setE = setB.subtracting(setA)







