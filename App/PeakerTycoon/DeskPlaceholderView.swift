import SwiftUI
import PeakerData
import PeakerKernel

/// Desk stub. Next up, then Today, then one retained SOURCE sample at a time. No offer ticket.
/// The single primary button opens a read-only sheet for the sample currently on the strip.
struct DeskPlaceholderView: View {
    var daLocalClock: String? = nil
    /// True after the coach is finished or the player chose Not now. Not a second tour.
    var showsNextStep: Bool = false
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion
    @State private var sampleIndex = 0
    @State private var showSampleReview = false

    private var samples: [NormalizedObservation] { MarketSampleArchive.rows }

    private var activeSample: NormalizedObservation? {
        guard !samples.isEmpty else { return nil }
        return samples[sampleIndex % samples.count]
    }

    var body: some View {
        VStack(spacing: 0) {
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    nextUpCard
                    if showsNextStep {
                        nextStepLine
                    }
                    todayCard
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
            ThumbPrimaryButton(
                title: "Review today’s plan",
                accessibilityHint: "Opens the retained sample on screen. Not live."
            ) {
                var transaction = Transaction()
                transaction.disablesAnimations = reduceMotion
                withTransaction(transaction) {
                    showSampleReview = true
                }
            }
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
        .instantWhenReduceMotion(reduceMotion)
        .sheet(isPresented: $showSampleReview) {
            RetainedSampleSheet(row: activeSample)
        }
    }

    private var nextUpCard: some View {
        HStack(alignment: .top, spacing: 8) {
            RoundedRectangle(cornerRadius: 1.5)
                .fill(ControlGlass.accentTeal.opacity(0.4))
                .frame(width: 3, height: 28)
                .accessibilityHidden(true)
            Text("Next up")
                .font(.title2.weight(.semibold))
                .foregroundStyle(ControlGlass.textPrimary(scheme))
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(ControlGlass.surfaceElevated(scheme))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(ControlGlass.hairline(scheme), lineWidth: 1)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Next up")
    }

    private var nextStepLine: some View {
        Text("Next, use the arrows to cycle saved hubs, or open Review today’s plan.")
            .font(.subheadline)
            .foregroundStyle(ControlGlass.textSecondary(scheme))
            .fixedSize(horizontal: false, vertical: true)
            .accessibilityHint("The arrows are on the saved hub samples. Review today’s plan opens the one on screen.")
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
        let index = samples.isEmpty ? 0 : sampleIndex % samples.count
        let row = samples[index]
        return VStack(alignment: .leading, spacing: 8) {
            Text("Sample prices from retained SOURCE archives")
                .font(.caption.weight(.semibold))
                .foregroundStyle(ControlGlass.textTertiary(scheme))
            MarketSampleCard(row: row, position: "\(index + 1) of \(samples.count)")
            if samples.count > 1 {
                sampleCycle(index: index)
            }
            Text("These are retained historical samples, not a live market.")
                .font(.caption)
                .foregroundStyle(ControlGlass.textTertiary(scheme))
                .fixedSize(horizontal: false, vertical: true)
                .accessibilityHint("Stays true for every hub in this cycle.")
        }
    }

    private func sampleCycle(index: Int) -> some View {
        ViewThatFits(in: .horizontal) {
            cycleRow(index: index, dotsBesideArrows: true)
            VStack(alignment: .leading, spacing: 4) {
                cycleRow(index: index, dotsBesideArrows: false)
                sampleDots(index: index)
            }
        }
    }

    private func cycleRow(index: Int, dotsBesideArrows: Bool) -> some View {
        HStack(spacing: 8) {
            cycleButton(
                systemName: "chevron.left",
                label: "Previous sample",
                hint: "Shows the previous retained hub sample. Not a live market."
            ) {
                moveSample(by: -1)
            }
            Spacer(minLength: 0)
            if dotsBesideArrows {
                sampleDots(index: index)
                Spacer(minLength: 0)
            }
            cycleButton(
                systemName: "chevron.right",
                label: "Next sample",
                hint: "Shows the next retained hub sample. Not a live market."
            ) {
                moveSample(by: 1)
            }
        }
    }

    private func sampleDots(index: Int) -> some View {
        HStack(spacing: 6) {
            ForEach(samples.indices, id: \.self) { dot in
                Circle()
                    .fill(dot == index ? ControlGlass.accentTeal : ControlGlass.textTertiary(scheme))
                    .frame(width: 6, height: 6)
            }
        }
        .accessibilityHidden(true)
    }

    private func cycleButton(systemName: String, label: String, hint: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Image(systemName: systemName)
                .font(.body.weight(.semibold))
                .foregroundStyle(ControlGlass.textSecondary(scheme))
                .frame(minWidth: 44, minHeight: 44)
                .contentShape(Rectangle())
        }
        .buttonStyle(.plain)
        .accessibilityLabel(label)
        .accessibilityHint(hint)
    }

    private func moveSample(by delta: Int) {
        let count = samples.count
        guard count > 1 else { return }
        sampleIndex = (sampleIndex + delta + count) % count
    }
}

private struct MarketSampleCard: View {
    let row: NormalizedObservation
    let position: String
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(row.sourcePointId)
                .font(.subheadline.weight(.semibold))
                .foregroundStyle(ControlGlass.textSecondary(scheme))
            if let friendlyHub = friendlyHubName(for: row.sourcePointId) {
                Text(friendlyHub)
                    .font(.caption)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
            }
            Text(deliveryStamp)
                .font(.caption)
                .foregroundStyle(ControlGlass.textTertiary(scheme))
            Text("\(row.valueDecimal) \(row.unit)")
                .font(.caption.monospacedDigit())
                .foregroundStyle(ControlGlass.textSecondary(scheme))
            ForEach(sampleFacts(for: row), id: \.self) { fact in
                Text(fact)
                    .font(.caption)
                    .foregroundStyle(ControlGlass.textTertiary(scheme))
                    .fixedSize(horizontal: false, vertical: true)
            }
            EvidenceTag(label: .source, provenance: provenance)
        }
        .padding(10)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(ControlGlass.surfaceRecessed(scheme))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(accessibleName), \(deliveryStamp), \(row.valueDecimal) \(row.unit). \(sampleFacts(for: row).joined(separator: " ")) Sample \(position). Retained historical sample, not a live market.")
    }

    private var deliveryStamp: String {
        let hour = row.hourEndingRaw ?? ""
        return "\(row.sourceLocalDate) \(hour) CT"
    }

    private var provenance: String {
        "SOURCE row from a retained day-ahead archive sample. \(accessibleName), delivery \(row.sourceLocalDate), hour ending \(row.hourEndingRaw ?? ""), \(row.valueDecimal) \(row.unit). \(sampleFacts(for: row).joined(separator: " ")) Retained historical sample, not a live market, and not a proxy site mapping. Not the whole day."
    }

    private var accessibleName: String {
        if let friendlyHub = friendlyHubName(for: row.sourcePointId) {
            return "\(row.sourcePointId), \(friendlyHub)"
        }
        return row.sourcePointId
    }
}

