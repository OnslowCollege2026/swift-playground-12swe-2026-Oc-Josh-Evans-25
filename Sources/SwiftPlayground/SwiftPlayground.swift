// The Swift Programming Language
// https://docs.swift.org/swift-book

func print(board: [[String]]) {
    board.forEach{ line in 
        print("\(line[0]) | \(line[1]) | \(line[2])")
        print("--+---+--")
    }
}

func askForPosition(board: [[String]]) -> [Int] {
    while true {
        print("Please enter the row number 1-3: ")
        if let userInput = readLine(), var rowNumber = Int(userInput) {
            print("Please enter the column number 1-3: ")
            rowNumber = rowNumber - 1
            if let userInput = readLine(), var columnNumber = Int(userInput) {
                columnNumber = columnNumber - 1
                if board[rowNumber][columnNumber] == "." {
                    return [rowNumber, columnNumber]
                } else {
                    print("A naught or a cross has already been placed in that position. \n")
                }
            }
        }
    }
}

@main
struct SwiftPlayground {
    static func main() {
        var player = "O"
        var gameRunning = true

        var board = [
            [".",".","."], // row 0
            [".",".","."], // row 1
            [".",".","."] // row 2
        ]
        print(board: board)


        while gameRunning == true {
            // Ask for user's move.
            let position = askForPosition(board: board)
            board[position[0]][position[1]] = player
            
            if player == "O" {
                player = "X"
            } else if player == "X" {
                player = "O"
            }

            print(board: board)
        }
        

        // // First move: 0 in middle.
        // board[1][1] = "O"
        // print(board: board)

        // // Second move: X in the top left.
        // board[0][0] = "X"
        // print(board: board)

        // // Third move: 0 in the top right.
        // board[0][2] = "O"
        // print(board: board)

        // // Fourth move: X in the bottom left.
        // board[2][0] = "X"
        // print(board: board)

        // // Fifth move: 0 in middle left.
        // board[1][0] = "O"
        // print(board: board)

        // // Sixth move: X in middle right.
        // board[1][2] = "X"
        // print(board: board)

        // // Seventh move: 0 in bottom middle.
        // board[2][1] = "O"
        // print(board: board)

        // // Eighth move: X in bottom right.
        // board[2][2] = "X"
        // print(board: board)

        // // Final move: O in top middle.
        // board[2][0] = "O"
        // print(board: board)


    }
}