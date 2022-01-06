import Foundation

/* 
   Closures
*/


/* 1. Creating Your Struct */
struct Location {
  let x: Int
  let y: Int
}
// x and y are member of struct, it's properties.


/* 2. Instantiate a Struct */
let storeLocation = Location(x: 3, y: 3)


/* 3. Accessing members */
struct DeliveryArea {
  let center: Location
  var radius: Double
}
var storeArea = DeliveryArea(center: storeLocation, radius: 2.5)
// use `dot syntax` to access member(read value)
storeArea.radius  // 2.5
storeArea.center.x  // 3
// use assign operator for white value
storeArea.radius = 3.5
// you can do this if you are declare a member is `var`


/* 4. Introducing methods */
// Pythagorean Theorem 📐🎓
func distance(
  from source: (x: Int, y: Int),
  to target: (x: Int, y: Int)
) -> Double {
  let distanceX = Double(source.x - target.x)
  let distanceY = Double(source.y - target.y)
  return (distanceX * distanceX + distanceY * distanceY).squareRoot()
}
struct DeliveryAreaWithMethod {
  let center: Location
  var radius: Double

  func contains(_ location: Location) -> Bool {
    let distanceFromCenter =
      distance(from: (center.x, center.y), to: (location.x, location.y))
    return distanceFromCenter < radius
  }
}
/*
  Function `contain`, which is now a member of DeliveryAreaWithMethod
  Function that are members of types are called `method`
*/

let area = DeliveryAreaWithMethod(center: Location(x: 8, y: 8), radius: 2.5)
let customerLocation = Location(x: 7, y: 7)
area.contains(customerLocation) // true




