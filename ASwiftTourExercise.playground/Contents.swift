//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//Experiment 1 : Create a constant with an explicit type of Float and a value of 4.

let explicitFloat:Float=4

//Experiment 2 : Try removing the conversion to String from the last line. What error do you get?

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

//let widthLabel = label + width

//Error: Binary operator '+' cannot be applied to operands of type 'String' and "int'

//Experiment 3 : Use \() to include a floating-point calculation in a string and to include someone’s name in a greeting.

let name = "Stacy"
let greetings="Hello!"
let appleCost:Float=1.3
let orangeCost:Float=1.7
let statement="\(greetings)+\(name)+cost of the purchase is \(appleCost+orangeCost)"

//Experiment 4 : Change optionalName to nil. What greeting do you get? Add an else clause that sets a different greeting if optionalName is nil.

/*var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}
 */

var optionalString: String? = "Hello"
print(optionalString == nil)

var optionalName: String? = nil //If the optional string is assigned a nil value,the conditional is false and the code in braces is skipped.
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

//Experiment 5 : Try removing the default case. What error do you get?

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a spicy \(x)?")
default:                     //If the deafault statement is removed we get,'Switch must be exhaustive,try adding a default case'.Switches must have a default case always.
    print("Everything tastes good in soup.")
}

//Experiment 6 : Add another variable to keep track of which kind of number was the largest, as well as what that largest number was.

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var type:String?
for (kind, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            type=kind
        }
    }
}
print(largest)
print(type!)

//Experiment 7 : Remove the day parameter. Add a parameter to include today’s lunch special in the greeting.

/*func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
greet(person: "Bob", day: "Tuesday")
 */

func greet(person:String,lunch:String)->String{
return "Hello \(name),today's lunch special is \(lunch)"
}

greet(person:"Stacy",lunch:"Chilli Cheese Sandwich")

//Experiment 8 : Write a function that calculates the average of its arguments.

func sumOf(numbers: Int...) -> (Int,Float) {
    var sum = 0
    var count=0
    for number in numbers {
        sum += number
        count += 1
    }
    
    return (sum,Float(sum)/Float(count))
}
sumOf()
sumOf(numbers: 42, 597, 12)

//Experiment 9 : Rewrite the closure to return zero for all odd numbers.

var numbers = [20, 19, 7, 12]
numbers.map({
    (number: Int) -> Int in
    var result = 0
    if number % 2 == 0 {
        result = 3 * number
    }
    return result
})

//Experiment 10 : Add a constant property with let, and add another method that takes an argument.

class Shape {
    var numberOfSides = 0
    let color:String = ""
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    
    func colorOfShape()->String{
        return "A shape in \(color) color."
    }
}

//Experiment 11 : Make another subclass of NamedShape called Circle that takes a radius and a name as arguments to its initializer. Implement an area() and a simpleDescription() method on the Circle class.

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    init(name: String) {
        self.name = name
    }
    
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

class Circle : NamedShape{
    var radius:Double
    
    init(radius:Double,name:String){
        self.radius=radius
        super.init(name:name)
        numberOfSides=0
        }
    func area()->Double{
        return 3.14*radius*radius
    }
    
    override func simpleDescription() -> String {
        return "A circle with radius of length \(radius)"
    }

}

let test=Circle(radius:2.5,name:"Circle")
test.area()
test.simpleDescription()

//Experiment 12 : Write a function that compares two Rank values by comparing their raw values.

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}


let ace = Rank.ace
let jack=Rank.jack
let aceRawValue = ace.rawValue

func compareRank(first:Rank,second:Rank)->Bool{
    return first.rawValue==second.rawValue

}

var isEqual=compareRank(first: ace, second: jack)

//Experiment 13 : Add a color() method to Suit that returns “black” for spades and clubs, and returns “red” for hearts and diamonds.

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
    
    func color()->String{
        switch self{
        case .hearts ,.diamonds:
            return "red"
        case .clubs,.spades:
            return "black"
        
        }
    
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

let spade = Suit.spades
let spadeColor = spade.color()

//Experiment 14 : Add a third case to ServerResponse and to the switch.

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case error(String,String,String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let error=ServerResponse.error("Reason unknown","ErrorMsg","Terminated")

switch error {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .error(var1,var2,var3):
    print("Error..\(var1) for \(var2) and it is \(var3)")
}


//Experiment 15 : Add a method to Card that creates a full deck of cards, with one card of each combination of rank and suit.

struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
    
    func createDeck() -> [Card] {
        let ranks = [Rank.ace, Rank.two, Rank.three, Rank.four, Rank.five, Rank.six, Rank.seven, Rank.eight, Rank.nine, Rank.ten, Rank.jack, Rank.queen, Rank.king]
        let suits = [Suit.spades, Suit.hearts, Suit.diamonds, Suit.clubs]
        var deck = [Card]()
        for suit in suits {
            for rank in ranks {
                deck.append(Card(rank: rank, suit: suit))
            }
        }
        return deck
    }
}

// Experiment 16 : Write an enumeration that conforms to this protocol.

protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

enum simpleEnum:ExampleProtocol{
case a,b,c
case d,e
    var simpleDescription: String{
    switch self{
    case .a:
    return "a"
    case .b:
    return "b"
    case .c:
    return "c"
    case .d:
    return "d"
    case .e:
    return "e"
    }
    }
    
   mutating func adjust() {
    switch self {
    case .a:
        self = .a
    case .b:
        self = .b
    case .c:
        self = .c
    case .d:
        self = .d
    case .e:
        self = .e
    }

    }
}
var trying = simpleEnum.b
trying.simpleDescription
trying.adjust()
trying.simpleDescription

//Experimemt 17 : Write an extension for the Double type that adds an absoluteValue property.

extension Double {
    var absoluteValue: Double {
        get {
            return fabs(self)
        }
    }
}

var myDouble = -17.8
myDouble.absoluteValue

//Experiment 18 : Change the printer name to "Never Has Toner", so that the send(job:toPrinter:) function throws an error.

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}

do {
    let printerResponse = try send(job: 1040, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch {
    print(error)
}

//Experiment 19 : Modify the anyCommonElements(_:_:) function to make a function that returns an array of the elements that any two sequences have in common.

func commonElements <T, U> (lhs: T, rhs: U) -> [T.Iterator.Element] where T: Sequence, U: Sequence, T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
    var seq: [T.Iterator.Element] = []
    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                seq.append(lhsItem)
            }
        }
    }
    return seq
}

commonElements(lhs: [1,2,3, 30], rhs: [1, 10,2, 30])
