// The Swift Programming Language
// https://docs.swift.org/swift-book

func printBoard(_ board: [[String]]) {
    var columnLabels = ""
    for i in 1...board.count {
        columnLabels = columnLabels + "\(i) "
    }
    print(columnLabels)

    var rowNumber = 1
    for row in board {
        var rowString = "\(rowNumber)"
        for cell in row {
            rowString = rowString + cell + ""
        }
        rowNumber = rowNumber + 1
        print(rowString)
    }
}

/// Parameters:
/// - row: The row index for the guess.
/// - col: The column index for the guess.
/// - ocean: The hidden ships grid.
/// - guesses: The player's current guesses grid.
///
/// Returns: The updated guesses grid after the guess is applied.
func processGuess(row: Int, col: Int, ocean: [[String]], guesses: [[String]]) -> [[String]] {
    guard row >= 1, row <= ocean.count, col >= 1, col <= ocean[0].count else {
        print("Your guess is invalid. Try again.")
        return guesses
    }

    guard guesses[row - 1][col - 1] == "O" || guesses[row - 1][col - 1] == "X" else {
        print("You have already guessed that position. Try again.")
        return guesses
    }

    guard guesses[row - 1][col - 1] != "~" else {
        print("MISS!")
        var newGuesses = guesses
        newGuesses[row - 1][col - 1] = "O"
        return newGuesses
    }

    print("You've sunk my battleship!")
    var newGuesses = guesses
    newGuesses[row - 1][col - 1] = "O"
    return newGuesses
}


@main
struct SwiftPlayground {
    static func main() {
        // The size of the board.
        let size = 6

        // The array of the board you are using.
        var ocean = Array(repeating: Array(repeating: "~", count: size), count: size)

        // Guesses made by the user.
        var guesses = Array(repeating: Array(repeating: "~", count: size), count: size)

        ocean[1][3] = "S"
        ocean[2][4] = "S"
        ocean[5][0] = "S"
        ocean[4][3] = "S"

        printBoard(ocean)

        
    }
}