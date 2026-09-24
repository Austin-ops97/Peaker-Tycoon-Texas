import SwiftUI

/// Closed gas-day stub. Marker times stay off this screen until the window is open.
struct FuelPlaceholderView: View {
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Gas day is closed")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .accessibilityLabel("Fuel tab. Nomination not open.")
                Text("When nomination opens, this tab shows the four time markers and whether you’re nominating blind.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                Text("Check back when the gas window opens. Markers stay on Central Time.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                Text("Gas times stay on Central Time. Markers appear when the window opens.")
                    .font(.caption)
                    .foregroundStyle(ControlGlass.textTertiary(scheme))
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
    }
}
