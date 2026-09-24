/// Evidence labels from Build Spec v3 (reading precedence). A number without a label is a defect (§31.2).
public enum EvidenceLabel: String, Codable, Sendable, CaseIterable, Equatable {
    case source = "SOURCE"
    case game = "GAME"
    case proxy = "PROXY"
    case gate = "GATE"

    /// Short chip text. The word is always present so color is never the only signal.
    public var chipText: String {
        switch self {
        case .source: return "SRC"
        case .game: return "GAME"
        case .proxy: return "PROXY"
        case .gate: return "GATE"
        }
    }

    public var spokenName: String {
        switch self {
        case .source: return "Source"
        case .game: return "Game"
        case .proxy: return "Proxy"
        case .gate: return "Gate"
        }
    }
}
