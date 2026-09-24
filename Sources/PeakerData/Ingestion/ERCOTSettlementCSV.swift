import Foundation
import PeakerKernel

/// Retained ERCOT settlement CSV → `NormalizedObservation`.
///
/// Mapping (NP4-190-CD DAM and NP6-905-CD RT extracts). These are file columns, not API paths.
///
/// - `sourceProductId`: `NP4-190-CD` or `NP6-905-CD`, taken from the caller. The header must match that product.
/// - `sourcePointId`: `SettlementPoint` / `SettlementPointName` verbatim after trim. Names are not rewritten onto fictional sites. `SettlementPointType` (RN, LCCRN, LZ_DC, LZ_DCEW, …) is not appended and does not create a second id.
/// - `pointType`: name prefix wins over `SettlementPointType`. `HB_` → `hub_spp`, `LZ_` → `load_zone_spp`, otherwise `resource_spp`. A type code that starts with `LZ_` does not promote a resource name.
/// - `sourceLocalDate`: `DeliveryDate` `MM/DD/YYYY` → `yyyy-MM-dd`.
/// - DAM `HourEnding` (`HH:00`, 01…24) is ERCOT hour-ending in America/Chicago. The interval is the 60 minutes that end at that clock time (01:00 → 00:00–01:00, 24:00 → 23:00–24:00). `hourEndingRaw` keeps the cell text.
/// - RT `DeliveryHour` (1…24, same hour-ending) plus `DeliveryInterval` (1…4, 15 minutes inside that hour). Interval 1 of hour 14 is 13:00–13:15 Chicago. `hourEndingRaw` is `"<DeliveryHour>:<DeliveryInterval>"` from the raw cells (for example `14:1`). That string is not a clock time.
/// - `dstFlagRaw`: `DSTFlag` cell verbatim. It chooses which repeated hour to use on a Chicago fall-back day. On every other day the calendar offset ignores it.
/// - Interval UTC strings are best-effort civil arithmetic (below). PeakerKernel has transition dates and quarter-hour counts only, no zone conversion. `sourcePublishedAt` is always null. These strings are not publication times.
/// - `valueDecimal`: trimmed price text. Nonfinite or non-decimal cells are omitted and reported. The stored text is not reformatted.
/// - `unit`: `$/MWh`.
/// - `ingestedAt` and `revisionId` come from the caller. The library does not read a wall clock. Tests pass a fixed `ingestedAt`.
/// - `sourceHash`: SHA-256 hex of the CSV bytes passed in, shared by every row from that buffer.
/// - `qualityFlags`: empty. Real SOURCE rows do not get `fixture_not_source`.
///
/// Zip members are caller-owned. This module does not inflate zip bytes (no zip library on the Linux test host). Pass the CSV member.
public enum ERCOTSettlementProduct: String, Sendable, Equatable {
    case dayAheadNP4190CD = "NP4-190-CD"
    case realtimeNP6905CD = "NP6-905-CD"

    public var datasetId: String {
        switch self {
        case .dayAheadNP4190CD: return "ercot.settlement.np4-190-cd"
        case .realtimeNP6905CD: return "ercot.settlement.np6-905-cd"
        }
    }

    var requiredColumns: [String] {
        switch self {
        case .dayAheadNP4190CD:
            return ["DeliveryDate", "HourEnding", "SettlementPoint", "SettlementPointPrice", "DSTFlag"]
        case .realtimeNP6905CD:
            return [
                "DeliveryDate", "DeliveryHour", "DeliveryInterval",
                "SettlementPointName", "SettlementPointType", "SettlementPointPrice", "DSTFlag",
            ]
        }
    }
}

public struct ERCOTSettlementParseResult: Equatable, Sendable {
    public let observations: [NormalizedObservation]
    public let errors: [String]

    public init(observations: [NormalizedObservation], errors: [String]) {
        self.observations = observations
        self.errors = errors
    }
}

public enum ERCOTSettlementCSV {
    public static let unit = "$/MWh"

