import Foundation

/*
    String
    - strings as a collection of indinidual characters
    - define by using syntax `string literal`
    - use + operator for concatenation
    - use `\(variable)` for Interpolation
    - use """ (three double-quote) for multi-line

    ** Note **
    - There's no such thing as a character literal in Swift
      if you wanna define `Character`, you must make the type explicit.
      => let characterD: Character = "D"
*/

// Define string
let stringDog: String = "Dog" // or let stringDog = "Dog" > Type Inferrence
// the right-hand side of equal expression is `string literal`


// Concatenation
let firstName = "Funny"
let lastName = "Dev"
let fullName = firstName + " " + lastName // Funny Dev
/*
    if you wanna concat string with another type such as integer or double.
    you should convert this type into String type
*/
let age = 25 
let fullNameWithAge = fullName + ". I'm " + String(age) // Funny Dev. I'm 25


// Interpolation
let nickname = "PJ"
let message = "Hello my nick name is \(nickname)!" // Hello my nick name is PJ!


// Multi-line
let bigString = """
You can have a string
that contains multiple
lines
by doing this.
"""
/*
    You can have a string
    that contains multiple
    lines
    by doing this.
*/

let coordinates = (1,1.1,"a","aaa")


