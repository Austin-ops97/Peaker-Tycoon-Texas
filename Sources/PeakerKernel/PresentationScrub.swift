/// Display-only step for the phone chrome (§8 speeds).
///
/// `CampaignKernel.apply` is not called. Operating days, RNG, and coverage do not move.
/// One call is one real second of the shell ticker:
/// pause adds nothing; 1× adds one game second; 8× adds eight; 32× adds thirty-two.
/// Until next decision matches 1× and stops at 10:00:00 CT on the displayed civil day
/// (the placeholder DA submission chip). If that instant is already 10:00:00 or later, it pauses immediately.
public enum PresentationScrub {
    public static func step(
        clock: GameInstant,
        speed: PresentationSpeed
    ) -> (clock: GameInstant, speed: PresentationSpeed) {
        switch speed {
        case .pause:
            return (clock, .pause)
        case .x1:
            return (clock.adding(seconds: 1), .x1)
        case .x8:
            return (clock.adding(seconds: 8), .x8)
        case .x32:
            return (clock.adding(seconds: 32), .x32)
        case .untilNextDecision:
            if isAtOrAfterPlaceholderDecision(clock) {
                return (clock, .pause)
            }
            let next = clock.adding(seconds: 1)
            if isAtOrAfterPlaceholderDecision(next) {
                return (
                    GameInstant(date: clock.date, hour: 10, minute: 0, second: 0),
                    .pause
                )
            }
            return (next, .untilNextDecision)
        }
    }

    public static func isAtOrAfterPlaceholderDecision(_ instant: GameInstant) -> Bool {
        let seconds = instant.hour * 3_600 + instant.minute * 60 + instant.second
        return seconds >= 10 * 3_600
    }
}
