# Peaker Tycoon Texas — Phase 1 shell polish: Control Glass v1

**Owner:** UI/UX Graphics Designer  
**Date:** 2026-09-24  
**Partners:** iOS Development Engineer (implement), Supervisor iOS Game (gate)  
**IA contract:** [`01-phone-first-screen-inventory-v1.md`](./01-phone-first-screen-inventory-v1.md) (inventory v1.1)  
**Source of truth:** Build Spec v3 §8, §22 functional hierarchy — **not** a look. Prior visual prototype is **rejected**; do not revive neon / cyber dashboard chrome.

**Changelog v1:** Initial Control Glass token + shared-component + empty/stub polish pack for Phase 1 tabs (Desk | Fuel | Plant | Settle). Parallel to Engineer; no desk trading logic inventing.

---

## 1. Purpose / out of scope

### Purpose
Ship **shell polish only** behind the existing four-tab TabView so Engineer can apply chrome without guessing tokens or empty-state copy. Phase 0 empty TabView shell is already OK; this pack covers:

- Control Glass design tokens (SwiftUI-friendly semantic assets)
- Shared chrome components (EvidenceTag, DeadlineChip, InterruptTray empty, top clock/speed, AuditChainView skeleton)
- Per-tab empty/stub polish when domain fixtures are absent vs present
- Engineer handoff + Supervisor gate checklists

### Explicitly out of scope (do not invent)
- **Outcome Lens** calibration UI (Phase 2)
- **7-role switcher** / live firewalls / role workspaces (Phase 3b)
- Live trading ticket logic beyond empty/stub chrome (no inventing DA tranche editors, credit validators, or submit binding flows here — those follow domain + inventory P1-02 when ready)
- Neon cyber dashboard revival, skeuomorphic metal, fake 3D plants, untagged sparklines
- Prices on Plant tab; gauges for unpublished physics fields
- Full ISA-18.2 operator fatigue board (P3a+)

Gas-day panel (§8 four-marker + verdict) is **already binding** in inventory v1.1 §1.4.1 — this doc **references** it and only adds empty/stub visual when nomination is not open. Do not re-litigate markers or verdict copy.

---

## 2. Control Glass design tokens

**Art direction name:** **Control Glass** — graphite industrial SCADA honesty + iOS clarity. One teal accent. SF Symbols. ISA-18.2 alarms with redundant encoding (color **never** sole meaning).

Prefer semantic Color / Font / CGFloat assets in an Asset Catalog or `ControlGlass` Swift package. Suggested hex are **seed values** for light/dark; Engineer may adjust for OLED/Dynamic Island contrast but must keep role semantics.

### 2.1 Color roles

| Semantic asset | Role | Suggested hex (dark-first) | Notes |
|----------------|------|----------------------------|-------|
| `cg.surface.base` | App / tab root background | `#0E1114` | Deep graphite, not pure black |
| `cg.surface.elevated` | Cards / glass panels | `#171B20` @ ~92% opacity over base | Elevated glass fill |
| `cg.surface.recessed` | Inset wells (ticket rows, ledger) | `#0A0C0E` | Slightly deeper than base |
| `cg.hairline` | Dividers, panel edges | `#2A3138` | 1 pt hairline |
| `cg.glass.fill` | Ultra-thin material stand-in | `#1C2228` @ 0.72 + blur | Pair with `cg.blur.panel` |
| `cg.text.primary` | Titles, primary values | `#E8ECF0` | |
| `cg.text.secondary` | Captions, provenance footnotes | `#9AA3AD` | |
| `cg.text.tertiary` | Disabled / stub hints | `#6B737C` | |
| `cg.accent.teal` | Interactive focus, selected tab tint, primary CTA fill | `#2EC4B6` | **Only** chrome accent |
| `cg.accent.teal.muted` | Selected row wash | `#2EC4B6` @ 0.14 | |
| `cg.money.pos` | Gain | `#3DDC97` | Always pair with `+` text + ▲ glyph |
| `cg.money.neg` | Loss | `#F07178` | Always pair with `−` text + ▼ glyph |
| `cg.warn.amber` | GATE chip, soft warnings | `#E6A23C` | Text label required |
| `cg.alarm.critical` | ISA-18.2 CRITICAL | `#E53935` | + diamond glyph + “CRITICAL” |
| `cg.alarm.high` | HIGH | `#FB8C00` | + triangle + “HIGH” |
| `cg.alarm.medium` | MEDIUM | `#FDD835` | + square + “MEDIUM” |
| `cg.alarm.low` | LOW | `#42A5F5` | + circle + “LOW” |
| `cg.alarm.info` | INFO | `#90A4AE` | + dash + “INFO” |
| `cg.evidence.source` | SOURCE chip fill | `#3A4550` | Dense abbrev `SRC` |
| `cg.evidence.game` | GAME | `#2F3D48` | |
| `cg.evidence.proxy` | PROXY | `#3D3548` | Slightly cooler |
| `cg.evidence.gate` | GATE | `#4A3A28` + amber hairline | Always show “GATE” text |

