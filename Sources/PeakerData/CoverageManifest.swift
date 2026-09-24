import Foundation
import PeakerKernel

public struct SourcePeriod: Codable, Equatable, Sendable {
    public let start: String
    public let end: String

    enum CodingKeys: String, CodingKey {
        case start
        case end
    }
}

public struct ProxyPointCoverage: Codable, Equatable, Sendable {
    public let siteId: String
    public let displayName: String
    public let evidence: String
    public let approximateSetting: String
    public let starterPriceFamily: String
    public let proxyGrade: String
    public let sourcePointId: String?
    public let coveredLocalDates: [String]

    enum CodingKeys: String, CodingKey {
        case siteId = "site_id"
        case displayName = "display_name"
        case evidence
        case approximateSetting = "approximate_setting"
        case starterPriceFamily = "starter_price_family"
        case proxyGrade = "proxy_grade"
        case sourcePointId = "source_point_id"
        case coveredLocalDates = "covered_local_dates"
    }
}

public struct AncillaryFamilyCoverage: Codable, Equatable, Sendable {
    public let familyId: String
    public let coveredLocalDates: [String]

    enum CodingKeys: String, CodingKey {
        case familyId = "family_id"
        case coveredLocalDates = "covered_local_dates"
    }
}

public struct AncillarySelection: Codable, Equatable, Sendable {
    public let selected: Bool
    public let reason: String
}

public struct GapReport: Codable, Equatable, Sendable {
    public let status: String
    public let reason: String
}

public struct TrainingArchiveRef: Codable, Equatable, Sendable {
    public let archiveId: String
    public let label: String
    public let periodStart: String
    public let periodEnd: String
    public let completeness: String
    public let sourceBatchCount: Int

    enum CodingKeys: String, CodingKey {
        case archiveId = "archive_id"
        case label
        case periodStart = "period_start"
        case periodEnd = "period_end"
        case completeness
        case sourceBatchCount = "source_batch_count"
    }
}

public struct SourceProductStatus: Codable, Equatable, Sendable {
    public let productId: String
    public let role: String
    public let status: String
    public let pinnedApiPath: String?

    enum CodingKeys: String, CodingKey {
        case productId = "product_id"
        case role
        case status
        case pinnedApiPath = "pinned_api_path"
    }
}

/// In-repo coverage manifest (§5.3 pack fields plus the Phase 0 day gate).
public struct CoverageManifest: Codable, Equatable, Sendable {
    public let packId: String
    public let schemaVersion: String
    public let evidence: String
    public let claimsCompleteSourceCoverage: Bool
    public let completeness: String
    public let sourceBatchCount: Int
    public let rightsStatus: String
    public let qualityGrade: String
    public let sourcePeriod: SourcePeriod
    public let operatingDays: [String]
    public let selectedProxyPoints: [ProxyPointCoverage]
    public let ancillaryServicePriceFamilies: [AncillaryFamilyCoverage]
    public let ancillaryServiceSelection: AncillarySelection
    public let gapReport: GapReport
    public let trainingArchive: TrainingArchiveRef
    public let sourceProducts: [SourceProductStatus]
    public let contentHash: String?
    public let collectionTime: String?
    public let effectiveRuleProfiles: [String]
    public let pointManifestHash: String?
    public let proxyMappingHash: String?
    public let availableFeatures: [String]
    public let settlementRevisionPolicy: String
    public let reconstructedInputs: [String]
    public let trainingCutoff: String?

    enum CodingKeys: String, CodingKey {
        case packId = "pack_id"
        case schemaVersion = "schema_version"
        case evidence
        case claimsCompleteSourceCoverage = "claims_complete_source_coverage"
        case completeness
        case sourceBatchCount = "source_batch_count"
        case rightsStatus = "rights_status"
        case qualityGrade = "quality_grade"
        case sourcePeriod = "source_period"
        case operatingDays = "operating_days"
        case selectedProxyPoints = "selected_proxy_points"
        case ancillaryServicePriceFamilies = "ancillary_service_price_families"
        case ancillaryServiceSelection = "ancillary_service_selection"
        case gapReport = "gap_report"
        case trainingArchive = "training_archive"
        case sourceProducts = "source_products"
        case contentHash = "content_hash"
        case collectionTime = "collection_time"
        case effectiveRuleProfiles = "effective_rule_profiles"
        case pointManifestHash = "point_manifest_hash"
        case proxyMappingHash = "proxy_mapping_hash"
        case availableFeatures = "available_features"
        case settlementRevisionPolicy = "settlement_revision_policy"
        case reconstructedInputs = "reconstructed_inputs"
        case trainingCutoff = "training_cutoff"
    }

