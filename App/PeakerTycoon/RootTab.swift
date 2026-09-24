import Foundation

/// Frozen root navigation. Four tabs. Do not add a fifth.
enum RootTab: String, Hashable, CaseIterable {
    case desk
    case fuel
    case plant
    case settle

    var title: String {
        switch self {
        case .desk: return "Desk"
        case .fuel: return "Fuel"
        case .plant: return "Plant"
        case .settle: return "Settle"
        }
    }

    var systemImage: String {
        switch self {
        case .desk: return "briefcase.fill"
        case .fuel: return "flame.fill"
        case .plant: return "bolt.fill"
        case .settle: return "doc.text.fill"
        }
    }

    /// Spoken after the tab name. The visible label stays the short title.
    var voiceOverHint: String {
        switch self {
        case .desk: return "Retained samples and today’s plan. Not a live market."
        case .fuel: return "Gas-day timeline. Nomination isn’t open yet."
        case .plant: return "Waiting for a connected reading. Not a live dispatch."
        case .settle: return "Statements aren’t ready yet. This isn’t a live settle."
        }
    }
}
