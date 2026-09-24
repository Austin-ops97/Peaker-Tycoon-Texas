import Foundation
import Testing
@testable import PeakerData

private let retainedIngestedAt = "2026-09-24T00:00:00Z"

@Test func retainedBatchesExposeOnlyVerifiedPriceZips() throws {
    let root = retainRoot()
    let zips = try RetainedSettlementArchive.priceZipURLs(in: root)
    #expect(zips.count == 82)
    #expect(zips.allSatisfy { $0.pathExtension == "zip" })
    #expect(zips.filter { $0.path.contains("/batch2/") }.count == 6)
    #expect(zips.filter { $0.path.contains("/batch3/") }.count == 13)
    #expect(zips.filter { $0.path.contains("/batch4/") }.count == 24)
    #expect(zips.filter { $0.path.contains("/batch5/") }.count == 14)
    #expect(zips.filter { $0.path.contains("/batch6/") }.count == 25)
    #expect(zips.allSatisfy {
        RetainedSettlementArchive.product(forZipFileName: $0.lastPathComponent) != nil
    })
    let rootZips = try FileManager.default.contentsOfDirectory(at: root, includingPropertiesForKeys: nil)
    #expect(rootZips.contains { $0.pathExtension == "zip" })
    #expect(!zips.contains { $0.deletingLastPathComponent().lastPathComponent == "2026-09-24" })
}

@Test func retainedNP4ZipParsesHoustonHubAfterSidecarCheck() throws {
    let url = retainRoot().appendingPathComponent(
        "batch3/np4-190-cd__inst1_20210209_757802224_DAMSPNP4190_csv.zip"
    )
    let read = try RetainedSettlementArchive.readZip(at: url, ingestedAt: retainedIngestedAt)
    #expect(read.product == .dayAheadNP4190CD)
    #expect(read.result.errors.isEmpty)
    let houston = try #require(read.result.observations.first {
        $0.sourcePointId == "HB_HOUSTON" && $0.hourEndingRaw == "01:00"
    })
    #expect(houston.pointType == "hub_spp")
    #expect(houston.valueDecimal == "24.14")
    #expect(houston.sourceLocalDate == "2021-02-10")
    #expect(houston.sourceProductId == "NP4-190-CD")
    #expect(houston.sourcePublishedAt == nil)
    #expect(houston.qualityFlags.isEmpty)
    #expect(houston.ingestedAt == retainedIngestedAt)
    #expect(read.verifiedSHA256 == SHA256Digest.hex(try Data(contentsOf: url)))
}

@Test func retainedNP6ZipParsesResourcePriceAfterSidecarCheck() throws {
    let url = retainRoot().appendingPathComponent(
        "batch3/np6-905-cd__inst1_20210209_757800273_SPPHLZNP6905_20210209_1315_csv.zip"
    )
    let read = try RetainedSettlementArchive.readZip(at: url, ingestedAt: retainedIngestedAt)
    #expect(read.product == .realtimeNP6905CD)
    #expect(read.result.errors.isEmpty)
    let aeec = try #require(read.result.observations.first { $0.sourcePointId == "AEEC" })
    #expect(aeec.pointType == "resource_spp")
    #expect(aeec.valueDecimal == "36.78")
    #expect(aeec.sourceLocalDate == "2021-02-09")
    #expect(aeec.hourEndingRaw == "14:1")
    #expect(aeec.sourcePublishedAt == nil)
    #expect(aeec.qualityFlags.isEmpty)
}

@Test func retainedBatch5NP4ZipParsesHoustonHubAfterSidecarCheck() throws {
    let url = retainRoot().appendingPathComponent(
        "batch5/np4-190-cd__inst1_20210214_758641836_DAMSPNP4190_csv.zip"
    )
    let read = try RetainedSettlementArchive.readZip(at: url, ingestedAt: retainedIngestedAt)
    #expect(read.product == .dayAheadNP4190CD)
    #expect(read.result.errors.isEmpty)
    let houston = try #require(read.result.observations.first {
        $0.sourcePointId == "HB_HOUSTON" && $0.hourEndingRaw == "01:00"
    })
    #expect(houston.pointType == "hub_spp")
    #expect(houston.valueDecimal == "3056.91")
    #expect(houston.sourceLocalDate == "2021-02-15")
    #expect(houston.sourceProductId == "NP4-190-CD")
    #expect(houston.sourcePublishedAt == nil)
    #expect(houston.qualityFlags.isEmpty)
    #expect(read.verifiedSHA256 == "6616c68bd41419e804a2ce65608d8d3d34cdd5a1198d62f82415f6c3e783a137")
}

