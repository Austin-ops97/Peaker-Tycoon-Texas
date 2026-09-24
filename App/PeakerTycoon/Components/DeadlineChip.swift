import SwiftUI
import PeakerKernel

struct DeadlineChip: View {
    let title: String
    let centralLabel: String
    let localTwinLabel: String
    let evidence: EvidenceLabel
    let provenance: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline.weight(.semibold))
            Text("\(centralLabel) · \(localTwinLabel)")
                .font(.body)
                .accessibilityLabel("\(title). \(centralLabel). \(localTwinLabel).")
            EvidenceTag(label: evidence, provenance: provenance)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.secondary, lineWidth: 1)
        )
    }
}
