// The Swift Programming Language
// https://docs.swift.org/swift-book

func printBoard(_ board: [[String]]) {
    
}

@main
struct SwiftPlayground {
    static func main() {
        let size = 6
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

        ocean[1][3] = "S"
        ocean[2][4] = "S"
        ocean[5][0] = "S"
        ocean[4][3] = "S"

        printBoard(ocean)
    }
}