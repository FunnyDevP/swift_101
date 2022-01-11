import Foundation

/*
  Enumeration
  - enumeration is a list of related values that  define a common type
  - advantage
    - advantage of using enumerations instead of strings
      - prevent typos in your member value
*/

/* 1. Declaring a n enumeration */
enum Month {
  case january
  case february
  case march
  case april
  case may
  case june
  case july
  case august
  case september
  case october
  case november
  case december
}
/*
  simplify way

  enum Month {
    case january, february, march, april, may, june, july, august,
    september, october, november, december
  }
*/


/* 2. Using enumeration */
func semester(for month: Month) -> String {
  switch month {
  case .august, .september, .october,
    .november, .december:
    return "Autumn"
  case .january, .february, .march, .april,
    .may:
    return "Spring"
  default:
    return "Not in the school year"
  }
}
// you can simplify remove enumeration name Ex. Month.august => .august

var month = Month.april
print(semester(for: month))


/* 3. Raw values */
enum Domain: String {
  case Book = "https://example.com"
}
enum APIEndpoint: String {
  case GetBooks = "/api/v1/books"
  case GetUserProfile = "/api/v1/profile"
}

// accessing raw value by using `rawValue` property
let getBooks = URL(string: Domain.Book.rawValue + APIEndpoint.GetBooks.rawValue)
print(getBooks?.absoluteString)  // Optional("https://example.com/api/v1/products")


/* 4. Iterating through all cases */
enum Pet: String, CaseIterable {
  case cat = "Cat"
  case dog = "Dog"
  case bird = "Bird"
  case turtle = "Turtle"
  case fish = "Fish"
}

for pet in Pet.allCases {
  print(pet.rawValue)
}

// > Cat
// > Dog
// > Bird
// > Turtle
// > Fish