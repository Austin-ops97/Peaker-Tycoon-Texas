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
                    Text("Statements and the audit trail land here after the day settles.")
                        .font(.body)
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                        .fixedSize(horizontal: false, vertical: true)
                    Text("No statements yet.")
                        .font(.body)
                        .foregroundStyle(ControlGlass.textSecondary(scheme))
                        .accessibilityLabel("Settle empty. No statements.")
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            ThumbPrimaryButton(title: "How settlement works") {
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
            VStack(alignment: .leading, spacing: 12) {
                Text("Settlement is the money in and the money out for the day.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .fixedSize(horizontal: false, vertical: true)
                Text("When a statement is ready, tap a line to see why that amount is there.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                    .fixedSize(horizontal: false, vertical: true)
                Spacer()
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
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
