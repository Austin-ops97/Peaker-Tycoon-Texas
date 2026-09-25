import SwiftUI

/// Design 05 empty lead. Muted teal bar, title2 title, short secondary lead. No illustration.
struct EmptyLeadHeader: View {
    let title: String
    let lead: String
    var titleAccessibilityLabel: String? = nil
    var leadAccessibilityHint: String? = nil
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            RoundedRectangle(cornerRadius: 1.5)
                .fill(ControlGlass.accentTeal.opacity(0.4))
                .frame(width: 3, height: 28)
                .accessibilityHidden(true)
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .font(.title2.weight(.semibold))
                    .foregroundStyle(ControlGlass.textPrimary(scheme))
                    .accessibilityLabel(titleAccessibilityLabel ?? title)
                leadText
            }
        }
    }

    private var leadText: some View {
        let text = Text(lead)
            .font(.body)
            .foregroundStyle(ControlGlass.textSecondary(scheme))
            .fixedSize(horizontal: false, vertical: true)
        return Group {
            if let leadAccessibilityHint {
                text.accessibilityHint(leadAccessibilityHint)
            } else {
                text
            }
        }
    }
}

/// Quiet pointer under an empty lead. Not a second coach and not a thumb button.
struct CalmWaitingLine: View {
    let text: String
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        Text(text)
            .font(.subheadline)
            .foregroundStyle(ControlGlass.textSecondary(scheme))
            .fixedSize(horizontal: false, vertical: true)
    }
}

extension View {
    /// Reduce Motion: custom motion in this subtree is instant. No slide and no bounce.
    func instantWhenReduceMotion(_ reduceMotion: Bool) -> some View {
        transaction { transaction in
            if reduceMotion {
                transaction.disablesAnimations = true
            }
        }
    }
}
