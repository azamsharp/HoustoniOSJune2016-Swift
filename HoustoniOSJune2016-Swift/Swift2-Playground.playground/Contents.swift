
// Swift 2 New Features 

// Exception Handling

import XCPlayground
import UIKit

enum Compus {
    case North
    case East
    case South
    case West
}

enum DebitCardError : ErrorType {
    case InvalidPin
    case InsufficientFunds
}

class DebitCard {
    
    var number :String!
    var pin :String!
    var balance :Double!
    
    init(number :String, pin: String, balance :Double) {
        
        self.number = number
        self.pin = pin
        self.balance = balance
    }
    
    func swipe() throws {
        
        if self.pin.characters.count < 5 {
            throw DebitCardError.InvalidPin
        }
    }
}

let card = DebitCard(number: "232343", pin: "1234", balance: 1000)

 //try! card.swipe()  // The developer takes the responsibility of calling the function

do {
      try card.swipe()
}

catch {
    
}

//try? card.swipe()


// unwrapping optionals 

var name :String?
name = "Hello World"
print(name!)

if let n = name {
    print(n)
}

// name = nil

guard let n = name else {
    fatalError("Error occured")
}

print("some other line")

// availability API 

if #available(iOS 9, *) {
    
}

// protocol extensions 

protocol Flyable {
   
    func fly()
}

extension Flyable {
    
    func fly() {
        print("I am a simple bird that can fly")
    }
    
}

class Sparrow :Flyable {
    
}

class Pelican : Flyable {
    
    func fly() {
        print("Pelican can fly")
    }
    
}


// extensions 

extension String {
    func reverse() {
        
    }
}

let customerName = "John Doe"

//let reversedString = MyStringHelper.reverse(customerName)

customerName.reverse()

"Hello World".reverse()


// Home Assignment


class GraphView : UIView {
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setup()
        
    }
    
    private func setup() {
        
        UIColor(red: 120/255, green: 100/255, blue: 234/255, alpha: 1).setFill()
        
        print("hello world")
        
        let points :[CGPoint] = [CGPoint(x:10, y:20),CGPoint(x:20,y:40)]
        
        UIColor.greenColor().setStroke()
        UIColor.redColor().setFill()
        
        let line = UIBezierPath()
        
        line.moveToPoint(CGPoint(x: 0, y: 0))
        
        for point in points {
            
            UIColor.greenColor().setFill()
            let circle = UIBezierPath(ovalInRect: CGRect(x: 0, y: 0, width: 100, height: 100))
            
            circle.fill()
            
            line.addLineToPoint(point)
        }
        
        line.stroke()
        line.closePath()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

let graphView = GraphView(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
graphView.backgroundColor = UIColor.purpleColor()


XCPlaygroundPage.currentPage.liveView = graphView



































