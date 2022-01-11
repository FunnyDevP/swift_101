import Foundation

/* Properties */


/* 1. Stored properties */
// Used to store data in particular class, struct, or enumeration.

struct Contact0 {
  var fullName: String
  var emailAddress: String
}

// Default
struct Contact {
  var fullName: String
  let emailAddress: String
  var relationship = "Friend"
}

// initiate
var person = Contact(fullName: "Grace Murray",
                     emailAddress: "grace@navy.mil")
person.relationship // Friend

var boss = Contact(fullName: "Ray Wenderlich",
                   emailAddress: "ray@raywenderlich.com",
                   relationship: "Boss")
boss.relationship // Boss


/* 
  2. Computed properties 
      - Computed properties are part of family of property type.
      - The computed properties is used to `perform calculation before returning values`
      - Computed property `must be` defined as a variable `var`
*/
struct TV {
  var height: Double
  var width: Double

  var diagonal: Int {
    let result = ((height * height) + (width * width)).squareRoot().rounded()
    return Int(result)
  }
}
// `diagonal` is a member of `TV`, It's computed properties.


/*
  3. Getter and Setter
*/
struct TV1 {
  var height: Double
  var width: Double

  var diagonal: Int {
    get {
      let result = (height * height +
        width * width).squareRoot().rounded()
      return Int(result)
    }
    set {
      let ratioWidth = 16.0
      let ratioHeight = 9.0
      let ratioDiagonal = (ratioWidth * ratioWidth +
        ratioHeight * ratioHeight).squareRoot()
      height = Double(newValue) * ratioHeight / ratioDiagonal
      width = height * ratioWidth / ratioHeight
    }
  }
}
/*
The newValue constant lets you use whatever value was passed in during the assignment
*/

var tv = TV1(height: 10.0, width: 20.0)
tv.diagonal = 70
// newValue = 70
tv.height // 34.32...
tv.width // 61.01...


/*
  4. Property Observers
      - willSet is observer is called when a property is about to change (called before property change)
      - didSet is observer is called after a property has been changed (called after property change)

  note: willSet and didSet observers are only available for store properties
*/

struct StepCounter {
  var totalSteps: Int = 0 {
    willSet(newTotalSteps) {
      print("About to set totalSteps to \(newTotalSteps)")
    }
    didSet {
      print("old total Step \(oldValue)")
      if totalSteps > oldValue {
        print("Added \(totalSteps - oldValue) steps")
      }
    }
  }
}

var stepCounter = StepCounter()
stepCounter.totalSteps = 200
// > About to set totalSteps to 200
// > old total Step 0
// > Added 200 steps
stepCounter.totalSteps = 360
// > About to set totalSteps to 360
// > old total Step 200
// > Added 160 steps