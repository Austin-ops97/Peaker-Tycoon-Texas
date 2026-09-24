import SwiftUI
import PeakerKernel

/// Placeholder for nomination and the blind-nomination explainer. No fuel desk logic.
struct FuelPlaceholderView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Fuel")
                    .font(.largeTitle.bold())
                Text("Phase 0 placeholder. Nomination is not implemented.")
                    .font(.body)
                DeadlineChip(
                    title: "Timely gas gate",
                    centralLabel: "13:00 CT",
                    evidence: .game,
                    provenance: "GAME modeled timely gas deadline of 13:00 (§8). S16 is gas-coordination context, not a claim that every Texas pipeline uses this gate."
                )
                Text("Blind-nomination explainer")
                    .font(.headline)
                Text("publication time unknown — treated as BLIND (conservative)")
                    .font(.body)
                    .accessibilityLabel("Publication time unknown. Treated as blind. Conservative.")
                EvidenceTag(
                    label: .gate,
                    provenance: "GATE. The archive has no DAM publication timestamp, so the spec's unknown branch is shown (§8). No publication time was invented."
                )
                Text("Volume, timing, and receipt stay empty until Phase 1.")
                    .font(.body)
                    .foregroundStyle(.secondary)
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