    /// Parse one CSV buffer. Rows that fail a field check are skipped and named in `errors`.
    public static func parse(
        csv: Data,
        product: ERCOTSettlementProduct,
        ingestedAt: String,
        revisionId: String = "final"
    ) -> ERCOTSettlementParseResult {
        guard let table = CSVTable.parse(csv) else {
            return ERCOTSettlementParseResult(observations: [], errors: ["CSV is not UTF-8"])
        }
        guard let header = table.first, !header.isEmpty else {
            return ERCOTSettlementParseResult(observations: [], errors: ["CSV has no header"])
        }
        let columns = Dictionary(uniqueKeysWithValues: header.enumerated().map { ($0.element, $0.offset) })
        var errors: [String] = []
        for name in product.requiredColumns where columns[name] == nil {
            errors.append("\(product.rawValue) header missing \(name)")
        }
        if !errors.isEmpty {
            return ERCOTSettlementParseResult(observations: [], errors: errors)
        }

        let sourceHash = SHA256Digest.hex(csv)
        var observations: [NormalizedObservation] = []
        for (offset, row) in table.dropFirst().enumerated() {
            let line = offset + 2
            func cell(_ name: String) -> String {
                guard let index = columns[name], index < row.count else { return "" }
                return row[index].trimmingCharacters(in: .whitespaces)
            }
            if row.allSatisfy({ $0.trimmingCharacters(in: .whitespaces).isEmpty }) {
                continue
            }
            guard let localDate = Self.parseDeliveryDate(cell("DeliveryDate")) else {
                errors.append("line \(line): DeliveryDate \(cell("DeliveryDate")) is not MM/DD/YYYY")
                continue
            }
            let price = cell("SettlementPointPrice")
            guard ObservationValidator.isFiniteDecimal(price) else {
                errors.append("line \(line): nonfinite price \(price)")
                continue
            }
            let pointId = product == .dayAheadNP4190CD ? cell("SettlementPoint") : cell("SettlementPointName")
            guard !pointId.isEmpty else {
                errors.append("line \(line): empty settlement point")
                continue
            }
            let dst = cell("DSTFlag")
            let placed: (start: String, end: String, hourEndingRaw: String)?
            switch product {
            case .dayAheadNP4190CD:
                placed = placeDayAhead(hourEnding: cell("HourEnding"), localDate: localDate, dstFlag: dst, line: line, errors: &errors)
            case .realtimeNP6905CD:
                placed = placeRealtime(
                    deliveryHour: cell("DeliveryHour"),
                    deliveryInterval: cell("DeliveryInterval"),
                    localDate: localDate,
                    dstFlag: dst,
                    line: line,
                    errors: &errors
                )
            }
            guard let placed else { continue }
            observations.append(NormalizedObservation(
                datasetId: product.datasetId,
                sourceProductId: product.rawValue,
                sourcePointId: pointId,
                pointType: pointType(forSettlementPointName: pointId),
                intervalStartUtc: placed.start,
                intervalEndUtc: placed.end,
                sourceLocalDate: localDate.iso,
                hourEndingRaw: placed.hourEndingRaw,
                dstFlagRaw: dst.isEmpty ? nil : dst,
                valueDecimal: price,
                unit: Self.unit,
                sourcePublishedAt: nil,
                ingestedAt: ingestedAt,
                availableAt: nil,
                revisionId: revisionId,
                sourceHash: sourceHash,
                qualityFlags: []
            ))
        }
        return ERCOTSettlementParseResult(observations: observations, errors: errors)
    }

    /// `HB_` hub, `LZ_` load zone, anything else a resource. Prefix is the settlement-point name, not `SettlementPointType`.
    public static func pointType(forSettlementPointName name: String) -> String {
        if name.hasPrefix("HB_") { return "hub_spp" }
        if name.hasPrefix("LZ_") { return "load_zone_spp" }
        return "resource_spp"
    }

    private static func parseDeliveryDate(_ raw: String) -> CivilDate? {
        let parts = raw.split(separator: "/")
        guard parts.count == 3,
              let month = Int(parts[0]),
              let day = Int(parts[1]),
              let year = Int(parts[2]),
              CivilDate.isValid(year: year, month: month, day: day)
        else { return nil }
        return CivilDate(year: year, month: month, day: day)
    }

    private static func placeDayAhead(
        hourEnding: String,
        localDate: CivilDate,
        dstFlag: String,
        line: Int,
        errors: inout [String]
    ) -> (start: String, end: String, hourEndingRaw: String)? {
        let parts = hourEnding.split(separator: ":")
        guard parts.count == 2,
              let hour = Int(parts[0]),
              let minute = Int(parts[1]),
              (1...24).contains(hour),
              minute == 0
        else {
            errors.append("line \(line): HourEnding \(hourEnding) is not HH:00 in 01:00...24:00")
            return nil
        }
        guard let utc = ChicagoIntervalClock.utcRange(
            localDate: localDate,
            startHour: hour - 1,
            startMinute: 0,
            durationMinutes: 60,
            dstFlag: dstFlag
        ) else {
            errors.append("line \(line): cannot place HourEnding \(hourEnding) on \(localDate.iso) in America/Chicago")
            return nil
        }
        return (utc.start, utc.end, hourEnding)
    }

    private static func placeRealtime(
        deliveryHour: String,
        deliveryInterval: String,
        localDate: CivilDate,
        dstFlag: String,
        line: Int,
        errors: inout [String]
    ) -> (start: String, end: String, hourEndingRaw: String)? {
        guard let hour = Int(deliveryHour), (1...24).contains(hour) else {
            errors.append("line \(line): DeliveryHour \(deliveryHour) is not 1...24")
            return nil
        }
        guard let interval = Int(deliveryInterval), (1...4).contains(interval) else {
            errors.append("line \(line): DeliveryInterval \(deliveryInterval) is not 1...4")
            return nil
        }
        guard let utc = ChicagoIntervalClock.utcRange(
            localDate: localDate,
            startHour: hour - 1,
            startMinute: (interval - 1) * 15,
            durationMinutes: 15,
            dstFlag: dstFlag
        ) else {
            errors.append("line \(line): cannot place DeliveryHour \(deliveryHour) interval \(deliveryInterval) on \(localDate.iso) in America/Chicago")
            return nil
        }
        return (utc.start, utc.end, "\(deliveryHour):\(deliveryInterval)")
    }
}

