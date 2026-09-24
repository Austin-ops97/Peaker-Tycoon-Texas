import SwiftUI
import PeakerKernel

/// Read-only minute-physics placeholders. No price chrome.
struct PlantPlaceholderView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Plant")
                    .font(.largeTitle.bold())
                Text("No price chrome on this tab.")
                    .font(.body.weight(.semibold))
                telemetryRow(title: "Unit state", value: "—")
                telemetryRow(title: "MW", value: "—")
                telemetryRow(title: "Fuel flow", value: "—")
                EvidenceTag(
                    label: .gate,
                    provenance: "GATE. Minute physics is not connected. Empty marks are not measurements."
                )
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }

    private func telemetryRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.headline)
            Spacer()
            Text(value)
                .font(.body.monospacedDigit())
                .accessibilityLabel("\(title) unavailable")
        }
    }
}
