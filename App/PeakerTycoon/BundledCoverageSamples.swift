import Foundation
import PeakerData

/// Reads the bundled sample inventory. Does not scan archives and does not write coverage.
enum BundledCoverageSamples {
    static let summary: RetainedSamplePlayerSummary? = load()

    private static func load() -> RetainedSamplePlayerSummary? {
        guard let url = Bundle.main.url(forResource: "retained-sample-inventory", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let inventory = try? RetainedSampleInventory.decode(from: data) else {
            return nil
        }
        return RetainedSamplePlayerSummary.make(from: inventory)
    }
}