/// America/Chicago clock → UTC ISO-8601, using the post-2007 US DST rule already encoded by `ChicagoCivilCalendar`.
///
/// Standard time is 6 hours ahead of UTC. Daylight time is 5 hours ahead of UTC.
/// The second Sunday in March skips local 02:00–03:00. The first Sunday in November repeats 01:00–02:00:
/// `DSTFlag` `Y` is the first (daylight) occurrence and `N` is the second (standard). Outside that repeated hour the flag is stored but does not change the offset.
/// Adding the interval length on the UTC side keeps a fall-back hour 60 or 15 real minutes long.
enum ChicagoIntervalClock {
    static func utcRange(
        localDate: CivilDate,
        startHour: Int,
        startMinute: Int,
        durationMinutes: Int,
        dstFlag: String
    ) -> (start: String, end: String)? {
        guard let shiftHours = hoursToAddToReachUTC(
            localDate: localDate,
            hour: startHour,
            minute: startMinute,
            dstFlag: dstFlag
        ) else { return nil }
        let start = shift(date: localDate, hour: startHour, minute: startMinute, byMinutes: shiftHours * 60)
        let end = shift(date: start.date, hour: start.hour, minute: start.minute, byMinutes: durationMinutes)
        return (iso(start), iso(end))
    }

    /// Nil when the local time does not exist (spring-forward gap) or the fall-back repeat has no Y/N flag.
    static func hoursToAddToReachUTC(localDate: CivilDate, hour: Int, minute: Int, dstFlag: String) -> Int? {
        let spring = ChicagoCivilCalendar.nthWeekday(year: localDate.year, month: 3, weekday: .sunday, n: 2)
        let fall = ChicagoCivilCalendar.nthWeekday(year: localDate.year, month: 11, weekday: .sunday, n: 1)
        if localDate < spring || localDate > fall {
            return 6
        }
        if localDate > spring && localDate < fall {
            return 5
        }
        if localDate == spring {
            if hour < 2 { return 6 }
            if hour < 3 { return nil }
            return 5
        }
        if hour < 1 { return 5 }
        if hour < 2 {
            switch dstFlag.trimmingCharacters(in: .whitespaces).uppercased() {
            case "Y": return 5
            case "N": return 6
            default: return nil
            }
        }
        return 6
    }

    private static func shift(date: CivilDate, hour: Int, minute: Int, byMinutes delta: Int) -> (date: CivilDate, hour: Int, minute: Int) {
        var total = hour * 60 + minute + delta
        var cursor = date
        while total < 0 {
            total += 1_440
            cursor = cursor.addingDays(-1)
        }
        let extraDays = total / 1_440
        total %= 1_440
        if extraDays > 0 {
            cursor = cursor.addingDays(extraDays)
        }
        return (cursor, total / 60, total % 60)
    }

    private static func iso(_ instant: (date: CivilDate, hour: Int, minute: Int)) -> String {
        let clock = String(format: "%02d:%02d:00Z", instant.hour, instant.minute)
        return "\(instant.date.iso)T\(clock)"
    }
}

enum CSVTable {
    static func parse(_ data: Data) -> [[String]]? {
        guard var text = String(data: data, encoding: .utf8) else { return nil }
        if text.hasPrefix("\u{feff}") {
            text.removeFirst()
        }
        var rows: [[String]] = []
        var row: [String] = []
        var field = ""
        var inQuotes = false
        let characters = Array(text)
        var index = 0
        while index < characters.count {
            let character = characters[index]
            if inQuotes {
                if character == "\"" {
                    if index + 1 < characters.count && characters[index + 1] == "\"" {
                        field.append("\"")
                        index += 2
                        continue
                    }
                    inQuotes = false
                } else {
                    field.append(character)
                }
                index += 1
                continue
            }
            switch character {
            case "\"":
                inQuotes = true
            case ",":
                row.append(field)
                field = ""
            case "\n", "\r":
                if character == "\r", index + 1 < characters.count, characters[index + 1] == "\n" {
                    index += 1
                }
                row.append(field)
                field = ""
                if row.contains(where: { !$0.isEmpty }) {
                    rows.append(row)
                }
                row = []
            default:
                field.append(character)
            }
            index += 1
        }
        if inQuotes { return nil }
        if !field.isEmpty || !row.isEmpty {
            row.append(field)
            if row.contains(where: { !$0.isEmpty }) {
                rows.append(row)
            }
        }
        return rows
    }
}
