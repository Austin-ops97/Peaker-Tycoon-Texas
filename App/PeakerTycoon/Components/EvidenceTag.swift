import SwiftUI
import PeakerKernel

struct EvidenceTag: View {
    let label: EvidenceLabel
    let provenance: String
    @State private var presented = false
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        Button {
            presented = true
        } label: {
            Text(label.chipText)
                .font(.caption.weight(.semibold))
                .foregroundStyle(ControlGlass.textPrimary(scheme))
                .padding(.horizontal, 6)
                .padding(.vertical, 2)
                .background(ControlGlass.evidenceFill(label, scheme))
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(label == .gate ? ControlGlass.warnAmber(scheme) : ControlGlass.hairline(scheme), lineWidth: 1)
                )
        }
        .buttonStyle(.plain)
        .accessibilityLabel("\(label.spokenName). \(provenance)")
        .sheet(isPresented: $presented) {
            ProvenanceSheet(label: label, provenance: provenance)
        }
    }
}