@Test func retainedBatch6NP4ZipParsesHoustonHubAfterSidecarCheck() throws {
    let url = retainRoot().appendingPathComponent(
        "batch6/np4-190-cd__inst1_20210414_768484164_DAMSPNP4190_csv.zip"
    )
    let read = try RetainedSettlementArchive.readZip(at: url, ingestedAt: retainedIngestedAt)
    #expect(read.product == .dayAheadNP4190CD)
    #expect(read.result.errors.isEmpty)
    let houston = try #require(read.result.observations.first {
        $0.sourcePointId == "HB_HOUSTON" && $0.hourEndingRaw == "01:00"
    })
    #expect(houston.pointType == "hub_spp")
    #expect(houston.valueDecimal == "20.35")
    #expect(houston.sourceLocalDate == "2021-04-15")
    #expect(houston.sourcePublishedAt == nil)
    #expect(read.verifiedSHA256 == "7c3ef076e8f01ad619359691f80b3e407f74fd02e55995a99b274ccdd5375d7f")
}

@Test func januaryFifteenthStaysAnEmptyGateOnTheReadPath() throws {
    #expect(RetainedSettlementArchive.emptyLiveFromToDay == "2023-01-15")
    let url = retainRoot().appendingPathComponent(
        "batch4/np4-190-cd__inst6_20230116_889808030_DAMSPNP4190_csv.zip"
    )
    let read = try RetainedSettlementArchive.readZip(at: url, ingestedAt: retainedIngestedAt)
    let dates = Set(read.result.observations.map(\.sourceLocalDate))
    #expect(dates == ["2023-01-17"])
    #expect(!dates.contains(RetainedSettlementArchive.emptyLiveFromToDay))
}

@Test func sidecarMismatchRefusesTheZip() throws {
    let source = retainRoot().appendingPathComponent(
        "batch2/np6-905-cd__inst2_20210209_757717538_SPPHLZNP6905_20210209_0230_csv.zip"
    )
    let temp = FileManager.default.temporaryDirectory.appendingPathComponent("peaker-sidecar-mismatch.zip")
    try? FileManager.default.removeItem(at: temp)
    try? FileManager.default.removeItem(at: URL(fileURLWithPath: temp.path + ".sha256"))
    try Data(contentsOf: source).write(to: temp)
    try Data("0000000000000000000000000000000000000000000000000000000000000000\n".utf8)
        .write(to: URL(fileURLWithPath: temp.path + ".sha256"))
    #expect(throws: RetainedArchiveError.self) {
        try RetainedSettlementArchive.readZip(at: temp, ingestedAt: retainedIngestedAt)
    }
    try? FileManager.default.removeItem(at: temp)
    try? FileManager.default.removeItem(at: URL(fileURLWithPath: temp.path + ".sha256"))
}

@Test func readingRetainedZipsDoesNotClaimCoverage() throws {
    _ = try RetainedSettlementArchive.readZip(
        at: retainRoot().appendingPathComponent(
            "batch2/np6-905-cd__inst2_20210209_757717538_SPPHLZNP6905_20210209_0230_csv.zip"
        ),
        ingestedAt: retainedIngestedAt
    )
    let manifest = try CoverageManifest.load(
        from: repoRootForRetain().appendingPathComponent(CoverageManifest.publishedRelativePath)
    )
    #expect(manifest.claimsCompleteSourceCoverage == false)
    #expect(manifest.sourceBatchCount == 88)
    #expect(manifest.selectedProxyPoints.allSatisfy { $0.sourcePointId == nil && $0.coveredLocalDates.isEmpty })
    let er = manifest.sourceProducts.filter { $0.productId == "NP4-180-ER" || $0.productId == "NP6-785-ER" }
    #expect(er.count == 2)
    #expect(er.allSatisfy { $0.pinnedApiPath == nil && $0.status == "absent_from_public_reports_catalog" })
}

