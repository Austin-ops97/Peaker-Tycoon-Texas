import SwiftUI

/// One-time tip. Swipe down and Not now both dismiss it for good.
struct LocalTwinTipSheet: View {
    let onNotNow: () -> Void
    let onOpenSettings: () -> Void
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @Environment(\.accessibilityReduceTransparency) private var reduceTransparency

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Label("Show your local time?", systemImage: "globe")
                .font(.title3.weight(.semibold))
                .foregroundStyle(ControlGlass.textPrimary(scheme))
                .accessibilityAddTraits(.isHeader)
            Text("Game time stays Central (CT). Add your zone so deadlines also show your clock.")
                .font(.body)
                .foregroundStyle(ControlGlass.textSecondary(scheme))
                .fixedSize(horizontal: false, vertical: true)
            VStack(spacing: 8) {
                Button(action: onOpenSettings) {
                    Text("Open Settings")
                        .font(.body.weight(.semibold))
                        .foregroundStyle(ControlGlass.tealOnFill)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(ControlGlass.accentTeal)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
                .accessibilityLabel("Open Settings")
                Button("Not now", action: onNotNow)
                    .font(.body.weight(.semibold))
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 12)
            }
        }
        .padding(24)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(panel)
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
        .transaction { transaction in
            if reduceMotion {
                transaction.disablesAnimations = true
            }
        }
    }

    private var panel: Color {
        reduceTransparency
            ? ControlGlass.surfaceElevated(scheme)
            : ControlGlass.accentMuted(scheme)
    }
}