**Non-color redundancy (mandatory):** money → sign + triangle; alarms → ISA priority text + distinct SF Symbol shape; evidence → full word on tap sheet; blind YES/NO → pill text + lock/open symbol; gate OPEN/LOCKED → pill text + SF Symbol.

**Reduce Transparency fallback:** replace `cg.glass.fill` + blur with opaque `cg.surface.elevated`; keep hairlines.

### 2.2 Typography

Prefer **system SF** (SF Pro Text / Display as resolved by SwiftUI). Use **SF Rounded** only for large empty-state headlines if desired — default body/HUD stay standard SF for industrial tone. **SF Mono** (or `.monospacedDigit()`) for MW, $, prices, clock, audit IDs.

| Token | Style | Size (default Dynamic Type) | Use |
|-------|-------|-----------------------------|-----|
| `cg.type.hud.clock` | SF Mono, semibold | 15 pt | Top game clock |
| `cg.type.hud.chip` | SF Text, medium | 12 pt | Evidence / speed / deadline chips |
| `cg.type.title` | SF Text, semibold | 17 pt | Section headers |
| `cg.type.body` | SF Text, regular | 15 pt | Body / empty copy |
| `cg.type.caption` | SF Text, regular | 13 pt | Secondary / dual TZ |
| `cg.type.value.lg` | SF Mono, semibold | 22 pt | Net MW, P&L headline |
| `cg.type.value.sm` | SF Mono, regular | 14 pt | Row figures |
| `cg.type.empty.headline` | SF Text (or Rounded), semibold | 20 pt | Empty-state title |

Support Dynamic Type from the start; clip chips with truncation + accessibility hint rather than shrinking below readable.

### 2.3 Spacing / radii / blur

| Token | Value | Use |
|-------|-------|-----|
| `cg.space.xs` | 4 | Chip padding inner |
| `cg.space.sm` | 8 | Strict 8-pt grid base |
| `cg.space.md` | 16 | Section padding |
| `cg.space.lg` | 24 | Empty-state vertical rhythm |
| `cg.space.thumb` | 12–16 above Home Indicator + tab bar clearance | Primary CTA lift |
| `cg.radius.chip` | 6 | Evidence / speed / deadline capsules |
| `cg.radius.panel` | 12 | Glass cards |
| `cg.radius.tray` | 16 | Interrupt tray card top |
| `cg.blur.panel` | systemMaterial / ultraThinMaterial equivalent ~20 | Glass panels; disable under Reduce Transparency |
| `cg.hairline.width` | 1 / `1 / displayScale` | Dividers |

Safe area: clock/status under Dynamic Island / notch; content insets clear tab bar + Home Indicator. One-column scroll; no multi-pane.

### 2.4 Motion

| Event | Motion | Notes |
|-------|--------|-------|
| Tab switch | Cross-dissolve ~180 ms | Respect Reduce Motion → instant swap |
| InterruptTray entrance | Slide up from bottom safe area + fade, 220 ms | Non-modal; does **not** dim desk; never pauses clock |
| Interrupt dismiss / defer | Slide out + fade | Log defer in domain when wired |
| Binding confirm (future) | Firm haptic only | No confetti / celebration |
| Empty → data appear | Fade in values | No spring bounce carnival |

### 2.5 Accessibility

- **Dynamic Type:** all tokens scale; tabular figures stay monospaced where possible.
- **Reduce Transparency:** opaque elevated surfaces; no blur dependency for hierarchy.
- **Reduce Motion:** disable slide/dissolve; hard cut.
- **VoiceOver stubs:** every empty state exposes a label like “Desk empty — no offer ticket yet”, traits `.staticText`, and hints pointing to what will appear when fixtures load.
- **Color blind / grayscale:** alarm patterns + text priority; money sign glyphs; evidence full words on sheet.
- **Contrast:** primary text on base ≥ WCAG AA; teal CTAs use dark label (`cg.surface.base`) on `cg.accent.teal` fill when filled button.

---

## 3. Shared components

Each component: anatomy · states · SF Symbol · a11y · empty behavior.

### 3.1 EvidenceTag

