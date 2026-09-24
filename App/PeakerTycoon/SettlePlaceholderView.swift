import SwiftUI

/// Placeholder statement and audit-chain shell. No settlement math.
struct SettlePlaceholderView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Text("Settle")
                    .font(.largeTitle.bold())
                Text("No statement lines in Phase 0.")
                    .font(.body)
                AuditChainView()
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
