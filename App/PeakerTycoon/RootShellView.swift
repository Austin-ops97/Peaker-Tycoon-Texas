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
    @AppStorage("coachBeat1Dismissed") private var coachBeat1Dismissed = false
    @AppStorage("coachBeat2Dismissed") private var coachBeat2Dismissed = false
    @AppStorage("coachBeat3Dismissed") private var coachBeat3Dismissed = false
    @State private var coachHeld = false
    @Environment(\.colorScheme) private var scheme
    @Environment(\.dynamicTypeSize) private var dynamicTypeSize
    @Environment(\.accessibilityReduceMotion) private var reduceMotion

    var body: some View {
        NavigationStack {
            Group {
                if dynamicTypeSize.isAccessibilitySize {
                    GeometryReader { proxy in
                        VStack(spacing: 0) {
                            ScrollView {
                                chromeStack
                            }
                            .frame(maxHeight: proxy.size.height * 0.45)
                            tabPages
                        }
                    }
                } else {
                    VStack(spacing: 0) {
                        chromeStack
                        tabPages
                    }
                }
            }
            .background(ControlGlass.surfaceBase(scheme).ignoresSafeArea())
            .instantWhenReduceMotion(reduceMotion)
            .background {
                PresentationClockDriver(clock: $chrome.clock, speed: $chrome.speed)
            }
            .tint(ControlGlass.accentTeal)
            .navigationTitle(tab.title)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        withoutMotionIfNeeded { showSettings = true }
                    } label: {
                        Label("Settings", systemImage: "gearshape")
                    }
                }
            }
            .sheet(isPresented: $showSettings) {
                NavigationStack {
                    SettingsPlaceholderView(
                        zoneIdentifier: $zoneIdentifier,
                        onShowTip: {
                            withoutMotionIfNeeded {
                                showSettings = false
                                showTip = true
                            }
                        },
                        onShowNavigationTips: replayCoach
                    )
                    .toolbar {
                        ToolbarItem(placement: .confirmationAction) {
                            Button("Done") { withoutMotionIfNeeded { showSettings = false } }
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
                    withoutMotionIfNeeded { showTip = true }
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

    private var nextCoachBeat: Int? {
        if !coachBeat1Dismissed { return 1 }
        if !coachBeat2Dismissed { return 2 }
        if !coachBeat3Dismissed { return 3 }
        return nil
    }

    /// Quiet Desk line after Got it finishes the tips, or after Not now. Hidden while a tip is on screen.
    private var showsDeskNextStep: Bool {
        coachHeld || nextCoachBeat == nil
    }

    /// Coach sits under the clock only after the local-time tip is out of the way.
    private var showCoach: Bool {
        let tipPending = showTip || (!tipDismissed && zoneIdentifier.isEmpty)
        return !tipPending && !showSettings && !coachHeld && nextCoachBeat != nil
    }

    private func dismissCoach(beat: Int, advance: Bool) {
        withoutMotionIfNeeded {
            switch beat {
            case 1: coachBeat1Dismissed = true
            case 2: coachBeat2Dismissed = true
            default: coachBeat3Dismissed = true
            }
            if !advance {
                coachHeld = true
            }
        }
    }

    private func replayCoach() {
        withoutMotionIfNeeded {
            coachBeat1Dismissed = false
            coachBeat2Dismissed = false
            coachBeat3Dismissed = false
            coachHeld = false
            showSettings = false
        }
    }

    /// Reduce Motion: coach, tips, and settings appear and leave with no slide.
    private func withoutMotionIfNeeded(_ update: () -> Void) {
        var transaction = Transaction()
        transaction.disablesAnimations = reduceMotion
        withTransaction(transaction) {
            update()
        }
    }

    private var chromeStack: some View {
        VStack(spacing: 0) {
            GameClockBar(
                clock: chrome.clock,
                zoneIdentifier: zoneIdentifier,
                speed: $chrome.speed
            )
            if showCoach, let beat = nextCoachBeat {
                NavigationCoachCard(
                    beat: beat,
                    onGotIt: { dismissCoach(beat: beat, advance: true) },
                    onNotNow: { dismissCoach(beat: beat, advance: false) }
                )
            }
        }
    }

    private var tabPages: some View {
        TabView(selection: $tab) {
            tabPage(DeskPlaceholderView(daLocalClock: daLocalClock, showsNextStep: showsDeskNextStep), tab: .desk)
            tabPage(FuelPlaceholderView(), tab: .fuel)
            tabPage(PlantPlaceholderView(reading: .gamePhysicsSample), tab: .plant)
            tabPage(SettlePlaceholderView(), tab: .settle)
        }
    }

    @ViewBuilder
    private func tabPage<Content: View>(_ content: Content, tab: RootTab) -> some View {
        if tab == .desk, !chrome.interrupts.isEmpty {
            pageWithTray(content)
                .badge(chrome.interrupts.count)
                .tabItem { tabLabel(tab) }
                .tag(tab)
        } else {
            pageWithTray(content)
                .tabItem { tabLabel(tab) }
                .tag(tab)
        }
    }

    private func tabLabel(_ tab: RootTab) -> some View {
        Label(tab.title, systemImage: tab.systemImage)
            .accessibilityLabel(tab.title)
            .accessibilityHint(tab.voiceOverHint)
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
