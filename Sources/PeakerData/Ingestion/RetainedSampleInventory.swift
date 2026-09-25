import Foundation
import PeakerKernel

/// Inventory of CSV delivery dates in the retained batch2–batch9 price zips.
///
/// Built only through `RetainedSettlementArchive` (sidecar, inflate, parse).
/// This is a sample list. It does not publish, does not set proxy `covered_local_dates`,
/// and does not change `claims_complete_source_coverage`.
public struct RetainedSampleInventory: Codable, Equatable, Sendable {
    public static let jsonRelativePath = "Data/archives/ercot/2026-09-24/retained-sample-inventory.json"
    public static let markdownRelativePath = "Data/archives/ercot/2026-09-24/retained-sample-inventory.md"
    /// Live artifact From/To days that returned `totalRecords` 0 on both price products in the latest drop.
    /// A retained file on one of these days is still not a live From/To fill.
    /// Latest drop recorded live From/To empty for 2023-06-15 on both products.
    /// An earlier day-ahead archive file already has that delivery date. No real-time interval does.
    /// 2023-10-15 was empty on the live fetch in batch 7 and now has archive samples.
    public static let emptyLiveFromToLocalDates: [String] = ["2023-06-15"]
    /// Days whose earlier live From/To was empty and that now have archive CSV delivery dates.
    public static let earlierEmptyLiveDaysWithArchiveSamples = [
        "2021-04-15", "2022-07-15", "2022-11-15", "2023-01-15", "2023-04-15", "2023-10-15",
    ]

    public let label: String
    public let statement: String
    public let claimsCompleteSourceCoverage: Bool
    public let campaignEraStart: String
    public let campaignEraEnd: String
    public let retainFolders: [String]
    public let products: [RetainedProductSamples]
    public let emptyLiveFromToGates: [EmptyLiveFromToGate]
    public let earlierEmptyLiveDaysWithArchiveSamples: [String]
    public let absentProducts: [AbsentSourceProduct]

    enum CodingKeys: String, CodingKey {
        case label
        case statement
        case claimsCompleteSourceCoverage = "claims_complete_source_coverage"
        case campaignEraStart = "campaign_era_start"
        case campaignEraEnd = "campaign_era_end"
        case retainFolders = "retain_folders"
        case products
        case emptyLiveFromToGates = "empty_live_from_to_gates"
        case earlierEmptyLiveDaysWithArchiveSamples = "earlier_empty_live_days_with_archive_samples"
        case absentProducts = "absent_products"
    }

