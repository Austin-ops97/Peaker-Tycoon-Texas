import Foundation

/// Plain-language summary of a retained sample inventory for the phone shell.
///
/// Counts come from the inventory. The wording stays incomplete even if a caller
/// passes a manifest that claims complete coverage. Product ids are not copied
/// into the sentences. Real-time delivery dates are not described as full days.
public struct RetainedSamplePlayerSummary: Equatable, Sendable {
    public static let rowTitle = "Saved price samples"
    public static let incompleteSentence = "Coverage is incomplete."
    public static let emptyLiveFetchSentence = "Some early days are still empty on the live fetch."
    public static let missingReportsSentence = "Some reports are not in the public catalog."

    public let fileSentence: String
    public let dateSentence: String
    /// Earliest and latest CSV delivery dates in the inventory. Nil when no dates are listed.
    public let spanSentence: String?
    public let showsEmptyLiveFetch: Bool
    public let showsMissingReports: Bool
    /// Always false. This summary does not publish a coverage claim.
    public var claimsCompleteSourceCoverage: Bool { false }

    public static func make(from inventory: RetainedSampleInventory) -> RetainedSamplePlayerSummary {
        let dayAhead = inventory.products.first { $0.sourceProductId == "NP4-190-CD" }
        let realtime = inventory.products.first { $0.sourceProductId == "NP6-905-CD" }
        let dayAheadFiles = dayAhead?.zipCount ?? 0
        let realtimeFiles = realtime?.zipCount ?? 0
        let dayAheadDates = dayAhead?.deliveryDates.count ?? 0
        let realtimeDates = realtime?.deliveryDates.count ?? 0
        let dates = inventory.products
            .flatMap(\.deliveryDates)
            .map(\.sourceLocalDate)
            .sorted()
        let spanSentence: String?
        if let earliest = dates.first, let latest = dates.last {
            spanSentence = "Saved delivery dates span \(earliest) → \(latest)."
        } else {
            spanSentence = nil
        }
        return RetainedSamplePlayerSummary(
            fileSentence: "\(dayAheadFiles) day-ahead price files and \(realtimeFiles) real-time price files are saved with this build.",
            dateSentence: "Those files mention \(dayAheadDates) day-ahead delivery dates and \(realtimeDates) real-time delivery dates. A real-time date here is a short sample, not a full day, and it does not fill an empty day.",
            spanSentence: spanSentence,
            showsEmptyLiveFetch: !inventory.emptyLiveFromToGates.isEmpty,
            showsMissingReports: !inventory.absentProducts.isEmpty
        )
    }
}
