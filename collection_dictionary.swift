import Foundation

/* 
    Dictionaries 
    - Unordered collection of pairs.
    - Where each pair comprises a `key` and a `value`
    - keys 
        - unique.
        - The same key can't appear twice in a dictionary
        - all keys must be of the same type
    - values
        - All vales must be of the same type.
*/


/* 1. Creating dictionaries */
// implicit type
var namesAndScores = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6] // => [String:Int]

// explicit type
var namesAndScores1: [String:Int] = ["Anna": 2, "Brian": 2, "Craig": 8, "Donna": 6]

// empty dictionary
var pairs: [String: Int] = [:]
/*
    If you wanna declare empty dictionary, 
    you need to use type annotation to make the type explicit
*/


/* 2. Accessing values */
/* 
    Using subscripting
    - if there is keys in dictionary, return Optional(value)
    - if doesn't find the key, return nil
*/
var annaScore = namesAndScores["Anna"] // Optional(2)
var gregScore = namesAndScores["Greg"] // nil


/* 3. Modifying dictionaries */
var bobData = [
  "name": "Bob",
  "profession": "Card Player",
  "country": "USA"
]
// Adding pairs
bobData.updateValue("CA", forKey: "state") // > ["name": "Bob", "state": "CA", "country": "USA", "profession": "Card Player"]
bobData["city"] = "San Francisco" // > ["state": "CA", "country": "USA", "name": "Bob", "profession": "Card Player", "city": "San Francisco"]

// Updating values
// updateValue(_,forKey:_) return old value, if the key doesn't exist, this method will add a new pair and return nil
bobData.updateValue("Bobby", forKey: "name") // Bob
bobData["profession"] = "Mailman"

// Removing pairs
bobData.removeValue(forKey: "state")
bobData["city"] = nil


/* 4. Iterating through dictionaries */
for (player, score) in namesAndScores {
  print("\(player) - \(score)")
}
// > Craig - 8
// > Anna - 2
// > Donna - 6
// > Brian - 2

for player in namesAndScores.keys {
  print("\(player), ", terminator: "") // no newline
}
print("") // print one final newline
// > Craig, Anna, Donna, Brian,

for player in namesAndScores.values {
  print("\(player), ", terminator: "") // no newline
}
print("") // print one final newline
// > 2, 8, 2, 6

