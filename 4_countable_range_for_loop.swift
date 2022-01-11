import Foundation

/*
    Countable ranges
    - countable range is data types, which let you represent a sequence of countable integer
    - has two types of ranges.
        - closed range (start...end)
        - half-open range (start..<end)
*/


// countable closed range
let closedRange = 0...5
// The three dots (...) indicate that this range is closed
// which means the range does from 0 to 5. That's the numbers (0,1,2,3,4,5)


// countable half-open range
let halfOpenRange = 0..<5
// Half-open means the range goes from 0 up to, but not including
// which means the range does from 0 to 4. That's the number (0,1,2,3,4)


/*
    For loops
    - use it to run code a certain number of times

    /* structure */
    for <CONSTANT> in <COUNTABLE RANGE> {
        <LOOP CODE>
    }

*/

var sum = 0
for i in 1...10 {
    sum += i
}
// sum = 55


/* Ignore loop constant */
var sum1 = 0
var lastSum = 0
for _ in 0..<10 {
    let temp = sum1
    sum1 += lastSum
    lastSum = temp
}


/* Iterate element by condition */
var sum2 = 0
for i in 1...10 where i % 2 == 1 {
    sum2 += i
}

/* Continue */

var sum3 = 0
for i in 0...10 {
    if i == 5 {
        continue
    }
    sum3 += i
}






