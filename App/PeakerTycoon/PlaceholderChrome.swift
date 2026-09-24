import Foundation
import PeakerKernel

struct InterruptCard: Identifiable, Equatable {
    let id: String
    let origin: String
    let decision: String
    let deadlineLabel: String
    let inactionConsequence: String
}

/// Placeholder chrome state. The clock starts at the GAME morning-brief anchor, not the device time.
/// `PresentationClockDriver` may scrub `clock` when speed is not pause. That scrub does not run `CampaignKernel`.
struct PlaceholderChrome: Equatable {
    var speed: PresentationSpeed = .pause
    var clock: GameInstant = GameDefaults.placeholderMorningBrief
    var interrupts: [InterruptCard] = []
}
