import Foundation
import Testing
@testable import PeakerData

private let fixedIngestedAt = "2026-09-24T00:00:00Z"

@Test func dayAheadSampleParsesHoustonHubWithoutAWallClock() throws {
    let csv = try fixtureData("np4-dam-sample.csv")
    let parsed = IngestionPipeline.parseRetainedSettlementCSV(
        csv: csv,
        product: .dayAheadNP4190CD,
        ingestedAt: fixedIngestedAt,
        revisionId: "final"
    )
    #expect(parsed.errors.isEmpty)
    #expect(parsed.observations.count == 10)
    let houston = try #require(parsed.observations.first { $0.sourcePointId == "HB_HOUSTON" })
    #expect(houston.pointType == "hub_spp")
    #expect(houston.valueDecimal == "24.14")
    #expect(houston.sourceProductId == "NP4-190-CD")
    #expect(houston.datasetId == "ercot.settlement.np4-190-cd")
    #expect(houston.sourceLocalDate == "2021-02-10")
    #expect(houston.hourEndingRaw == "01:00")
    #expect(houston.dstFlagRaw == "N")
    #expect(houston.unit == "$/MWh")
    #expect(houston.qualityFlags.isEmpty)
    #expect(!houston.qualityFlags.contains("fixture_not_source"))
    #expect(houston.sourcePublishedAt == nil)
    #expect(houston.ingestedAt == fixedIngestedAt)
    #expect(houston.revisionId == "final")
    #expect(houston.sourceHash == SHA256Digest.hex(csv))
    // Hour-ending 01:00 is 00:00–01:00 America/Chicago. 2021-02-10 is CST (UTC−6).
    #expect(houston.intervalStartUtc == "2021-02-10T06:00:00Z")
    #expect(houston.intervalEndUtc == "2021-02-10T07:00:00Z")

    let resource = try #require(parsed.observations.first { $0.sourcePointId == "AEEC" })
    #expect(resource.pointType == "resource_spp")
    #expect(resource.valueDecimal == "26.26")
    let north = try #require(parsed.observations.first { $0.sourcePointId == "HB_NORTH" })
    #expect(north.pointType == "hub_spp")
    #expect(north.valueDecimal == "27.18")
    #expect(parsed.observations.allSatisfy { $0.sourceHash == houston.sourceHash })
    #expect(parsed.observations.allSatisfy { $0.ingestedAt == fixedIngestedAt })
}

@Test func realtimeSampleKeepsResourceNamesAndFifteenMinuteHourEnding() throws {
    let csv = try fixtureData("np6-rt-sample.csv")
    let parsed = IngestionPipeline.parseRetainedSettlementCSV(
        csv: csv,
        product: .realtimeNP6905CD,
        ingestedAt: fixedIngestedAt
    )
    #expect(parsed.errors.isEmpty)
    #expect(parsed.observations.count == 13)
    let aeec = try #require(parsed.observations.first { $0.sourcePointId == "AEEC" })
    #expect(aeec.pointType == "resource_spp")
    #expect(aeec.valueDecimal == "36.78")
    #expect(aeec.sourceProductId == "NP6-905-CD")
    #expect(aeec.sourceLocalDate == "2021-02-09")
    #expect(aeec.hourEndingRaw == "14:1")
    #expect(aeec.dstFlagRaw == "N")
    #expect(aeec.sourcePublishedAt == nil)
    #expect(aeec.qualityFlags.isEmpty)
    #expect(aeec.ingestedAt == fixedIngestedAt)
    #expect(aeec.sourceHash == SHA256Digest.hex(csv))
    // DeliveryHour 14 interval 1 is 13:00–13:15 Chicago. 2021-02-09 is CST.
    #expect(aeec.intervalStartUtc == "2021-02-09T19:00:00Z")
    #expect(aeec.intervalEndUtc == "2021-02-09T19:15:00Z")

    let dc = parsed.observations.filter { $0.sourcePointId == "DC_E" }
    #expect(dc.count == 2)
    #expect(dc.allSatisfy { $0.pointType == "resource_spp" })
    #expect(dc.allSatisfy { $0.valueDecimal == "36.78" })
}

