import SwiftUI
import PeakerKernel

/// Read-only unit stub. State, MW, and fuel flow only. No prices and no extra gauges.
struct PlantPlaceholderView: View {
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Plant")
                            .font(.title3.weight(.semibold))
                            .foregroundStyle(ControlGlass.textPrimary(scheme))
                        Text("State, power output, and fuel flow stay blank until a reading is connected.")
                            .font(.body)
                            .foregroundStyle(ControlGlass.textPrimary(scheme))
                            .fixedSize(horizontal: false, vertical: true)
                        statusCard
                            .id(Self.statusID)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                ThumbPrimaryButton(title: "View unit status") {
                    var transaction = Transaction()
                    transaction.disablesAnimations = reduceMotion
                    withTransaction(transaction) {
                        proxy.scrollTo(Self.statusID, anchor: .top)
                    }
                }
            }
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
    }

    private var statusCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            telemetryRow(title: "State", value: "—")
            telemetryRow(title: "MW", value: "—")
            telemetryRow(title: "Fuel flow", value: "—")
            EvidenceTag(
                label: .game,
                provenance: "GAME placeholder. State, power output, and fuel flow are not connected. This card has no prices."
            )
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(ControlGlass.surfaceElevated(scheme))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(ControlGlass.hairline(scheme), lineWidth: 1)
        )
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

    private static let statusID = "plant-status"
}
