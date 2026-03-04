// The Swift Programming Language
// https://docs.swift.org/swift-book

func columnTotal(in table: [[Int]], column: Int) -> Int {
    guard column >= 0 && column < table.count else { return 0 }
    return table[column].reduce(0, +)
}

func maxValue(in table: [[Double]]) {
    var largestValue = table[0][0]

    for row in table {
            for value in row {
                if value > largestValue {
                    largestValue = value
                }
            }
        }
}

@main
struct SwiftPlayground {
    static func main() {
        var valuesPrinted = 0

        let temperatures = [
            [17, 18, 21, 16],
            [11, 13, 9, 10],
            [4, 6, 7, 7]
        ]

        let table = [
            [2, 4, 6],
            [8, 10, 12],
            [14, 16, 18]
        ]

        let table2 = [
            [3, 5, 7, 9],
            [2, 4],
            [8, 6, 1],
            [10]
        ]

        let readings = [
            [1.5, 3.2, 2.8],
            [7.1],
            [4.4, 6.0],
            [5.9, 8.3, 0.7, 2.2]
        ]

        print(temperatures[0])
        print(temperatures[1][2])
        print(temperatures[2][0])

        let averageTemp = (temperatures[1][0] + temperatures[1][1] + temperatures[1][2] + temperatures[1][3]) / 4
        print(averageTemp)
        print("")

        for row in table {
            for value in row {
                print(value)
                valuesPrinted += value
            }
        }

        print("")
        print(valuesPrinted)
        print("")

        print(columnTotal(in: table2, column: 0))
        print(columnTotal(in: table2, column: 1))

        print("")
        print(maxValue(in: readings))
    }
}