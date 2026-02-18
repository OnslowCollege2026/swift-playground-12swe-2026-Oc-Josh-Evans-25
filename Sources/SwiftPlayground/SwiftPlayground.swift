// The Swift Programming Language
// https://docs.swift.org/swift-book

func menuChoice() {
    var userChoice = 0
    print("==== Egg Shop ====")
    print("   1. Add eggs")
    print("   2. Sell eggs")
    print("   3. Show current stock")
    print("   4. Show total eggs sold")
    print("   5. Exit")
    print("   Choose an option:")
    if let choice = readLine(), let choiceNumber = Int(choice) {
        if choiceNumber == 1 {
            userChoice = choiceNumber
        } else {
            print("Invalid choice. Please enter number from choices 1-5.")
        } 
    }
}

@main
struct SwiftPlayground {
    static func main() {
        
    }
}