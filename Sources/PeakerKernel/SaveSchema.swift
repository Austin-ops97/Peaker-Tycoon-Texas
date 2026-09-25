import Foundation

public struct MigrationRecord: Codable, Equatable, Sendable {
    public let fromVersion: SchemaVersion
    public let toVersion: SchemaVersion
    public let note: String

    public init(fromVersion: SchemaVersion, toVersion: SchemaVersion, note: String) {
        self.fromVersion = fromVersion
        self.toVersion = toVersion
        self.note = note
    }
}

public struct InputLogEntry: Codable, Equatable, Sendable {
    public let sequence: Int
    public let input: KernelInput

    public init(sequence: Int, input: KernelInput) {
        self.sequence = sequence
        self.input = input
    }
}

public struct SaveEnvelope: Codable, Equatable, Sendable {
    public var schemaVersion: SchemaVersion
    public var campaignSeed: UInt64
    public var inputLog: [InputLogEntry]
    public var migrationLog: [MigrationRecord]
    public var replayDigest: String

    public init(
        schemaVersion: SchemaVersion,
        campaignSeed: UInt64,
        inputLog: [InputLogEntry],
        migrationLog: [MigrationRecord],
        replayDigest: String
    ) {
        self.schemaVersion = schemaVersion
        self.campaignSeed = campaignSeed
        self.inputLog = inputLog
        self.migrationLog = migrationLog
        self.replayDigest = replayDigest
    }
}

public struct SaveMigrationStep: Equatable {
    public let from: SchemaVersion
    public let to: SchemaVersion
    public let note: String

    public init(from: SchemaVersion, to: SchemaVersion, note: String) {
        self.from = from
        self.to = to
        self.note = note
    }
}

public enum SaveError: Error, Equatable, CustomStringConvertible {
    case rejectedOlderSave(version: SchemaVersion, message: String)
    case unsupportedFutureSave(version: SchemaVersion)
    case migrationGap(from: SchemaVersion, to: SchemaVersion)

    public var description: String {
        switch self {
        case .rejectedOlderSave(_, let message):
            return message
        case .unsupportedFutureSave(let version):
            return "Save schema \(version.description) is newer than this build and cannot be loaded."
        case .migrationGap(let from, let to):
            return "No forward migration is registered from \(from.description) to \(to.description)."
        }
    }
}

public enum SaveSchema {
    /// v3 saves are not compatible with v2 (§24.4). Phase 0 current schema is 3.0.0.
    public static let current = SchemaVersion(major: 3, minor: 0, patch: 0)
    public static let minimumMajor = 3

    public static func load(
        _ save: SaveEnvelope,
        migratingToward target: SchemaVersion = current,
        steps: [SaveMigrationStep] = []
    ) throws -> SaveEnvelope {
        if save.schemaVersion.major < minimumMajor {
            throw SaveError.rejectedOlderSave(
                version: save.schemaVersion,
                message: "This save uses schema \(save.schemaVersion.description). v3 saves are not backward-compatible with v2. The loader rejects it rather than converting it."
            )
        }
        if save.schemaVersion.major > target.major {
            throw SaveError.unsupportedFutureSave(version: save.schemaVersion)
        }
        var loaded = save
        while loaded.schemaVersion < target {
            guard let step = steps.first(where: { $0.from == loaded.schemaVersion }) else {
                throw SaveError.migrationGap(from: loaded.schemaVersion, to: target)
            }
            if step.to <= loaded.schemaVersion || step.to > target {
                throw SaveError.migrationGap(from: loaded.schemaVersion, to: target)
            }
            loaded.migrationLog.append(
                MigrationRecord(fromVersion: step.from, toVersion: step.to, note: step.note)
            )
            loaded.schemaVersion = step.to
        }
        return loaded
    }
}

public enum Replay {
    public static func run(seed: UInt64, log: [KernelInput]) throws -> CampaignKernel {
        var kernel = CampaignKernel(seed: seed)
        for input in log {
            try kernel.apply(input)
        }
        return kernel
    }

    public static func run(save: SaveEnvelope) throws -> CampaignKernel {
        let loaded = try SaveSchema.load(save)
        return try run(seed: loaded.campaignSeed, log: loaded.inputLog.map { $0.input })
    }

    public static func makeSave(seed: UInt64, log: [KernelInput]) throws -> SaveEnvelope {
        let kernel = try run(seed: seed, log: log)
        let entries = log.enumerated().map { index, input in
            InputLogEntry(sequence: index, input: input)
        }
        return SaveEnvelope(
            schemaVersion: SaveSchema.current,
            campaignSeed: seed,
            inputLog: entries,
            migrationLog: [],
            replayDigest: kernel.replayDigest
        )
    }
}