    public static func scan(retainRoot: URL, ingestedAt: String) throws -> RetainedSampleInventory {
        var buckets: [String: [String: DateBucket]] = [:]
        var zipCounts: [String: Int] = [:]
        var parseErrorCounts: [String: Int] = [:]
        let order = [ERCOTSettlementProduct.dayAheadNP4190CD, .realtimeNP6905CD]
        for product in order {
            buckets[product.rawValue] = [:]
            zipCounts[product.rawValue] = 0
            parseErrorCounts[product.rawValue] = 0
        }

        let zips = try RetainedSettlementArchive.priceZipURLs(in: retainRoot)
        for zipURL in zips {
            let read = try RetainedSettlementArchive.readZip(at: zipURL, ingestedAt: ingestedAt)
            let productId = read.product.rawValue
            zipCounts[productId, default: 0] += 1
            parseErrorCounts[productId, default: 0] += read.result.errors.count
            let relative = relativeZipPath(zipURL, retainRoot: retainRoot)
            var dates = buckets[productId] ?? [:]
            for observation in read.result.observations {
                let bucket = dates[observation.sourceLocalDate] ?? DateBucket()
                if let hourEnding = observation.hourEndingRaw {
                    bucket.hourEndings.insert(hourEnding)
                }
                bucket.zipFileNames.insert(relative)
                bucket.observationCount += 1
                dates[observation.sourceLocalDate] = bucket
            }
            buckets[productId] = dates
        }

        let products = order.map { product in
            let dates = buckets[product.rawValue] ?? [:]
            let samples = dates.keys.sorted().map { date in
                let bucket = dates[date]!
                return DeliveryDateSample(
                    sourceLocalDate: date,
                    insideCampaignEra: date >= CampaignCalendar.start.iso && date <= CampaignCalendar.end.iso,
                    hourEndings: bucket.hourEndings.sorted(),
                    observationCount: bucket.observationCount,
                    zipFileNames: bucket.zipFileNames.sorted()
                )
            }
            return RetainedProductSamples(
                sourceProductId: product.rawValue,
                zipCount: zipCounts[product.rawValue] ?? 0,
                parseErrorCount: parseErrorCounts[product.rawValue] ?? 0,
                deliveryDates: samples
            )
        }

        let gates = emptyLiveFromToLocalDates.map { day in
            EmptyLiveFromToGate(
                sourceLocalDate: day,
                status: "empty_live_from_to",
                retainedHourEndingsByProduct: Dictionary(uniqueKeysWithValues: products.map { product in
                    let hours = product.deliveryDates.first { $0.sourceLocalDate == day }?.hourEndings ?? []
                    return (product.sourceProductId, hours)
                })
            )
        }

        return RetainedSampleInventory(
            label: "retained_sample_inventory",
            statement: "Inventory of CSV DeliveryDate values in verified batch2-batch9 price zips. Not complete coverage. Dates are not proxy covered_local_dates.",
            claimsCompleteSourceCoverage: false,
            campaignEraStart: CampaignCalendar.start.iso,
            campaignEraEnd: CampaignCalendar.end.iso,
            retainFolders: RetainedSettlementArchive.batchFolderNames,
            products: products,
            emptyLiveFromToGates: gates,
            earlierEmptyLiveDaysWithArchiveSamples: earlierEmptyLiveDaysWithArchiveSamples,
            absentProducts: [
                AbsentSourceProduct(productId: "NP4-180-ER", status: "absent_from_public_reports_catalog"),
                AbsentSourceProduct(productId: "NP6-785-ER", status: "absent_from_public_reports_catalog"),
            ]
        )
    }

    public static func decode(from data: Data) throws -> RetainedSampleInventory {
        try JSONDecoder().decode(RetainedSampleInventory.self, from: data)
    }

