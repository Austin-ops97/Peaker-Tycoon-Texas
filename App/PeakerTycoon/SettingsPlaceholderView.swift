import SwiftUI
import PeakerKernel

struct SettingsPlaceholderView: View {
    @Binding var zoneIdentifier: String
    let onShowTip: () -> Void
    @State private var reduceMotionNoted = false
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        List {
            Section {
                LabeledContent("Your local time zone", value: valueText)
                    .accessibilityLabel("Your local time zone. \(valueText).")
                Text("Deadlines always show CT. Local is optional and only appears when set.")
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
                NavigationLink {
                    TimeZonePickerView(identifier: $zoneIdentifier, onSaved: {})
                } label: {
                    Text(isSet ? "Change…" : "Set time zone…")
                }
                if isSet {
                    Button("Clear local time", role: .destructive) {
                        zoneIdentifier = ""
                    }
                }
                Button("Show local time tip", action: onShowTip)
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
