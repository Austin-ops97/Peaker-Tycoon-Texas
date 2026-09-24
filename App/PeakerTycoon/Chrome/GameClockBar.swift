import SwiftUI
import PeakerKernel

/// Status band. Callers place this in a VStack above scroll content. It is not an overlay.
struct GameClockBar: View {
    let clock: GameInstant
    var zoneIdentifier: String = ""
    @Binding var speed: PresentationSpeed
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceTransparency) private var reduceTransparency

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            HStack(alignment: .center, spacing: 8) {
                VStack(alignment: .leading, spacing: 2) {
                    Text(clock.centralLabel)
                        .font(.system(.headline, design: .monospaced))
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                        .lineLimit(1)
                        .minimumScaleFactor(0.75)
                    if let caption = LocalTwinClock.localCaption(for: clock, identifier: zoneIdentifier) {
                        Text(caption)
                            .font(.caption)
                            .foregroundStyle(ControlGlass.textSecondary(scheme))
                            .lineLimit(1)
                    }
                }
                .accessibilityElement(children: .ignore)
                .accessibilityLabel(LocalTwinClock.accessibility(for: clock, identifier: zoneIdentifier))
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
        .background(ControlGlass.glassFill(scheme, reduceTransparency: reduceTransparency))
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(ControlGlass.hairline(scheme))
                .frame(height: 1)
        }
    }
}