    public static let publishedRelativePath = "Data/packs/TX_GAME_ENERGY_V1/coverage-manifest.json"

    public static func load(from url: URL) throws -> CoverageManifest {
        let data = try Data(contentsOf: url)
        let decoder = JSONDecoder()
        return try decoder.decode(CoverageManifest.self, from: data)
    }
}

public enum CoverageGate {
    /// §26.3 five_year_coverage_gate. A single missing day fails. Empty SOURCE batches fail.
    /// AS families are required only when the manifest selects them. Release 1 energy-only selects none (§4, §20, §28.2).
    public static func evaluate(_ manifest: CoverageManifest) -> [String] {
        var errors: [String] = []
        if manifest.claimsCompleteSourceCoverage == false || manifest.completeness != "complete" {
            errors.append(
                "GATE: manifest does not claim complete SOURCE coverage for \(CampaignCalendar.start.iso) through \(CampaignCalendar.end.iso)."
            )
        }
        if manifest.sourceBatchCount == 0 {
            errors.append("GATE: source_batch_count is 0. A hand-filled day list is not ingested coverage.")
        }
        if manifest.rightsStatus == "unresolved" {
            errors.append("GATE: rights_status is unresolved. No redistribution permission is recorded.")
        }
        if manifest.selectedProxyPoints.isEmpty {
            errors.append("GATE: no proxy points are selected.")
        }
        let expected = Set(CampaignCalendar.allDays().map(\.iso))
        for point in manifest.selectedProxyPoints {
            if point.sourcePointId == nil || point.sourcePointId?.isEmpty == true {
                errors.append("GATE: \(point.siteId) has no validated SOURCE settlement point id.")
            }
            let missing = expected.subtracting(point.coveredLocalDates)
            if !missing.isEmpty {
                errors.append("GATE: \(point.siteId) is missing \(missing.count) campaign days.")
            }
        }
        if manifest.ancillaryServiceSelection.selected {
            if manifest.ancillaryServicePriceFamilies.isEmpty {
                errors.append("GATE: ancillary families are selected but none are listed.")
            }
            for family in manifest.ancillaryServicePriceFamilies {
                let missing = expected.subtracting(family.coveredLocalDates)
                if !missing.isEmpty {
                    errors.append("GATE: AS family \(family.familyId) is missing \(missing.count) campaign days.")
                }
            }
        } else if !manifest.ancillaryServicePriceFamilies.isEmpty {
            errors.append("GATE: ancillary families are listed while ancillary selection is false.")
        }
        for product in manifest.sourceProducts where product.status != "ingested" {
            errors.append("GATE: source product \(product.productId) status is \(product.status).")
        }
        for product in manifest.sourceProducts where product.pinnedApiPath == nil {
            errors.append("GATE: source product \(product.productId) has no pinned API path.")
        }
        return errors
    }
}

public enum CampaignChronologyGate {
    /// §26.3 campaign_chronology against the published pack, not a generated calendar of uncovered days.
    public static func evaluate(operatingDayISOs: [String]) -> [String] {
        var errors: [String] = []
        if operatingDayISOs.isEmpty {
            errors.append(
                "GATE: the published pack lists no operating days. Real five-year coverage has not been ingested, so campaign_chronology cannot pass."
            )
        }
        var days: [CivilDate] = []
        for iso in operatingDayISOs {
            guard let date = try? CivilDate(iso: iso) else {
                errors.append("Unparseable operating day \(iso).")
                continue
            }
            days.append(date)
        }
        if operatingDayISOs.isEmpty {
            return errors
        }
        errors.append(contentsOf: CampaignCalendar.chronologyErrors(in: days))
        return errors
    }
}
