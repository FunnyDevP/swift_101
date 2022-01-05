import Foundation

/* 
   Sets
   - unordered collection
   - unique values of the same type
*/

/* 1. Creating sets */
var explicitSet: Set<Int> = [1, 2, 3, 1] // > [2,3,4]
var someSet = Set([1, 2, 3, 1]) // > [2,3,4]


/* 2. Adding and removing elements */ 
// using insert(_:) method
someSet.insert(5) // > [5, 1, 2, 3]

// using the remove(_) method. it’s return the removed element if it’s in the set, or nil otherwise.
let removedElement = someSet.remove(1)
print(removedElement!)


/* 3. Iterating through sets */
for elem in someSet {
	print(elem)
}
// > 2
// > 3
// > 5

for idx in someSet.indices {
	let elem = someSet[idx]
	print(elem)
}

