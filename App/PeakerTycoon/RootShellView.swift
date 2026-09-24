import SwiftUI
import PeakerKernel

/// iPhone shell. Navigation is frozen at Desk, Fuel, Plant, and Settle.
/// The clock bar is a layout sibling above the tabs, never a top safe-area overlay.
struct RootShellView: View {
    @State private var tab: RootTab = .desk
    @State private var chrome = PlaceholderChrome()
    @State private var showSettings = false
    @State private var showTip = false
    @AppStorage(LocalTwinClock.zoneKey) private var zoneIdentifier = ""
    @AppStorage(LocalTwinClock.tipDismissedKey) private var tipDismissed = false
    @Environment(\.colorScheme) private var scheme

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                GameClockBar(
                    clock: chrome.clock,
                    zoneIdentifier: zoneIdentifier,
                    speed: $chrome.speed
                )
                TabView(selection: $tab) {
                    tabPage(DeskPlaceholderView(daLocalClock: daLocalClock), tab: .desk)
                    tabPage(FuelPlaceholderView(), tab: .fuel)
                    tabPage(PlantPlaceholderView(), tab: .plant)
                    tabPage(SettlePlaceholderView(), tab: .settle)
                }
            }
            .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
            .background {
                PresentationClockDriver(clock: $chrome.clock, speed: $chrome.speed)
            }
            .tint(ControlGlass.accentTeal)
            .navigationTitle(tab.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showSettings = true
                    } label: {
                        Label("Settings", systemImage: "gearshape")
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                NavigationStack {
                    SettingsPlaceholderView(zoneIdentifier: $zoneIdentifier) {
                        showSettings = false
                        showTip = true
                    }
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") { showSettings = false }
                        }
                    }
                }
            }
            .sheet(isPresented: $showTip, onDismiss: { tipDismissed = true }) {
                LocalTwinTipSheet(
                    onNotNow: { showTip = false },
                    onOpenSettings: {
                        showTip = false
                        showSettings = true
                    }
                )
            }
            .onAppear {
                if !tipDismissed && zoneIdentifier.isEmpty {
                    showTip = true
                }
            }
        }
    }

    private var daLocalClock: String? {
        LocalTwinClock.hourMinute(
            on: chrome.clock.date,
            hour: 10,
            minute: 0,
            second: 0,
            identifier: zoneIdentifier
        )
    }

    private func tabPage<Content: View>(_ content: Content, tab: RootTab) -> some View {
        pageWithTray(content)
            .tabItem { Label(tab.title, systemImage: tab.systemImage) }
            .tag(tab)
    }

    @ViewBuilder
    private func pageWithTray<Content: View>(_ content: Content) -> some View {
        if chrome.interrupts.isEmpty {
            content
        } else {
            content.safeAreaInset(edge: .bottom, spacing: 0) {
                InterruptTray(items: chrome.interrupts)
            }
        }
    }
}
