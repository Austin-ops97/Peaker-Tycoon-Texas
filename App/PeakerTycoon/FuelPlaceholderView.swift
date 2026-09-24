import SwiftUI

/// Closed gas day. The four markers are a muted silhouette. Confirm stays off this screen.
struct FuelPlaceholderView: View {
    @Environment(\.colorScheme) private var scheme
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        ScrollViewReader { proxy in
            VStack(spacing: 0) {
                ScrollView {
                    VStack(alignment: .leading, spacing: 16) {
                        Text("Gas day")
                            .font(.title3.weight(.semibold))
                            .foregroundStyle(ControlGlass.textPrimary(scheme))
                            .accessibilityLabel("Fuel tab. Nomination isn’t open yet. This tab is waiting.")
                        Text("This tab is waiting. Nomination isn’t open yet, so you only see the day’s timeline.")
                            .font(.body)
                            .foregroundStyle(ControlGlass.textPrimary(scheme))
                            .fixedSize(horizontal: false, vertical: true)
                        timeline
                            .id(Self.timelineID)
                        Text("No result yet — nomination is still closed.")
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(ControlGlass.textSecondary(scheme))
                        Text("Those times are the gas-day markers, not a live nomination.")
                            .font(.caption)
                            .foregroundStyle(ControlGlass.textTertiary(scheme))
                    }
                    .padding(16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                ThumbPrimaryButton(title: "See gas day timeline") {
                    var transaction = Transaction()
                    transaction.disablesAnimations = reduceMotion
                    withTransaction(transaction) {
                        proxy.scrollTo(Self.timelineID, anchor: .top)
                    }
                }
            }
        }
        .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
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
