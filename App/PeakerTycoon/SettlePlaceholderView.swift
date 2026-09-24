import SwiftUI

/// Empty settlement stub. No statement lines and no settlement math.
struct SettlePlaceholderView: View {
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("No settlements yet")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .accessibilityLabel("Settle empty. No statements.")
                Text("When statement fixtures load, tap a line to walk the audit chain.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                Text("Return to Desk after a market day to review results.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                Text("Each line links back to the award and the offer that created it.")
                    .font(.caption)
                    .foregroundStyle(ControlGlass.textTertiary(scheme))
                AuditChainView()
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
    }
}
