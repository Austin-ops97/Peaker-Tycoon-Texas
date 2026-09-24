/// Presentation speeds (§8). They never change simulation resolution or probabilities.
public enum PresentationSpeed: String, Codable, Sendable, CaseIterable, Equatable {
    case pause
    case x1
    case x8
    case x32
    case untilNextDecision

    public var label: String {
        switch self {
        case .pause: return "Pause"
        case .x1: return "1×"
        case .x8: return "8×"
        case .x32: return "32×"
        case .untilNextDecision: return "Until next decision"
        }
    }
}
