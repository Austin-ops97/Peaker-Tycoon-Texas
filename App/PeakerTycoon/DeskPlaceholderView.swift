import SwiftUI
import PeakerKernel

/// Desk stub. No offer ticket. The DA row shows Central time, plus local only when a zone is saved.
struct DeskPlaceholderView: View {
    var daLocalClock: String? = nil
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Nothing on your desk yet")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .accessibilityLabel("Desk empty. No offer ticket yet.")
                Text("When market stubs load, you’ll see today’s checklist and the offer gate countdown here.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                Text("Browse Fuel, Plant, or Settle — or open Settings anytime.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                DeadlineChip(
                    title: "DA submission",
                    centralLabel: "10:00 CT",
                    localClock: daLocalClock,
                    evidence: .source,
                    provenance: "Build Spec §8, citing S6: ERCOT DAM inputs are due at 10:00 Central. This chip is a placeholder, not a live countdown and not a publication timestamp."
                )
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
    }
}
