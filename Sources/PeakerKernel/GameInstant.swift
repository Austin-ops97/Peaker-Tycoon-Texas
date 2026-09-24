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

    /// Adds civil seconds for the phone's displayed clock. This does not step `CampaignKernel`.
    public func adding(seconds delta: Int) -> GameInstant {
        var total = hour * 3_600 + minute * 60 + second + delta
        var cursor = date
        while total < 0 {
            total += 86_400
            cursor = cursor.addingDays(-1)
        }
        let extraDays = total / 86_400
        total %= 86_400
        if extraDays > 0 {
            cursor = cursor.addingDays(extraDays)
        }
        return GameInstant(
            date: cursor,
            hour: total / 3_600,
            minute: (total % 3_600) / 60,
            second: total % 60
        )
    }

    public var description: String { centralLabel }
}
