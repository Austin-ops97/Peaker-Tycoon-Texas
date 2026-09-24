import SwiftUI
import PeakerKernel

/// App-only palette. Light values match `Design/Peaker-Tycoon-Texas/tokens/control-glass-light-v1.json`.
/// Dark values are the 02 dark seeds. No player theme toggle: the OS appearance picks the set.
enum ControlGlass {
    static let accentTeal = Color(red: 46.0 / 255, green: 196.0 / 255, blue: 182.0 / 255)
    static let tealOnFill = Color(red: 14.0 / 255, green: 17.0 / 255, blue: 20.0 / 255)

    static func surfaceBase(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? rgb(0x0E1114) : rgb(0xF2F4F6)
    }

    static func surfaceElevated(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? rgb(0x171B20).opacity(0.92) : rgb(0xFFFFFF).opacity(0.92)
    }

    static func surfaceRecessed(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? rgb(0x0A0C0E) : rgb(0xE6EAEE)
    }

    static func surfaceTintCool(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? accentTeal.opacity(0.14) : rgb(0xE8F4F2)
    }

    static func hairline(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? rgb(0x2A3138) : rgb(0xC5CCD4)
    }

    static func glassFill(_ scheme: ColorScheme, reduceTransparency: Bool) -> Color {
        if reduceTransparency {
            return scheme == .dark ? rgb(0x171B20) : rgb(0xFFFFFF)
        }
        return scheme == .dark ? rgb(0x1C2228).opacity(0.72) : rgb(0xF7F9FA).opacity(0.78)
    }

    static func textPrimary(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? rgb(0xE8ECF0) : rgb(0x1A1F24)
    }

    static func textSecondary(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? rgb(0x9AA3AD) : rgb(0x5C6570)
    }

    static func textTertiary(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? rgb(0x6B737C) : rgb(0x8A939C)
    }

    static func accentMuted(_ scheme: ColorScheme) -> Color {
        accentTeal.opacity(scheme == .dark ? 0.14 : 0.12)
    }

    static func moneyPositive(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? rgb(0x3DDC97) : rgb(0x1B9E6E)
    }

    static func moneyNegative(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? rgb(0xF07178) : rgb(0xD64550)
    }

    static func warnAmber(_ scheme: ColorScheme) -> Color {
        scheme == .dark ? rgb(0xE6A23C) : rgb(0xC9851A)
    }

    static func evidenceFill(_ label: EvidenceLabel, _ scheme: ColorScheme) -> Color {
        switch (label, scheme) {
        case (.source, .dark): return rgb(0x3A4550)
        case (.source, .light): return rgb(0xDDE3E8)
        case (.game, .dark): return rgb(0x2F3D48)
        case (.game, .light): return rgb(0xD6DEE4)
        case (.proxy, .dark): return rgb(0x3D3548)
        case (.proxy, .light): return rgb(0xDDD8E6)
        case (.gate, .dark): return rgb(0x4A3A28)
        case (.gate, .light): return rgb(0xF0E4D4)
        @unknown default:
            return surfaceRecessed(scheme)
        }
    }

    private static func rgb(_ hex: UInt32) -> Color {
        Color(
            red: Double((hex >> 16) & 0xFF) / 255,
            green: Double((hex >> 8) & 0xFF) / 255,
            blue: Double(hex & 0xFF) / 255
        )
    }
}

/// Sign plus triangle. Not placed on empty tabs, so no price is invented.
struct MoneySign: View {
    let positive: Bool
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        Text(positive ? "+ ▲" : "− ▼")
            .font(.caption.weight(.semibold))
            .foregroundStyle(positive ? ControlGlass.moneyPositive(scheme) : ControlGlass.moneyNegative(scheme))
            .accessibilityLabel(positive ? "Gain" : "Loss")
    }
}
