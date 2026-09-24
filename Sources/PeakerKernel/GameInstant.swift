/// A simulated instant in America/Chicago civil time. Not read from the device clock.
public struct GameInstant: Hashable, Sendable, Codable, Equatable, CustomStringConvertible {
    public let date: CivilDate
    public let hour: Int
    public let minute: Int
    public let second: Int

    public init(date: CivilDate, hour: Int, minute: Int, second: Int) {
        self.date = date
        self.hour = hour
        self.minute = minute
        self.second = second
    }

    public var centralLabel: String {
        String(format: "%@ %02d:%02d:%02d CT", date.iso, hour, minute, second)
    }

    public var description: String { centralLabel }
}
