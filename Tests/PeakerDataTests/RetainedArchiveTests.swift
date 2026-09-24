import Foundation
import Testing
@testable import PeakerData

private let retainedIngestedAt = "2026-09-24T00:00:00Z"

@Test func retainedBatchesExposeOnlyVerifiedPriceZips() throws {
    let root = retainRoot()
    let zips = try RetainedSettlementArchive.priceZipURLs(in: root)
    #expect(zips.count == 43)
    #expect(zips.allSatisfy { $0.pathExtension == "zip" })
    #expect(zips.filter { $0.path.contains("/batch2/") }.count == 6)
    #expect(zips.filter { $0.path.contains("/batch3/") }.count == 13)
    #expect(zips.filter { $0.path.contains("/batch4/") }.count == 24)
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
    #expect(manifest.sourceBatchCount == 49)
    #expect(manifest.selectedProxyPoints.allSatisfy { $0.sourcePointId == nil && $0.coveredLocalDates.isEmpty })
    let er = manifest.sourceProducts.filter { $0.productId == "NP4-180-ER" || $0.productId == "NP6-785-ER" }
    #expect(er.count == 2)
    #expect(er.allSatisfy { $0.pinnedApiPath == nil && $0.status == "absent_from_public_reports_catalog" })
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
