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

func kumaraSale(kumaraStock: Double, kumaraCost: Double, bagCost: Double, kumaraWeight: Double) -> Double {
    var totalCost = 0.0
    let bagWeights = 2.5

    let bagAmount = (kumaraWeight / bagWeights).rounded()
    let totalBagCost = bagAmount * bagCost
    totalCost = (kumaraWeight * kumaraCost) + totalBagCost
    print("Your total cost is $\(totalCost).")
    return totalCost
} 

@main
struct SwiftPlayground {
    static func main() {
        var kumaraStock = 15.0

        let kumaraCost = 3.0

        let bagCost = 0.2

        // Stores the cost of each sale, bag amount, and 
        var sales = [0.0]
        sales.removeFirst()

        var kumaraWeightBought = [0.0]
        kumaraWeightBought.removeFirst()

        var kumaraBagsBought = [0]
        kumaraBagsBought.removeFirst()

        var menuRunning = true
        while menuRunning == true {
            let menuOption = menuChoice()
            if menuOption == 1 {
                // Fully hash out buying system so user can grab kumara, weigh them, and then calculate the cost
                
                if kumaraStock > 0 {
                    print("Kumara are $3 per kilogram.")
                    print("How much do the Kumara you're buying weigh?")
                    if let input = readLine(), let kumaraWeight = Double(input), kumaraWeight <= kumaraStock {
                        let saleResult = kumaraSale(kumaraStock: kumaraStock, kumaraCost: kumaraCost, bagCost: bagCost, kumaraWeight: kumaraWeight)
                        sales.append(saleResult)
                        print(sales)    
                    }
                }
            } else if menuOption == 2 {
                // Print off each individual sale
                
            } else if menuOption == 3 {
                print("There is currently \(kumaraStock)kg of Kumara left.")
            } else if menuOption == 4 {
                // kumaraWeightSold / number of bags used = how much kumara to put in each bag
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