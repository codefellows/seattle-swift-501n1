# Week 1 - Class 4
## Homework
* Using Playgrounds…  
  * Declare an Enum. Your enum should have at least 5 cases and should use Associated Values for 3 of the 5 cases using the following types:  
    * String  
    * (Int, Int)  
    * ()->()  
  * Demonstrate, using a switch statement, accessing each of the associated types.  
  * Declare a `Person` class with 3 member properties. Declare a `Student` subclass that inherits from Person.  
    * Both Your Student and Person class should have at least 2 meaningful Type and 2 Instance Methods that would apply to each type. *Be creative*.  
    * In one of these 2 classes(`Student` or `Person`), demonstrate a computed property and implement a property observer.  
    * Your `Student` class should have a `student ID` property that is a unique identifier for each student  
  * Create a `Classroom` class that is a true singleton and has an array of `Students`.  
    * Add *accessor methods*(`add(Student:)`, `remove(Student:)`, `studentWith(id:)-> Student`, `allStudentNames()->[String]`, `studentCount()->Int`) to `Classroom` to access student data from the array.  

 ### Stretch goals
   * Conform your Enum to the Error protocol. Implement custom error handling for different Error cases.   

## Reading Assignment (read **before** Class 5):  
* Apple Documentation  
  *  [Core Data Programming Guide](https://developer.apple.com/library/content/documentation/Cocoa/Conceptual/CoreData/index.html)   
  * [KeyedArchiver](https://developer.apple.com/documentation/foundation/nskeyedarchiver)  
  * [KeeyedUnarchiver](https://developer.apple.com/documentation/foundation/nskeyedunarchiver)
  

## Other Resources
* [Grading Rubrics](../../resources/)
* [Lecture Slides](https://www.icloud.com/keynote/000U6vesUJwxPXIHFk2bnURYw#Week1_Day4)
