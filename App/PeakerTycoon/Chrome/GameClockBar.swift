import SwiftUI
import PeakerKernel

/// Status band. Callers place this in a VStack above scroll content. It is not an overlay.
struct GameClockBar: View {
    let clock: GameInstant
    var zoneIdentifier: String = ""
    @Binding var speed: PresentationSpeed
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceTransparency) private var reduceTransparency
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            if dynamicTypeSize.isAccessibilitySize {
                VStack(alignment: .leading, spacing: 8) {
                    clockReadout
                    SpeedChip(speed: $speed)
                }
            } else {
                HStack(alignment: .center, spacing: 8) {
                    clockReadout
                    Spacer(minLength: 8)
                    SpeedChip(speed: $speed)
                }
            }
            EvidenceTag(
                label: .game,
                provenance: "Displayed GAME time. It starts at the morning-brief anchor 2021-02-01 08:00 CT and scrubs only while a speed other than Pause is selected. This is not the device clock, not a simulation step, and not a market publication time."
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

    private var clockReadout: some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(clock.centralLabel)
                .font(.system(.headline, design: .monospaced))
                .foregroundStyle(ControlGlass.textPrimary(scheme))
                .lineLimit(dynamicTypeSize.isAccessibilitySize ? nil : 1)
                .minimumScaleFactor(dynamicTypeSize.isAccessibilitySize ? 1 : 0.75)
                .fixedSize(horizontal: false, vertical: true)
            if let caption = LocalTwinClock.localCaption(for: clock, identifier: zoneIdentifier) {
                Text(caption)
                    .font(.caption)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                    .lineLimit(dynamicTypeSize.isAccessibilitySize ? nil : 1)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(LocalTwinClock.accessibility(for: clock, identifier: zoneIdentifier))
    }
}
