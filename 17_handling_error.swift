import Foundation

/* Error Handling */

class Pastry {
    let flavor: String
    var numberOnHand: Int
    
    init(flavor: String, numberOnHand: Int) {
        self.flavor = flavor
        self.numberOnHand = numberOnHand
    }
}
// if you would like to use custom type to throwing error, that type must be conform `Error` protocol.
enum BakeryError: Error {
    case tooFew(numberOnHand: Int), doNotSell, wrongFlavor
    case inventory, noPower
}


// MARK: - Throwing Error
class Bakery {
    var itemsForSale = [
        "Cookie": Pastry(flavor: "ChocolateChip", numberOnHand: 20),
        "PopTart": Pastry(flavor: "WildBerry", numberOnHand: 13),
        "Donut" : Pastry(flavor: "Sprinkles", numberOnHand: 24),
        "HandPie": Pastry(flavor: "Cherry", numberOnHand: 6)
    ]
    
    func open(_ now: Bool = Bool.random()) throws -> Bool {
        
        guard now else {
            throw Bool.random() ? BakeryError.inventory
            : BakeryError.noPower
        }
        return now
    }
    
    func orderPastry(item: String,amountRequested: Int,flavor: String)  throws  -> Int {
        guard let pastry = itemsForSale[item] else {
            throw BakeryError.doNotSell
        }
        guard flavor == pastry.flavor else {
            
            throw BakeryError.wrongFlavor
        }
        guard amountRequested <= pastry.numberOnHand else {
            throw BakeryError.tooFew(numberOnHand: pastry.numberOnHand)
        }
        pastry.numberOnHand -= amountRequested
        
        return pastry.numberOnHand
    }
}

let bakery = Bakery()
/*
 
 bakery.open()
 bakery.orderPastry(item: "Albatross", amountRequested: 1, flavor: "AlbatrossFlavor")
 
 // error warning: > Call can throw but is not marked with 'try'
 
 */


// MARK: - Handling errors

// do{ try... } catch ...{ // error detail }
do {
    try bakery.open()
    try bakery.orderPastry(item: "Albatross", amountRequested: 1, flavor: "AlbatrossFlavor")
} catch BakeryError.inventory, BakeryError.noPower {
    print("Sorry, the bakery is now closed.")
} catch BakeryError.doNotSell {
    print("Sorry, but we don’t sell this item.")
} catch BakeryError.wrongFlavor {
    print("Sorry, but we don’t carry this flavor.")
}catch BakeryError.tooFew {
    print("Sorry, we don’t have enough items to fulfill your order.")
}

/*
 not looking at the detailed error. use try optional `try?`
 - the return type is Optional[Type]
 EX. open() throw -> Int
 let a = try? open() // Optional[Int]
 */
let openBakery = try? bakery.open(false) // nil
let remaning = try? bakery.orderPastry(item: "Albatross", amountRequested: 1, flavor: "AlbatrossFlavor") // nil