**Purpose:** Every number carries provenance. Dense chips may abbreviate; tap sheet spells full labels.

**Anatomy**
- Capsule: fill per evidence role + optional 1 pt hairline (GATE uses amber hairline)
- Label dense: `SRC` | `GAME` | `PROXY` | `GATE`
- Optional trailing SF Symbol `info.circle` at 10–11 pt (decorative; whole chip is the hit target)

**States**
| State | Appearance |
|-------|------------|
| Default | Muted capsule per `cg.evidence.*` |
| Pressed | Teal wash `cg.accent.teal.muted` |
| Disabled / stub | Tertiary text, no tap sheet |

**Tap sheet (required)**
- Title: full word — **`SOURCE`** (never “SRC” in sheet), `GAME`, `PROXY`, `GATE`
- Body: provenance string from domain (or stub: “Provenance unavailable”)
- Detents: `.medium` preferred; dismissible

**SF Symbol:** `tag` or role-neutral `info.circle` (not color-only meaning).

**A11y:** Label “Evidence SOURCE” (full word even if chip shows SRC). Hint: “Shows provenance.”

**Empty:** If number has no provenance yet, show `PROXY` stub chip + sheet “Not yet bound to a source.”

### 3.2 DeadlineChip

**Purpose:** Dual-label deadlines — game CT + player local.

**Anatomy**
- Capsule with clock glyph + time pair: `10:00 CT · 10:00 your local` (convert local)
- Optional countdown when ≤60 min to Now item: compact `mm:ss` in SF Mono

**States**
| State | Appearance |
|-------|------------|
| Open | Secondary text, `clock` |
| Urgent (≤60 min) | Amber hairline + `clock.badge.exclamationmark` |
| Locked / passed | Tertiary + `lock.fill`; strike or “LOCKED” caption |

**SF Symbol:** `clock` / `clock.badge.exclamationmark` / `lock.fill`.

**A11y:** “Deadline 10:00 Central, 10:00 your local, open.”

**Empty:** Hide chip or show placeholder “No gate scheduled” caption — do not invent fake times.

### 3.3 InterruptTray (empty)

**Purpose:** Persistent non-modal strip for structured interrupts. P1 ships **empty publisher/chrome**.

**Anatomy**
- Bottom-anchored stack above tab bar (or top under clock — prefer **bottom** for thumb reach)
- Max 3 cards visible; overflow “+N” opens list sheet
- Card: origin initials stripe (color **plus** initials) · decision title · deadline · inaction consequence line
- Swipe trailing to defer (logged when domain wires)

**States**
| State | Appearance |
|-------|------------|
| Empty | Zero height / hidden — **or** 0-pt chrome reserved; no ghost card saying “No interrupts” in the live tray (keep Settings coach for legend). Optional debug: Settings → “Show empty tray outline” for Engineer only |
| Populated | Cards slide in; desk remains interactive |
| Overflow | `+N` chip → list |

**Hard rules:** Non-modal. **Never** pauses game time. Never `alert()`-style blocking.

**SF Symbol:** `bell` on overflow; per-card none required beyond role stripe + initials.

**A11y:** Tray container “Interrupt tray, empty” when empty; cards as buttons with full decision + deadline + consequence.

### 3.4 Top clock / speed chrome (§8 discrete set)

**Purpose:** Game time (CT) + local twin + speed control. Spec §8 discrete set only.

**Anatomy**
- Leading: SF Mono clock `HH:MM:SS CT` + caption local twin
- Trailing: segmented or menu chip — **exactly:** `pause` · `1×` · `8×` · `32×` · `Until next decision`
- Hairline bar under Dynamic Island / notch; height ~44 pt content + safe area

**States**
| State | Appearance |
|-------|------------|
| Running | Teal underline on selected speed |
| Paused | Pause glyph filled; clock secondary |
| Forced pause/1× at binding gate | Chip locked + `lock.fill`; VoiceOver explains gate |

**SF Symbols:** `pause.fill`, `play.fill` (for 1× affordance if needed), `forward.fill` variants optional — prefer text multipliers for clarity; `until.next` use `arrow.right.to.line.compact` + label “Until next decision”.

**A11y:** “Game speed 8×” / “Paused” / “Until next decision.”

**Empty / stub:** Clock can show fixture CT or frozen stub time; still render full speed set UI (disabled until sim clock exists is OK — show set, dim non-available).

**Do not** invent continuous scrubber or arbitrary × values outside §8 set.

### 3.5 AuditChainView (empty / skeleton)

