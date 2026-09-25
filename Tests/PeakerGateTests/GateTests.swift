import Foundation
import Testing
@testable import PeakerData

@Test("campaign_chronology")
func campaignChronology() throws {
    let manifest = try loadPublishedManifest()
    let errors = CampaignChronologyGate.evaluate(operatingDayISOs: manifest.operatingDays)
    #expect(
        errors.isEmpty,
        "campaign_chronology failed:\n\(errors.joined(separator: "\n"))"
    )
}

@Test("five_year_coverage_gate")
func fiveYearCoverageGate() throws {
    let manifest = try loadPublishedManifest()
    let errors = CoverageGate.evaluate(manifest)
    #expect(
        errors.isEmpty,
        "five_year_coverage_gate failed:\n\(errors.joined(separator: "\n"))"
    )
}

private func loadPublishedManifest(file: String = #filePath) throws -> CoverageManifest {
    var url = URL(fileURLWithPath: file)
    let fm = FileManager.default
    while url.path != "/" {
        if fm.fileExists(atPath: url.appendingPathComponent("Package.swift").path) {
            return try CoverageManifest.load(from: url.appendingPathComponent(CoverageManifest.publishedRelativePath))
        }
        url.deleteLastPathComponent()
    }
    throw GateLoadError.manifestMissing
}

private enum GateLoadError: Error {
    case manifestMissing
}
