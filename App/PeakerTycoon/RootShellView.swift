import SwiftUI
import PeakerKernel

/// iPhone shell. Navigation is frozen at Desk, Fuel, Plant, and Settle.
/// Visual tokens are not applied here; the graphics designer owns look and feel.
struct RootShellView: View {
    @State private var tab: RootTab = .desk
    @State private var chrome = PlaceholderChrome()
    @State private var showSettings = false

    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                GameClockBar(
                    clock: chrome.clock,
                    localCaption: nil,
                    speed: $chrome.speed
                )
                TabView(selection: $tab) {
                    tabPage(DeskPlaceholderView(), tab: .desk)
                    tabPage(FuelPlaceholderView(), tab: .fuel)
                    tabPage(PlantPlaceholderView(), tab: .plant)
                    tabPage(SettlePlaceholderView(), tab: .settle)
                }
            }
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
                    SettingsPlaceholderView()
                        .toolbar {
                            ToolbarItem(placement: .confirmationAction) {
                                Button("Done") { showSettings = false }
                            }
                        }
                }
            }
        }
    }

    private func tabPage<Content: View>(_ content: Content, tab: RootTab) -> some View {
        content
            .safeAreaInset(edge: .bottom, spacing: 0) {
                InterruptTray(items: chrome.interrupts)
            }
            .tabItem { Label(tab.title, systemImage: tab.systemImage) }
            .tag(tab)
    }
}
