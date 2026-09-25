import Foundation

public enum CivilDateError: Error, Equatable, CustomStringConvertible {
    case invalidISO(String)
    case impossible(String)

    public var description: String {
        switch self {
        case .invalidISO(let raw): return "Invalid civil date '\(raw)'."
        case .impossible(let raw): return "Impossible civil date '\(raw)'."
        }
    }
}

public enum Weekday: Int, Codable, Sendable, Equatable {
    case sunday = 0
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
}

/// Gregorian civil date. The kernel never reads a wall clock to obtain one.
public struct CivilDate: Hashable, Sendable, Comparable, CustomStringConvertible {
    public let year: Int
    public let month: Int
    public let day: Int

    public init(year: Int, month: Int, day: Int) {
        self.year = year
        self.month = month
        self.day = day
    }

    public init(iso: String) throws {
        let parts = iso.split(separator: "-")
        guard parts.count == 3,
              let year = Int(parts[0]),
              let month = Int(parts[1]),
              let day = Int(parts[2])
        else {
            throw CivilDateError.invalidISO(iso)
        }
        guard CivilDate.isValid(year: year, month: month, day: day) else {
            throw CivilDateError.impossible(iso)
        }
        self.year = year
        self.month = month
        self.day = day
    }

    public var iso: String {
        String(format: "%04d-%02d-%02d", year, month, day)
    }

    public var description: String { iso }

    public static func < (lhs: CivilDate, rhs: CivilDate) -> Bool {
        lhs.julianDayNumber < rhs.julianDayNumber
    }

    public func addingDays(_ days: Int) -> CivilDate {
        CivilDate(julianDayNumber: julianDayNumber + days)
    }

    public var weekday: Weekday {
        let delta = julianDayNumber - 2_440_588
        let index = (delta + 4) % 7
        let normalized = index >= 0 ? index : index + 7
        return Weekday(rawValue: normalized) ?? .sunday
    }

    public var julianDayNumber: Int {
        let a = (14 - month) / 12
        let y = year + 4800 - a
        let m = month + 12 * a - 3
        return day + (153 * m + 2) / 5 + 365 * y + y / 4 - y / 100 + y / 400 - 32045
    }

    public init(julianDayNumber jdn: Int) {
        var l = jdn + 68569
        let n = (4 * l) / 146097
        l = l - (146097 * n + 3) / 4
        let i = (4000 * (l + 1)) / 1461001
        l = l - (1461 * i) / 4 + 31
        let j = (80 * l) / 2447
        let day = l - (2447 * j) / 80
        l = j / 11
        let month = j + 2 - 12 * l
        let year = 100 * (n - 49) + i + l
        self.year = year
        self.month = month
        self.day = day
    }

    public static func isValid(year: Int, month: Int, day: Int) -> Bool {
        guard (1...12).contains(month), day >= 1 else { return false }
        return day <= daysInMonth(year: year, month: month)
    }

    public static func daysInMonth(year: Int, month: Int) -> Int {
        switch month {
        case 1, 3, 5, 7, 8, 10, 12: return 31
        case 4, 6, 9, 11: return 30
        case 2: return isLeapYear(year) ? 29 : 28
        default: return 0
        }
    }

    public static func isLeapYear(_ year: Int) -> Bool {
        if year % 400 == 0 { return true }
        if year % 100 == 0 { return false }
        return year % 4 == 0
    }
}

extension CivilDate: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw = try container.decode(String.self)
        self = try CivilDate(iso: raw)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(iso)
    }
}
