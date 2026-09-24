import SwiftUI
import PeakerKernel

struct DeadlineChip: View {
    let title: String
    let centralLabel: String
    /// Player-zone clock, already formatted. Nil keeps the row on Central time only.
    var localClock: String? = nil
    let evidence: EvidenceLabel
    let provenance: String

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.subheadline.weight(.semibold))
            Text(timeLine)
                .font(.body)
                .accessibilityLabel("\(title). \(timeLine).")
            EvidenceTag(label: evidence, provenance: provenance)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(12)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.secondary, lineWidth: 1)
        )
    }

    private var timeLine: String {
        if let localClock {
            return "\(centralLabel) · \(localClock) your local"
        }
        return centralLabel
    }
}
