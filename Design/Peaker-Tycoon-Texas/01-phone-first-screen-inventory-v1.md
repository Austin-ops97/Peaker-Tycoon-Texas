# Peaker Tycoon Texas — Phone-first screen inventory v1

**Owner:** UI/UX Graphics Designer  
**Source of truth:** Build Spec v3 §15, §22 (functional hierarchy + info contracts; not a look)  
**Platform:** iPhone-first (Austin override of §1 desktop browser)  
**Date:** 2026-09-24  
**Partners:** iOS Development Engineer (systems), Supervisor iOS Game (gates)

**Binding rules carried from the sheet**
- §22 specifies hierarchy and information contracts — not visuals. Prior visual prototype is rejected; do not revive it.
- Every number carries an evidence label: `SOURCE` | `GAME` | `PROXY` | `GATE` (tap reveals provenance; never hover-only on phone).
- Color is never the sole carrier of meaning; alarms follow ISA-18.2 semantics with text + shape/pattern redundancy.
- Cross-role alerts = structured interrupts that do **not** pause game time (no blocking modals for interrupts).
- Phone questions every major screen must answer: What can I change? When does it bind? What cash/physical exposure? What evidence supports the estimate?

---

## 0. Phase map (do not invent systems ahead of Engineer)

| Phase | UI we design | UI we do **not** ship yet |
|-------|--------------|---------------------------|
| **0** | None (data/determinism only) | Any chrome |
| **1** | **Trader desk shell** — DA shaped ticket, fuel blind-nom panel, settlement/audit chain, plant telemetry *read* hooks | Role switcher with 7 live firewalls; Outcome Lens calib; Fund/Risk/Asset boards |
| **2** | Outcome Lens calibration (§22.3); regret/exposure depth | Full multi-role org |
| **3a** | Operator alarm board lite; maintenance surfaces | Full ISA-18.2 fatigue model chrome |
| **3b** | **Role switcher + 7 workspaces + firewalls + handoffs** | — |
| **3c+** | Fund / IR / endings | — |

**Engineer preferred first workspace:** Power Trader (matches Phase 1 day-trader core). Gas Scheduler panel can sit *inside* the Phase 1 shell as a second tab (fuel + blind-nom) without claiming full role firewalls yet. Operator read-only strip once physics telemetry is stable.

---

## 1. Full §22 inventory (target architecture — Phase 3b complete)

### 1.1 Global chrome (always available once roles exist)

| Screen / chrome | Spec | Phone notes |
|-----------------|------|-------------|
| **Role switcher** | §22.2 / §15 | Bottom sheet or radial picker: 7 roles. Instant switch. Shows unread interrupt count per role. Firewall badge when entering a restricted desk. |
| **Game clock + speed** | §22.6 | Top status: game time (CT) + local TZ twin; speed chip; auto-locks to 1× at binding gates. |
| **Interrupt tray** | §22.2 | Persistent non-modal strip / stacked cards. Origin role · decision · deadline · inaction consequence. Swipe to defer (logged). **Never** `alert()`-style pause. |
| **Evidence legend** | §22.2 / §2 | First-run coach mark + Settings → Evidence. Tap any tagged number → sheet with label + source string. |

### 1.2 Per-role workspace template (§22.2)

Every role workspace is the **same four-panel skeleton** (tabs or segmented control on phone):

1. **Now** — decisions due in next 60 min game time; countdown to each binding deadline  
2. **Today** — role daily cadence checklist (§15 rhythms) that fills as deadlines pass  
3. **Evidence** — numbers currently on-desk, each with provenance tag  
4. **Handoff** — chronological sent/received with timestamps + attributable failures  

### 1.3 Seven role workspaces (§15) — screen map

| # | Role | Primary screens (inside template) | Firewall (never shows) | Phase |
|---|------|-----------------------------------|------------------------|-------|
| 1 | **Power Trader** | Trading desk (shaped DA ticket ≤4 tranches/hour), morning brief, exposure/regret hooks, EOD attribution, Lens offer panel (P2+) | Future RT before publish; hidden faults; Lens random draws; LP side letters | **P1 shell** |
| 2 | **Gas Scheduler** | Gas desk (physical + cash balance), nomination ticket + receipt, **blind-nom explainer (§22.4)**, pipeline notice inbox, imbalance ledger | Trader private regret scenarios; power prices beyond public forecast | **P1 panel** (full firewall P3b) |
| 3 | **Control Room Operator** | Unit control (state machine, permissives), alarm queue (ISA-18.2), handover log, procedure cards | Live power prices; company cash; LP identities | P3a telemetry → P3b full |
| 4 | **Reliability Engineer** | Maintenance board, diagnostic workbench (D1–D14), deferral risk register, Lens maintenance-timing (P2+) | Live SCED prices (regime tag only); LP terms | P3a–3b |
| 5 | **Plant / Asset Manager** | Firm/site dashboard, risk posture, budget fight board, upgrade shop | Hidden faults before diagnosis; live SCED detail | P3b |
| 6 | **Fund Manager + IR** | Fund NAV/DPI/IRR, capital call, waterfall preview, LP report approver, Fund II table | Unit telemetry (KPIs only); intraday trader positions | P3c |
| 7 | **Risk & Compliance / QSE** | Collateral/exposure, settlement review + dispute, market-notice inbox, permit board | Trader strategy notes; LP side letters | P3b–3c |

