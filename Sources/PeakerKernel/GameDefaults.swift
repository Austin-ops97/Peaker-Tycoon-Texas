import Foundation

/// Versioned GAME defaults. Changing a default requires a configuration version and a migration note.
public enum GameDefaults {
    public static let configVersion = SchemaVersion(major: 3, minor: 0, patch: 0)
    public static let configId = "GAME_DEFAULTS_V3"

    public static let campaignEraStart = CampaignCalendar.start
    public static let campaignEraEnd = CampaignCalendar.end
    public static let bootstrapRetirementCompletedDays = BootstrapPolicy.retirementCompletedDays
    public static let areaBasketWeights = ProxyPrice.defaultAreaWeights

    /// GAME morning-brief display anchor (§8). Not a market publication time.
    public static let placeholderMorningBrief = GameInstant(
        date: CampaignCalendar.start,
        hour: 8,
        minute: 0,
        second: 0
    )
}