/// Read-only look at the sample currently on the Desk strip. Nothing here is submitted.
private struct RetainedSampleSheet: View {
    let row: NormalizedObservation?
    @Environment(\.dismiss) private var dismiss
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    if let row {
                        sampleBody(row)
                    } else {
                        Text("No retained sample is loaded.")
                            .font(.body)
                            .foregroundStyle(ControlGlass.textPrimary(scheme))
                        Text("Retained sample — not live.")
                            .font(.body)
                            .foregroundStyle(ControlGlass.textSecondary(scheme))
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
            .navigationTitle("Today’s plan")
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
        .presentationDragIndicator(.visible)
    }

    private func sampleBody(_ row: NormalizedObservation) -> some View {
        let friendly = friendlyHubName(for: row.sourcePointId)
        return VStack(alignment: .leading, spacing: 8) {
            Text(friendly ?? row.sourcePointId)
                .font(.title3.weight(.semibold))
                .foregroundStyle(ControlGlass.textPrimary(scheme))
            if friendly != nil {
                Text(row.sourcePointId)
                    .font(.subheadline)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
            }
            Text(row.sourceLocalDate)
                .font(.body)
                .foregroundStyle(ControlGlass.textPrimary(scheme))
            Text("Hour ending \(row.hourEndingRaw ?? "") CT")
                .font(.body)
                .foregroundStyle(ControlGlass.textSecondary(scheme))
            Text("\(row.valueDecimal) \(row.unit)")
                .font(.body.monospacedDigit())
                .foregroundStyle(ControlGlass.textPrimary(scheme))
            ForEach(sampleFacts(for: row), id: \.self) { fact in
                Text(fact)
                    .font(.body)
                    .foregroundStyle(ControlGlass.textSecondary(scheme))
                    .fixedSize(horizontal: false, vertical: true)
            }
            Text("Retained sample — not live.")
                .font(.body)
                .foregroundStyle(ControlGlass.textPrimary(scheme))
            Text("Not the whole day.")
                .font(.caption)
                .foregroundStyle(ControlGlass.textTertiary(scheme))
        }
        .accessibilityElement(children: .combine)
    }
}

/// Plain facts already on the parsed row. No product id and no invented publication time.
func sampleFacts(for row: NormalizedObservation) -> [String] {
    var lines: [String] = []
    switch row.pointType {
    case "hub_spp":
        lines.append("Hub price")
    case "load_zone_spp":
        lines.append("Load zone price")
    case "resource_spp":
        lines.append("Resource price")
    default:
        break
    }
    switch row.dstFlagRaw {
    case "N":
        lines.append("Not a repeated hour.")
    case "Y":
        lines.append("Repeated hour.")
    default:
        break
    }
    if row.sourcePublishedAt == nil {
        lines.append("No publication time saved with this row.")
    }
    return lines
}

/// Plain name for the four hubs. Any other settlement code stays code-only.
private func friendlyHubName(for code: String) -> String? {
    switch code {
    case "HB_HOUSTON": return "Houston"
    case "HB_NORTH": return "North"
    case "HB_SOUTH": return "South"
    case "HB_WEST": return "West"
    default: return nil
    }
}