**Purpose:** Causal walk-back bound to stable IDs: `StatementLine → Award → OfferTranche` (on `OfferTicket`) per inventory §5 / §22.5 / §25.3. Fixtures must use the **same** IDs — no parallel mock graph.

**Anatomy**
- Vertical stepper / linked rows: node title · ID (SF Mono, truncatable) · evidence tag · chevron to expand
- Order: StatementLine → Award → OfferTranche → (stub footnote) “Forecast family / calibration N/A until Phase 2”

**States**
| State | Appearance |
|-------|------------|
| Empty | Skeleton 3 pulse rows **or** industrial empty copy (see Settle) |
| Partial | Known nodes solid; unknown nodes dashed hairline + “ID pending” |
| Loaded | Full chain; tap node copies ID (optional) + shows evidence sheet |

**SF Symbol:** `arrow.triangle.branch` or `list.bullet.rectangle` header; nodes `doc.text`, `rosette`/`seal`, `ticket`.

**A11y:** “Audit chain empty — no statements.” / “Statement line {id}, links to award {id}…”

**Empty:** Do not fabricate demo IDs. Skeleton shimmer uses `cg.surface.elevated` bars only.

---

## 4. Per-tab empty / stub polish

Layout wire notes (all tabs): content in safe area; top clock chrome persistent; bottom tab bar clearance + Home Indicator; primary actions in thumb zone (bottom 25–30%) when present; one-column scroll.

### 4.1 Desk (Power Trader Now / Today composite)

| Condition | Player sees |
|-----------|-------------|
| **Empty stubs** | Section headers Now / Today / Exposure as glass panels with empty copy; no fake tranche rows; “Submit offer” CTA **disabled** (tertiary) or hidden until ticket model exists |
| **Fixtures exist** | Now countdown + DeadlineChip to 10:00 DA; Today checklist rows; Exposure strip hooks with GAME tags; ticket entry point enabled |

**Primary empty copy (industrial, not cute)**
- Headline: `No offer on desk`
- Body: `DA ticket and gate countdown appear when market stubs load.`
- Secondary: `Today cadence stays idle until the gas day opens.`

**Wire:** Segmented or sticky sub-headers Now | Today inside Desk scroll. Exposure strip collapses to 0 height when empty. SF Symbol tab: `chart.line.uptrend.xyaxis` or `briefcase`.

**VoiceOver:** “Desk empty — no offer ticket yet.”

### 4.2 Fuel (nomination + §8 blind-nom panel)

| Condition | Player sees |
|-----------|-------------|
| **Nomination not open** | Stub panel: title `Gas day closed`; four-marker **silhouette** timeline in recessed well (markers labeled but muted/tertiary — times not inventable); verdict slot shows `Verdict unavailable — nomination not open`; Confirm hidden/disabled |
| **Nomination open + fixtures** | Full §8 panel per inventory §1.4.1 — four markers (10:00 DA · 13:00 gas · 13:30 DAM target · archive actual); dual CT + local; overlap/gap shading; **verdict line visible before Confirm**; Confirm in thumb zone |

**Do not re-litigate** marker times or verdict strings — bind to inventory v1.1 §1.4.1 canonical copy.

**Primary empty copy**
- Headline: `Nomination window closed`
- Body: `Blind-legibility markers and verdict show when the gas day is open.`
- Footnote: `Panel follows §8 four-marker contract.`

**Wire:** Timeline as horizontal glass track; markers as ticks + captions; verdict as elevated glass banner above Confirm. SF Symbol tab: `flame` or `cylinder.split.1x2`.

**VoiceOver:** “Fuel tab — nomination not open. Blind panel stub.”

### 4.3 Plant (read-only telemetry)

| Condition | Player sees |
|-----------|-------------|
| **Empty / no physics emit** | State pill `—`; MW and fuel_flow as `—` with tertiary captions; no gauge chrome; no price row |

**Allowed fields only (P1):** `state` enum (§12.1) · net `MW` · `fuel_flow` (MMBtu/h). Evidence GAME/PROXY on values when present.

**Primary empty copy**
- Headline: `Telemetry offline`
- Body: `State, net MW, and fuel flow publish when the unit stub is live.`
- Footnote: `No prices. No gauges for unpublished fields.`

**Wire:** Three glass metric tiles in a vertical stack (or 1×3 on large phones with Dynamic Type still stacking). State as status pill (text + optional SF Symbol map — e.g. ONLINE `bolt.fill`, TRIPPED `exclamationmark.triangle`, OFFLINE `powerplug`). **Never** draw gauges for exhaust / vibration / lube until published.

**VoiceOver:** “Plant telemetry offline.”

### 4.4 Settle (statement + audit chain)