@Test func settlementPointPrefixBeatsTypeCodeAndDstFlagDoesNotShiftFebruary() throws {
    let loadZone = Data("DeliveryDate,HourEnding,SettlementPoint,SettlementPointPrice,DSTFlag\n02/10/2021,01:00,LZ_HOUSTON, 10.50,Y\n".utf8)
    let parsed = ERCOTSettlementCSV.parse(csv: loadZone, product: .dayAheadNP4190CD, ingestedAt: fixedIngestedAt)
    #expect(parsed.errors.isEmpty)
    let row = try #require(parsed.observations.first)
    #expect(row.sourcePointId == "LZ_HOUSTON")
    #expect(row.pointType == "load_zone_spp")
    #expect(row.valueDecimal == "10.50")
    #expect(row.dstFlagRaw == "Y")
    #expect(row.intervalStartUtc == "2021-02-10T06:00:00Z")

    let hourEnding24 = Data("DeliveryDate,HourEnding,SettlementPoint,SettlementPointPrice,DSTFlag\n02/10/2021,24:00,HB_HOUSTON,1.5,N\n".utf8)
    let endOfDay = ERCOTSettlementCSV.parse(csv: hourEnding24, product: .dayAheadNP4190CD, ingestedAt: fixedIngestedAt)
    let last = try #require(endOfDay.observations.first)
    #expect(last.hourEndingRaw == "24:00")
    #expect(last.intervalStartUtc == "2021-02-11T05:00:00Z")
    #expect(last.intervalEndUtc == "2021-02-11T06:00:00Z")
}

@Test func repeatedFallBackHourUsesDstFlagAndSpringGapIsRejected() throws {
    let header = "DeliveryDate,HourEnding,SettlementPoint,SettlementPointPrice,DSTFlag\n"
    let daylight = Data("\(header)11/07/2021,02:00,HB_HOUSTON,3.00,Y\n".utf8)
    let standard = Data("\(header)11/07/2021,02:00,HB_HOUSTON,4.00,N\n".utf8)
    let first = try #require(ERCOTSettlementCSV.parse(csv: daylight, product: .dayAheadNP4190CD, ingestedAt: fixedIngestedAt).observations.first)
    let second = try #require(ERCOTSettlementCSV.parse(csv: standard, product: .dayAheadNP4190CD, ingestedAt: fixedIngestedAt).observations.first)
    #expect(first.intervalStartUtc == "2021-11-07T06:00:00Z")
    #expect(first.intervalEndUtc == "2021-11-07T07:00:00Z")
    #expect(second.intervalStartUtc == "2021-11-07T07:00:00Z")
    #expect(second.intervalEndUtc == "2021-11-07T08:00:00Z")

    let gap = Data("\(header)03/14/2021,03:00,HB_HOUSTON,1.00,N\n".utf8)
    let rejected = ERCOTSettlementCSV.parse(csv: gap, product: .dayAheadNP4190CD, ingestedAt: fixedIngestedAt)
    #expect(rejected.observations.isEmpty)
    #expect(rejected.errors.contains { $0.contains("cannot place") })
}

