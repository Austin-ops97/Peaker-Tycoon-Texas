import SwiftUI
import PeakerData
import PeakerKernel

/// Gas-day timeline. Confirm stays off. A saved day-ahead row can say the day is closed.
/// There is no gas volume in the retained price files.
struct FuelPlaceholderView: View {
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    private var samples: [NormalizedObservation] { MarketSampleArchive.rows }

    private var savedDates: [String] {
        var dates: [String] = []
        for row in samples where !dates.contains(row.sourceLocalDate) {
            dates.append(row.sourceLocalDate)
        }
        return dates
    }

    var body: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        lead
                        CalmWaitingLine(
                            text: "Next, See gas day timeline.",
                            accessibilityHint: "Scrolls to the four gas-day markers. Nomination isn’t open yet."
                        ) {
                            revealTimeline(with: proxy)
                        }
                        timeline
                            .id(Self.timelineID)
                        if !samples.isEmpty {
                            retainedClosure
                        }
                        Text("No result yet — nomination is still closed.")
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(ControlGlass.textSecondary(scheme))
                        Text("Those times are the gas-day markers, not a live nomination.")
                            .font(.caption)
                            .foregroundStyle(ControlGlass.textTertiary(scheme))
                            .fixedSize(horizontal: false, vertical: true)
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                ThumbPrimaryButton(
                    title: "See gas day timeline",
                    accessibilityHint: "Scrolls to the four gas-day markers. Nomination isn’t open yet."
                ) {
                    revealTimeline(with: proxy)
                }
            }
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
        .instantWhenReduceMotion(reduceMotion)
    }

    @ViewBuilder
    private var lead: some View {
        if samples.isEmpty {
            EmptyLeadHeader(
                title: "Gas day",
                lead: "Nomination isn’t open right now. You can still see today’s timeline.",
                titleAccessibilityLabel: "Fuel tab. Nomination isn’t open yet. This tab is waiting.",
                leadAccessibilityHint: "Closed gas day. Not a live nomination."
            )
        } else {
            EmptyLeadHeader(
                title: "Gas day",
                lead: "Nomination is closed. These saved days have no publication time.",
                titleAccessibilityLabel: "Fuel tab. Nomination is closed for the saved days.",
                leadAccessibilityHint: "Publication time isn’t saved. Not a live nomination."
            )
        }
    }

    private var retainedClosure: some View {
        VStack(alignment: .leading, spacing: 8) {
            VStack(alignment: .leading, spacing: 6) {
                Text("Saved days \(savedDayList).")
                    .font(.body)
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .fixedSize(horizontal: false, vertical: true)
                if samples.allSatisfy({ $0.sourcePublishedAt == nil }) {
                    Text("Publication time isn’t saved with these rows.")
                        .font(.body)
                        .foregroundStyle(ControlGlass.textSecondary(scheme))
                        .fixedSize(horizontal: false, vertical: true)
                }
                if samples.allSatisfy({ $0.dstFlagRaw == "N" }) {
                    Text("Not a repeated hour.")
                        .font(.body)
                        .foregroundStyle(ControlGlass.textSecondary(scheme))
                }
                Text("This is not a gas volume.")
                    .font(.caption)
                    .foregroundStyle(ControlGlass.textTertiary(scheme))
            }
            .accessibilityElement(children: .combine)
            .accessibilityLabel("Saved days \(savedDayList). Publication time isn’t saved, so nomination stays closed. Not a gas volume.")
            EvidenceTag(
                label: .source,
                provenance: "SOURCE. Saved day-ahead rows for \(savedDayList). Publication time isn’t saved. Not a live nomination and not a gas volume."
            )
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(ControlGlass.surfaceElevated(scheme))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay(
            RoundedRectangle(cornerRadius: 12)
                .stroke(ControlGlass.hairline(scheme), lineWidth: 1)
        )
    }

    private var savedDayList: String {
        switch savedDates.count {
        case 0:
            return ""
        case 1:
            return savedDates[0]
        default:
            let head = savedDates.dropLast().joined(separator: ", ")
            return "\(head), and \(savedDates[savedDates.count - 1])"
        }
    }

    private func revealTimeline(with proxy: ScrollViewProxy) {
        var transaction = Transaction()
        transaction.disablesAnimations = reduceMotion
        withTransaction(transaction) {
            proxy.scrollTo(Self.timelineID, anchor: .top)
        }
    }

    private var timeline: some View {
        VStack(alignment: .leading, spacing: 8) {
            ForEach(Self.markers, id: \.self) { marker in
                Text(marker)
                    .font(.subheadline)
                    .foregroundStyle(ControlGlass.textTertiary(scheme))
            }
        }
        .padding(12)
        .frame(maxWidth: .infinity, alignment: .leading)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(ControlGlass.hairline(scheme), lineWidth: 1)
        )
        .accessibilityElement(children: .combine)
        .accessibilityLabel("Gas day timeline. \(Self.markers.joined(separator: ", ")).")
    }

    private static let timelineID = "fuel-timeline"
    /// Inventory times. Not invented and not an open nomination panel.
    private static let markers = [
        "10:00 DA",
        "13:00 gas",
        "13:30 DAM target",
        "archive actual",
    ]
}
