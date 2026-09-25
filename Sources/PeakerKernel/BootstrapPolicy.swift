/// TX_TRAIN_2019_2020 supplements forecasts only until 90 completed campaign days (§2.1, §7).
public enum BootstrapPolicy {
    public static let archiveId = "TX_TRAIN_2019_2020"
    public static let trainingOnlyLabel = "training-only"
    public static let retirementCompletedDays = 90
    public static let affectedForecastLabel = "bootstrap"

    public static func supplementsForecast(completedCampaignDays: Int) -> Bool {
        completedCampaignDays < retirementCompletedDays
    }

    /// Nil once the archive has retired. Callers must not keep the bootstrap label after retirement.
    public static func forecastLabel(completedCampaignDays: Int) -> String? {
        supplementsForecast(completedCampaignDays: completedCampaignDays) ? affectedForecastLabel : nil
    }
}
