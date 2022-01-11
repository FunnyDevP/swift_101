import Foundation

/*
  Protocol
  - protocol like an interface or blueprint
  - protocol is common set of properties and behaviors(method)
  - protocol doesn't contain any implementation
  - protocol can be adopted by a class, struct or enum
*/


/* 
  1. Introducing protocols 
  - use protocols to enforce methods and properties on `other types`.
  - when another type adopts a protocol, it's `required` to implement 
    the methods and properties defined in the protocol.
  - once a type implements all members of a protocol, 
    the type is said to `conform` to the protocol
*/

protocol Vehicle {
  func accelerate()
  func stop()
}

class Unicycle: Vehicle {
  var peddling = false

  func accelerate() {
    peddling = true
  }

  func stop(){
    peddling = false
  }
}

/*
  1.1 Method in protocols 
  - method in protocols doesn't define any implementation.
  - method in protocols can't contain `default parameters`
  - method in protocols can overloading.
*/
enum Direction {
  case left
  case right
}

protocol DirectionalVehicle {
  func accelerate()
  func stop()
  func turn(_ direction: Direction) 
  func description() -> String
}

/*
  1.2 Properties in protocols
  - when defining properties in a protocol, you must `explicitly` mark them as `get` or `get set`
  - don't include any implementation for properties.
  - you can implement these property requirements as computed properties or as regular variables.
  - If the property has only a `get` requirement, you're still allowed
    to implement it as a stored property or read-write computed property.
  
  - If you implement property with `stored property`, you must initialize value.

    *** The requirements in the protocl are `only minimum requirements`. ***
*/

struct TvRatio {
    var ratioWidth: Double
    var ratioHeight: Double
}
protocol BaseTV {
    var width: Double {get}
    var height: Double {get}
    var ratio: TvRatio {get}
    var diagonal: Double {get}
}

class TV: BaseTV {
    var ratio: TvRatio
    
    var width: Double
    
    var height: Double
    
    init(width: Double, height: Double, ratio: TvRatio) {
        self.width = width
        self.height = height
        self.ratio = ratio
    }
    
    var diagonal: Double {
        get {
            let result = (height * height +
              width * width).squareRoot().rounded()
            return result
        }
        set {
            let ratioWidth = self.ratio.ratioWidth
            let ratioHeight = self.ratio.ratioHeight
            let ratioDiagonal = (ratioWidth * ratioWidth +
              ratioHeight * ratioHeight).squareRoot()
            height = Double(newValue) * ratioHeight / ratioDiagonal
            width = height * ratioWidth / ratioHeight
        }
        
    }
}

var tv = TV(width: 27.9, height: 15.7, ratio: TvRatio(ratioWidth: 16.0, ratioHeight: 9.0))
print(tv.ratio) // TvRatio(ratioWidth: 16.0, ratioHeight: 9.0)
print(tv.diagonal) // 32.0


/* 
  1.3 Implementing multiple protocols 
  - protocols support multiple conformances
  - you can add any number of protocol conformances to classes, structure(struct) and enumerations.
*/

protocol Wheeled {
  var numberOfWheels: Int{get}
  var wheelSize: Double {get set}
}

class Bike: Vehicle,Wheeled {
  var numberOfWheels: Int
  var wheelSize: Double

  init(numberOfWheels: Int,wheelSize: Double) {
    self.numberOfWheels = numberOfWheels
    self.wheelSize = wheelSize
  }

  func accelerate() {
   // // code
  }

  func stop(){
   // code
  }
}


/* 
  1.4 Protocol composition 
  - sometimes you need a function to take a data type that must conform to multiple protocols,
    That is where protocol composition comes in.
*/

func roundAndRound(transportation: Vehicle & Wheeled) {
    print("The brakes are being applied to \(transportation.numberOfWheels) wheels.")
}
roundAndRound(transportation: Bike(numberOfWheels: 4, wheelSize: 22.0))
// > The brakes are being applied to 4 wheels.


/* 1.5 Extension & protocol conformance */
protocol Reflective {
  var typeName: String {get}
}

extension String: Reflective {
  var typeName: String {
    "I'm a String"
  }
}

let title = "Swift Apprentice!"
print(title.typeName) // I'm a String.


