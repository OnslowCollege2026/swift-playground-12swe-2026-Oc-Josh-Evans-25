// The Swift Programming Language
// https://docs.swift.org/swift-book

/// Calculates the area of the room.
/// - Parameters:
///   - length
///   - width
/// - Returns: The room area as a double.
func roomArea(length: Double, width: Double) -> Double {
    return length * width
}

/// Calculates the volume of the room.
/// - Parameters:
///   - length: length of room in metres
///   - width: width of room in metres
///   - height: height of room in metres
/// - Returns: The room volume as a double. 
func roomVolume(length: Double, width: Double, height: Double) -> Double {
    return length * width * height
}

/// Checks if room is smaller than 60 metres.
/// - Parameters:
///   - volume: volume of room in metres
/// - Returns: True if volume is smaller than 60.
func isRoomSmall(volume: Double) -> Bool {
    return volume < 60
}

/// Calculates the height reduced by a percent.
/// - Parameters:
///   - original: original volume as a double
///   - reductionPercent: the percentage volume is being reduced by
/// - Returns: original volume times by reduction percentage.
func reducedHeight(original: Double, reductionPercent: Double) -> Double {
    let multiplier = (100.0 - reductionPercent) / 100.0
    return original * multiplier
}

@main
struct SwiftPlayground {
    static func main() {

    }
}