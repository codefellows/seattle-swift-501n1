//: Playground - noun: a place where people can play

import UIKit

////Declare new String called str.
//var str = "Hello, playground"
//
//var opacity = 101234.0
//
//opacity = 0.5
//
//
//let number: Int = 10
//
//let string: String = "Number: \(number)"
//
//let float : Float = Float(number)
//
//
//
//
////Tuple = (String, Int, String)
//let person : (name: String, age: Int, location: String) = ("Adam", 31, "Seattle, WA")
//
//let myName = person.name
//
//
//var otherNumber = 95
//
//var remainder = otherNumber % 10
//
//otherNumber += 1 //otherNumber = otherNumber + 1
//
//
//let planet = "Mars"
//
//if planet == "Mars" {
//    print("equal")
//} else if planet == "Earth" {
//    print("Planet is earth")
//}else {
//    print("not equal!")
//}
//
//let equal = planet == "Mars" ? true : false
//equal
//
//
//
//
//
//let age = 15
//
//switch age {
//    case 13..<18:
//        print("This is a teenager")
//    case 31:
//        print("This is Adam's age.")
//    default:
//        print("This person is an adult!")
//}
//
//
//var name = "Amanda"
//
//switch name {
//case "Amanda", "Mika", "Chelsea":
//    print("My Family")
//case "Adam":
//    print("The user's name is Adam!")
//default:
//    print("Not sure what this string is..")
//}
//
//
//
//let numbers = [100,200,300,400,500]
//
////for index in stride(from: 0, to: numbers.count, by: 1){
//// print(index)
////}
//
////for number in numbers {
////    print("Number: \(number)")
////}
//
////for index in 1...100 {
////    print("Number: \(index)")
////}
//
//
//var count = 0
//
////while(count < 10) {
////    print(count)
////    count += 1
////}
//
//repeat {
//    print(count)
//} while(count > 100 && count < 150)
//
//
//
//
//
//
//
//func sayHelloTo(_ firstName: String, _ lastName: String) {
//    let string = "Hello, \(firstName) \(lastName)!"
////    return string
//}
//
//let greeting = sayHelloTo("Adam","Wallraff")
//
//let sayHelloFunction = sayHelloTo
//
//sayHelloFunction("Adam", "Wallraff")
//
//func print() {
//    
//}
//
//print



UIView.animate(withDuration: 1.0) {
//    view1.alpha = 0.0
}

var closure : (Int, Int) -> Int = { (a, b) -> Int in
    return a + b
}

func addTwoThings(_ a: Int, _ b: Int) -> Int {
    return a + b
}

var result = closure(10, 30)
var funcResult = addTwoThings(10, 30)


var myName : String?

myName = "Adam"

myName = nil

if let myName = myName {
    print(myName)
}

print(myName)




//var myAge : Int?
//
//myAge = 31
//
//guard let myAge = myAge else {
//    fatalError("NO AGE!!!")
//}
//
//if let myAge = myAge {
//    //do stuff
//}

var typeOfCar : String?

//typeOfCar = "Forester"

var description = typeOfCar ?? "No Description"




print(description)













