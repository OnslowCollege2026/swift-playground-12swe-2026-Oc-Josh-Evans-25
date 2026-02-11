// The Swift Programming Language
// https://docs.swift.org/swift-book

func printRoomIntro() {
    print("This program is for testing functions,")
    print("You can see this from the fact this text is from a function.")
}

func printDivider() {
    print("--------")
}

func printUnitsNote() {
    print("All measurements are in metres.")
}

func printGoodbye() {
    print("Done. Thank you for using this program.")
}

@main
struct SwiftPlayground {
    static func main() {
        printRoomIntro()

        printDivider()
        print("Summary here")
        printDivider()

        printUnitsNote()

        printGoodbye()
    }
}