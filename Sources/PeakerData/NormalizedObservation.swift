import Foundation
import PeakerKernel

/// Normalized observation (§5.2). Publication timestamps stay null when the archive does not prove them.
public struct NormalizedObservation: Codable, Equatable, Sendable {
    public var datasetId: String
    public var sourceProductId: String
    public var sourcePointId: String
    public var pointType: String
    public var intervalStartUtc: String
    public var intervalEndUtc: String
    public var sourceLocalDate: String
    public var hourEndingRaw: String?
    public var dstFlagRaw: String?
    public var valueDecimal: String
    public var unit: String
    public var sourcePublishedAt: String?
    public var ingestedAt: String
    public var availableAt: String?
    public var revisionId: String
    public var sourceHash: String
    public var qualityFlags: [String]
    public var issuedAt: String?
    public var forecastFor: String?

    public init(
        datasetId: String,
        sourceProductId: String,
        sourcePointId: String,
        pointType: String,
        intervalStartUtc: String,
        intervalEndUtc: String,
        sourceLocalDate: String,
        hourEndingRaw: String?,
        dstFlagRaw: String?,
        valueDecimal: String,
        unit: String,
        sourcePublishedAt: String?,
        ingestedAt: String,
        availableAt: String?,
        revisionId: String,
        sourceHash: String,
        qualityFlags: [String],
        issuedAt: String? = nil,
        forecastFor: String? = nil
    ) {
        self.datasetId = datasetId
        self.sourceProductId = sourceProductId
        self.sourcePointId = sourcePointId
        self.pointType = pointType
        self.intervalStartUtc = intervalStartUtc
        self.intervalEndUtc = intervalEndUtc
        self.sourceLocalDate = sourceLocalDate
        self.hourEndingRaw = hourEndingRaw
        self.dstFlagRaw = dstFlagRaw
        self.valueDecimal = valueDecimal
        self.unit = unit
        self.sourcePublishedAt = sourcePublishedAt
        self.ingestedAt = ingestedAt
        self.availableAt = availableAt
        self.revisionId = revisionId
        self.sourceHash = sourceHash
        self.qualityFlags = qualityFlags
        self.issuedAt = issuedAt
        self.forecastFor = forecastFor
    }

    enum CodingKeys: String, CodingKey {
        case datasetId = "dataset_id"
        case sourceProductId = "source_product_id"
        case sourcePointId = "source_point_id"
        case pointType = "point_type"
        case intervalStartUtc = "interval_start_utc"
        case intervalEndUtc = "interval_end_utc"
        case sourceLocalDate = "source_local_date"
        case hourEndingRaw = "hour_ending_raw"
        case dstFlagRaw = "dst_flag_raw"
        case valueDecimal = "value_decimal"
        case unit
        case sourcePublishedAt = "source_published_at"
        case ingestedAt = "ingested_at"
        case availableAt = "available_at"
        case revisionId = "revision_id"
        case sourceHash = "source_hash"
        case qualityFlags = "quality_flags"
        case issuedAt = "issued_at"
        case forecastFor = "forecast_for"
    }
}

public enum ObservationValidator {
    public static let knownPointTypes: Set<String> = [
        "hub_spp", "load_zone_spp", "resource_spp", "fixture",
    ]

    public static func validate(_ rows: [NormalizedObservation]) -> [String] {
        var errors: [String] = []
        var seen: [String: String] = [:]
        for row in rows {
            if !knownPointTypes.contains(row.pointType) {
                errors.append("unknown point type \(row.pointType)")
            }
            if row.pointType == "fixture" && !row.qualityFlags.contains("fixture_not_source") {
                errors.append("fixture rows must carry quality flag fixture_not_source")
            }
            if !isFiniteDecimal(row.valueDecimal) {
                errors.append("nonfinite or missing value for \(row.sourcePointId) \(row.intervalStartUtc)")
            }
            if (try? CivilDate(iso: row.sourceLocalDate)) == nil {
                errors.append("impossible date \(row.sourceLocalDate)")
            }
            if !row.intervalStartUtc.isEmpty && row.intervalEndUtc <= row.intervalStartUtc {
                errors.append("interval end must be after interval start")
            }
            let key = "\(row.sourcePointId)|\(row.intervalStartUtc)|\(row.revisionId)"
            if let previous = seen[key], previous != row.valueDecimal {
                errors.append("duplicate conflicting interval key \(key)")
            }
            seen[key] = row.valueDecimal
            if let date = try? CivilDate(iso: row.sourceLocalDate),
               ChicagoCivilCalendar.transition(on: date) == .fallBack,
               row.dstFlagRaw == nil || row.dstFlagRaw?.isEmpty == true {
                errors.append("unresolved repeated hour on \(row.sourceLocalDate)")
            }
        }
        return errors
    }

    public static func isFiniteDecimal(_ raw: String) -> Bool {
        let trimmed = raw.trimmingCharacters(in: .whitespaces)
        if trimmed.isEmpty { return false }
        let lowered = trimmed.lowercased()
        if lowered == "nan" || lowered == "inf" || lowered == "+inf" || lowered == "-inf" || lowered == "infinity" {
            return false
        }
        return Decimal(string: trimmed) != nil
    }
}

public enum GapPolicyError: Error, Equatable, CustomStringConvertible {
    case doNotInterpolate
    case doNotForwardFill

    public var description: String {
        switch self {
        case .doNotInterpolate:
            return "Missing settlement intervals are not interpolated (§5.3)."
        case .doNotForwardFill:
            return "Yesterday's price is not forward-filled into a missing interval (§5.3)."
        }
    }
}
