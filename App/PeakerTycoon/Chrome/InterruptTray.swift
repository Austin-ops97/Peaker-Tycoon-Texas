import SwiftUI

/// Non-modal interrupt tray (§22.2). Empty publisher is valid. This view never presents an alert and never pauses time.
struct InterruptTray: View {
    let items: [InterruptCard]

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Interrupts · \(items.count)")
                .font(.caption.weight(.semibold))
                .accessibilityLabel("Interrupt tray. \(items.count) cards. Does not pause game time.")
            if items.isEmpty {
                Text("No interrupts.")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            } else {
                ForEach(items.prefix(3)) { item in
                    VStack(alignment: .leading, spacing: 2) {
                        Text("\(item.origin) · \(item.decision)")
                            .font(.caption.weight(.semibold))
                        Text(item.deadlineLabel)
                            .font(.caption2)
                        Text(item.inactionConsequence)
                            .font(.caption2)
                    }
                    .accessibilityElement(children: .combine)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .background(.thinMaterial)
    }
}
