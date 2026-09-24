import Foundation

public struct RawBytes: Equatable, Sendable {
    public let bytes: [UInt8]
    public let label: String

    public init(bytes: [UInt8], label: String) {
        self.bytes = bytes
        self.label = label
    }
}

public struct RetainedRaw: Equatable, Sendable {
    public let sha256: String
    public let byteCount: Int
    public let label: String
}

public enum RawRetain {
    public static func retain(_ raw: RawBytes) -> RetainedRaw {
        RetainedRaw(
            sha256: SHA256Digest.hex(raw.bytes),
            byteCount: raw.bytes.count,
            label: raw.label
        )
    }
}

public enum IngestionError: Error, Equatable, CustomStringConvertible {
    case adapterUnpinned(productId: String)
    case liveFetchNotConfigured(productId: String)
    case refusedCompletePublish(reasons: [String])
    case paginationIncomplete

    public var description: String {
        switch self {
        case .adapterUnpinned(let productId):
            return "Refusing to fetch \(productId). The API path is not pinned. Resolve it from ERCOT OpenAPI and pin the adapter version. This build does not invent a path."
        case .liveFetchNotConfigured(let productId):
            return "Live fetch for \(productId) is not configured. No credentials are stored in this repository, and no request was sent."
        case .refusedCompletePublish(let reasons):
            return "Refusing to publish a complete pack: \(reasons.joined(separator: "; "))"
        case .paginationIncomplete:
            return "An incomplete pagination sequence cannot publish a dataset as complete."
        }
    }
}

/// Fetch stage. Report IDs from the spec inventory are not API paths.
public enum LiveFetch {
    public static func fetch(sourceProductId: String, pinnedOpenAPIPath: String?) throws -> RawBytes {
        guard let pinnedOpenAPIPath, !pinnedOpenAPIPath.isEmpty else {
            throw IngestionError.adapterUnpinned(productId: sourceProductId)
        }
        throw IngestionError.liveFetchNotConfigured(productId: sourceProductId)
    }
}

public struct ReconciledSeries: Equatable, Sendable {
    public let rows: [NormalizedObservation]
    public let policy: String
    public let inventedCorrectionChronology: Bool
}

public enum Reconciler {
    /// Revisions stay append-only. When only final prices exist, label final-price replay and do not invent earlier posts.
    public static func reconcile(_ rows: [NormalizedObservation], policy: String) -> ReconciledSeries {
        ReconciledSeries(rows: rows, policy: policy, inventedCorrectionChronology: false)
    }
}

public struct PackDraft: Equatable, Sendable {
    public let packId: String
    public let completeness: String
    public let observations: [NormalizedObservation]
    public let validationErrors: [String]
    public let contentHash: String
    public let rawSHA256: String
    public let claimsCompleteSourceCoverage: Bool
    public let settlementRevisionPolicy: String
}

public enum PackPublisher {
    public static func publish(
        packId: String,
        observations: [NormalizedObservation],
        validationErrors: [String],
        rawSHA256: String,
        settlementRevisionPolicy: String,
        requestComplete: Bool
    ) throws -> PackDraft {
        let canonical = observations.map { "\($0.sourcePointId)|\($0.intervalStartUtc)|\($0.revisionId)|\($0.valueDecimal)" }
            .joined(separator: "\n")
        let hash = SHA256Digest.hex(Array(canonical.utf8))
        var reasons = validationErrors
        if observations.isEmpty {
            reasons.append("no observations")
        }
        if observations.contains(where: { $0.qualityFlags.contains("fixture_not_source") }) {
            reasons.append("batch contains fixture_not_source rows")
        }
        if observations.contains(where: { $0.sourcePublishedAt == nil }) {
            reasons.append("at least one row has a null publication time")
        }
        let blocked = !reasons.isEmpty
        if requestComplete && blocked {
            throw IngestionError.refusedCompletePublish(reasons: reasons)
        }
        return PackDraft(
            packId: packId,
            completeness: blocked ? "incomplete" : "complete",
            observations: observations,
            validationErrors: validationErrors,
            contentHash: hash,
            rawSHA256: rawSHA256,
            claimsCompleteSourceCoverage: requestComplete && !blocked,
            settlementRevisionPolicy: settlementRevisionPolicy
        )
    }
}

public enum IngestionPipeline {
    /// Fixture path: retain bytes, validate, reconcile, publish as incomplete.
    public static func runFixture(bytes: [UInt8], observations: [NormalizedObservation]) throws -> PackDraft {
        let retained = RawRetain.retain(RawBytes(bytes: bytes, label: "fixture"))
        let errors = ObservationValidator.validate(observations)
        let reconciled = Reconciler.reconcile(observations, policy: "final-price replay")
        return try PackPublisher.publish(
            packId: "FIXTURE_NOT_A_SOURCE_PACK",
            observations: reconciled.rows,
            validationErrors: errors,
            rawSHA256: retained.sha256,
            settlementRevisionPolicy: reconciled.policy,
            requestComplete: false
        )
    }
}
