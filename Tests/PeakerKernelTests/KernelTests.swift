import Foundation
import Testing
@testable import PeakerKernel

@Test func civilDatesRoundTripAcrossTheCampaignEra() throws {
    let start = try CivilDate(iso: "2021-02-01")
    #expect(start.addingDays(1) == CivilDate(year: 2021, month: 2, day: 2))
    #expect(CivilDate(year: 2021, month: 2, day: 28).addingDays(1) == CivilDate(year: 2021, month: 3, day: 1))
    #expect(CivilDate(year: 2024, month: 2, day: 28).addingDays(1) == CivilDate(year: 2024, month: 2, day: 29))
    #expect(CivilDate(year: 2024, month: 2, day: 29).addingDays(1) == CivilDate(year: 2024, month: 3, day: 1))
    #expect(throws: CivilDateError.self) { try CivilDate(iso: "2021-02-31") }
}

@Test func generatedCampaignCalendarIsStrictlyIncreasing() {
    let days = CampaignCalendar.allDays()
    #expect(days.count == 1795)
    #expect(CampaignCalendar.chronologyErrors(in: days).isEmpty)
    #expect(days.first == CampaignCalendar.start)
    #expect(days.last == CampaignCalendar.end)
}

@Test func chicagoTransitionDaysHaveNinetyTwoOrOneHundredQuarterHours() {
    #expect(ChicagoCivilCalendar.quarterHours(on: CivilDate(year: 2021, month: 2, day: 1)) == 96)
    #expect(ChicagoCivilCalendar.transition(on: CivilDate(year: 2021, month: 3, day: 14)) == .springForward)
    #expect(ChicagoCivilCalendar.quarterHours(on: CivilDate(year: 2021, month: 3, day: 14)) == 92)
    #expect(ChicagoCivilCalendar.transition(on: CivilDate(year: 2021, month: 11, day: 7)) == .fallBack)
    #expect(ChicagoCivilCalendar.quarterHours(on: CivilDate(year: 2021, month: 11, day: 7)) == 100)
    #expect(ChicagoCivilCalendar.transition(on: CivilDate(year: 2024, month: 3, day: 10)) == .springForward)
    #expect(ChicagoCivilCalendar.transition(on: CivilDate(year: 2025, month: 11, day: 2)) == .fallBack)
}

@Test func rngSubstreamsAreStableAndIndependent() throws {
    var first = RNGRegistry(campaignSeed: 0x5045_414B)
    var second = RNGRegistry(campaignSeed: 0x5045_414B)
    let drawA = try first.next(stream: "forecast.lens")
    let drawB = try second.next(stream: "forecast.lens")
    #expect(drawA == drawB)
    let equipmentBefore = first.state(of: "equipment.events")
    _ = try first.next(stream: "forecast.lens")
    #expect(first.state(of: "equipment.events") == equipmentBefore)
    #expect(first.state(of: "forecast.lens") != second.state(of: "forecast.lens"))
    #expect(throws: RNGError.self) { try first.next(stream: "unlabeled.stream") }
    #expect(RNGRegistry.documentedSubstreams.contains("forecast.lens"))
    #expect(RNGRegistry.documentedSubstreams.contains("equipment.events"))
}

@Test func replayMatchesSeedPlusInputLog() throws {
    let log: [KernelInput] = [
        .advanceOperatingDay,
        .setPresentationSpeed(.x32),
        .advanceOperatingDay,
        .notePlaceholder(id: "phase0-note"),
    ]
    let left = try Replay.run(seed: 7, log: log)
    let right = try Replay.run(seed: 7, log: log)
    #expect(left == right)
    #expect(left.operatingDay == CivilDate(year: 2021, month: 2, day: 3))
    #expect(left.completedDays == 2)
    #expect(left.presentationSpeed == .x32)
    #expect(left.bootstrapSupplementsForecast)

    var speedOnly = CampaignKernel(seed: 7)
    let before = speedOnly.worldDigest
    try speedOnly.apply(.setPresentationSpeed(.x8))
    #expect(speedOnly.worldDigest == before)
    #expect(speedOnly.replayDigest != before)

    let save = try Replay.makeSave(seed: 7, log: log)
    let restored = try Replay.run(save: save)
    #expect(restored.replayDigest == save.replayDigest)
    #expect(restored == left)
}

