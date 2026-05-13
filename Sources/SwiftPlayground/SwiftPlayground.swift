// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

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

func kumaraSale(kumaraCost: Double, bagCost: Double, kumaraWeight: Double, bagAmount : Double) -> Double {
    let totalBagCost = bagAmount * bagCost
    let totalCost = (kumaraWeight * kumaraCost) + totalBagCost
    print("Your total cost is $\(totalCost).")
    return totalCost
} 

func rowTotal(in matrix: [[Int]], row: Int) -> Int {
    guard row >= 0 && row < matrix.count else { return 0 }
    return matrix[row].reduce(0, +)
}

// To-do:
// - Need to change to be guard lets instead of if lets
// - Add summary info
// - Finish foreach loop that prints the sales
// - Boundary testing
// - Add comments
// - Modify to prevent crashs for invalid testing

@main
struct SwiftPlayground {
    static func main() {
        var kumaraStock = 15.0

        let kumaraCost = 3.0

        let bagStock = 5000.0

        let bagCost = 0.2

        // Stores the cost of each sale, bag amount, and 
        var sales: [[Double]] = [
            [],
            [],
            [],
        ]

        var menuRunning = true
        while menuRunning == true {
            let menuOption = menuChoice()
            if menuOption == 1 {
                if kumaraStock > 0 {
                    print("Kumara are $3 per kilogram.")
                    print("How many Kilograms of Kumara do you want to buy?")
                    if let input = readLine(), let kumaraWeight = Double(input), kumaraWeight <= kumaraStock {
                        sales[0].append(kumaraWeight)
                        print("How many bags would you like? Each bag can hold 5kg of Kumara.")
                        if let input2 = readLine(), let bagAmount = Double(input2), bagAmount <= bagStock {
                            if bagAmount < kumaraWeight / 5 {
                                print("Invalid amount of bags.") 
                                print("Please check you have at least 1 bag per 5kg of Kumara and try again.")
                            } else {
                                sales[1].append(bagAmount)
                                let saleResult = kumaraSale(kumaraCost: kumaraCost, bagCost: bagCost, kumaraWeight: kumaraWeight, bagAmount: bagAmount)
                                sales[2].append(saleResult) 
                                print(sales)
                            }
                        } 
                    }
                }
            } else if menuOption == 2 {
                let numberInColumn = sales[0].count
                print("These are sales that have been made so far: \n")

                for i in 0..<numberInColumn {
                    print("Sale \(i + 1): ")
                    
                    let kumaraWeightRow = sales[0]
                    let bagAmountRow = sales[1]
                    let saleCostRow = sales[2]

                    print("Purchase amount: $\(saleCostRow)")
                    print("Kumara Weight Bought: \(kumaraWeightRow)kg ")
                    print("Amount of Bags: \(bagAmountRow) \n")
                } 
            } else if menuOption == 3 {
                print("There is currently \(kumaraStock)kg of Kumara left.")
            } else if menuOption == 4 {
                // let kumaraPerBag = kumaraSoldTotal / bagsUsed
            } else if menuOption == 5 {
                print("How much Kumara in kilograms will you add to the stock?")
                if let input = readLine(), let kumaraAdded = Double(input), kumaraAdded > 0 {
                    kumaraStock += kumaraAdded
                    print("You added \(kumaraAdded)kg of Kumara to the stock.")
                } else {
                    print("Invalid number. Please try again.")
                }
            } else if menuOption == 6 {
                menuRunning = false
            } else {
                print("Invalid option. Please try again if you made a mistake.")
            }
        }
    }
}