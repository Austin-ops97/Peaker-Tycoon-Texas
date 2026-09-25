/// Continuous campaign chronology. GAME era selection (§2.1): 2021-02-01 through 2025-12-31.
/// Days are strictly increasing civil dates. This calendar is not a claim that SOURCE prices exist.
public enum CampaignCalendar {
    public static let start = CivilDate(year: 2021, month: 2, day: 1)
    public static let end = CivilDate(year: 2025, month: 12, day: 31)
    public static let inclusiveDayCount = 1795

    public static func day(after date: CivilDate) -> CivilDate? {
        let next = date.addingDays(1)
        guard next <= end else { return nil }
        return next
    }

    public static func allDays() -> [CivilDate] {
        var days: [CivilDate] = []
        days.reserveCapacity(inclusiveDayCount)
        var cursor = start
        while cursor <= end {
            days.append(cursor)
            cursor = cursor.addingDays(1)
        }
        return days
    }

    /// Fails when any step is not exactly one civil day later, or the ends do not match the era.
    public static func chronologyErrors(in days: [CivilDate]) -> [String] {
        var errors: [String] = []
        if days.first != start {
            errors.append("Campaign chronology must start on \(start.iso).")
        }
        if days.last != end {
            errors.append("Campaign chronology must end on \(end.iso).")
        }
        if days.count != inclusiveDayCount {
            errors.append("Campaign chronology has \(days.count) days; the continuous era has \(inclusiveDayCount).")
        }
        for index in 1..<days.count {
            let expected = days[index - 1].addingDays(1)
            if days[index] != expected {
                errors.append("\(days[index].iso) is not exactly one day after \(days[index - 1].iso).")
            }
        }
        return errors
    }
}
