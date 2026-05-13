// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

/// Gets user response and checks whether number is valid.
/// - Parameters:
///   - error: Error message if value is invalid.
///   - minNumber: smallest valid number option from the menu.
///   - maxNumber: largest valid number option from the menu.
/// - Returns: The user input as an int.
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

/// Uses userResponse function to let them choose which option by entering a number from 1 to 6.
/// Returns: 
func menuChoice() -> Int {
    print("==== Kumara Stall ====")
    print("   1. Make a sale")
    print("   2. Sales Records")
    print("   3. Show current stock")
    print("   4. Summary information")
    print("   5. Add Kumara to stock")
    print("   6. Exit")
    print("   Choose an option 1-6:")
    let menu = userResponse(error: "Invalid number. Please enter a number from 1 to 6.", minNumber: 1, maxNumber: 6)
    return menu
}

/// Calculates how much the total cost of Kumaras and bags.
/// -  Parameters:
///   - kumaraCost: Default kumaraCost
///   - bagCost: Default bagCost
///   - kumaraWeight: How much weight the user is buying inputted into the function.
///   - bagAmount: Amount of bags the user is buying.
/// Returns: The total cost based on how Kumara they're buying and how many bags they're buying.
func kumaraSale(kumaraCost: Double, bagCost: Double, kumaraWeight: Double, bagAmount : Double) -> Double {
    let totalBagCost = bagAmount * bagCost
    let totalCost = (kumaraWeight * kumaraCost) + totalBagCost
    print("Your total cost is $\(totalCost).")
    return totalCost
} 

/// Gets the total of a row in a multidimensional array.
/// -  Parameters:
///    - matrix: the 2d array being used
///    - row: which row to get the total from
/// Returns: The total value of the whole row added together.
func rowTotal(in matrix: [[Double]], row: Int) -> Double {
    guard row >= 0 && row < matrix.count else { return 0 }
    return matrix[row].reduce(0, +)
}

// To-do:
// - Add comments
// - Invalid testing if have the time?

@main
struct SwiftPlayground {
    static func main() {
        // Default amount of stock when the program starts
        var kumaraStock = 15.0

        // The finite cost of each kg of Kumara
        let kumaraCost = 3.0

        // The total amount of bags in stock for the user.
        let bagStock = 5000.0

        // The cost per bag needed to hold 5kg of Kumara
        let bagCost = 0.2

        // Stores each sales, kumara weight, bag amount, and price.
        var sales: [[Double]] = [
            [], // Kumara weight bought
            [], // Bags Bought
            [], // Total price of Sale
        ]

        // Loop that runs until the user chooses to exit.
        var menuRunning = true
        while menuRunning == true {
            // Calls the menu choice function to let the user choose which option to use.
            let menuOption = menuChoice()
            
            // Accords to the make a sale option in the menu.
            if menuOption == 1 {
                // Ensures that there is still stock left to buy, gives user an error if it isn't.
                if kumaraStock > 0 {
                    // Gets user input for how much Kumara they want to buy and gives them an error if they enter a number lower than 0.
                    print("Kumara are $3 per kilogram.")
                    print("How many Kilograms of Kumara do you want to buy?")
                    guard let input = readLine(), let kumaraWeight = Double(input), kumaraWeight > 0, kumaraWeight <= kumaraStock else {
                        print("Please enter a valid number of Kumara that you want to buy.")
                        return
                    }
                    // If there is no error, the program proceeds and the kumaraWeight is added into the first row of the sales 2d Array.
                    sales[0].append(kumaraWeight)

                    // Gets user input for amount of bags the user is buying 
                    print("How many bags would you like? Each bag can hold 5kg of Kumara.") 
                    guard let input2 = readLine(), let bagAmount = Double(input2), bagAmount > 0, bagAmount <= bagStock else {
                        print("Invalid amount of bags.") 
                        print("Please check you have at least 1 bag per 5kg of Kumara and try again.")
                        return
                    }

                    // Checks if user has too much Kumara in one bag, the limit is 5kg per bag.
                    // If there is no problem, the program adds the amount of bags they bought 
                    // and how much the total sale costed into seperate rows of the 2d sales array.
                    if bagAmount < kumaraWeight / 5 {
                        print("Invalid amount of bags.") 
                        print("Please check you have at least 1 bag per 5kg of Kumara and try again.")
                    } else {
                        sales[1].append(bagAmount)
                        let saleResult = kumaraSale(kumaraCost: kumaraCost, bagCost: bagCost, kumaraWeight: kumaraWeight, bagAmount: bagAmount)
                        sales[2].append(saleResult)
                    }
                } else {
                    print("Stock is empty.")
                }
            
            // Accords to the sale records option in the menu.
            } else if menuOption == 2 {
                // Finds out how many columns there are.
                let numberInColumn = sales[0].count
                print("These are sales that have been made so far: \n")

                // Loops through each column and prints out details of each sale.
                for col in 0..<numberInColumn {
                    print("Sale \(col + 1): ")
                    
                    let kumaraWeightRow = sales[0][col]
                    let bagAmountRow = sales[1][col]
                    let saleCostRow = sales[2][col]

                    print("Purchase amount: $\(saleCostRow)")
                    print("Kumara Weight Bought: \(kumaraWeightRow)kg ")
                    print("Amount of Bags: \(bagAmountRow) \n")
                } 

            // Accords to the menu option that shows user current Kumara stock in kgs.
            } else if menuOption == 3 {
                print("There is currently \(kumaraStock)kg of Kumara left.")

            // Accords to the summary information option.
            } else if menuOption == 4 {
                // Finds the total of the Kumara weight bought and total bags bought using the rowTotal function.
                let totalKumaraWeight = rowTotal(in: sales, row: 0)
                let totalBagsBought = rowTotal(in: sales, row: 1)

                // Calculates amount of Kumara per bag using kumara weight sold / number of bags used = how much kumara to put in each bag
                let kumaraPerBag = (totalKumaraWeight / totalBagsBought).rounded()
                print("The amount of Kumara that we should have for pre-bagged Kumara sales is \(kumaraPerBag)kg.")

            // Accords to the option that allows the user to add more Kumara to the stock.
            } else if menuOption == 5 {
                print("How much Kumara in kilograms will you add to the stock?")
                guard let input = readLine(), let kumaraAdded = Double(input), kumaraAdded > 0 else {
                    print("Invalid number. Please try again.")
                    return
                } 
                kumaraStock += kumaraAdded
                print("You added \(kumaraAdded)kg of Kumara to the stock.")

            // Stops the program if the user chooses to do so.
            } else if menuOption == 6 {
                menuRunning = false
            } else {
                print("Invalid option. Please try again if you made a mistake.")
            }
        }
    }
}