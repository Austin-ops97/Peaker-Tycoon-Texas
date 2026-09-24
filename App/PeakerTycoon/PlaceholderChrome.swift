import Foundation
import PeakerKernel

struct InterruptCard: Identifiable, Equatable {
    let id: String
    let origin: String
    let decision: String
    let deadlineLabel: String
    let inactionConsequence: String
}

/// Placeholder chrome state. The clock is a GAME anchor, not the device time.
/// Changing speed does not advance the kernel and does not start a timer.
struct PlaceholderChrome: Equatable {
    var speed: PresentationSpeed = .pause
    var clock: GameInstant = GameDefaults.placeholderMorningBrief
    /// One-line clock chip. The explanation lives in Settings, not under the clock.
    var localTwinChip: String = "Local twin"
    var interrupts: [InterruptCard] = []
}
