import Foundation

/* Control Flow EP.1 */

/* if */
let animal = "Fox"
if animal == "Cat" || animal == "Dog" {
    print("Animal is a house pet.")
}


/* if..else */
if animal == "Cat" || animal == "Dog" {
    print("Animal is a house pet.")
}else {
    print("Animal is not a house pet.")
}


/*  if..else if ... else */
let hourOfDay = 12
var timeOfDay = ""
if hourOfDay < 6 {
    timeOfDay = "Early morning"
}else if hourOfDay < 12 {
    timeOfDay = "Morning"
} else if hourOfDay < 17 {
    timeOfDay = "Afternoon"
}else {
    timeOfDay = "INVALID HOUR!"
}
// timeOfDay => Afternoon


/*  Short-circuiting */
// when there are multiple Boolfean conditions, separated by ANDs(&&) or ORs(||)
let age = 25
let name = "Funny Dev"

if age > 25 && name == "Funny Dev" {
    // ...
}


/* Ternary operator*/
// if..else form
let a = 5
let b = 10

let min: Int
if a < b {
    min = a
}else {
    min = b
}
// ternary operator => (<CONDITION>) ? <TRUE VALUE> : <FALSE VALUE>
let min2 = a < b ? a : b // min2 = 5


