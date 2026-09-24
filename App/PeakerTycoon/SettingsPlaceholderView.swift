import SwiftUI
import PeakerKernel

struct SettingsPlaceholderView: View {
    @State private var reduceMotionNoted = false

    var body: some View {
        List {
            Section("Player timezone") {
                Text("Clock labels use Central time.")
                Text("Your own timezone is not chosen yet. That is expected in this build. Nothing is broken.")
                    .font(.body)
                    .foregroundStyle(.secondary)
                Text("Tap Local twin on the clock to open this note. It stays a single chip and does not cover the desk.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
            Section("Evidence legend") {
                ForEach(EvidenceLabel.allCases, id: \.self) { label in
                    VStack(alignment: .leading, spacing: 4) {
                        EvidenceTag(label: label, provenance: legendCopy(label))
                        Text(legendCopy(label))
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            Section("Accessibility") {
                Text("Dynamic Type follows the system text size. This placeholder uses text styles, not fixed point sizes.")
                Toggle("Reduce Motion noted", isOn: $reduceMotionNoted)
                Text("No motion is used in this placeholder. The toggle is a stub and is not stored.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
                Text("Alarm patterns, when they exist, use a word plus a shape: CRITICAL octagon, HIGH triangle, MEDIUM square, LOW circle, INFO dash. Color is never the only signal.")
            }
            Section("Roles") {
                Text("Role workspaces are not in this build. Phase 3b owns the role switcher. This screen is not a switcher.")
                    .font(.body)
            }
        }
        .navigationTitle("Settings")
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
