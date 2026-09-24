import SwiftUI
import PeakerKernel

/// Status band. Callers place this in a VStack above scroll content. It is not an overlay.
struct GameClockBar: View {
    let clock: GameInstant
    /// Shown only when a player zone is saved. Nil omits the line.
    var localCaption: String? = nil
    @Binding var speed: PresentationSpeed

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center, spacing: 8) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(clock.centralLabel)
                        .font(.system(.headline, design: .monospaced))
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                    if let localCaption {
                        Text(localCaption)
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                    }
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(accessibilityLabel)
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
        .frame(maxWidth: .infinity, alignment: .leading)
        .fixedSize(horizontal: false, vertical: true)
        .background(.bar)
    }

    private var accessibilityLabel: String {
        let time = String(format: "%02d:%02d:%02d", clock.hour, clock.minute, clock.second)
        if let localCaption {
            return "Game time \(time) Central. \(localCaption)."
        }
        return "Game time \(time) Central."
    }
}
