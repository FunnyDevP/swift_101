import Foundation

/*
    Type aliases
    - create your own type which is an alias of another type.
    - use for give a more useful name to your type that describes what it is
*/

// Define 
typealias Animal = String
let myPet: Animal = "Dog"
// when the compiler sees this type, it simply treats it as a String
typealias Coordinates = (Int, Int)
let xy: Coordinates = (2,4)

