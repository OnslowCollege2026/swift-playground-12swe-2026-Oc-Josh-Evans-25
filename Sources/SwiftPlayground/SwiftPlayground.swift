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
    let menu = userResponse(error: "Invalid number. Please enter a number from 1 to 5.", minNumber: 1, maxNumber: 6)
    return menu
}

func kumaraSale(kumaraStock: Double) -> Double {
    var totalCost = 0.0
    let kumaraCost = 3.0
    let bagCost = 0.2

    if kumaraStock > 0 {
        print("Kumara are $3 per kilogram.")
        print("How much do the Kumara you're buying weigh?")
        if let input = readLine(), let kumaraWeight = Double(input), kumaraWeight < kumaraStock {
            
            // Fix rounding issue so that bag amount divides and then is rounded up to correct number
            
            let bagAmount = (kumaraWeight / 5.3).rounded() 
            print(bagAmount)
            // totalCost = kumaraWeight * kumaraCost + (bagCost * bagAmount)
            // print("Your total cost is $\(totalCost).")
        }
    }
    return totalCost
}

@main
struct SwiftPlayground {
    static func main() {
        var kumaraStock = 10.0

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
                sales.append(kumaraSale(kumaraStock: kumaraStock))
                print(sales)
            } else if menuOption == 2 {
                
            } else if menuOption == 3 {
                print("There is currently \(kumaraStock)kg of Kumara left.")
            } else if menuOption == 4 {
                
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