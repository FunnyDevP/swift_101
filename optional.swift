import Foundation

/*
    Optional
*/

/* 1. Define  optional */
var result: Int? = 30
print(result) // Optional(30)

/* 
    2. Unwrapping optionals 
        1. Force unwrapping
            - Using the exclamation mark(!) for unwrap optional
            - The exclamation mark(!) after the variable name tells the compiler that you want to look inside the box 
              and take out the value.
        *** You should use force unwrapping sparingly, because if you try to 
            unwrapping optional but it doesn't contain a value, error is happened.
            It's notice the error if you execute this code. ***

        2. Optional binding
            - Using if let... for unwrap optional
            - It's safely access the value inside optional
        
        Force unwrapping vs Optional binding
            - Use `Force unwrapping` when an optional if guaranteed contain a value.
            - Use `Optional binding` when a optional might be `nil` 
              (recommend this way because it's safely rather than force unwrapping)

*/
var authorName: String? = "Funny Dev"
var authorAge: Int? = 25

// 2.1 Force unwrapping 
var unwrappedAuthorName = authorName!
print("Author is \(unwrappedAuthorName)") // Author is Funny Dev

// try to force unwrapping when optional doesn't contain a value
var authorName1: String? = nil
//var unwrappedAuthorName1 = authorName1! => Fatal error: Unexpectedly found nil while unwrapping an Optional value

// prevent error
if authorName1 != nil {
  print("Author is \(authorName!)")
} else {
  print("No author.")
}


// 2.2 Optional binding
if let unwrappedAuthorName = authorName {
  print("Author is \(unwrappedAuthorName)") // Author is Funny Dev
} else {
  print("No author.")
}
/* 
    - If the optional contains a value, this value is unwrapped and stored in, or bounded to, the constant
    `unwrappedAuthorName`.
    - If the optional doesn't contain a value, else statement then executes.
*/

// It's common practice to give the unwrapped constant the same name as the optional (shadowing)
if let authorName = authorName {
  print("Author is \(authorName)") // Author is Funny Dev
} else {
  print("No author.")
}

// unwrapping multiple optional
if let authorName = authorName,
   let authorAge = authorAge {
  print("The author is \(authorName) who is \(authorAge) years old.") // The author is Funny Dev who is 25 years old.
} else {
  print("No author or no age.")
}

// combine unwrapping multiple optional with addional Boolean checks.
if let authorName = authorName,
   let authorAge = authorAge,
   authorAge >= 40 {
  print("The author is \(authorName) who is \(authorAge) years old.")
} else {
  print("No author or no age or age less than 40.") // No author or no age or age less than 40.
}


/* 
    3. Guard 
    - comprises `guard` keyword 
        - followed by condition that can include both `Boolean expression` and optional binding.
        - followed by `else` and a block of code.
    - `else` block will execute if the condition is false(optional doesn't contain a value)
*/
func guardMyCastle(name: String?) {
  guard let castleName = name else {
    print("No castle!")
    return 
  }
  
  // At this point, `castleName` is a non-optional String
  
  print("Your castle called \(castleName) was guarded!")
}
var castleName: String? = nil
guardMyCastle(name: castleName) // No castle!
castleName = "Funny Castle"
guardMyCastle(name: castleName) // Your castle called Funny Castle was guarded!


/*
    4. Nil coalescing
    - Using nil coalescing when you wanna get a value out of the optional no matter what.
*/

var optionalInt_: Int? = 10
var mustHaveResult_ = optionalInt_ ?? 0 // 10 || 0

// optional binding
var optionalInt: Int? = 10
var mustHaveResult: Int
if let unwrapped = optionalInt {
  mustHaveResult = unwrapped // mustHaveResult = 10
} else {
  mustHaveResult = 0
}