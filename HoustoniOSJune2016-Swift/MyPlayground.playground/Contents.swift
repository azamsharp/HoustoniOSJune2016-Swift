//: Playground - noun: a place where people can play

import UIKit

// defining a constant
let name = "John Doe"

// defining a variable
var age = 20
age = 21

print("My name is \(name) and my age is \(age)")

var season = "Spring"

let language :String?

language = "English"

print(language!)

let noOfCarsInHouston :Int?

noOfCarsInHouston = 230

// unwrap the option
print(noOfCarsInHouston!)
print(season)

//let firstName :String!


var cities :[String] = ["Houston","Austin","Dallas","San Antonio"]

let placesToVisit = ["Costa Rica","USA","Asia"]

cities.append("San Jose")

cities[1] = "San Francisco"
cities[0] = "Denver"

cities

cities.count

// for loop 

for cityName in cities {
    cityName + ", " + "USA"
}

cities.indexOf("Denver")

let firstName = "John"
let lastName = "Doe"
let fullName = firstName + ", " + lastName



let airports = ["Alberton":"AIL","Houston":"IAH","Las Angelos":"LAX","Greenville":"GSP"]

airports["Houston"]
airports["Costa Rica"]

// iterate through the dictionary 

for (city,airportCode) in airports {
    print("key = \(city) and value = \(airportCode)")
}


let scores = ["USA":23,"JAPAN":19,"FRANCE":45]
scores

// functions 

func greet() {
    print("hello")
}

greet()

func display(name :String) {
    
    // if you want to change the variable
    var someName = name
    someName = "Mary"
    
    print(name)
}

display("John Doe")

func verifyAge(name :String, age :Int) {
    
}

verifyAge("John Doe", age: 20)

func add(a :Int, b:Int) -> Int {
    return a+b
}

let result = add(2, b: 4)

func isPalindrom(userInput :String) -> Bool {
    return false
}

// classes 

class Person {
    
    var firstName :String
    var lastName :String
    var age :Int
    
    init() {

        // commenting out block of code and uncommenting out the block of code
        //    
        // Command plus - plus /
        
        self.firstName = ""
        self.lastName = ""
        self.age = 10
        
    }
    
    init(firstName :String, lastName :String) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = 10
    }
    
    init(firstName :String,lastName: String, age:Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

let somePersonObject = Person()

let someOtherPerson = Person()
someOtherPerson.firstName = "Mary"
someOtherPerson.lastName = "Kate"

let person = Person(firstName: "John", lastName: "Doe")

let anotherPerson = Person(firstName: "John", lastName: "Doe", age: 29)

person.firstName
person.lastName
person.age

anotherPerson.age


class Calculator {
    
    func add(a :Int, b:Int) -> Int {
        return a + b
    }
}

let someString :NSString = "asdasd"


let calculator = Calculator()

calculator.add(2, b: 6)

class Animal {
    
    func sleep() {
        print("Animal is sleeping")
    }
    
    func walk() {
        print("Animal is walking")
    }
    
}



class Cat : Animal {
    
    override func sleep() {
        print("Cat is sleeping")
    }
    
    override func walk() {
        print("Cat is walking")
    }
    
}

let cat = Cat()
cat.sleep()
cat.walk()


// protocols 

class Bird {
 
   
}

protocol Flyable {
    func fly()
}

class Sparrow : Flyable {
    
    func fly() {
         print("I can fly")
    }
}

class Eagle : Bird, Flyable {
    
    func fly() {
        print("I can fly")
    }
}

class Kiwi : Bird {
    
}

let s = Sparrow()
s.fly()



















