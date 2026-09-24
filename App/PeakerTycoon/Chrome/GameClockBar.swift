import SwiftUI
import PeakerKernel

struct GameClockBar: View {
    let clock: GameInstant
    let localTwinChip: String
    @Binding var speed: PresentationSpeed
    let onOpenPlayerTimezone: () -> Void

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(spacing: 8) {
                Text(clock.centralLabel)
                    .font(.headline)
                    .lineLimit(1)
                    .minimumScaleFactor(0.75)
                    .accessibilityLabel("Game clock \(clock.centralLabel)")
                Button(action: onOpenPlayerTimezone) {
                    Text(localTwinChip)
                        .font(.caption.weight(.semibold))
                        .lineLimit(1)
                        .padding(.horizontal, 8)
                        .padding(.vertical, 4)
                        .overlay(
                            Capsule().stroke(Color.secondary, lineWidth: 1)
                        )
                }
                .buttonStyle(.plain)
                .accessibilityLabel("Local twin. Opens Settings. Clock labels use Central time.")
                Spacer(minLength: 8)
                SpeedChip(speed: $speed)
            }
            EvidenceTag(
                label: .game,
                provenance: "GAME placeholder morning-brief anchor at 08:00 CT on the campaign start date (§8). This is not the device clock and not a market publication time."
            )
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 8)
        .background(.bar)
    }
}
