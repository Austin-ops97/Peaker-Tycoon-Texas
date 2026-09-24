import SwiftUI
import PeakerKernel

/// Ticks the displayed GAME instant. This view is not a layout band.
///
/// The timeline is only a once-per-second pulse. The label stays `GameInstant` from the morning-brief anchor.
/// It does not step the campaign, does not start the sim, and does not treat the device clock as game time.
/// Reduce Motion uses the same pulse and no ornamental animation. Pause removes the pulse.
struct PresentationClockDriver: View {
    @Binding var clock: GameInstant
    @Binding var speed: PresentationSpeed
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        pulse
            .onChange(of: speed) { _, newSpeed in
                // Already at the placeholder 10:00 CT deadline: do not wait for the next pulse.
                if newSpeed == .untilNextDecision && PresentationScrub.isAtOrAfterPlaceholderDecision(clock) {
                    speed = .pause
                }
            }
    }

    @ViewBuilder
    private var pulse: some View {
        if speed == .pause {
            Color.clear.accessibilityHidden(true)
        } else {
            // Same one-second pulse whether or not Reduce Motion is on. No animation wrapper.
            TimelineView(.periodic(from: .distantPast, by: reduceMotion ? 1 : 1)) { timeline in
                Color.clear
                    .accessibilityHidden(true)
                    .onChange(of: timeline.date) { _, _ in
                        let stepped = PresentationScrub.step(clock: clock, speed: speed)
                        clock = stepped.clock
                        speed = stepped.speed
                    }
            }
        }
    }
}
