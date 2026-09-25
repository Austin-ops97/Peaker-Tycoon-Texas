/// America/Chicago civil-day length from the post-2007 US DST rule.
/// This is calendar arithmetic, not a wall-clock read (§5.3).
public enum ChicagoDSTTransition: String, Codable, Sendable, Equatable {
    case none
    case springForward
    case fallBack
}

public enum ChicagoCivilCalendar {
    public static func quarterHours(on date: CivilDate) -> Int {
        switch transition(on: date) {
        case .none: return 96
        case .springForward: return 92
        case .fallBack: return 100
        }
    }

    public static func transition(on date: CivilDate) -> ChicagoDSTTransition {
        if date == nthWeekday(year: date.year, month: 3, weekday: .sunday, n: 2) {
            return .springForward
        }
        if date == nthWeekday(year: date.year, month: 11, weekday: .sunday, n: 1) {
            return .fallBack
        }
        return .none
    }

    public static func nthWeekday(year: Int, month: Int, weekday: Weekday, n: Int) -> CivilDate {
        var cursor = CivilDate(year: year, month: month, day: 1)
        while cursor.weekday != weekday {
            cursor = cursor.addingDays(1)
        }
        return cursor.addingDays(7 * (n - 1))
    }
}
