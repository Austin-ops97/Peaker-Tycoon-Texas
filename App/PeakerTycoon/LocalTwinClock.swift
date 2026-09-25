import Foundation
import PeakerKernel

/// Converts a Chicago game instant into the player's zone. Does not read the device clock.
enum LocalTwinClock {
    static let zoneKey = "localTimeZoneIdentifier"
    static let tipDismissedKey = "localTwinTipDismissed"

    static func zone(for identifier: String) -> TimeZone? {
        guard !identifier.isEmpty else { return nil }
        return TimeZone(identifier: identifier)
    }

    static func friendlyLabel(_ identifier: String) -> String {
        guard let zone = zone(for: identifier) else { return "Not set" }
        let name = zone.localizedName(for: .generic, locale: .current)
            ?? zone.localizedName(for: .standard, locale: .current)
            ?? ""
        if name.isEmpty { return identifier }
        return "\(identifier) — \(name)"
    }

    static func localCaption(for instant: GameInstant, identifier: String) -> String? {
        guard let hhmm = hourMinute(
            on: instant.date,
            hour: instant.hour,
            minute: instant.minute,
            second: instant.second,
            identifier: identifier
        ) else {
            return nil
        }
        return "\(hhmm) your local"
    }

    static func hourMinute(
        on date: CivilDate,
        hour: Int,
        minute: Int,
        second: Int,
        identifier: String
    ) -> String? {
        guard let player = zone(for: identifier),
              let chicago = TimeZone(identifier: "America/Chicago") else {
            return nil
        }
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = chicago
        var parts = DateComponents()
        parts.calendar = calendar
        parts.timeZone = chicago
        parts.year = date.year
        parts.month = date.month
        parts.day = date.day
        parts.hour = hour
        parts.minute = minute
        parts.second = second
        guard let absolute = calendar.date(from: parts) else { return nil }
        var local = Calendar(identifier: .gregorian)
        local.timeZone = player
        let shown = local.dateComponents([.hour, .minute], from: absolute)
        guard let shownHour = shown.hour, let shownMinute = shown.minute else { return nil }
        return String(format: "%02d:%02d", shownHour, shownMinute)
    }

    static func accessibility(for instant: GameInstant, identifier: String) -> String {
        let central = String(format: "%02d:%02d:%02d", instant.hour, instant.minute, instant.second)
        if let local = hourMinute(
            on: instant.date,
            hour: instant.hour,
            minute: instant.minute,
            second: instant.second,
            identifier: identifier
        ) {
            return "Game time \(central) Central. Your local \(local)."
        }
        return "Game time \(central) Central."
    }
}
