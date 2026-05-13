// The Swift Programming Language
// https://docs.swift.org/swift-book

func rowTotal(in matrix: [[Double]], row: Int) -> Double {
    guard row >= 0 && row < matrix.count else { return 0 }
    return matrix[row].reduce(0, +)
}

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

        let salesData: [[Double]] = [
        [10, 20, 30], // Purchase Price
        [15, 25, 35], // KumaraWeight
        [20, 30, 40]  // BagsBought
        ]

        let averageKumaraWeight = rowTotal(in: salesData, row: 0)
        let averageBagsBought = rowTotal(in: salesData, row: 1)

        let kumaraPerBag = averageKumaraWeight / averageBagsBought
        print(kumaraPerBag)
            
        let numCols = salesData[0].count

        print("--- Printing Column by Column ---")
        
        // Outer loop: Columns
        for col in 0..<numCols {
            print("Sale \(col + 1):")
            
            let price = salesData[0][col]
            let weight = salesData[1][col]
            let bags = salesData[2][col]

            print("Price: \(price)")
            print("WeightBought: \(weight)")
            print("BagsBought: \(bags) \n")
        }
    }
}