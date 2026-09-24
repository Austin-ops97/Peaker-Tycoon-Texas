import SwiftUI
import PeakerData
import PeakerKernel

/// Desk stub. Next up, then Today, then muted reference rows. No offer ticket.
/// The single primary button sits in the thumb zone and scrolls to Today.
struct DeskPlaceholderView: View {
    var daLocalClock: String? = nil
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private var samples: [NormalizedObservation] { MarketSampleArchive.rows }

    var body: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        nextUpCard
                        todayCard
                            .id(Self.todayID)
                        DeadlineChip(
                            title: "DA submission",
                            centralLabel: "10:00 CT",
                            localClock: daLocalClock,
                            evidence: .source,
                            provenance: "Build Spec §8, citing S6: ERCOT DAM inputs are due at 10:00 Central. This chip is a placeholder, not a live countdown and not a publication timestamp."
                        )
                        if !samples.isEmpty {
                            sampleSection
                        }
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                ThumbPrimaryButton(title: "Review today’s plan") {
                    var transaction = Transaction()
                    transaction.disablesAnimations = reduceMotion
                    withTransaction(transaction) {
                        proxy.scrollTo(Self.todayID, anchor: .top)
                    }
                }
            }
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
    }

    private var nextUpCard: some View {
        HStack(alignment: .top, spacing: 0) {
            Rectangle()
                .fill(ControlGlass.accentTeal)
                .frame(width: 4)
            VStack(alignment: .leading, spacing: 6) {
                Text("Next up")
                    .font(.headline)
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                Text("You’re on the trading desk. When offers open, you’ll build them here. For now, check today’s plan.")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .fixedSize(horizontal: false, vertical: true)
            }
            .padding(12)
        }
        .background(ControlGlass.surfaceElevated(scheme))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(ControlGlass.hairline(scheme), lineWidth: 1)
        )
        .accessibilityElement(children: .combine)
    }

    private var todayCard: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("Today")
                .font(.headline)
                .foregroundStyle(ControlGlass.textSecondary(scheme))
            Text("No checklist items yet. Day pieces will show up here as the market day runs.")
                .font(.body)
                .foregroundStyle(ControlGlass.textSecondary(scheme))
                .fixedSize(horizontal: false, vertical: true)
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(ControlGlass.surfaceRecessed(scheme))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }

    private var sampleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("Sample prices from retained SOURCE archives")
                .font(.caption.weight(.semibold))
                .foregroundStyle(ControlGlass.textTertiary(scheme))
            Text("Nothing to submit. These are a few retained archive rows, not a live price and not the whole day.")
                .font(.caption)
                .foregroundStyle(ControlGlass.textTertiary(scheme))
            ForEach(samples, id: \.sourcePointId) { row in
                MarketSampleCard(row: row)
            }
        }
        .accessibilityElement(children: .contain)
    }

    private static let todayID = "desk-today"
}

private struct MarketSampleCard: View {
    let row: NormalizedObservation
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(row.sourcePointId)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(ControlGlass.textSecondary(scheme))
            Text(deliveryStamp)
                .font(.caption)
                .foregroundStyle(ControlGlass.textTertiary(scheme))
            Text("\(row.valueDecimal) \(row.unit)")
                .font(.caption.monospacedDigit())
                .foregroundStyle(ControlGlass.textSecondary(scheme))
            EvidenceTag(label: .source, provenance: provenance)
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(ControlGlass.surfaceRecessed(scheme))
        .clipShape(RoundedRectangle(cornerRadius: 8))
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
