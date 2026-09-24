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
        case .desk: return "briefcase"
        case .fuel: return "flame"
        case .plant: return "bolt.fill"
        case .settle: return "doc.text.magnifyingglass"
        }
    }
}
