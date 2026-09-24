import Foundation

public enum RNGError: Error, Equatable, CustomStringConvertible {
    case unknownStream(String)

    public var description: String {
        switch self {
        case .unknownStream(let name):
            return "RNG sub-stream '\(name)' is not in the documented registry."
        }
    }
}

/// SplitMix64. Same seed and same draw count reproduce the same UInt64s.
public struct SplitMix64: Equatable, Sendable {
    public private(set) var state: UInt64

    public init(seed: UInt64) {
        self.state = seed
    }

    public mutating func next() -> UInt64 {
        state = state &+ 0x9E37_79B9_7F4A_7C15
        var z = state
        z = (z ^ (z >> 30)) &* 0xBF58_476D_1CE4_E5B9
        z = (z ^ (z >> 27)) &* 0x94D0_49BB_1331_11EB
        return z ^ (z >> 31)
    }
}

/// Campaign RNG with one documented sub-stream per subsystem (§24.3).
/// Forecast draws and equipment/event draws are different streams.
public struct RNGRegistry: Equatable, Sendable {
    public let campaignSeed: UInt64
    private var streams: [String: SplitMix64]

    /// Sub-streams Phase 0 registers. Later phases draw from these names; they do not add unlabeled RNGs.
    public static let documentedSubstreams: [String] = [
        "permit.durations",
        "interconnection.networkUpgradeCost",
        "plant.faultInjection",
        "award.partialFill",
        "fund2.negotiation",
        "weather.droughtSeverity",
        "forecast.lens",
        "equipment.events",
    ]

    public init(campaignSeed: UInt64) {
        self.campaignSeed = campaignSeed
        var built: [String: SplitMix64] = [:]
        for name in Self.documentedSubstreams {
            built[name] = SplitMix64(seed: Self.substreamSeed(campaignSeed: campaignSeed, name: name))
        }
        self.streams = built
    }

    public static func substreamSeed(campaignSeed: UInt64, name: String) -> UInt64 {
        var hash: UInt64 = 14_695_981_039_346_656_037
        var words: [UInt8] = []
        var seed = campaignSeed
        for _ in 0..<8 {
            words.append(UInt8(seed & 0xFF))
            seed >>= 8
        }
        words.append(contentsOf: name.utf8)
        for byte in words {
            hash ^= UInt64(byte)
            hash &*= 1_099_511_628_211
        }
        return hash
    }

    public mutating func next(stream name: String) throws -> UInt64 {
        guard var generator = streams[name] else {
            throw RNGError.unknownStream(name)
        }
        let value = generator.next()
        streams[name] = generator
        return value
    }

    public func state(of name: String) -> UInt64? {
        streams[name]?.state
    }

    public var snapshot: String {
        Self.documentedSubstreams.map { name in
            let state = streams[name]?.state ?? 0
            return "\(name)=\(String(format: "%016llx", state))"
        }.joined(separator: ",")
    }
}