@Test func loaderRejectsV2AndRecordsMinorMigration() throws {
    let v2 = SaveEnvelope(
        schemaVersion: SchemaVersion(major: 2, minor: 0, patch: 0),
        campaignSeed: 1,
        inputLog: [],
        migrationLog: [],
        replayDigest: "ignored"
    )
    #expect(throws: SaveError.self) { try SaveSchema.load(v2) }

    let current = try Replay.makeSave(seed: 1, log: [])
    let loaded = try SaveSchema.load(current)
    #expect(loaded.schemaVersion == SchemaVersion(major: 3, minor: 0, patch: 0))
    #expect(loaded.migrationLog.isEmpty)

    let step = SaveMigrationStep(
        from: SchemaVersion(major: 3, minor: 0, patch: 0),
        to: SchemaVersion(major: 3, minor: 1, patch: 0),
        note: "test migration"
    )
    let migrated = try SaveSchema.load(
        current,
        migratingToward: SchemaVersion(major: 3, minor: 1, patch: 0),
        steps: [step]
    )
    #expect(migrated.schemaVersion == SchemaVersion(major: 3, minor: 1, patch: 0))
    #expect(migrated.migrationLog.count == 1)
    #expect(migrated.migrationLog[0].note == "test migration")
}

@Test func bootstrapRetiresAtNinetyCompletedDays() throws {
    #expect(BootstrapPolicy.supplementsForecast(completedCampaignDays: 0))
    #expect(BootstrapPolicy.supplementsForecast(completedCampaignDays: 89))
    #expect(!BootstrapPolicy.supplementsForecast(completedCampaignDays: 90))
    #expect(BootstrapPolicy.forecastLabel(completedCampaignDays: 89) == "bootstrap")
    #expect(BootstrapPolicy.forecastLabel(completedCampaignDays: 90) == nil)

    var kernel = CampaignKernel(seed: 1)
    for _ in 0..<89 {
        try kernel.apply(.advanceOperatingDay)
    }
    #expect(kernel.bootstrapSupplementsForecast)
    try kernel.apply(.advanceOperatingDay)
    #expect(kernel.completedDays == 90)
    #expect(!kernel.bootstrapSupplementsForecast)
}

@Test func areaProxyMatchesTheSpecExampleAndBlocksMissingComponents() throws {
    let weights = ProxyPrice.defaultAreaWeights
    let price = try ProxyPrice.combine(
        weights: weights,
        prices: [Decimal(100), Decimal(120), Decimal(80)]
    )
    #expect(price == Decimal(102))
    #expect(throws: ProxyPriceError.self) {
        try ProxyPrice.combine(weights: weights, prices: [Decimal(100), nil, Decimal(80)])
    }
}

@Test func kernelAndAppSourcesDoNotReadTheWallClockOrImportUI() throws {
    let root = repoRoot()
    let kernel = try swiftSources(at: root.appendingPathComponent("Sources/PeakerKernel"))
    let app = try swiftSources(at: root.appendingPathComponent("App"))
    let forbidden = [
        "import SwiftUI",
        "import UIKit",
        "Date()",
        "Timer(",
        "CFAbsoluteTimeGetCurrent",
        "clock_gettime",
        "FileManager",
        "URLSession",
        "ProcessInfo.processInfo",
    ]
    for file in kernel {
        let text = try String(contentsOf: file, encoding: .utf8)
        for token in forbidden {
            #expect(!text.contains(token), "\(file.lastPathComponent) contains \(token)")
        }
    }
    let appForbidden = ["Date()", "Timer(", "CFAbsoluteTimeGetCurrent", "URLSession"]
    for file in app where file.pathExtension == "swift" {
        let text = try String(contentsOf: file, encoding: .utf8)
        for token in appForbidden {
            #expect(!text.contains(token), "\(file.lastPathComponent) contains \(token)")
        }
        #expect(!text.contains("RoleSwitcher"))
    }
    let rootTab = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/RootTab.swift"), encoding: .utf8)
    #expect(rootTab.contains("case desk"))
    #expect(rootTab.contains("case fuel"))
    #expect(rootTab.contains("case plant"))
    #expect(rootTab.contains("case settle"))
    #expect(!rootTab.contains("case portfolio"))
    #expect(!rootTab.contains("case roles"))
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

private func swiftSources(at directory: URL) throws -> [URL] {
    let fm = FileManager.default
    guard let enumerator = fm.enumerator(at: directory, includingPropertiesForKeys: nil) else {
        return []
    }
    var files: [URL] = []
    for case let url as URL in enumerator where url.pathExtension == "swift" {
        files.append(url)
    }
    return files
}
