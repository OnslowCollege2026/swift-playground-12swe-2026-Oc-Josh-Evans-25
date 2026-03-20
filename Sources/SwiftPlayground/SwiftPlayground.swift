// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Gets user response and checks whether number is valid.
/// - Parameters:
///   - error: Error message if value is invalid.
///   - minNumber: smallest valid number option from the menu.
///   - maxNumber: largest valid number option from the menu.
/// - Returns: 
func userResponse(error: String, minNumber: Int, maxNumber: Int) -> Int {
    var gettingResponse = true
    while gettingResponse {
        if let response = readLine(), let optionResponse = Int(response) {
            if optionResponse >= minNumber && optionResponse <= maxNumber {
                gettingResponse = false
                return optionResponse
            } else {
                print(error)
            }
        } else {
            print(error)
        }
    }
}


func menuChoice() -> Int {
    print("==== Egg Shop ====")
    print("   1. Add eggs")
    print("   2. Sell eggs")
    print("   3. Show current stock")
    print("   4. Show total eggs sold")
    print("   5. Exit")
    print("   Choose an option:")
    let menu = userResponse(error: "Invalid number. Please enter a number from 1 to 5.", minNumber: 1, maxNumber: 5)
    return menu
}

func addEggs(currentStock: Int, amount: Int) -> Int {
    print("How many eggs would you like to add to the current amount?")
    let eggsAdding = userResponse(error: "You have added too many eggs already.", minNumber: 1, maxNumber: 1000)
    print("Eggs have been added.")
    return eggsAdding
}

func sellEggs(currentStock: Int, amount: Int) -> Int? {
    print("How many eggs would you like to sell?")
    let eggsSelling = userResponse(error: "You have no eggs left, please try again when you have eggs.", minNumber: 1, maxNumber: 50)
    print("Eggs have been sold.")
    return eggsSelling
}

func updateSoldCount(currentSold: Int) {
    print("You have sold \(currentSold) eggs in total.")
}

func stockMessage(stock: Int) {
    print("You currently have \(stock) eggs.")
}

@main
struct SwiftPlayground {
    static func main() {
        var eggsSold = 0
        var eggsInStock = 0

        var menuRunning = true
        while menuRunning == true {
            let menuOption = menuChoice()
            if menuOption == 1 {
                eggsInStock = addEggs(currentStock: eggsInStock, amount: eggsInStock)
                print(eggsInStock)
            } else if menuOption == 2 {
                eggsSold = sellEggs(currentStock: eggsInStock, amount: eggsSold)!
                eggsInStock = eggsInStock - eggsSold
                
                print(eggsInStock)
            } else if menuOption == 3 {
                stockMessage(stock: eggsInStock)
            } else if menuOption == 4 {
                updateSoldCount(currentSold: eggsSold)
            } else if menuOption == 5 {
                menuRunning = false
            } else {
                print("Invalid option. Please try again if you made a mistake.")
            }
        }
    }
}