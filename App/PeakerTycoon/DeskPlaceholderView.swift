import SwiftUI
import PeakerKernel

/// Placeholder for Power Trader Now/Today and the shaped DA ticket. No offer logic.
struct DeskPlaceholderView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Desk")
                    .font(.largeTitle.bold())
                Text("Phase 0 placeholder. The shaped day-ahead ticket is not implemented.")
                    .font(.body)
                DeadlineChip(
                    title: "DA submission",
                    centralLabel: "10:00 CT",
                    evidence: .source,
                    provenance: "Build Spec §8, citing S6: ERCOT DAM inputs are due at 10:00 Central. This chip is a placeholder, not a live countdown and not a publication timestamp."
                )
                Group {
                    Text("Now")
                        .font(.headline)
                    Text("Decisions due in the next 60 minutes of game time will list here in Phase 1.")
                        .font(.body)
                    Text("Today")
                        .font(.headline)
                    Text("Cadence checklist (brief, ticket, fuel check, gate, watch, end of day) is not active.")
                        .font(.body)
                    Text("Shaped ticket hook")
                        .font(.headline)
                    Text("Up to 4 price–quantity tranches per hour. No prices, no quantities, and no submit action in Phase 0.")
                        .font(.body)
                }
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
