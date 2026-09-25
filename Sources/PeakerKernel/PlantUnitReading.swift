import Foundation

/// Read-only unit status for the Plant tab. Values are game-physics or a later stand-in.
/// This type does not read a meter and does not carry a price.
public struct PlantUnitReading: Equatable, Sendable {
    /// §12.1 operating state. DERATED is not a case; it is `derated` on the reading.
    public enum OperatingState: String, Sendable, CaseIterable {
        case offline = "OFFLINE"
        case ready = "READY"
        case starting = "STARTING"
        case purging = "PURGING"
        case firing = "FIRING"
        case accelerating = "ACCELERATING"
        case synchronizing = "SYNCHRONIZING"
        case online = "ONLINE"
        case stopping = "STOPPING"
        case cooldown = "COOLDOWN"
        case tripped = "TRIPPED"
        case maintenance = "MAINTENANCE"

        /// Plain English for the player. Never the raw token.
        public var playerLabel: String {
            switch self {
            case .offline: return "Offline"
            case .ready: return "Ready"
            case .starting: return "Starting"
            case .purging: return "Purging"
            case .firing: return "Firing"
            case .accelerating: return "Accelerating"
            case .synchronizing: return "Synchronizing"
            case .online: return "Online"
            case .stopping: return "Stopping"
            case .cooldown: return "Cooldown"
            case .tripped: return "Tripped"
            case .maintenance: return "Maintenance"
            }
        }

        /// Optional scan aid. Text-only state still stands without a symbol.
        public var symbolName: String? {
            switch self {
            case .offline: return "powerplug"
            case .online: return "bolt.fill"
            case .tripped: return "exclamationmark.triangle"
            default: return nil
            }
        }
    }

    public var state: OperatingState?
    public var derated: Bool
    public var netMegawatts: Decimal?
    public var fuelFlowMMBtuPerHour: Decimal?
    /// GAME for a game-physics sample, PROXY for a stand-in. SOURCE only for a real external feed.
    public var evidence: EvidenceLabel

    public init(
        state: OperatingState?,
        derated: Bool = false,
        netMegawatts: Decimal?,
        fuelFlowMMBtuPerHour: Decimal?,
        evidence: EvidenceLabel
    ) {
        self.state = state
        self.derated = derated
        self.netMegawatts = netMegawatts
        self.fuelFlowMMBtuPerHour = fuelFlowMMBtuPerHour
        self.evidence = evidence
    }

    /// True when at least one player field is present. Derated alone does not count.
    public var hasRetainedField: Bool {
        state != nil || netMegawatts != nil || fuelFlowMMBtuPerHour != nil
    }

    public var stateText: String {
        state?.playerLabel ?? "—"
    }

    public var megawattText: String {
        netMegawatts.map(Self.playerFigure) ?? "—"
    }

    public var fuelFlowText: String {
        fuelFlowMMBtuPerHour.map(Self.playerFigure) ?? "—"
    }

    /// One decimal when the rounded tenth is nonzero. Otherwise an integer. Not localized.
    public static func playerFigure(_ value: Decimal) -> String {
        var source = value
        var rounded = Decimal()
        NSDecimalRound(&rounded, &source, 1, .plain)
        let raw = NSDecimalNumber(decimal: rounded).stringValue
        guard let dot = raw.firstIndex(of: ".") else { return raw }
        let fraction = raw[raw.index(after: dot)...]
        if fraction.allSatisfy({ $0 == "0" }) {
            return String(raw[..<dot])
        }
        return raw
    }

    /// Bundled game-physics sample for the Phase 1 unit stub.
    /// Net 48 MW at a documented heat rate of 10 MMBtu per MWh gives fuel flow 480 MMBtu/h.
    /// Not a connected meter, not a market price, and not SOURCE.
    public static let gamePhysicsSample = PlantUnitReading(
        state: .online,
        derated: false,
        netMegawatts: Decimal(string: "48"),
        fuelFlowMMBtuPerHour: Decimal(string: "480"),
        evidence: .game
    )
}
