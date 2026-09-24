import Foundation

public enum SchemaVersionError: Error, Equatable, CustomStringConvertible {
    case malformed(String)

    public var description: String {
        switch self {
        case .malformed(let raw):
            return "Schema version '\(raw)' is not major.minor.patch."
        }
    }
}

/// Semantic version stored on saves and configuration (§24.4, reading precedence).
public struct SchemaVersion: Hashable, Sendable, Comparable, Codable, CustomStringConvertible {
    public let major: Int
    public let minor: Int
    public let patch: Int

    public init(major: Int, minor: Int, patch: Int) {
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    public init(parsing raw: String) throws {
        let parts = raw.split(separator: ".")
        guard parts.count == 3,
              let major = Int(parts[0]),
              let minor = Int(parts[1]),
              let patch = Int(parts[2]),
              major >= 0, minor >= 0, patch >= 0
        else {
            throw SchemaVersionError.malformed(raw)
        }
        self.major = major
        self.minor = minor
        self.patch = patch
    }

    public var description: String { "\(major).\(minor).\(patch)" }

    public static func < (lhs: SchemaVersion, rhs: SchemaVersion) -> Bool {
        (lhs.major, lhs.minor, lhs.patch) < (rhs.major, rhs.minor, rhs.patch)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let raw = try container.decode(String.self)
        self = try SchemaVersion(parsing: raw)
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(description)
    }
}