    public func jsonUTF8() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = [.prettyPrinted, .sortedKeys, .withoutEscapingSlashes]
        return try encoder.encode(self) + Data("\n".utf8)
    }

    public func markdown() -> String {
        var lines: [String] = []
        lines.append("# Retained sample inventory")
        lines.append("")
        lines.append("This file lists CSV `DeliveryDate` values found by `RetainedSettlementArchive` in verified price zips under `batch2` through `batch9`. It is an inventory of retained samples. It is not complete coverage.")
        lines.append("")
        lines.append("`claims_complete_source_coverage` is false. Proxy `source_point_id` and `covered_local_dates` are not filled from this list.")
        lines.append("")
        lines.append("Dates are `sourceLocalDate` from the CSV, not archive post timestamps. An NP4 delivery date is often the civil day after the post. An NP6 file is one `DeliveryHour`:`DeliveryInterval` sample, not a full day. Hour endings `01:00`–`24:00` on an NP4 date are that DAM file’s hours, not proxy coverage.")
        lines.append("")
        lines.append("Campaign era checked here is \(campaignEraStart) through \(campaignEraEnd). Batch 1 is not scanned. The three 2026-09-24 RT zips are outside this readout.")
        lines.append("")
        lines.append("Regenerate both artifacts from the retained zips with `PEAKER_REFRESH_RETAINED_INVENTORY=1` on the inventory test. Do not hand-edit the date rows.")
        lines.append("")
        for product in products {
            lines.append("## \(product.sourceProductId)")
            lines.append("")
            lines.append("\(product.zipCount) price zips. Parse errors reported by the validator: \(product.parseErrorCount). Those errors stay on the rows; they are not dropped from this date list when a row still parsed.")
            lines.append("")
            lines.append("| Delivery date | In campaign era | Hour endings | Observations | Zips |")
            lines.append("| --- | --- | --- | --- | --- |")
            for sample in product.deliveryDates {
                let zips = sample.zipFileNames.map { "`\($0)`" }.joined(separator: ", ")
                lines.append("| \(sample.sourceLocalDate) | \(sample.insideCampaignEra ? "yes" : "no") | \(hourEndingSummary(sample.hourEndings)) | \(sample.observationCount) | \(zips) |")
            }
            lines.append("")
        }
        lines.append("## EMPTY GATE — live From/To")
        lines.append("")
        if emptyLiveFromToGates.isEmpty {
            lines.append("The latest retain recorded no new live `deliveryDateFrom` / `deliveryDateTo` day with `totalRecords` 0. A retained archive file is not a live From/To fill.")
            lines.append("")
        } else {
            lines.append("These days returned `totalRecords` 0 for live `deliveryDateFrom` / `deliveryDateTo` on both NP4-190-CD and NP6-905-CD. A retained hour or interval on that date does not close the gate.")
            lines.append("")
            lines.append("| Day | NP4-190-CD retained hours | NP6-905-CD retained hours |")
            lines.append("| --- | --- | --- |")
            for gate in emptyLiveFromToGates {
                let np4 = gate.retainedHourEndingsByProduct["NP4-190-CD"] ?? []
                let np6 = gate.retainedHourEndingsByProduct["NP6-905-CD"] ?? []
                lines.append("| \(gate.sourceLocalDate) | \(np4.isEmpty ? "none" : hourEndingSummary(np4)) | \(np6.isEmpty ? "none" : hourEndingSummary(np6)) |")
            }
            lines.append("")
        }
        lines.append("Earlier live From/To days \(earlierEmptyLiveDaysWithArchiveSamples.joined(separator: ", ")) now have archive CSV delivery dates in the retained zips. Those files are samples. A real-time file is still one interval. They are not proxy `covered_local_dates`, and this list does not say the live endpoint started returning rows.")
        lines.append("")
        lines.append("## ER ABSENT GATE")
        lines.append("")
        for absent in absentProducts {
            lines.append("- \(absent.productId) is `\(absent.status)`. No Public API path is invented here.")
        }
        lines.append("")
        return lines.joined(separator: "\n")
    }

    private static func relativeZipPath(_ zipURL: URL, retainRoot: URL) -> String {
        let root = retainRoot.standardizedFileURL.path
        let path = zipURL.standardizedFileURL.path
        let prefix = root.hasSuffix("/") ? root : root + "/"
        if path.hasPrefix(prefix) {
            return String(path.dropFirst(prefix.count))
        }
        return zipURL.lastPathComponent
    }

    private func hourEndingSummary(_ hours: [String]) -> String {
        let fullDayAhead = (1...24).map { String(format: "%02d:00", $0) }
        if hours == fullDayAhead {
            return "01:00–24:00 (24)"
        }
        return hours.joined(separator: ", ")
    }
}

public struct RetainedProductSamples: Codable, Equatable, Sendable {
    public let sourceProductId: String
    public let zipCount: Int
    public let parseErrorCount: Int
    public let deliveryDates: [DeliveryDateSample]

    enum CodingKeys: String, CodingKey {
        case sourceProductId = "source_product_id"
        case zipCount = "zip_count"
        case parseErrorCount = "parse_error_count"
        case deliveryDates = "delivery_dates"
    }
}

public struct DeliveryDateSample: Codable, Equatable, Sendable {
    public let sourceLocalDate: String
    public let insideCampaignEra: Bool
    public let hourEndings: [String]
    public let observationCount: Int
    public let zipFileNames: [String]

    enum CodingKeys: String, CodingKey {
        case sourceLocalDate = "source_local_date"
        case insideCampaignEra = "inside_campaign_era"
        case hourEndings = "hour_endings"
        case observationCount = "observation_count"
        case zipFileNames = "zip_file_names"
    }
}

public struct EmptyLiveFromToGate: Codable, Equatable, Sendable {
    public let sourceLocalDate: String
    public let status: String
    /// Product id to the hour-ending strings retained for that delivery date. Empty means no retained sample.
    public let retainedHourEndingsByProduct: [String: [String]]

    enum CodingKeys: String, CodingKey {
        case sourceLocalDate = "source_local_date"
        case status
        case retainedHourEndingsByProduct = "retained_hour_endings_by_product"
    }
}

public struct AbsentSourceProduct: Codable, Equatable, Sendable {
    public let productId: String
    public let status: String

    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case status
    }
}

private final class DateBucket {
    var hourEndings: Set<String> = []
    var zipFileNames: Set<String> = []
    var observationCount = 0
}
