import SwiftUI

/// Three short tips in the chrome band under the clock. Not a cover over the tab scroll.
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
            HStack(spacing: 16) {
                Button("Got it", action: onGotIt)
                    .font(.subheadline.weight(.semibold))
                Button("Not now", action: onNotNow)
                    .font(.subheadline)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
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
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Navigation tip. \(message)")
    }

    private var message: String {
        switch beat {
        case 1:
            return "This is your desk. Start with today’s plan."
        case 2:
            return "Fuel shows the gas-day clock. Confirm only when nomination is open."
        default:
            return "After the day, statements show up here."
        }
    }
}