@Test func nonfinitePricesAndConflictsStayOutOfACompletePublish() throws {
    let header = "DeliveryDate,HourEnding,SettlementPoint,SettlementPointPrice,DSTFlag\n"
    let bad = Data("\(header)02/10/2021,01:00,HB_HOUSTON,NaN,N\n".utf8)
    let rejected = IngestionPipeline.parseRetainedSettlementCSV(csv: bad, product: .dayAheadNP4190CD, ingestedAt: fixedIngestedAt)
    #expect(rejected.observations.isEmpty)
    #expect(rejected.errors.contains { $0.contains("nonfinite") })

    let clash = Data("\(header)02/10/2021,01:00,HB_HOUSTON,1.00,N\n02/10/2021,01:00,HB_HOUSTON,2.00,N\n".utf8)
    let conflicted = IngestionPipeline.parseRetainedSettlementCSV(csv: clash, product: .dayAheadNP4190CD, ingestedAt: fixedIngestedAt)
    #expect(conflicted.observations.count == 2)
    #expect(conflicted.errors.contains { $0.contains("duplicate conflicting") })

    let sample = try fixtureData("np4-dam-sample.csv")
    let parsed = IngestionPipeline.parseRetainedSettlementCSV(csv: sample, product: .dayAheadNP4190CD, ingestedAt: fixedIngestedAt)
    #expect(throws: IngestionError.self) {
        try PackPublisher.publish(
            packId: "TX_GAME_ENERGY_V1",
            observations: parsed.observations,
            validationErrors: parsed.errors,
            rawSHA256: SHA256Digest.hex(sample),
            settlementRevisionPolicy: "final-price replay",
            requestComplete: true
        )
    }
    let draft = try PackPublisher.publish(
        packId: "TX_GAME_ENERGY_V1",
        observations: parsed.observations,
        validationErrors: parsed.errors,
        rawSHA256: SHA256Digest.hex(sample),
        settlementRevisionPolicy: "final-price replay",
        requestComplete: false
    )
    #expect(draft.claimsCompleteSourceCoverage == false)
    #expect(draft.completeness == "incomplete")
}

@Test func bundledDeskSampleParsesSixHubDaysWithoutCoverageClaims() throws {
    let url = settlementRepoRoot().appendingPathComponent("App/PeakerTycoon/Resources/market-sample-np4.csv")
    let csv = try Data(contentsOf: url)
    let parsed = IngestionPipeline.parseRetainedSettlementCSV(
        csv: csv,
        product: .dayAheadNP4190CD,
        ingestedAt: "2026-09-24T00:00:00Z",
        revisionId: "app-bundle-sample"
    )
    #expect(parsed.errors.isEmpty)
    #expect(parsed.observations.map(\.sourcePointId) == [
        "HB_HOUSTON", "HB_NORTH", "HB_WEST", "HB_HOUSTON", "HB_NORTH", "HB_WEST",
    ])
    #expect(parsed.observations.map(\.pointType) == Array(repeating: "hub_spp", count: 6))
    #expect(parsed.observations.map(\.valueDecimal) == ["24.14", "27.18", "18.87", "43.75", "22.41", "20.02"])
    #expect(parsed.observations.map(\.sourceLocalDate) == [
        "2021-02-10", "2021-02-10", "2021-04-15", "2022-07-15", "2023-10-15", "2024-08-15",
    ])
    #expect(parsed.observations.allSatisfy { $0.hourEndingRaw == "01:00" })
    #expect(parsed.observations.allSatisfy { $0.sourcePublishedAt == nil })
    #expect(parsed.observations.allSatisfy { $0.qualityFlags.isEmpty })
}

@Test func parsingSamplesDoesNotFlipTheCoverageManifest() throws {
    let root = settlementRepoRoot()
    let manifest = try CoverageManifest.load(from: root.appendingPathComponent(CoverageManifest.publishedRelativePath))
    #expect(manifest.claimsCompleteSourceCoverage == false)
    #expect(manifest.sourceBatchCount == 144)
    #expect(manifest.selectedProxyPoints.allSatisfy { $0.sourcePointId == nil && $0.coveredLocalDates.isEmpty })
}

private func fixtureData(_ name: String) throws -> Data {
    let url = settlementRepoRoot().appendingPathComponent("Tests/PeakerDataTests/Fixtures/\(name)")
    return try Data(contentsOf: url)
}

private func settlementRepoRoot(file: String = #filePath) -> URL {
    var url = URL(fileURLWithPath: file)
    let fm = FileManager.default
    while url.path != "/" {
        if fm.fileExists(atPath: url.appendingPathComponent("Package.swift").path) {
            return url
        }
        url.deleteLastPathComponent()
    }
    fatalError("Package.swift not found")
}