@Test func retainedSampleInventoryListsDeliveryDatesWithoutClaimingCoverage() throws {
    let inventory = try RetainedSampleInventory.scan(retainRoot: retainRoot(), ingestedAt: retainedIngestedAt)
    #expect(inventory.claimsCompleteSourceCoverage == false)
    #expect(inventory.retainFolders == ["batch2", "batch3", "batch4", "batch5", "batch6"])
    #expect(inventory.campaignEraStart == "2021-02-01")
    #expect(inventory.campaignEraEnd == "2025-12-31")
    #expect(inventory.products.map(\.sourceProductId) == ["NP4-190-CD", "NP6-905-CD"])
    let np4 = try #require(inventory.products.first { $0.sourceProductId == "NP4-190-CD" })
    let np6 = try #require(inventory.products.first { $0.sourceProductId == "NP6-905-CD" })
    #expect(np4.zipCount == 42)
    #expect(np6.zipCount == 40)
    #expect(np4.deliveryDates.allSatisfy { $0.insideCampaignEra })
    #expect(np6.deliveryDates.allSatisfy { $0.insideCampaignEra })
    let february = try #require(np4.deliveryDates.first { $0.sourceLocalDate == "2021-02-15" })
    #expect(february.hourEndings.contains("01:00"))
    #expect(february.zipFileNames.contains {
        $0.hasSuffix("np4-190-cd__inst1_20210214_758641836_DAMSPNP4190_csv.zip")
    })
    let aprilInterval = try #require(np6.deliveryDates.first { $0.sourceLocalDate == "2021-04-15" })
    #expect(aprilInterval.hourEndings == ["12:3", "12:4"])
    let aprilAhead = try #require(np4.deliveryDates.first { $0.sourceLocalDate == "2021-04-15" })
    #expect(aprilAhead.hourEndings.count == 24)
    for day in ["2022-07-15", "2023-01-15", "2023-04-15"] {
        #expect(np4.deliveryDates.contains { $0.sourceLocalDate == day })
        #expect(np6.deliveryDates.contains { $0.sourceLocalDate == day })
    }
    #expect(inventory.emptyLiveFromToGates.map(\.sourceLocalDate) == ["2022-11-15"])
    let november = try #require(inventory.emptyLiveFromToGates.first)
    #expect(november.retainedHourEndingsByProduct["NP4-190-CD"]?.count == 24)
    #expect(november.retainedHourEndingsByProduct["NP6-905-CD"]?.isEmpty == true)
    #expect(inventory.earlierEmptyLiveDaysWithArchiveSamples == RetainedSampleInventory.earlierEmptyLiveDaysWithArchiveSamples)
    #expect(inventory.absentProducts.map(\.productId) == ["NP4-180-ER", "NP6-785-ER"])
    #expect(inventory.absentProducts.allSatisfy { $0.status == "absent_from_public_reports_catalog" })
    let text = inventory.markdown()
    #expect(text.contains("not complete coverage"))
    #expect(text.contains("covered_local_dates` are not filled"))
    let repo = repoRootForRetain()
    let jsonURL = repo.appendingPathComponent(RetainedSampleInventory.jsonRelativePath)
    let markdownURL = repo.appendingPathComponent(RetainedSampleInventory.markdownRelativePath)
    let json = try inventory.jsonUTF8()
    let bundledURL = repo.appendingPathComponent("App/PeakerTycoon/Resources/retained-sample-inventory.json")
    if ProcessInfo.processInfo.environment["PEAKER_REFRESH_RETAINED_INVENTORY"] == "1" {
        try json.write(to: jsonURL)
        try json.write(to: bundledURL)
        try Data(text.utf8).write(to: markdownURL)
    }
    #expect(try Data(contentsOf: jsonURL) == json)
    #expect(try Data(contentsOf: bundledURL) == json)
    #expect(try String(contentsOf: markdownURL, encoding: .utf8) == text)
    let manifest = try CoverageManifest.load(
        from: repo.appendingPathComponent(CoverageManifest.publishedRelativePath)
    )
    #expect(manifest.claimsCompleteSourceCoverage == false)
    #expect(manifest.sourceBatchCount == 88)
    #expect(manifest.selectedProxyPoints.allSatisfy { $0.sourcePointId == nil && $0.coveredLocalDates.isEmpty })
}

@Test func retainedSamplePlayerSummaryStaysIncomplete() throws {
    let repo = repoRootForRetain()
    let data = try Data(contentsOf: repo.appendingPathComponent(RetainedSampleInventory.jsonRelativePath))
    let bundled = try Data(contentsOf: repo.appendingPathComponent("App/PeakerTycoon/Resources/retained-sample-inventory.json"))
    #expect(data == bundled)
    let inventory = try RetainedSampleInventory.decode(from: data)
    #expect(inventory.claimsCompleteSourceCoverage == false)
    let summary = RetainedSamplePlayerSummary.make(from: inventory)
    #expect(summary.claimsCompleteSourceCoverage == false)
    #expect(summary.fileSentence == "42 day-ahead price files and 40 real-time price files are saved with this build.")
    #expect(summary.dateSentence.contains("42 day-ahead delivery dates"))
    #expect(summary.dateSentence.contains("35 real-time delivery dates"))
    #expect(summary.dateSentence.contains("not a full day"))
    #expect(summary.showsEmptyLiveFetch)
    #expect(summary.showsMissingReports)
    let spoken = [
        summary.fileSentence,
        summary.dateSentence,
        RetainedSamplePlayerSummary.incompleteSentence,
        RetainedSamplePlayerSummary.emptyLiveFetchSentence,
        RetainedSamplePlayerSummary.missingReportsSentence,
    ].joined(separator: " ")
    #expect(!spoken.contains("NP4"))
    #expect(!spoken.contains("NP6"))
    #expect(!spoken.contains("covered_local"))

    let lying = RetainedSampleInventory(
        label: "retained_sample_inventory",
        statement: "not coverage",
        claimsCompleteSourceCoverage: true,
        campaignEraStart: "2021-02-01",
        campaignEraEnd: "2025-12-31",
        retainFolders: [],
        products: [],
        emptyLiveFromToGates: [],
        earlierEmptyLiveDaysWithArchiveSamples: [],
        absentProducts: []
    )
    let denied = RetainedSamplePlayerSummary.make(from: lying)
    #expect(denied.claimsCompleteSourceCoverage == false)
    #expect(denied.fileSentence.contains("0 day-ahead price files"))
    #expect(!denied.showsEmptyLiveFetch)
    #expect(!denied.showsMissingReports)
}

private func retainRoot() -> URL {
    repoRootForRetain().appendingPathComponent("Data/archives/ercot/2026-09-24")
}

private func repoRootForRetain(file: String = #filePath) -> URL {
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
