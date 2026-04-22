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
    let menu = userResponse(error: "Invalid number. Please enter a number from 1 to 5.", minNumber: 1, maxNumber: 5)
    return menu
}

func kumaraSale(kumaraStock: Int) -> Double {
    var totalCost = 0.0
    if kumaraStock > 0 {
        print("How much does your Kumara weigh? (Kilograms)")
        if let input = readLine(), let kumaraWeight = Double(input) {
            totalCost = kumaraWeight * 3 + 0.2
        }
    }
    return totalCost
}

@main
struct SwiftPlayground {
    static func main() {
        var kumaraStock = 10

        var menuRunning = true
        while menuRunning == true {
            let menuOption = menuChoice()
            if menuOption == 1 {
                print(kumaraSale(kumaraStock: kumaraStock))
            } else if menuOption == 2 {
                
            } else if menuOption == 3 {
                
            } else if menuOption == 4 {
                
            } else if menuOption == 5 {

            } else if menuOption == 6 {
                menuRunning = false
            } else {
                print("Invalid option. Please try again if you made a mistake.")
            }
        }
    }
}