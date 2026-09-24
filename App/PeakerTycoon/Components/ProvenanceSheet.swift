import SwiftUI
import PeakerKernel

struct ProvenanceSheet: View {
    let label: EvidenceLabel
    let provenance: String
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        NavigationStack {
            List {
                LabeledContent("Label", value: label.rawValue)
                LabeledContent("Chip", value: label.chipText)
                Text(provenance)
                    .font(.body)
            }
            .navigationTitle("Provenance")
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
