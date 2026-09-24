import SwiftUI
import PeakerKernel

/// Read-only unit stub. No prices and no extra gauges.
struct PlantPlaceholderView: View {
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Plant data is offline")
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .accessibilityLabel("Plant telemetry offline.")
                Text("State, net megawatts, and fuel flow show up when the unit stub is live.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                Text("No action needed — this tab is read-only.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                telemetryRow(title: "Unit state", value: "—")
                telemetryRow(title: "MW", value: "—")
                telemetryRow(title: "Fuel flow", value: "—")
                Text("No prices. No extra gauges yet.")
                    .font(.caption)
                    .foregroundStyle(ControlGlass.textTertiary(scheme))
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
    }

    private func telemetryRow(title: String, value: String) -> some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundStyle(ControlGlass.textPrimary(scheme))
            Spacer()
            Text(value)
                .font(.body.monospacedDigit())
                .foregroundStyle(ControlGlass.textSecondary(scheme))
                .accessibilityLabel("\(title) unavailable")
        }
    }
}
