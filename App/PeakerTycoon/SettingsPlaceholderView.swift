import SwiftUI
import PeakerData
import PeakerKernel

struct SettingsPlaceholderView: View {
    @Binding var zoneIdentifier: String
    let onShowTip: () -> Void
    let onShowNavigationTips: () -> Void
    @State private var reduceMotionNoted = false
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        List {
            Section {
                NavigationLink {
                    TimeZonePickerView(identifier: $zoneIdentifier, onSaved: {})
                } label: {
                    HStack(spacing: 12) {
                        Image(systemName: "clock")
                            .foregroundStyle(ControlGlass.textSecondary(scheme))
                            .accessibilityHidden(true)
                        VStack(alignment: .leading, spacing: 2) {
                            Text("Your local time zone")
                                .foregroundStyle(ControlGlass.textPrimary(scheme))
                            Text(valueText)
                                .font(.subheadline)
                                .foregroundStyle(ControlGlass.textSecondary(scheme))
                        }
                    }
                    .accessibilityElement(children: .combine)
                    .accessibilityLabel("Your local time zone. \(valueText).")
                    .accessibilityHint("Opens the time zone list.")
                }
                Text("Game deadlines always use Central Time. Local time is optional.")
                    .font(.caption)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                if saveFailed {
                    Text("Couldn’t save time zone")
                        .font(.body.weight(.semibold))
                        .foregroundStyle(ControlGlass.warnAmber(scheme))
                    Text("Try again from Settings. Game time still runs on CT.")
                        .font(.caption)
                        .foregroundStyle(ControlGlass.textSecondary(scheme))
                }
                if isSet {
                    Button("Clear local time", role: .destructive) {
                        zoneIdentifier = ""
                    }
                }
            }
            Section {
                Button("Show local time tip", action: onShowTip)
                Button("Show navigation tips", action: onShowNavigationTips)
            }
            Section("Evidence") {
                if let summary = BundledCoverageSamples.summary {
                    NavigationLink {
                        CoverageSamplePage(summary: summary)
                    } label: {
                        coverageRow(summary)
                    }
                    .accessibilityHint("Opens the sample summary.")
                } else {
                    coverageRow(nil)
                }
            }
            Section("Evidence legend") {
                ForEach(EvidenceLabel.allCases, id: \.self) { label in
                    VStack(alignment: .leading, spacing: 4) {
                        EvidenceTag(label: label, provenance: legendCopy(label))
                        Text(legendCopy(label))
                            .font(.caption)
                            .foregroundStyle(ControlGlass.textSecondary(scheme))
                    }
                }
            }
            Section("Accessibility") {
                Text("Dynamic Type follows the system text size. This placeholder uses text styles, not fixed point sizes.")
                Toggle("Reduce Motion noted", isOn: $reduceMotionNoted)
                Text("No motion is used in this placeholder. The toggle is a stub and is not stored.")
                    .font(.caption)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                Text("Alarm patterns, when they exist, use a word plus a shape: CRITICAL octagon, HIGH triangle, MEDIUM square, LOW circle, INFO dash. Color is never the only signal.")
            }
            Section("Roles") {
                Text("Role workspaces are not in this build. Phase 3b owns the role switcher. This screen is not a switcher.")
                    .font(.body)
            }
        }
        .navigationTitle("Settings")
        .tint(ControlGlass.accentTeal)
    }

    private var isSet: Bool {
        LocalTwinClock.zone(for: zoneIdentifier) != nil
    }

    private var saveFailed: Bool {
        !zoneIdentifier.isEmpty && !isSet
    }

    private func coverageRow(_ summary: RetainedSamplePlayerSummary?) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Text(RetainedSamplePlayerSummary.rowTitle)
                .foregroundStyle(ControlGlass.textPrimary(scheme))
            Text(RetainedSamplePlayerSummary.incompleteSentence)
                .font(.subheadline)
                .foregroundStyle(ControlGlass.textSecondary(scheme))
            if let span = summary?.spanSentence {
                Text(span)
                    .font(.subheadline)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
            }
        }
        .accessibilityElement(children: .combine)
        .accessibilityLabel(coverageAccessibility(summary))
    }

    private func coverageAccessibility(_ summary: RetainedSamplePlayerSummary?) -> String {
        var parts = [
            "\(RetainedSamplePlayerSummary.rowTitle).",
            RetainedSamplePlayerSummary.incompleteSentence,
        ]
        if let span = summary?.spanSentence {
            parts.append(span)
        }
        return parts.joined(separator: " ")
    }

    private var valueText: String {
        isSet ? LocalTwinClock.friendlyLabel(zoneIdentifier) : "Not set"
    }

    private func legendCopy(_ label: EvidenceLabel) -> String {
        switch label {
        case .source:
            return "SOURCE. A cited external fact. Chip text is SRC."
        case .game:
            return "GAME. A deliberate simulation rule."
        case .proxy:
            return "PROXY. A derived representation, not an official settlement point."
        case .gate:
            return "GATE. A dependency that must pass before the feature can ship."
        }
    }
}

/// Read-only sample counts. Not a thumb-zone action and not a coverage claim.
private struct CoverageSamplePage: View {
    let summary: RetainedSamplePlayerSummary
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        List {
            Section {
                HStack(alignment: .firstTextBaseline, spacing: 8) {
                    EvidenceTag(label: .gate, provenance: Self.gateProvenance)
                    Text(RetainedSamplePlayerSummary.incompleteSentence)
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                }
                if let span = summary.spanSentence {
                    Text(span)
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                }
                Text(summary.fileSentence)
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                Text(summary.dateSentence)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
            }
            if summary.showsEmptyLiveFetch {
                Section {
                    Text(RetainedSamplePlayerSummary.emptyLiveFetchSentence)
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                }
            }
            if summary.showsMissingReports {
                Section {
                    Text(RetainedSamplePlayerSummary.missingReportsSentence)
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                }
            }
        }
        .navigationTitle(RetainedSamplePlayerSummary.rowTitle)
        .navigationBarTitleDisplayMode(.inline)
        .tint(ControlGlass.accentTeal)
    }

    private static let gateProvenance = "GATE. Saved price files are samples only. Coverage is incomplete. Some early days are still empty on the live fetch. Some reports are not in the public catalog."
}
