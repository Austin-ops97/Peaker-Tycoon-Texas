import SwiftUI

/// One filled action in the thumb zone. Label color is the existing teal on-fill token.
struct ThumbPrimaryButton: View {
    let title: String
    var accessibilityHint: String? = nil
    let action: () -> Void
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.body.weight(.semibold))
                .foregroundStyle(ControlGlass.tealOnFill)
                .frame(maxWidth: .infinity)
                .frame(minHeight: 44)
                .padding(.horizontal, 16)
                .background(ControlGlass.accentTeal)
                .clipShape(RoundedRectangle(cornerRadius: 12))
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
        .padding(.bottom, 12)
        .background(ControlGlass.surfaceBase(scheme))
        .overlay(alignment: .top) {
            Rectangle()
                .fill(ControlGlass.hairline(scheme))
                .frame(height: 1)
        }
        .accessibilityHint(accessibilityHint ?? title)
    }
}
