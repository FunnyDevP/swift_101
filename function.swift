import Foundation

/*
    Function
    - define a function using the `func` keyword
    - function parameter are constants, which means they can’t be modified.
    - Swift copies the value before passing it to the function, a behavior known as `pass-by-value`
    - using keyword `inout` when you would like to change a parameter directly
        a behavior known as `copy-in copy-out`
    
    - structure 
        - simple function
            func functionName(){
                // CODE
            }
        - function with parameters
            func functionName(param1: DataType) {
                // CODE
            }
        - function with return values
            func functionName(parameterList) -> ReturnType{
                // Code
                return ...
            }

            ** if your function have a single statement, you can ignore `return` keyword **
*/

/* 1. Define simple function */
func printMyName(){
    print("My name is Funny Dev")
}
printMyName() // My name is Funny Dev


/* 2. Define function with parameters */
func printMultipleOfFive(value: Int) {
    print("\(value) * 5 = \(value * 5)")
}
printMultipleOfFive(value: 10) // 10 * 5 = 50

func printMultipleOf(multiplier: Int, andValue: Int) {
  print("\(multiplier) * \(andValue) = \(multiplier * andValue)")
}
printMultipleOf(multiplier: 4, andValue: 2) // 4 * 2 = 8

// external name
func printMultipleOf(multiplier: Int, and value: Int) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(multiplier: 4, and: 2) // 4 * 2 = 8

// ignore external name
func printMultipleOf(_ multiplier: Int, and value: Int) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4, and: 2) // 4 * 2 = 8

// default values
func printMultipleOf(_ multiplier: Int, _ value: Int = 1) {
  print("\(multiplier) * \(value) = \(multiplier * value)")
}
printMultipleOf(4) // 4 * 1 = 4


/* 3. Define function with Return values */
func multiply(_ number: Int, by multiplier: Int) -> Int {
    return number * multiplier
}
let result = multiply(4, by: 2) // 8

// return multiple values through the use of tuples
func multiplyAndDivide(_ number: Int, by factor: Int) -> (product: Int, quotient: Int) {
    (number * factor, number / factor)
    
}
let results = multiplyAndDivide(4, by: 2) // (product: 8, quotient: 2)
let product = results.product // 8
let quotient = results.quotient // 2


/* 4. Copy-in Copy out (pass-by-reference) */
func incrementAndPrint(_ value: inout Int) {
    value += 1
    print(value)
}
// `inout` before the parameter type indicates that this parameter should be copied in, that local copy used within the function and copied out when function return
var value = 5
incrementAndPrint(&value) // 6
// value = 6


/* 
    5. Function Overloading 
    - achieved through a difference in the parameter list
        - A different number of parameters.
        - Different parameter types
        - Different external parameter names.    
*/

func hello() -> String {
    return "hello my name is Funny Dev"
}
func hello(name: String) -> String {
    return "hello my name is \(name)"
}
func hello(iam name: String) -> String {
    return "hello my name is \(name)"
}

/*
    6. Doxygen
    - Doxygen is commenting standard, use for describe your function
    - generate Doxygen
        - Click the name of the function you wanna create doxygen for
        - Press `Option + Command + /` for generate Doxygen.
*/

/// Calculates the average of three values
/// - Parameters:
///   - a: The first value.
///   - b: The second value.
///   - c: The third value.
/// - Returns: The average of the three values.
func calculateAverage(of a: Double, and b: Double, and c: Double) -> Double {
  let total = a + b + c
  let average = total / 3
  return average
}
calculateAverage(of: 1, and: 3, and: 5)


