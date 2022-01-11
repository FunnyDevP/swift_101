import Foundation

/* 
    Array 
    - Ordered collection
    - Collection of values of the `same type`
    - The elements in the array are `zero-indexed` (index start with 0)
    
    - creating arrays
        - using array literal => [Type]

    - accessing elements
        - using subscripting
            - This syntax lets you access any value directly by using it's index inside square brackets.
        *** If you try to access an index that’s beyond the size of the array, you’ll get a runtime error. ***
        - ArraySlice
            - Use the subscript syntax with countable ranges to fetch more than a single value from an array.
*/      


/* 1. Creating arrays */
// implicit type
let evenNumbers = [2,4,6,8] // => [Int]

// explicit type
let oddNumbers: [Int] = [1,3,5,7]

// empty array
var subscribers: [String] = []

/*
	  if you wanna declare empty array, you need to 
	  use a type annotation to make the type explicit
*/


/* 2. Accessing elements */
var players = ["Alice","Bob","Cindy","Dan"]

// using subscripting
var firstPlayer = players[0] // Alice

// out of range
//var player = players[4] > fatal error: Index out of range

// Using countable ranges to make an ArraySlice
let upcomingPlayersSlice = players[1...2] // ["Bob","Cindy"]
print(upcomingPlayersSlice[1], upcomingPlayersSlice[2]) // > "Bob Cindy\n"


/* 3. Modifying arrays */

// Appeding elements
players.append("Eli") // ["Alice","Bob","Cindy","Dan","Eli"]
players += ["Gina"] // ["Alice","Bob","Cindy","Dan","Eli","Gina"]

// Inserting elements
players.insert("Frank", at: 5) // ["Alice","Bob","Cindy","Dan","Eli","Frank","Gina"]
/* The `at` argument defines where you want to add the element. */


/* 4. Removing elements */
var removedPlayer = players.removeLast()
print("\(removedPlayer) was removed") // > Gina was removed

removedPlayer = players.remove(at: 2) // index 2
print("\(removedPlayer) was removed") // > Cindy was removed


/* 5. Updating elements */

// players =  ["Alice", "Bob", "Dan", "Eli", "Frank"]

players[4] = "Franklin"
// players = ["Alice", "Bob", "Dan", "Eli", "Franklin"]

// multiple update (subscript syntax + countable range)
players[0...1] = ["Donna", "Craig", "Brian", "Anna"]
// players = ["Donna", "Craig", "Brian", "Anna", "Dan", "Eli", "Franklin"]


/* 6. Moving elements */

let playerAnna = players.remove(at: 3) // Anna
players.insert(playerAnna, at: 0) // added "Anna" to index 0
// players = ["Anna", "Donna", "Craig", "Brian", "Dan", "Eli", "Franklin"]

players.swapAt(1, 3)
// players = ["Anna", "Brian", "Craig", "Donna", "Dan", "Eli", "Franklin"]


/* 7. Iterating through an array */

// players = ["Anna","Brian","Craig","Dan","Donna","Eli","Franklin"]
for player in players {
  print(player)
}
// > Anna
// > Brian
// > Craig
// > Dan
// > Donna
// > Eli
// > Franklin

for (index, player) in players.enumerated() {
  print("\(index + 1). \(player)")
}
// > 1. Anna
// > 2. Brian
// > 3. Craig
// > 4. Dan
// > 5. Donna
// > 6. Eli
// > 7. Franklin
