import Foundation

/*
    Tuples
    - represent pairs data
    - represents data composed of more that one value of any type.
    - access element in tuple by using position, starting with zero.
        - by position
        - by name
        - shorthand syntax
            - using wildcard operator for ignore element
*/

// Define tuple
let coordinates:(Int,Int) = (2, 3) // or let coordinates = (2,3)
// define with mix types
let coordinatesMixed = (2.1,3) // Inferred to be of type (Double, Int)


// Access Element
// by position
let x1 = coordinates.0 // 2
let y1 = coordinates.1 // 3
// by name
let coordinatesNamed = (x: 2, y:3) // Inferred to be of type (x: Int, y: Int)
let x2 = coordinatesNamed.x // 2
let y2 = coordinatesNamed.y // 3
// access multiple parts at the same time, you can use shorthand syntax
let coordinates3D = (x: 2, y: 3, z: 1)
let (x3,y3,z3) = coordinates3D // x3 = 2, y3 = 3, z = 1
// ignore a certain element of the tuple, you can replace the corresponding part of the declaration with an underscore
let (x4, y4, _) = coordinates3D // x4 = 2, y4 = 3, ignore z


