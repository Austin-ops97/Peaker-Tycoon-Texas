import SwiftUI
import PeakerData
import PeakerKernel

/// Desk stub. No offer ticket. A bundled NP4 sample is read-only when the CSV is in the app.
/// The DA row shows Central time, plus local only when a zone is saved.
struct DeskPlaceholderView: View {
    var daLocalClock: String? = nil
    @Environment(\.colorScheme) private var scheme

    private var samples: [NormalizedObservation] { MarketSampleArchive.rows }

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if samples.isEmpty {
                    Text("Nothing on your desk yet")
                        .font(.title3.weight(.semibold))
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                        .accessibilityLabel("Desk empty. No offer ticket yet.")
                    Text("When market stubs load, you’ll see today’s checklist and the offer gate countdown here.")
                        .font(.body)
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                    Text("Browse Fuel, Plant, or Settle — or open Settings anytime.")
                        .font(.body)
                        .foregroundStyle(ControlGlass.textSecondary(scheme))
                } else {
                    Text("Sample prices from retained SOURCE archives")
                        .font(.title3.weight(.semibold))
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                        .accessibilityLabel("Sample prices from retained source archives. Nothing to submit.")
                    Text("Nothing to submit. These are a few retained archive rows, not a live price and not the whole day.")
                        .font(.body)
                        .foregroundStyle(ControlGlass.textPrimary(scheme))
                    Text("Browse Fuel, Plant, or Settle — or open Settings anytime.")
                        .font(.body)
                        .foregroundStyle(ControlGlass.textSecondary(scheme))
                    ForEach(samples, id: \.sourcePointId) { row in
                        MarketSampleCard(row: row)
                    }
                }
                DeadlineChip(
                    title: "DA submission",
                    centralLabel: "10:00 CT",
                    localClock: daLocalClock,
                    evidence: .source,
                    provenance: "Build Spec §8, citing S6: ERCOT DAM inputs are due at 10:00 Central. This chip is a placeholder, not a live countdown and not a publication timestamp."
                )
            }
            .padding(16)
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
    }
}

private struct MarketSampleCard: View {
    let row: NormalizedObservation
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(row.sourcePointId)
                .font(.headline)
                .foregroundStyle(ControlGlass.textPrimary(scheme))
            Text(deliveryStamp)
                .font(.subheadline)
                .foregroundStyle(ControlGlass.textSecondary(scheme))
            Text("\(row.valueDecimal) \(row.unit)")
                .font(.body.monospacedDigit())
                .foregroundStyle(ControlGlass.textPrimary(scheme))
            EvidenceTag(label: .source, provenance: provenance)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(ControlGlass.surfaceElevated(scheme))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(ControlGlass.hairline(scheme), lineWidth: 1)
        )
        .accessibilityElement(children: .combine)
    }

    private var deliveryStamp: String {
        let hour = row.hourEndingRaw ?? ""
        return "\(row.sourceLocalDate) \(hour) CT"
    }

    private var provenance: String {
        "SOURCE row from the bundled NP4-190-CD sample market-sample-np4.csv, cut from a retained archive extract. \(row.sourcePointId), delivery \(row.sourceLocalDate), hour ending \(row.hourEndingRaw ?? ""), \(row.valueDecimal) \(row.unit). Not a live fetch, not a proxy site mapping, and not a complete day. Coverage claims are unchanged."
    }
}