### 1.4 Spec-mandated special screens

| Screen | Spec | Phase | Notes |
|--------|------|-------|-------|
| **Outcome Lens calibration** | §22.3 | **2** | Distributions + coverage stats only. Labels: CALIBRATED / WIDE / NARROW. Insufficient-n grayed. Regime marks (Uri, drought). **Never recommendations.** |
| **Gas-day blind-nomination panel** | §22.4 | **1** (inside Gas / Phase-1 shell) | Two-marker timeline: DAM publish vs 13:00 gas gate; overlap/gap shaded; plain-language blind YES/NO + why. Updates when DAM late. |
| **Settlement / audit causal chain** | §22.5 | **1** | Click any P&L line → walk back: revenue → settlement → award → offer ticket → (later) policy → Lens → calibration status. Data-model requirement. |
| **Cross-role interrupts** | §22.2 | Stub P1; full P3b | Structured; non-pausing. |

### 1.5 Preserved v2 inventory (still in scope eventually)

Market overview · DA ticket · fuel desk · plant detail · maintenance · portfolio · fund · scenarios · settings — absorbed into role workspaces rather than a single commander view.

---

## 2. Phase 1 phone shell (ship this week with Engineer)

**Goal:** Playable day-trader loop on iPhone. One site, one unit. No org / no fake role switcher that implies seven live desks.

### 2.1 Recommended root navigation (for Engineer scaffold)

```
TabView (4 tabs) — label + SF Symbol + text (color not sole meaning)
├── Desk        // Power Trader Now/Today composite
├── Fuel        // Gas nomination + blind-nom panel
├── Plant       // Read-only physics strip (MW, state, fuel flow) — no price chrome
└── Settle      // Statement + audit chain
Plus: top clock / speed; Settings (evidence legend, accessibility); Interrupt tray overlay (empty until systems emit)
```

**Do not** put a 7-role switcher in Phase 1. Optional: Settings → “Roles (coming Phase 3b)” disabled list so the IA is foreshadowed without lying.

### 2.2 Phase 1 screen inventory (concrete)

| ID | Screen | Tab | Binding UI | Evidence |
|----|--------|-----|------------|----------|
| P1-01 | **Desk · Now** | Desk | Countdown to 10:00 DA gate; “Submit offer” primary | Gate times SOURCE/GAME |
| P1-02 | **Shaped DA ticket** | Desk | Hour picker; ≤4 price–qty tranches; validate credit headroom; Submit → binding at gate | Prices PROXY/SOURCE; limits GATE |
| P1-03 | **Desk · Today** | Desk | Cadence checklist (brief → build → joint fuel check → gate → RT watch → EOD) | — |
| P1-04 | **Exposure strip** | Desk | Cash/physical exposure summary for current ticket (hooks only; depth in P2) | GAME tags |
| P1-05 | **Fuel · Nomination** | Fuel | Volume/timing; receipt after lock | Contract quotes SOURCE/GAME |
| P1-06 | **Fuel · Blind explainer** | Fuel | Timeline DAM vs 13:00; blind state sentence; updates live | Publish times SOURCE |
| P1-07 | **Plant · Telemetry** | Plant | Unit state, MW, fuel flow (minute physics). **No RT price.** | Telemetry GAME/PROXY |
| P1-08 | **Settle · Statement** | Settle | Hourly lines expandable | Settlement SOURCE/GAME |
| P1-09 | **Settle · Audit chain** | Settle | Causal walk-back from any line | Full provenance |
| P1-10 | **Interrupt tray** | Global | Non-modal cards (may be empty in P1) | — |
| P1-11 | **Settings** | Global | Evidence legend, Dynamic Type, Reduce Motion, alarm pattern preview | — |

### 2.3 Wireframe-level flows (Phase 1)

**Flow A — Morning DA (Trader)**  
Desk/Now → open ticket → edit tranches per hour → exposure strip updates → (optional) jump Fuel to confirm coverage → return → Submit → gate lock at 10:00 CT → Desk/Today checks off “DA gate”.

**Flow B — Blind gas day (Scheduler panel)**  
Fuel tab → Blind explainer shows DAM-after-13:00 → nomination marked BLIND + reason → nominate anyway or wait if publish early → receipt → Handoff stub logs “coverage confirmed/declined” (even pre-firewall, log the event for future attribution).

**Flow C — Why did we lose money?**  
Settle → tap P&L line → chain: statement line → award → tranche on ticket → (stub) forecast family → “calibration N/A until Phase 2”.

**Flow D — Interrupt (non-blocking)**  
Background card: “Fuel coverage short hour 17 — confirm or accept naked” → player can keep editing DA → ignore is logged.

