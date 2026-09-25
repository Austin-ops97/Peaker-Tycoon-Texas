/// Domain identity only (§25 Role). No workspace, firewall, or UI.
/// Behavior arrives in Phase 3b. The placeholder shell must not present a role switcher.
public enum RoleId: String, Codable, Sendable, CaseIterable, Equatable {
    case powerTrader
    case gasScheduler
    case controlRoomOperator
    case reliabilityEngineer
    case assetManager
    case fundManager
    case riskCompliance
}
