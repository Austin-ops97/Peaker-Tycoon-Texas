import SwiftUI

struct TimeZonePickerView: View {
    @Binding var identifier: String
    let onSaved: () -> Void
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var scheme
    @State private var query = ""

    var body: some View {
        List(filtered, id: \.self) { zoneID in
            Button {
                guard TimeZone(identifier: zoneID) != nil else { return }
                identifier = zoneID
                onSaved()
                dismiss()
            } label: {
                VStack(alignment: .leading, spacing: 2) {
                    Text(LocalTwinClock.friendlyLabel(zoneID))
                        .font(.body)
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                    if identifier == zoneID {
                        Text("Selected")
                            .font(.caption)
                            .foregroundStyle(ControlGlass.accentTeal)
                    }
                }
            }
        }
        .searchable(text: $query, prompt: "Search time zones")
        .navigationTitle("Set time zone…")
        .navigationBarTitleDisplayMode(.inline)
    }

    private var filtered: [String] {
        let zones = TimeZone.knownTimeZoneIdentifiers.sorted()
        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmed.isEmpty else { return zones }
        return zones.filter { zoneID in
            zoneID.localizedCaseInsensitiveContains(trimmed)
                || LocalTwinClock.friendlyLabel(zoneID).localizedCaseInsensitiveContains(trimmed)
        }
    }
}
