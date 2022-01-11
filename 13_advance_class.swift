import Foundation

/*
  Classes Inheritance
  - class inheriting from another class is know as a `subclass` or a `derived class`.
  - class it inherits is know as a `superclass` or a `base class`.
  - A Swift class can inherit from `only one` class, a concept know as `single inheritance`.
*/

struct Grade {
  var letter: Character
  var points: Double
  var credits: Double
}

class Person {
  var firstName: String
  var lastName: String

  deinit {
    print("\(firstName) \(lastName) is being removed from memory!")
  }
  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }
}

class Student: Person{
  var grades: [Grade] = []

  func recordGrade(_ grade: Grade){
    print("Student: recordGrade => \(grade)")
    grades.append(grade)
  }
}

let jane = Student(firstName: "Jane",lastName:"Appleseed")
let history = Grade(letter:"B",points: 9.0,credits: 3.0)
jane.recordGrade(history)
print(jane.grades) // [main.Grade(letter: "B", points: 9.0, credits: 3.0)]


/* 1. method override */
class StudentAthlete: Student {
  var failedClasses: [Grade] = []

  override func recordGrade(_ grade: Grade) {
    super.recordGrade(grade)

    if grade.letter == "F" {
      failedClasses.append(grade)
    }
  }

  var isEligible: Bool {
    failedClasses.count < 3
  }
}
// The `super` keyword except it will invoke the method in the nearest implementing superclass
var john = StudentAthlete(firstName: "John",lastName:"Appleseed")
let historyF = Grade(letter: "F",points: 0.0, credits: 0.0)
john.recordGrade(historyF)

print("1 => \(john.failedClasses)") // Grade(letter: "F",points: 0.0, credits: 0.0)
print(john.grades) // Grade(letter: "F",points: 0.0, credits: 0.0)

let historyA = Grade(letter: "A",points: 10.0, credits: 10.0)
john.recordGrade(historyA)

print("2 => \(john.failedClasses)") // [main.Grade(letter: "F", points: 0.0, credits: 0.0)]
print(john.grades) //[main.Grade(letter: "F", points: 0.0, credits: 0.0), main.Grade(letter: "A", points: 10.0, credits: 10.0)]


/* 
  2. Preventing inheritance 
  - disallow subclasses of a particular class.
  - `final` keyword for you guarantee a class will never get a subclass
*/

final class FinalStudent: Person {}
class FinalStudentAthlete: FinalStudent {}
// Build error! => `error: inheritance from a final class 'FinalStudent'`

class AnotherStudent: Person {
  final func recordGrade(_ grade: Grade) {}
}

class AnotherStudentAthlete: AnotherStudent {
  override func recordGrade(_ grade: Grade) {}
  // Build error! => error: instance method overrides a 'final' instance method
}


/* 
  3. Class lifecycle
  - object are created in memory and stored on the `heap`
  - object on heap are `not automatically destroyed`
  - `reference counting or retain count` is machanism for deciding clean up unused objects on the heap
    - Each object has a `reference count` 
        - incremented for each constant or variable with a reference to that object.
        - decremented each time a reference is removed
    - when a reference count reaches zero, that mean the object is now abandoned. when that happens, Swift will clean up the object.

  *** you don't have to do any work yourself to increase or decrease the object reference count, 
      That's because Swift has a feature known as `automatic reference counting` ***
*/

var someone = Person(firstName: "Johnny", lastName: "Appleseed")
// Person object has a reference count of 1 (someone variable)

var anotherSomeone: Person? = someone
// Reference count 2 (someone, anotherSomeone)

var lotsOfPeople = [someone, someone, anotherSomeone, someone]
// Reference count 6 (someone, anotherSomeone, 4 references in lotsOfPeople)

anotherSomeone = nil
// Reference count 5 (someone, 4 references in lotsOfPeople)

lotsOfPeople = []
// Reference count 1 (someone)


/*
  4. Deinitialization
  - special method on classes that runs when an object's reference count 
    reaches zero but `before` Swift removes the object from memory
*/

 class Person1 {
   var firstName: String
   var lastName: String

  init(firstName: String, lastName: String) {
    self.firstName = firstName
    self.lastName = lastName
  }

   deinit {
     print("\(firstName) \(lastName) is being removed from memory!")
   }
 }

 var someone1 = Person1(firstName: "Funny", lastName: "Dev")
 // Person1 object has a reference count of 1 (someone1 variable)

// Now we create another object and replace someone with that reference.
 someone1 = Person1(firstName: "Funny", lastName: "Dev")
 // old object is reference count 0, it's remove the object from memory


 /* 5. Retain cycles and weak references */

 class Student1 {
   var firstName1: String
   var lastName1: String
   weak var partner: Student1?

  init(firstName1: String, lastName1: String) {
    
    self.firstName1 = firstName1
    self.lastName1 = lastName1
  }

  deinit {
    print("\(firstName1) is being deallocated!")
  }
 }

var alice: Student1? = Student1(firstName1: "Alice",
                              lastName1: "Appleseed")
var bob: Student1? = Student1(firstName1: "Bob",
                            lastName1: "Appleseed")

alice?.partner = bob
bob?.partner = alice
alice = nil
bob = nil





