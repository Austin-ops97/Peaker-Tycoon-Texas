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

@Test func presentationScrubMovesTheDisplayedInstantAndStopsAtThePlaceholderDeadline() {
    let start = GameDefaults.placeholderMorningBrief
    let paused = PresentationScrub.step(clock: start, speed: .pause)
    #expect(paused.clock == start)
    #expect(paused.speed == .pause)

    let one = PresentationScrub.step(clock: start, speed: .x1)
    #expect(one.clock == GameInstant(date: start.date, hour: 8, minute: 0, second: 1))
    #expect(one.speed == .x1)

    let eight = PresentationScrub.step(clock: start, speed: .x8)
    #expect(eight.clock.second == 8)
    let fast = PresentationScrub.step(clock: start, speed: .x32)
    #expect(fast.clock.second == 32)

    let late = GameInstant(date: start.date, hour: 23, minute: 59, second: 50)
    let rolled = PresentationScrub.step(clock: late, speed: .x32)
    #expect(rolled.clock == GameInstant(date: start.date.addingDays(1), hour: 0, minute: 0, second: 22))

    let almost = GameInstant(date: start.date, hour: 9, minute: 59, second: 59)
    let decision = PresentationScrub.step(clock: almost, speed: .untilNextDecision)
    #expect(decision.clock == GameInstant(date: start.date, hour: 10, minute: 0, second: 0))
    #expect(decision.speed == .pause)

    let morning = PresentationScrub.step(clock: start, speed: .untilNextDecision)
    #expect(morning.clock.second == 1)
    #expect(morning.speed == .untilNextDecision)

    let already = PresentationScrub.step(clock: decision.clock, speed: .untilNextDecision)
    #expect(already.clock == decision.clock)
    #expect(already.speed == .pause)
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
    let driver = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/Chrome/PresentationClockDriver.swift"), encoding: .utf8)
    #expect(driver.contains("TimelineView"))
    #expect(driver.contains("PresentationScrub"))
    #expect(!driver.contains("CampaignKernel"))
    let desk = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/DeskPlaceholderView.swift"), encoding: .utf8)
    #expect(desk.contains("Sample prices from retained SOURCE archives"))
    #expect(desk.contains("Previous sample"))
    #expect(desk.contains("Next sample"))
    #expect(desk.contains("These are retained historical samples, not a live market."))
    #expect(desk.contains("Stays true for every hub in this cycle."))
    #expect(desk.contains("Shows the previous retained hub sample. Not a live market."))
    #expect(desk.contains("Shows the next retained hub sample. Not a live market."))
    #expect(!desk.contains("Coverage is incomplete."))
    #expect(desk.contains("Review today’s plan"))
    #expect(desk.contains("Opens the retained sample on screen. Not live."))
    #expect(desk.contains("Retained sample — not live."))
    #expect(desk.contains("Button(\"Done\")"))
    #expect(desk.contains("Next up"))
    #expect(desk.contains("Next, use the arrows to cycle saved hubs, or open Review today’s plan."))
    #expect(desk.contains("HB_HOUSTON"))
    #expect(desk.contains("Houston"))
    #expect(desk.contains("HB_NORTH"))
    #expect(desk.contains("North"))
    #expect(desk.contains("HB_WEST"))
    #expect(desk.contains("West"))
    let sampleCSV = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/Resources/market-sample-np4.csv"), encoding: .utf8)
    #expect(sampleCSV.contains("02/10/2021,01:00,HB_HOUSTON, 24.14,N"))
    #expect(sampleCSV.contains("07/15/2022,01:00,HB_HOUSTON, 43.75,N"))
    #expect(sampleCSV.contains("10/15/2023,01:00,HB_NORTH, 22.41,N"))
    #expect(sampleCSV.contains("08/15/2024,01:00,HB_WEST, 20.02,N"))
    #expect(!desk.contains("Submit offer"))
    #expect(!desk.contains("\"Confirm\""))
    #expect(!desk.contains("\"Trade\""))
    #expect(!desk.contains("Lens"))
    let fuel = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/FuelPlaceholderView.swift"), encoding: .utf8)
    #expect(fuel.contains("10:00 DA"))
    #expect(fuel.contains("13:00 gas"))
    #expect(fuel.contains("13:30 DAM target"))
    #expect(fuel.contains("archive actual"))
    #expect(fuel.contains("This tab is waiting. Nomination isn’t open yet, so you only see the day’s timeline."))
    #expect(fuel.contains("No result yet — nomination is still closed."))
    #expect(fuel.contains("Those times are the gas-day markers, not a live nomination."))
    #expect(fuel.contains("See gas day timeline"))
    #expect(fuel.contains("Scrolls to the four gas-day markers. Nomination isn’t open yet."))
    #expect(fuel.contains("Closed gas day. Not a live nomination."))
    #expect(!fuel.contains("Verdict unavailable"))
    #expect(!fuel.contains("\"Confirm\""))
    let plant = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/PlantPlaceholderView.swift"), encoding: .utf8)
    #expect(plant.contains("This plant is waiting for a connected reading. State, power output, and fuel flow stay blank, and this is not a live dispatch."))
    #expect(plant.contains("View unit status"))
    #expect(plant.contains("Scrolls to state, power, and fuel flow. Not a live dispatch."))
    #expect(plant.contains("Fuel flow"))
    #expect(plant.contains("This card has no prices."))
    #expect(!plant.contains("\"Confirm\""))
    let settle = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/SettlePlaceholderView.swift"), encoding: .utf8)
    #expect(settle.contains("This tab is waiting. Statements aren’t ready yet, and this isn’t a live settle."))
    #expect(settle.contains("No statements yet."))
    #expect(settle.contains("How settlement works"))
    #expect(settle.contains("Opens a short explanation. Statements aren’t ready yet."))
    #expect(settle.contains("No statement is on this screen."))
    #expect(settle.contains("Settlement is the money in and the money out for the day. This isn’t a live settle."))
    #expect(settle.contains("When a statement is ready, you can read why an amount is there. None is ready yet."))
    #expect(!settle.contains("StatementLine"))
    #expect(!settle.contains("OfferTranche"))
    #expect(!settle.contains("Award"))
    let settings = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/SettingsPlaceholderView.swift"), encoding: .utf8)
    #expect(settings.contains("Your local time zone"))
    #expect(settings.contains("TimeZonePickerView"))
    #expect(settings.contains("Show navigation tips"))
    #expect(settings.contains("Plays the three tips under the clock again."))
    #expect(settings.contains("Shows the local time tip. Dismissing it does not cover Desk."))
    #expect(settings.contains("Section(\"Local time\")"))
    #expect(settings.contains("Section(\"Tips\")"))
    #expect(settings.contains("Section(\"Evidence\")"))
    #expect(settings.contains("CoverageSamplePage"))
    #expect(settings.contains("spanSentence"))
    #expect(!settings.contains("ThumbPrimaryButton"))
    #expect(!settings.contains("NP4-"))
    #expect(!settings.contains("NP6-"))
    #expect(!settings.contains("covered_local_dates"))
    let playerSummary = try String(contentsOf: root.appendingPathComponent("Sources/PeakerData/Ingestion/RetainedSamplePlayerSummary.swift"), encoding: .utf8)
    #expect(playerSummary.contains("Saved price samples"))
    #expect(playerSummary.contains("Saved samples are a partial history, and the campaign is not fully filled."))
    #expect(playerSummary.contains("Some days in this set still have no saved prices."))
    #expect(playerSummary.contains("Some settlement reports are not available yet."))
    #expect(playerSummary.contains("not a full day"))
    #expect(playerSummary.contains("Saved delivery dates span"))
    #expect(!playerSummary.contains("covered_local_dates"))
    let coach = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/Chrome/NavigationCoachCard.swift"), encoding: .utf8)
    #expect(coach.contains("Four tabs sit along the bottom: Desk, Fuel, Plant, and Settle."))
    #expect(coach.contains("On Desk, the arrows cycle retained hub samples. Those prices are not live."))
    #expect(coach.contains("Review today’s plan opens that sample to read. Dismiss it and you are back on Desk."))
    #expect(coach.contains("Got it"))
    #expect(coach.contains("Not now"))
    #expect(coach.contains("Dismisses this tip and shows the next one."))
    #expect(coach.contains("Dismisses this tip and hides the rest of this session."))
    #expect(!coach.contains("accessibilityElement(children: .combine)"))
    #expect(!coach.contains("Confirm"))
    #expect(!coach.contains("Submit"))
    #expect(!coach.contains("Trade"))
    #expect(!coach.contains("StatementLine"))
    #expect(!coach.contains("OfferTranche"))
    #expect(!coach.contains("Award"))
    let shell = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/RootShellView.swift"), encoding: .utf8)
    #expect(shell.contains("coachBeat1Dismissed"))
    #expect(shell.contains("coachBeat2Dismissed"))
    #expect(shell.contains("coachBeat3Dismissed"))
    #expect(shell.contains("coachHeld"))
    #expect(shell.contains("showsDeskNextStep"))
    #expect(shell.contains("local-time tip"))
    #expect(shell.contains("dynamicTypeSize.isAccessibilitySize"))
    #expect(shell.contains("proxy.size.height * 0.45"))
    let picker = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/TimeZonePickerView.swift"), encoding: .utf8)
    #expect(picker.contains("Use my phone’s time zone"))
    let rootTab = try String(contentsOf: root.appendingPathComponent("App/PeakerTycoon/RootTab.swift"), encoding: .utf8)
    #expect(rootTab.contains("voiceOverHint"))
    #expect(rootTab.contains("Retained samples and today’s plan. Not a live market."))
    #expect(rootTab.contains("Gas-day timeline. Nomination isn’t open yet."))
    #expect(rootTab.contains("Waiting for a connected reading. Not a live dispatch."))
    #expect(rootTab.contains("Statements aren’t ready yet. This isn’t a live settle."))
    #expect(rootTab.contains("briefcase.fill"))
    #expect(rootTab.contains("flame.fill"))
    #expect(rootTab.contains("bolt.fill"))
    #expect(rootTab.contains("doc.text.fill"))
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
