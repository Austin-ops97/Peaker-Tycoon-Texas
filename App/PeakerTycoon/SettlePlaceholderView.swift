import SwiftUI

/// Empty settlement stub. The explainer stays in plain language.
struct SettlePlaceholderView: View {
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var showExplainer = false

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    EmptyLeadHeader(
                        title: "Settlement",
                        lead: "Statements show up here after the day settles.",
                        titleAccessibilityLabel: "Settle tab. Statements aren’t ready yet. This isn’t a live settle.",
                        leadAccessibilityHint: "No statement is on this screen."
                    )
                    CalmWaitingLine(text: "Next, How settlement works.")
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
                var transaction = Transaction()
                transaction.disablesAnimations = reduceMotion
                withTransaction(transaction) {
                    showExplainer = true
                }
            }
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
        .instantWhenReduceMotion(reduceMotion)
        .sheet(isPresented: $showExplainer) {
            SettlementExplainerSheet()
        }
    }
}

private struct SettlementExplainerSheet: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

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
    }
}
