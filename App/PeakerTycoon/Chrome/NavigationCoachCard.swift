import SwiftUI

/// Three short tips in the chrome band under the clock. Not a cover over the tab scroll.
/// Beat 1 names the four tabs. Beat 2 is the Desk sample cycle. Beat 3 is the read-only plan sheet.
/// Dismissal keys are `coachBeat1Dismissed`, `coachBeat2Dismissed`, and `coachBeat3Dismissed`.
struct NavigationCoachCard: View {
    let beat: Int
    let onGotIt: () -> Void
    let onNotNow: () -> Void
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(message)
                .font(.subheadline)
                .foregroundStyle(ControlGlass.textPrimary(scheme))
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityLabel("Navigation tip. \(message)")
            HStack(spacing: 16) {
                Button("Got it", action: onGotIt)
                    .font(.subheadline.weight(.semibold))
                    .accessibilityHint("Dismisses this tip and shows the next one.")
                Button("Not now", action: onNotNow)
                    .font(.subheadline)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                    .accessibilityHint("Dismisses this tip and hides the rest of this session.")
            }
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(ControlGlass.surfaceElevated(scheme))
        .overlay(alignment: .bottom) {
            Rectangle()
                .fill(ControlGlass.hairline(scheme))
                .frame(height: 1)
        }
    }

    private var message: String {
        switch beat {
        case 1:
            return "Four tabs sit along the bottom: Desk, Fuel, Plant, and Settle."
        case 2:
            return "On Desk, the arrows cycle retained hub samples. Those prices are not live."
        default:
            return "Review today’s plan opens that sample to read. Dismiss it and you are back on Desk."
        }
    }
}
