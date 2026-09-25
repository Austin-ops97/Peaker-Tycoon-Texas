import Foundation

public enum KernelError: Error, Equatable, CustomStringConvertible {
    case campaignEraExhausted

    public var description: String {
        switch self {
        case .campaignEraExhausted:
            return "The continuous campaign era has no operating day after \(CampaignCalendar.end.iso)."
        }
    }
}

public enum KernelInput: Equatable, Sendable, Codable {
    case advanceOperatingDay
    case setPresentationSpeed(PresentationSpeed)
    case notePlaceholder(id: String)
}

/// Deterministic kernel (§24.1). No I/O, no wall-clock reads, no UI types.
public struct CampaignKernel: Equatable, Sendable {
    public let seed: UInt64
    public private(set) var operatingDay: CivilDate
    public private(set) var completedDays: Int
    public private(set) var rng: RNGRegistry
    public private(set) var presentationSpeed: PresentationSpeed
    public private(set) var appliedInputs: Int
    public private(set) var placeholderNotes: [String]

    public init(seed: UInt64) {
        self.seed = seed
        self.operatingDay = CampaignCalendar.start
        self.completedDays = 0
        self.rng = RNGRegistry(campaignSeed: seed)
        self.presentationSpeed = .pause
        self.appliedInputs = 0
        self.placeholderNotes = []
    }

    public var bootstrapSupplementsForecast: Bool {
        BootstrapPolicy.supplementsForecast(completedCampaignDays: completedDays)
    }

    /// World identity. Presentation speed is excluded (§8).
    public var worldDigest: String {
        StableDigest.hex(
            "seed=\(seed);day=\(operatingDay.iso);completed=\(completedDays);rng=\(rng.snapshot)"
        )
    }

    public var replayDigest: String {
        StableDigest.hex(
            "world=\(worldDigest);applied=\(appliedInputs);speed=\(presentationSpeed.rawValue);notes=\(placeholderNotes.joined(separator: "|"))"
        )
    }

    public mutating func apply(_ input: KernelInput) throws {
        switch input {
        case .advanceOperatingDay:
            guard let next = CampaignCalendar.day(after: operatingDay) else {
                throw KernelError.campaignEraExhausted
            }
            operatingDay = next
            completedDays += 1
        case .setPresentationSpeed(let speed):
            presentationSpeed = speed
        case .notePlaceholder(let id):
            placeholderNotes.append(id)
        }
        appliedInputs += 1
    }
}

enum StableDigest {
    static func hex(_ string: String) -> String {
        var hash: UInt64 = 14_695_981_039_346_656_037
        for byte in string.utf8 {
            hash ^= UInt64(byte)
            hash &*= 1_099_511_628_211
        }
        return String(format: "%016llx", hash)
    }
}
