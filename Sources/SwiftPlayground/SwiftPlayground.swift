// The Swift Programming Language
// https://docs.swift.org/swift-book

let volume = 3.0

func roomVolume() -> Double {
    return volume
}

func printArea(length: Double, width: Double) -> String {
    let area = length * width
    return "The area of the room is \(area)m²"
}

@main
struct SwiftPlayground {
    static func main() {
        print("\(roomVolume())m³")

        printArea(length: 3.0, width: 4.5)
    }
}