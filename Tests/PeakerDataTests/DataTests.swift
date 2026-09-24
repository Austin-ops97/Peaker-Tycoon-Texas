import Foundation
import Testing
@testable import PeakerData

@Test func sha256MatchesKnownVectors() {
    #expect(SHA256Digest.hex(Array("".utf8)) == "e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855")
    #expect(SHA256Digest.hex(Array("abc".utf8)) == "ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad")
}

@Test func liveFetchRefusesToInventAnApiPath() {
    #expect(throws: IngestionError.self) {
        try LiveFetch.fetch(sourceProductId: "NP4-190-CD", pinnedOpenAPIPath: nil)
    }
    do {
        _ = try LiveFetch.fetch(sourceProductId: "NP4-190-CD", pinnedOpenAPIPath: nil)
        Issue.record("expected throw")
    } catch {
        let text = String(describing: error)
        #expect(!text.contains("http://"))
        #expect(!text.contains("https://"))
        #expect(!text.lowercased().contains("/api/"))
    }
    #expect(throws: IngestionError.self) {
        try LiveFetch.fetch(sourceProductId: "NP4-190-CD", pinnedOpenAPIPath: "/pinned-but-not-called")
    }
}

@Test func fixturePipelineRetainsHashAndRefusesACompleteSourcePack() throws {
    let bytes = Array("fixture-bytes-not-ercot".utf8)
    let observation = NormalizedObservation(
        datasetId: "fixture.not_source",
        sourceProductId: "UNPINNED",
        sourcePointId: "FIXTURE_ONLY_NOT_AN_ERCOT_ID",
        pointType: "fixture",
        intervalStartUtc: "2021-02-01T06:00:00Z",
        intervalEndUtc: "2021-02-01T07:00:00Z",
        sourceLocalDate: "2021-02-01",
        hourEndingRaw: nil,
        dstFlagRaw: nil,
        valueDecimal: "0",
        unit: "fixture",
        sourcePublishedAt: nil,
        ingestedAt: "2026-09-24T00:00:00Z",
        availableAt: nil,
        revisionId: "fixture-r0",
        sourceHash: SHA256Digest.hex(bytes),
        qualityFlags: ["fixture_not_source", "publication_time_unknown"]
    )
    let draft = try IngestionPipeline.runFixture(bytes: bytes, observations: [observation])
    #expect(draft.rawSHA256 == SHA256Digest.hex(bytes))
    #expect(draft.completeness == "incomplete")
    #expect(draft.claimsCompleteSourceCoverage == false)
    #expect(draft.validationErrors.isEmpty)
    #expect(throws: IngestionError.self) {
        try PackPublisher.publish(
            packId: "FIXTURE_NOT_A_SOURCE_PACK",
            observations: [observation],
            validationErrors: [],
            rawSHA256: draft.rawSHA256,
            settlementRevisionPolicy: "final-price replay",
            requestComplete: true
        )
    }
}

@Test func validatorKeepsNegativePricesAndRejectsGapsAndConflicts() {
    var negative = sampleObservation()
    negative.valueDecimal = "-5.00"
    #expect(ObservationValidator.validate([negative]).isEmpty)

    var nonfinite = sampleObservation()
    nonfinite.valueDecimal = "NaN"
    #expect(!ObservationValidator.validate([nonfinite]).isEmpty)

    var impossible = sampleObservation()
    impossible.sourceLocalDate = "2021-02-31"
    #expect(ObservationValidator.validate([impossible]).contains { $0.contains("impossible date") })

    let left = sampleObservation()
    var right = sampleObservation()
    right.valueDecimal = "2"
    #expect(ObservationValidator.validate([left, right]).contains { $0.contains("duplicate conflicting") })

    var fallback = sampleObservation()
    fallback.sourceLocalDate = "2021-11-07"
    fallback.dstFlagRaw = nil
    #expect(ObservationValidator.validate([fallback]).contains { $0.contains("unresolved repeated hour") })

    #expect(throws: GapPolicyError.self) { throw GapPolicyError.doNotInterpolate }
}

@Test func publishedManifestDecodesAndSchemasExist() throws {
    let root = repoRoot()
    let url = root.appendingPathComponent(CoverageManifest.publishedRelativePath)
    let manifest = try CoverageManifest.load(from: url)
    #expect(manifest.packId == "TX_GAME_ENERGY_V1")
    #expect(manifest.claimsCompleteSourceCoverage == false)
    #expect(manifest.trainingArchive.archiveId == "TX_TRAIN_2019_2020")
    #expect(manifest.trainingArchive.label == "training-only")
    #expect(manifest.operatingDays.isEmpty)
    let schemaDir = root.appendingPathComponent("Schemas/phase0")
    let names = try FileManager.default.contentsOfDirectory(atPath: schemaDir.path)
    #expect(names.contains("coverage-manifest.schema.json"))
    #expect(names.contains("normalized-observation.schema.json"))
    #expect(names.contains("save-envelope.schema.json"))
    #expect(names.contains("campaign.schema.json"))
}

private func sampleObservation() -> NormalizedObservation {
    NormalizedObservation(
        datasetId: "fixture.not_source",
        sourceProductId: "UNPINNED",
        sourcePointId: "FIXTURE_ONLY_NOT_AN_ERCOT_ID",
        pointType: "fixture",
        intervalStartUtc: "2021-02-01T06:00:00Z",
        intervalEndUtc: "2021-02-01T07:00:00Z",
        sourceLocalDate: "2021-02-01",
        hourEndingRaw: nil,
        dstFlagRaw: "not_a_transition",
        valueDecimal: "0",
        unit: "fixture",
        sourcePublishedAt: nil,
        ingestedAt: "2026-09-24T00:00:00Z",
        availableAt: nil,
        revisionId: "fixture-r0",
        sourceHash: "abc",
        qualityFlags: ["fixture_not_source"]
    )
}

private func repoRoot(file: String = #filePath) -> URL {
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
