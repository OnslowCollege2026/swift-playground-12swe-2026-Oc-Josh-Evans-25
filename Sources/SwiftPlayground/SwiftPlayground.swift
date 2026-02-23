// The Swift Programming Language
// https://docs.swift.org/swift-book

func menuChoice() {
    print("==== Egg Shop ====")
    print("   1. Add eggs")
    print("   2. Sell eggs")
    print("   3. Show current stock")
    print("   4. Show total eggs sold")
    print("   5. Exit")
    print("   Choose an option:")
    if let choice = readLine(), let choiceNumber = Int(choice) {
        if choiceNumber == 1 {
            print("How many eggs do you want to add?") 
            let amountAdding = Int(readLine()!)!
            addEggs(currentStock: 0, amount: amountAdding)
        } else {
            print("Invalid choice. Please enter number from choices 1-5.")
        } 
    }
}

func addEggs(currentStock: Int, amount: Int) -> Int {
    return currentStock + amount
}

@main
struct SwiftPlayground {
    static func main() {
        var eggsInStock = 0
        var eggsSold = 0
        
        var menuRunning = true
        while menuRunning == true {
            menuChoice()
        }
    }
}