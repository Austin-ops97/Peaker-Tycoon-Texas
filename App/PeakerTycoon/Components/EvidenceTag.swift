import SwiftUI
import PeakerKernel

struct EvidenceTag: View {
    let label: EvidenceLabel
    let provenance: String
    @State private var presented = false

    var body: some View {
        Button {
            presented = true
        } label: {
            Text(label.chipText)
                .font(.caption.weight(.semibold))
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.secondary, lineWidth: 1)
                )
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(label.spokenName). \(provenance)")
        .sheet(isPresented: $presented) {
            ProvenanceSheet(label: label, provenance: provenance)
        }
    }
}
