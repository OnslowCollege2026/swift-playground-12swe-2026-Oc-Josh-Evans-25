// The Swift Programming Language
// https://docs.swift.org/swift-book

func showArea() {
    let width = 3
    let length = 4
    let area = width * length
    print(area)
}

@main
struct SwiftPlayground {
    static func main() {
        if true {
            let note = "Inside"
            print(note)
        }

        // print(note) // Outside if statement it was defined in

        var status = ""

        if true {
            status = "true"
            print(status)
        }

        print(status)

        print(showArea())
    }
}