### 2.4 What Engineer needs this week (navigation shell handoff)

1. Tab root as above (Desk / Fuel / Plant / Settle).  
2. Shared `EvidenceTag` view + tap sheet API.  
3. Shared `DeadlineChip` (game CT + local).  
4. Shared `InterruptTray` container (empty data OK).  
5. Placeholder `AuditChainView` driven by settlement models when golden tests land.  
6. **No** role enum UI until Phase 3b — keep `Role` in domain package only.

---

## 3. iPhone layout rules

- **Thumb zone:** Primary actions (Submit, Nominate, Acknowledge) in bottom 25–30%. Destructive / binding confirms use explicit hold or two-step, not accidental tap.
- **Density:** Trading desks are dense but scroll in **one column**; no multi-pane. Use collapsible hour rows on the DA ticket.
- **Safe areas:** Clock/status under Dynamic Island / notch; tab bar clears Home Indicator.
- **Type:** Dynamic Type from the start; tabular figures for MW, $, prices.
- **Evidence:** Badge chips `SRC` `GAME` `PROXY` `GATE` beside values; tap → provenance sheet (not hover).
- **Deadlines:** Always dual-label: `10:00 CT · 10:00 your local` (or converted).
- **Alarms (when present):** ISA-18.2 color **plus** icon shape **plus** text priority (e.g. CRITICAL / HIGH / MEDIUM / LOW / INFO). Patterns for color-blind / grayscale.
- **Interrupts:** Bottom or top card stack; max 3 visible; overflow to tray list; never full-screen modal that stops the clock.
- **Motion:** Prefer cross-dissolve; respect Reduce Motion.

---

## 4. Visual direction (functional first — cohesive, not decorative)

**Name working title:** **“Control Glass”** — industrial SCADA honesty meets iOS clarity.

| Token | Choice | Why |
|-------|--------|-----|
| Base | Deep neutral graphite / off-black surfaces, not neon cyberpunk | Reject flashy prior prototype; desks must feel operable for hours |
| Structure | Hairline dividers, strict grid, 8-pt spacing | Legibility under density |
| Accent | Single electric teal for interactive / focus | One accent = hierarchy without carnival |
| Money | Green/red **with** +/- text and triangles | Color never alone |
| Alarms | ISA-18.2 palette locked + redundant glyphs | Spec-binding |
| Evidence chips | Muted capsules; GATE uses warning amber + “GATE” text | Provenance is sacred |
| Typography | SF Pro / SF Mono for figures | Native, readable |
| Icons | SF Symbols first; custom only for plant/state machine glyphs | Keep HUD language coherent |
| Charts | Flat bands, labeled axes, provenance footer on every plot | No ornamentation pretending to be data |
| Motion | Subtle; binding actions get a firm haptic, not celebration confetti | Tone = operations, not casino |

**Explicit anti-goals:** skeuomorphic metal panels, random gauge clutter, fake 3D plants, untagged sparkline walls, purple/cyan “AI dashboard” look from the disliked prototype.

**HUD language:** Status pills (unit state, blind YES/NO, gate OPEN/LOCKED), countdown rings only for ≤60 min Now items, interrupt cards with role color-stripe **plus** role initials.

Art direction can deepen later; Phase 1 ships **Control Glass tokens + components**, not full illustration packs.

---

## 5. Open questions for Engineer

1. **Settlement model shape for AuditChain:** Will Phase 1 expose a stable `StatementLine → Award → OfferTranche` ID graph we can bind in SwiftUI, or should Design mock with fixtures until golden tests land?  
2. **Blind-nom inputs:** Confirm fields for DAM publish timestamp vs gas gate (always 13:00 CT?) and the canonical reason strings for the explainer.  
3. **Plant tab:** Exact telemetry fields available in Phase 1 minute physics (state enum, MW, fuel flow, temps?) so we don’t draw empty gauges.  
4. **Interrupt bus:** Even a no-op publisher in the scaffold? Prefer empty tray over omitting the chrome.  
5. **Repo path:** Confirm when `Design/` lands on `https://github.com/Austin-ops97/Peaker-Tycoon-Texas` (or current remote) so this file can move in-repo.  
6. **Nav freeze:** Please lock TabView IA above before adding more tabs — I’ll revise if domain needs a fifth root.

---

## 6. Deferred chrome (listed so we don’t “accidentally” design it into P1)

- Role switcher with live firewalls / seven Now boards  
- Outcome Lens calibration UI  
- Full ISA-18.2 fatigue / multi-priority Operator board  
- Fund II, debt, permits, NPRR inbox as primary nav  
- Any revival of the prior visual prototype  

---

## 7. Acceptance for this deliverable

- [x] Full §22 + §15 screen inventory  
- [x] Phase 1 shell + wireflows  
- [x] Role switcher specified but phase-gated  
- [x] iPhone layout + a11y rules  
- [x] One cohesive art direction  
- [x] Open questions for Engineer  
- [ ] In-repo under `Design/` when Engineer opens path (local copy: `/workspace/Design/Peaker-Tycoon-Texas/`)
