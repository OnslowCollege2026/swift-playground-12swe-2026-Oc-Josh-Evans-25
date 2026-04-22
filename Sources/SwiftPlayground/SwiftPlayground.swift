// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

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

@main
struct SwiftPlayground {
    static func main() {
       
    }
}