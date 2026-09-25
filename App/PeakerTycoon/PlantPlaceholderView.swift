import SwiftUI
import PeakerKernel

/// Read-only unit status. Empty keeps Design 05. A game-physics sample shows State, MW, and fuel flow.
/// No prices and no extra gauges.
struct PlantPlaceholderView: View {
    /// Nil, or a reading with no state, megawatts, or fuel flow, stays on the empty lead.
    var reading: PlantUnitReading? = nil
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var showExplainer = false

    private var retained: PlantUnitReading? {
        guard let reading, reading.hasRetainedField else { return nil }
        return reading
    }

    var body: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        lead
                        CalmWaitingLine(
                            text: "Next, View unit status.",
                            accessibilityHint: "Scrolls to state, power, and fuel flow. Not a live dispatch."
                        ) {
                            revealStatus(with: proxy)
                        }
                        statusCard
                            .id(Self.statusID)
                        if retained != nil {
                            Text("Game-physics sample.")
                                .font(.caption)
                                .foregroundStyle(ControlGlass.textTertiary(scheme))
                                .fixedSize(horizontal: false, vertical: true)
                                .accessibilityHint("These figures are game physics, not a connected meter and not a market price.")
                        }
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                ThumbPrimaryButton(
                    title: "View unit status",
                    accessibilityHint: "Scrolls to state, power, and fuel flow. Not a live dispatch."
                ) {
                    revealStatus(with: proxy)
                }
            }
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
        .instantWhenReduceMotion(reduceMotion)
        .sheet(isPresented: $showExplainer) {
            UnitStatusExplainerSheet()
        }
    }

    private var lead: some View {
        let populated = retained != nil
        return EmptyLeadHeader(
            title: "Plant",
            lead: populated
                ? "Unit status · read-only"
                : "Read-only unit status. State, power, and fuel flow show here when live.",
            titleAccessibilityLabel: populated
                ? "Plant tab. Unit status, read-only."
                : "Plant tab. Waiting for a connected reading. Not a live dispatch.",
            leadAccessibilityHint: populated
                ? "Game-physics sample. Read-only."
                : "State, power, and fuel flow stay blank."
        )
        .animation(reduceMotion ? nil : .easeOut(duration: 0.15), value: populated)
    }

    private func revealStatus(with proxy: ScrollViewProxy) {
        var transaction = Transaction()
        transaction.disablesAnimations = reduceMotion
        withTransaction(transaction) {
            proxy.scrollTo(Self.statusID, anchor: .top)
            showExplainer = true
        }
    }

    @ViewBuilder
    private var statusCard: some View {
        if let retained {
            retainedCard(retained)
        } else {
            emptyCard
        }
    }

    private var emptyCard: some View {
        VStack(alignment: .leading, spacing: 10) {
            telemetryRow(title: "State", value: "—")
            telemetryRow(title: "MW", value: "—")
            telemetryRow(title: "Fuel flow", value: "—")
            EvidenceTag(
                label: .game,
                provenance: "GAME. Waiting for a connected reading. Not a live dispatch. This card has no prices."
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

    private func retainedCard(_ reading: PlantUnitReading) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            stateRow(reading)
            numberRow(
                title: "MW",
                value: reading.megawattText,
                unit: nil,
                accessibilityValue: reading.megawattText,
                evidence: reading.evidence,
                field: "net megawatts"
            )
            numberRow(
                title: "Fuel flow",
                value: reading.fuelFlowText,
                unit: "MMBtu/h",
                accessibilityValue: "\(reading.fuelFlowText) MMBtu per hour",
                evidence: reading.evidence,
                field: "fuel flow"
            )
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(ControlGlass.surfaceElevated(scheme))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(ControlGlass.hairline(scheme), lineWidth: 1)
        )
        .animation(reduceMotion ? nil : .easeOut(duration: 0.15), value: reading)
    }

    private func stateRow(_ reading: PlantUnitReading) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            if let symbol = reading.state?.symbolName {
                Image(systemName: symbol)
                    .font(.system(size: 20))
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                    .accessibilityHidden(true)
            }
            Text("State")
                .font(.subheadline)
                .foregroundStyle(ControlGlass.textSecondary(scheme))
                .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: 8)
            VStack(alignment: .trailing, spacing: 2) {
                Text(reading.stateText)
                    .font(.title3.weight(.semibold))
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .fixedSize(horizontal: false, vertical: true)
                if reading.derated {
                    Text("Derated")
                        .font(.caption)
                        .foregroundStyle(ControlGlass.textSecondary(scheme))
                }
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel(stateAccessibility(reading))
            EvidenceTag(label: reading.evidence, provenance: provenance(reading.evidence, field: "state"))
        }
    }

    private func numberRow(
        title: String,
        value: String,
        unit: String?,
        accessibilityValue: String,
        evidence: EvidenceLabel,
        field: String
    ) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Text(title)
                .font(.subheadline)
                .foregroundStyle(ControlGlass.textSecondary(scheme))
                .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: 8)
            VStack(alignment: .trailing, spacing: 2) {
                Text(value)
                    .font(.title3.weight(.semibold))
                    .monospacedDigit()
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .fixedSize(horizontal: false, vertical: true)
                if let unit {
                    Text(unit)
                        .font(.caption)
                        .foregroundStyle(ControlGlass.textSecondary(scheme))
                }
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("\(title), \(accessibilityValue).")
            EvidenceTag(label: evidence, provenance: provenance(evidence, field: field))
        }
    }

    private func telemetryRow(title: String, value: String) -> some View {
        HStack(alignment: .firstTextBaseline, spacing: 8) {
            Text(title)
                .font(.headline)
                .foregroundStyle(ControlGlass.textPrimary(scheme))
                .fixedSize(horizontal: false, vertical: true)
            Spacer(minLength: 8)
            Text(value)
                .font(.body.monospacedDigit())
                .foregroundStyle(ControlGlass.textSecondary(scheme))
                .accessibilityLabel("\(title), waiting for a connected reading.")
        }
    }

    private func stateAccessibility(_ reading: PlantUnitReading) -> String {
        if reading.derated {
            return "State, \(reading.stateText), Derated."
        }
        return "State, \(reading.stateText)."
    }

    private func provenance(_ evidence: EvidenceLabel, field: String) -> String {
        switch evidence {
        case .game:
            return "GAME. Game-physics sample for \(field). Not a market price."
        case .proxy:
            return "PROXY. Stand-in for \(field). Not a market price."
        case .source:
            return "SOURCE. Connected reading for \(field)."
        case .gate:
            return "GATE. \(field) is not available."
        }
    }

    private static let statusID = "plant-status"
}

private struct UnitStatusExplainerSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text("This screen shows the unit’s state, power output in megawatts, and fuel flow. It’s read-only — you can’t start or stop the plant from here.")
                        .font(.body)
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                        .fixedSize(horizontal: false, vertical: true)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
            .navigationTitle("Unit status")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") {
                        var transaction = Transaction()
                        transaction.disablesAnimations = reduceMotion
                        withTransaction(transaction) {
                            dismiss()
                        }
                    }
                }
            }
        }
        .presentationDetents([.medium])
        .presentationDragIndicator(.visible)
    }
}
