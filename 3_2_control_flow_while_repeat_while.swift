import Foundation

/*
    While loops
    - repeats a block of code while a condition is true

    ** structure **
    while <CONDITION> {
        <LOOP CODE>
    }

    - If condition is `true`, then the loop executes and moves on to another iteration
    - If condition is `false`, then the loop stops
*/
var sum = 0
var i = 0
while i <= 10 {
    sum += i
    i+=1
}
// sum = 55


/*
    Repeat-while loops
    - Condition is evaluated at the end of the loop rather than the beginning

    ** structure **
    repeat {
        <LOOP CODE>
    } while <CONDITION>
*/
var sum2 = 0
var i2 = 0
repeat {
    sum2 += i2
    i2+=1
}while i2 <= 10
// sum2 = 55


/* 
    Breaking out of a loop
    - using `break` 
    - which immediately stops the loop's execution and continues on to the code after the loop
*/



