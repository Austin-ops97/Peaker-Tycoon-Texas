import Foundation
import PeakerData

/// Bundled NP4 rows for the Desk card. Read-only. Does not write the coverage manifest.
enum MarketSampleArchive {
    static let resourceName = "market-sample-np4"
    /// Fixed label. The shell does not stamp this from the device clock.
    static let ingestedAt = "2026-09-24T00:00:00Z"

    static let rows: [NormalizedObservation] = load()

    private static func load() -> [NormalizedObservation] {
        guard let url = Bundle.main.url(forResource: resourceName, withExtension: "csv"),
              let csv = try? Data(contentsOf: url) else {
            return []
        }
        let parsed = IngestionPipeline.parseRetainedSettlementCSV(
            csv: csv,
            product: .dayAheadNP4190CD,
            ingestedAt: ingestedAt,
            revisionId: "app-bundle-sample"
        )
        return parsed.errors.isEmpty ? parsed.observations : []
    }
}
