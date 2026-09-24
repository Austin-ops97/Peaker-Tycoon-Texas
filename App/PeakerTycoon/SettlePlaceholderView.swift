import SwiftUI

/// Empty settlement stub. The explainer stays in plain language.
struct SettlePlaceholderView: View {
    @Environment(\.colorScheme) private var scheme
    @State private var showExplainer = false

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    Text("Settlement")
                        .font(.title3.weight(.semibold))
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                        .accessibilityLabel("Settle tab. Statements aren’t ready yet. This isn’t a live settle.")
                    Text("This tab is waiting. Statements aren’t ready yet, and this isn’t a live settle.")
                        .font(.body)
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                        .fixedSize(horizontal: false, vertical: true)
                        .accessibilityHint("No statement is on this screen.")
                    Text("No statements yet.")
                        .font(.body)
                        .foregroundStyle(ControlGlass.textSecondary(scheme))
                        .accessibilityLabel("No statements yet. This isn’t a live settle.")
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            ThumbPrimaryButton(
                title: "How settlement works",
                accessibilityHint: "Opens a short explanation. Statements aren’t ready yet."
            ) {
                showExplainer = true
            }
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
        .sheet(isPresented: $showExplainer) {
            SettlementExplainerSheet()
        }
    }
}

private struct SettlementExplainerSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                Text("Settlement is the money in and the money out for the day. This isn’t a live settle.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .fixedSize(horizontal: false, vertical: true)
                Text("When a statement is ready, you can read why an amount is there. None is ready yet.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                    .fixedSize(horizontal: false, vertical: true)
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
            .navigationTitle("How settlement works")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Done") { dismiss() }
                }
            }
        }
        .presentationDetents([.medium])
    }
}
