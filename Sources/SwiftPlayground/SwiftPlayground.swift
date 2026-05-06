// The Swift Programming Language
// https://docs.swift.org/swift-book

@main
struct SwiftPlayground {
    static func main() {
        var sales: [[Double]] = [[], [], []]
        
        let bagStock = 5000.0

        print("How many kilograms of Kumara do you want to buy?")
        guard let input = readLine(),
        let kumaraWeight = Double(input) else {
            return
        }
        sales[0].append(kumaraWeight)

        print("How many bags would you like?")
        guard let input2 = readLine(),
        let bagAmount = Double(input2),
        bagAmount <= bagStock else {
            return
        }

        if bagAmount < kumaraWeight / 5 {

        } else {
            sales[1].append(bagAmount) 
            print(sales)
        }

        sales.forEach { sale in
            sale.forEach { amount in
                print("Amount bought: \(amount)")
            }
        }
    }
}

// if kumaraStock > 0 {
//                     print("Kumara are $3 per kilogram.")
//                     print("How many Kilograms of Kumara do you want to buy?")
//                     if let input = readLine(), let kumaraWeight = Double(input), kumaraWeight <= kumaraStock {
//                         sales[0].append(kumaraWeight)
//                         print("How many bags would you like? Each bag can hold 5kg of Kumara.")
//                         if let input2 = readLine(), let bagAmount = Double(input2), bagAmount <= bagStock {
//                             if bagAmount < kumaraWeight / 5 {
//                                 print("Invalid amount of bags.") 
//                                 print("Please check you have at least 1 bag per 5kg of Kumara and try again.")
//                             } else {
//                                 sales[1].append(bagAmount)
//                                 let saleResult = kumaraSale(kumaraCost: kumaraCost, bagCost: bagCost, kumaraWeight: kumaraWeight, bagAmount: bagAmount)
//                                 sales[2].append(saleResult) 
//                                 print(sales)
//                             }
//                         } 
//                     }