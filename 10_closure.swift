import Foundation

/*
    Closure
    - similar to lambda in other programming language 
      (lambda expression is a short block of code which takes in parameters and returns a value.)
    - self-contained block of functionality that can be passed around and used in your code
*/

/* 1. Creating closure */
// implicit type
var multiplyClosure1 = { (a: Int, b: Int) -> Int in
  return a * b
}
// explicit type
var multiplyClosure: (Int, Int) -> Int = {(a: Int, b: Int) -> Int in 
    return a * b
}
// These closure is take 2 parameter and return an Int.


/* 2. Shorthand syntax */
// remove return statement
multiplyClosure = { (a: Int, b: Int) -> Int in
  a * b
}
//If the closure comprises single return statement, you can leave out the return keyword.

// remove parameter type
multiplyClosure = { (a, b) in
  a * b
}

// omit the parameter list
multiplyClosure = {
  $0 * $1
}


/* 3. Function parameter as a Closure */
func operateOnNumbers(_ a: Int, _ b: Int,
                      operation: (Int, Int) -> Int) -> Int {
  let result = operation(a, b)
  print(result)
  return result
}
let addClosure = { (a: Int, b: Int) in
  a + b
}
operateOnNumbers(4, 2, operation: addClosure)
// define closure inline with the `operateOnNumbers` function call
operateOnNumbers(4, 2, operation: { (a: Int, b: Int) -> Int in
  return a + b
})
// omit parameter list
operateOnNumbers(4, 2, operation: { $0 + $1 })


/* 4. Trailing closure syntax */
// single trailing closures
operateOnNumbers(4, 2) {
  $0 + $1
}
// note: it can only be done when the closure is the final parameter

// multiple trailing closures
func sequenced(first: ()->Void, second: ()->Void) {
  first()
  second()
}

sequenced {
    print("hello",terminator: "")
} second: {
    print("world")
}
// note: Multiple trailing closures are a new feature in Swift 5.3

// > “Hello, world.”

/* 5. Iterating over collections with closures */
let values = [1,2,3,4,5,6]
values.forEach{
	print("\($0): \($0*$0)")
}
// > 1: 1
// > 2: 4
// > 3: 9
// > 4: 16
// > 5: 25
// > 6: 36
var prices = [1.5, 10, 4.99, 2.30, 8.19]
let largePrices = prices.filter {
  $0 > 5
} // > [10.0,8.19]
let salePrices = prices.map {
  $0 * 0.9
} // [1.35, 9, 4.491, 2.07, 7.371]


