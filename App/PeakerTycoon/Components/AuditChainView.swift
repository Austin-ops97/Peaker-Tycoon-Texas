import SwiftUI

struct AuditLink: Identifiable, Equatable {
    let id: String
    let title: String
    let detail: String
}

/// Empty causal-chain shell (§22.5). Phase 1 binds statement, award, and tranche ids.
struct AuditChainView: View {
    var links: [AuditLink] = []

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Audit chain")
                .font(.headline)
            if links.isEmpty {
                Text("No statement lines. The causal chain is unwired until Phase 1 settlement models exist.")
                    .font(.body)
                    .foregroundStyle(.secondary)
            } else {
                ForEach(links) { link in
                    VStack(alignment: .leading, spacing: 2) {
                        Text(link.title)
                            .font(.body.weight(.semibold))
                        Text(link.detail)
                            .font(.caption)
                    }
                    .accessibilityElement(children: .combine)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}
