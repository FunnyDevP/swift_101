import Foundation

/* Switch */

// 1.Define 
let number = 10

switch number {
case 0:
    print("Zero")
default:
    print("Non-zero")
}

// 2.Multiple condition
let string = "Dog"
switch string {
case "Cat","Dog":
    print("Animal is a house pet.")
default:
    print("Animal is not a house pet.")
}

// 3.Using `countable range` on switch
let hourOfDay = 12
var timeOfDay = ""
switch hourOfDay {
case 0...5:
    timeOfDay = "Early morning"
case 12...16:
    timeOfDay = "Afternoon"
default:
    timeOfDay = "INVALID HOUR!"
}
// timeOfDay = Afternoon


// 4.Using `where` clause on switch by using `let-where` syntax
// the case will match only when a certain condition is `true`. The `let` part binds a value to a name.
let number1 = 10
switch number1 {
case let x where x % 2 == 0:
    print("Even")
default:
    print("Odd")
}
// you can ignore `let` if unused
switch number1 {
case _ where number1 % 2 == 0:
    print("Even")
default:
    print("Odd")
}


// 5.Partial matching
// underscore(_) to mean that you don't care about the value.
let coordinates = (x: 3, y: 2, z: 5)
switch coordinates {
case (0, 0, 0): // 1
  print("Origin")
case (_, 0, 0): // 2
  print("On the x-axis.")
case (0, _, 0): // 3
  print("On the y-axis.")
case (0, 0, _): // 4
  print("On the z-axis.")
default:        // 5
  print("Somewhere in space")
}
/*
    1. Matches precisely where the value is (0, 0, 0). This is the origin of 3D space.
    2. Matches y=0, z=0 and any value of x. This means the coordinate is on the x-axis.
    3. Matches x=0, z=0 and any value of y. This means the coordinate is on the y-axis.
    4. Matches x=0, y=0 and any value of z. This means the coordinate is on the z-axis.
    5. Matches the remainder of coordinates.
*/

// use `let` to bind value
let coordinates1 = (1,0,0)
switch coordinates1 {
case (0, 0, 0):
  print("Origin")
case (let x, 0, 0):
  print("On the x-axis at x = \(x)") // print this line
case (0, let y, 0):
  print("On the y-axis at y = \(y)")
case (0, 0, let z):
  print("On the z-axis at z = \(z)")
case let (x, y, z): // default case if not match any case
  print("Somewhere in space at x = \(x), y = \(y), z = \(z)")
}

// use `where` clause
switch coordinates {
case let (x, y, _) where y == x:
  print("Along the y = x line.")
case let (x, y, _) where y == x * x:
  print("Along the y = x^2 line.")
default:
  break
}
