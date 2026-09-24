import SwiftUI
import PeakerKernel

struct GameClockBar: View {
    let clock: GameInstant
    let localTwinNote: String
    @Binding var speed: PresentationSpeed

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack {
                Text(clock.centralLabel)
                    .font(.headline)
                    .accessibilityLabel("Game clock \(clock.centralLabel)")
                Spacer()
                SpeedChip(speed: $speed)
            }
            Text(localTwinNote)
                .font(.caption)
                .foregroundStyle(.secondary)
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
