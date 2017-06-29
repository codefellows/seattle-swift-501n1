//: Playground - noun: a place where people can play

import UIKit

enum TrafficLight: Int {
    case red = 0
    case yellow = 100
    case green = 50
}

let currentLightState = TrafficLight.green

switch currentLightState {
case TrafficLight.red:
    print(currentLightState.rawValue)
case TrafficLight.yellow:
    print(currentLightState.rawValue)
case TrafficLight.green:
    print(currentLightState.rawValue)
}


enum ColorPallete {
    case primaryColor(UIColor)
    case secondaryColor(UIColor)
    case highlighting(UIColor)
}

let myPrimaryColor = ColorPallete.primaryColor(.blue)

switch myPrimaryColor {
case ColorPallete.primaryColor(let color):
    print(color.description)
default:
    print("Hit the default case")
}


enum Identification {
    case socialSecurityNumber(Float)
    case email(String)
    case phoneNumber(Int, Int, Int)
}

let myId = Identification.email("adam@codefellows.com")

let newUserId = Identification.socialSecurityNumber(1234567891)

let otherNewUserId : Identification = .phoneNumber(714, 609, 8889)

switch otherNewUserId {
case .email(let email):
    print("email: \(email)")
case .socialSecurityNumber(let ssn):
    print("SSN: \(ssn)")
case .phoneNumber(let areaCode, let prefix, let postFix):
    print("Phone#: \(areaCode)-\(prefix)-\(postFix)")
}


class Person {
    var firstName = "Adam" {
        didSet{
            print("Someone Changed first name! The new name is \(firstName).")
        }
        willSet{
            print("The old value of firstName was: \(firstName)")
        }
    }
    var lastName = "Wallraff"

    var fullName : String {
        return firstName + " " + lastName
    }
    
    

}

var me = Person()

me.firstName = "Bob"
me.firstName = "Fred"




class ShoppingCart {
    static let defaultCart = ShoppingCart()
    
    var itemCount = 0
    
    private init() {} //true singleton
}

//let cart = ShoppingCart()

ShoppingCart.defaultCart

ShoppingCart.defaultCart.itemCount = 1

var allItems = ShoppingCart.defaultCart.itemCount
allItems += 10

allItems

ShoppingCart.defaultCart.itemCount

ShoppingCart.defaultCart.itemCount += 1

ShoppingCart.defaultCart.itemCount


//let newCart = ShoppingCart()



var count = 0

var allCars = [String](){
    didSet {
        count += 1
    }
}

allCars.append("Bronco")
allCars.append("Subaru")

count







class Animal {
    var breed: String
    
    init(_ breed: String) {
        self.breed = breed
    }
    
    func whatType() {
        print("This is a " + self.breed)
    }
    
    func eat(){
        print("nom nom nom....")
    }
    
    static func allAnimals() -> Int{
        return 1000
    }
}

let elephant = Animal("trunky")

//Instance Method
elephant.whatType()
elephant.eat()

//Type Method
Animal.allAnimals()

class Math {
    static func addTwoNumbers(numOne: Int, numTwo: Int) -> Int {
        return numOne + numTwo
    }
}


Math.addTwoNumbers(numOne: 10, numTwo: 10)