| Condition | Player sees |
|-----------|-------------|
| **No statements** | Empty statement list + AuditChainView empty/skeleton; no fabricated P&L |
| **Fixtures exist** | Hourly StatementLine rows expandable; tap → AuditChainView walk-back StatementLine → Award → OfferTranche |

**Primary empty copy**
- Headline: `No statements`
- Body: `Settlement lines and audit chain bind when statement fixtures load.`
- Footnote: `IDs: StatementLine → Award → OfferTranche.`

**Wire:** List + detail; audit chain in sheet or lower panel. SF Symbol tab: `doc.text.magnifyingglass` or `list.clipboard`.

**VoiceOver:** “Settle empty — no statements.”

---

## 5. Engineer handoff checklist

### Implement in SwiftUI **now** (chrome / tokens — no domain invention)
- [ ] Asset / token map: `cg.*` colors, type styles, spacing, radii; dark-first Control Glass
- [ ] Reduce Transparency + Reduce Motion branches
- [ ] `EvidenceTag` + tap sheet spelling **SOURCE** / GAME / PROXY / GATE
- [ ] `DeadlineChip` dual CT + local; empty = hide or “No gate scheduled”
- [ ] Top clock + **§8 speed set only**: pause · 1× · 8× · 32× · Until next decision
- [ ] `InterruptTray` container empty (non-modal, never pauses time)
- [ ] `AuditChainView` empty/skeleton API accepting optional StatementLine → Award → OfferTranche IDs
- [ ] Per-tab empty states with copy above; disabled CTAs when stubs empty
- [ ] Fuel closed-window stub silhouette that **does not** invent publish times
- [ ] Plant tiles: state · MW · fuel_flow only; refuse price / extra gauge views
- [ ] Tab SF Symbols + text labels (color not sole meaning)
- [ ] VoiceOver labels on all stubs

### Wait for domain / later phase
- [ ] Live DA ticket editing, credit headroom, binding submit (inventory P1-02 + domain)
- [ ] Live gas nomination confirm + decision-record write (panel chrome ready; logic waits)
- [ ] Interrupt publisher payloads / defer logging
- [ ] Outcome Lens (Phase 2)
- [ ] 7-role switcher / firewalls (Phase 3b)
- [ ] Optional physics gauges beyond state / MW / fuel_flow
- [ ] Role enum in UI (keep `Role` domain-only)

**Nav freeze:** Desk | Fuel | Plant | Settle only — no fifth tab without Design revise.

---

## 6. Supervisor gate checklist (this deliverable)

- [ ] File at `Design/Peaker-Tycoon-Texas/02-phase1-shell-polish-control-glass-v1.md`
- [ ] Aligns to inventory v1.1 IA; no contradiction on tabs, evidence, §8 speed, §8 gas-day, plant fields, audit IDs
- [ ] Art direction named **Control Glass**; prior neon prototype explicitly rejected
- [ ] Tokens semantic + suggested hex; SwiftUI-friendly
- [ ] Shared components specified with empty behavior
- [ ] No Outcome Lens (P2) invention
- [ ] No 7-role live switcher (P3b) invention
- [ ] No live trading ticket logic beyond empty/stub chrome
- [ ] Evidence: dense `SRC` OK; tap sheet spells **SOURCE**
- [ ] InterruptTray: empty OK; non-modal; never pauses time
- [ ] Gas-day: reference inventory §1.4.1; stub when nomination not open only
- [ ] Plant P1: read-only state + MW + fuel_flow; no prices; no unpublished gauges
- [ ] Audit chain: StatementLine → Award → OfferTranche; empty Settle when no statements
- [ ] Engineer can implement chrome without inventing tokens
- [ ] Concise, industrial empty copy (not cute)

---

## 7. Design defaults (were open questions — locked for v1 unless Supervisor overrides)

| # | Topic | Design default |
|---|--------|----------------|
| 1 | **InterruptTray empty** | **Fully collapsed** (zero height). No outline chrome in player build. Optional `#if DEBUG` outline toggle for Engineer layout debug only — never Settings-facing. |
| 2 | **Speed control UI** | **Menu `Picker`** showing current speed label (e.g. `1×`). Options: pause · 1× · 8× · 32× · Until next decision. Avoids SE truncation of a five-segment control. |
| 3 | **AuditChainView empty** | **Static industrial empty copy** as the always-on empty state. Optional shimmer skeleton **only** when fixtures are loading AND Reduce Motion is off; if Reduce Motion on → static copy only. |

---

*End of Phase 1 shell polish — Control Glass v1. Parallel to Engineer; domain packages stay UI-separated.*
