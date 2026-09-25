# Peaker Tycoon Texas — Local twin + Control Glass light vibe pass v1

**Owner:** UI/UX Graphics Designer  
**Date:** 2026-09-24  
**Partners:** iOS Development Engineer (implement on `cursor/phase-0-ios-foundation-5a50`), Supervisor iOS Game (gate)  
**IA contract:** [`01-phone-first-screen-inventory-v1.md`](./01-phone-first-screen-inventory-v1.md) (inventory v1.1) §2 shell, §8 gas panel refs, Control Glass  
**Shell polish base:** [`02-phase1-shell-polish-control-glass-v1.md`](./02-phase1-shell-polish-control-glass-v1.md) — **extend, do not contradict**  
**Token companion:** [`tokens/control-glass-light-v1.json`](./tokens/control-glass-light-v1.json)

**Supervisor verify:** PASS 2026-09-24 CT (Austin smoke notes + Build Spec v3 §8 twin/speed). Soft-edit: Fuel/Settle player footnotes de-jargonized.

**Changelog v1:** Mac smoke fixes from Austin — (1) local-twin banner never permanently occludes Desk; Settings-first + one-time tip; (2) Control Glass **light** vibe pass (readable color, calm energy-trading feel, still operable). Scope remains Desk | Fuel | Plant | Settle stubs only.

---

## 1. Purpose / out of scope

### Purpose
Fix two binding UX problems from Austin Mac smoke without inventing Phase 2/3b chrome:

1. **Local twin (timezone)** — discoverable, dismissible, never sticky over Desk scroll content  
2. **Light vibe pass** — Phase-1-shell-compatible brighter Control Glass so the shell feels colorful enough to have vibe, calm enough for hours of play, and still VERY easy to navigate

Engineer owns layout/layout bugs in parallel; this doc owns **interaction, copy, tokens, and empty-state rewrite**.

### Explicitly out of scope (do not invent)
- Outcome Lens (Phase 2)
- 7-role switcher / live firewalls (Phase 3b)
- Live trading ticket logic beyond stub chrome
- Neon cyber / rejected prior prototype revival
- Continuous speed scrubber or × values outside §8 set
- Re-litigating §8 gas four-marker times or verdict strings (inventory §1.4.1)
- Sticky top banners that cover List / ScrollView body

---

## 2. Local twin (timezone) — interaction & copy

### 2.1 Problem statement
Mac smoke showed a persistent banner with copy like **“Local twin unset…”** sitting over Desk, clipping/hiding content, and refusing to go away. That fails the phone-first rule: primary content must stay operable. Timezone twin must stay **discoverable** without **blocking** the game.

### 2.2 Recommended pattern (ONE primary + fallback)

**Primary (ship this):** Settings is the only durable home for timezone.

| Surface | Behavior |
|---------|----------|
| **Settings → “Your local time zone”** | Clear set / change / clear. Picker uses system `TimeZone` identifiers; show friendly label (e.g. `America/Chicago — Central Time`). |
| **Clock chrome (always)** | Leading SF Mono clock always shows **game time CT**: `HH:MM:SS CT`. |
| **Local twin line** | Render **only when set**. Caption under CT: `HH:MM your local` (converted). When unset: **omit** the twin line — do not show “unset” in the HUD. |
| **First-run tip (optional, once)** | Gentle sheet or tip card on first launch of Desk **or** first open of Settings. Buttons: **Not now** · **Open Settings**. Dismissing writes `localTwinTipDismissed = true`. Tip **never** returns as a sticky banner; user can reopen via Settings → “Show local time tip”. |
| **Residual chip (fallback only)** | If Engineer needs a residual reminder after tip dismiss **and** twin still unset: compact chip in the **status row / below clock** (same chrome band as speed), **not** overlaid on List/ScrollView. Chip: dismissible ×. Once dismissed → only Settings reminder forever. |

**Hard rule:** Never permanently occlude primary Desk / Fuel / Plant / Settle scroll content. No full-width sticky banner over the body.

### 2.3 Exact copy strings

| ID | Surface | Copy |
|----|---------|------|
| `lt.tip.title` | First-run tip | `Show your local time?` |
| `lt.tip.body` | First-run tip | `Game time stays Central (CT). Add your zone so deadlines also show your clock.` |
| `lt.tip.notNow` | Tip button | `Not now` |
| `lt.tip.openSettings` | Tip button (primary teal) | `Open Settings` |
| `lt.settings.row` | Settings row title | `Your local time zone` |
| `lt.settings.unset` | Settings value when unset | `Not set` |
| `lt.settings.hint` | Settings caption | `Deadlines always show CT. Local is optional and only appears when set.` |
| `lt.settings.change` | Settings action | `Set time zone…` / `Change…` |
| `lt.settings.clear` | Settings action | `Clear local time` |
| `lt.settings.retip` | Settings secondary | `Show local time tip` |
| `lt.chip.unset` | Residual chip (fallback) | `Add local time` |
| `lt.chip.a11y` | Chip VoiceOver | `Add your local time zone. Opens Settings.` |
| `lt.clock.a11y.set` | Clock when twin set | `Game time {HH:MM:SS} Central. Your local {HH:MM}.` |
| `lt.clock.a11y.unset` | Clock when twin unset | `Game time {HH:MM:SS} Central.` |
| `lt.error.title` | Error state | `Couldn’t save time zone` |
| `lt.error.body` | Error state | `Try again from Settings. Game time still runs on CT.` |

**Do not ship:** `Local twin unset…`, `Timezone missing`, or any permanent red/amber banner over Desk.

### 2.4 States

| State | Clock chrome | Tip / chip | Settings |
|-------|--------------|------------|----------|
| **Unset** (default) | CT only; no twin caption | First-run tip once if `!localTwinTipDismissed`; else nothing (or compact residual chip if Engineer enables fallback) | Value `Not set`; actions Set / Show tip |
| **Set** | CT + `HH:MM your local` | Tip suppressed; chip hidden | Friendly zone label; Change / Clear |
| **Dismissed** (tip/chip) | Same as Unset (CT only) | No tip, no chip | Reminder only via Settings |
| **Error** | CT unchanged; twin not applied | Inline Settings error caption; optional non-blocking toast **below** chrome, auto-dismiss ≤4 s — still never sticky over scroll body | Retry Set |

Persistence keys (suggested): `localTimeZoneIdentifier` (String?), `localTwinTipDismissed` (Bool), `localTwinChipDismissed` (Bool).

### 2.5 Accessibility
- Tip sheet: Focus title first; buttons labeled as above; Escape / swipe-down = Not now.  
- Settings row: value announces zone name or “Not set”.  
- Chip: button trait; × is “Dismiss reminder”.  
- Color never sole meaning — tip/chip use text + `globe` / `clock` SF Symbol.  
- Dynamic Type: tip body wraps; chip truncates with accessibility hint, never shrinks below readable.  
- Reduce Motion: tip appears as fade or instant; no bounce.

---

## 3. Control Glass light vibe pass

Art direction remains **Control Glass** (graphite industrial honesty + clarity). This is a **light mode / brighter shell**, not a new brand. Still: one teal accent, SF Symbols, evidence chips, ISA redundancy. **Not** neon cyber. **Not** the rejected prior prototype.

Companion JSON: [`tokens/control-glass-light-v1.json`](./tokens/control-glass-light-v1.json) — semantic roles Engineer maps to SwiftUI Color assets.

### 3.1 How light differs from dark seeds in 02 (without abandoning Control Glass)

| Aspect | Dark (02 seeds) | Light (this pass) |
|--------|-----------------|-------------------|
| Base | Deep graphite `#0E1114` | Soft paper-graphite `#F2F4F6` |
| Elevated glass | Near-black translucent panels | White / cool mist glass `#FFFFFF` @ ~88–94% over base + hairline |
| Hairlines | `#2A3138` | `#C5CCD4` |
| Text | Near-white primary | Near-ink `#1A1F24` primary; secondary `#5C6570` |
| Accent teal | `#2EC4B6` (keep) | Same `#2EC4B6` — interactive accent unchanged |
| Money +/- | Green/red + signs | Slightly deeper greens/reds for AA on light; still `+`/`−` + triangles |
| Evidence chips | Dark muted capsules | Light muted capsules; denser border; SRC still abbreviates; sheet still spells **SOURCE** |
| Feel | Night ops board | Day ops desk — calm energy-trading, readable outdoors / Mac window |

**Hierarchy still comes from hairlines + elevation + teal focus**, not rainbow chrome. Muted secondary neutrals (`cg.surface.recessed`, `cg.surface.tint.cool`) add depth so light mode is not “flat white app.”

### 3.2 Token updates (light surfaces)

| Semantic asset | Light hex / notes | Role |
|----------------|-------------------|------|
| `cg.surface.base` | `#F2F4F6` | App / tab root |
| `cg.surface.elevated` | `#FFFFFF` @ 0.92 | Cards / glass panels |
| `cg.surface.recessed` | `#E6EAEE` | Inset wells |
| `cg.surface.tint.cool` | `#E8F4F2` | Soft teal-mist wash for selected empty panels |
| `cg.hairline` | `#C5CCD4` | Dividers, panel edges |
| `cg.glass.fill` | `#F7F9FA` @ 0.78 + blur | Material stand-in; Reduce Transparency → opaque elevated |
| `cg.text.primary` | `#1A1F24` | Titles, primary values |
| `cg.text.secondary` | `#5C6570` | Captions, dual TZ |
| `cg.text.tertiary` | `#8A939C` | Disabled / stub hints |
| `cg.accent.teal` | `#2EC4B6` | Interactive / tab tint / primary CTA (**unchanged**) |
| `cg.accent.teal.muted` | `#2EC4B6` @ 0.12 | Selected row / tip wash |
| `cg.accent.teal.onFill` | `#0E1114` | Label on filled teal button (AA) |
| `cg.money.pos` | `#1B9E6E` | Gain — always with `+` + ▲ |
| `cg.money.neg` | `#D64550` | Loss — always with `−` + ▼ |
| `cg.warn.amber` | `#C9851A` | GATE / soft warn — text required |
| `cg.evidence.source` | `#DDE3E8` | SRC chip fill (light) |
| `cg.evidence.game` | `#D6DEE4` | GAME |
| `cg.evidence.proxy` | `#DDD8E6` | PROXY (cooler) |
| `cg.evidence.gate` | `#F0E4D4` + amber hairline | GATE + “GATE” text |
| Alarm roles | Keep 02 shapes + priority text; lighten fills slightly for contrast on `#F2F4F6` | Color never sole meaning |

Typography, spacing, radii, motion from **02 §2.2–2.4 stay binding**. Only color seeds shift for light. Prefer system appearance: if OS is light → light tokens; dark → 02 dark seeds. Mac smoke may force light for vibe check — Engineer may add temporary Settings override `#if DEBUG` only if needed; player Settings does not need a theme toggle in P1.

### 3.3 Navigation vibe (easy to navigate)

- **Tabs:** Always **text label + SF Symbol** (Desk `briefcase`, Fuel `flame`, Plant `bolt.fill`, Settle `doc.text.magnifyingglass`). Selected = teal tint + semibold label; unselected = secondary. Color never sole selected meaning.  
- **Primary CTA:** Bottom thumb zone; filled teal + `cg.accent.teal.onFill` label when enabled; tertiary/disabled when stub empty. One obvious next action per empty state.  
- **Clock / speed:** Status band clear; speed menu Picker per 02 default — pause · 1× · 8× · 32× · Until next decision.  
- **InterruptTray:** Empty = **fully collapsed**; non-modal; never pauses time (unchanged).  
- **Empty states:** Short plain language, friendly, **no trader jargon on Desk stubs**. Tell the player what will show up and what to do next (usually: wait for stubs / open Settings / switch tab).

### 3.4 Per-tab empty / stub copy refresh

Industrial tone from 02 stays honest; this pass makes copy **friendlier and clearer** without cute mascot voice. Replace 02 empty strings with the following when light vibe lands (Engineer may keep both dark/light visual; copy is shared).

#### Desk
| Field | Copy |
|-------|------|
| Headline | `Nothing on your desk yet` |
| Body | `When market stubs load, you’ll see today’s checklist and the offer gate countdown here.` |
| Next action | `Browse Fuel, Plant, or Settle — or open Settings anytime.` |
| VoiceOver | `Desk empty. No offer ticket yet.` |
| Disabled CTA | Hide “Submit offer” until ticket model exists (same as 02). |

#### Fuel
| Field | Copy |
|-------|------|
| Headline | `Gas day is closed` |
| Body | `When nomination opens, this tab shows the four time markers and whether you’re nominating blind.` |
| Next action | `Check back when the gas window opens. Markers stay on Central Time.` |
| Footnote | `Gas times stay on Central Time. Markers appear when the window opens.` |
| VoiceOver | `Fuel tab. Nomination not open.` |

**Do not regress** inventory §1.4.1 markers (10:00 DA · 13:00 gas · 13:30 DAM target · archive actual) or verdict strings when open.

#### Plant
| Field | Copy |
|-------|------|
| Headline | `Plant data is offline` |
| Body | `State, net megawatts, and fuel flow show up when the unit stub is live.` |
| Next action | `No action needed — this tab is read-only.` |
| Footnote | `No prices. No extra gauges yet.` |
| VoiceOver | `Plant telemetry offline.` |

#### Settle
| Field | Copy |
|-------|------|
| Headline | `No settlements yet` |
| Body | `When statement fixtures load, tap a line to walk the audit chain.` |
| Next action | `Return to Desk after a market day to review results.` |
| Footnote | `Each line links back to the award and the offer that created it.` |
| VoiceOver | `Settle empty. No statements.` |

---

## 4. Engineer handoff checklist

Branch: **`cursor/phase-0-ios-foundation-5a50`**

### Implement now
- [ ] **Remove** any sticky “Local twin unset…” (or similar) banner over Desk / scroll body  
- [ ] Settings row **Your local time zone** — set / change / clear; persist identifier  
- [ ] Clock chrome: always CT; local twin caption **only when set**  
- [ ] First-run tip once (`Show your local time?`) — Not now / Open Settings; never sticky-return  
- [ ] Optional residual chip: status-row only, dismissible, never overlays List/ScrollView  
- [ ] Map [`tokens/control-glass-light-v1.json`](./tokens/control-glass-light-v1.json) → SwiftUI Color assets / `ControlGlass` light palette alongside 02 dark seeds  
- [ ] Apply light surfaces + hairlines + text + evidence chip fills; keep teal accent `#2EC4B6`  
- [ ] Money +/- with sign + triangle; evidence sheet still spells **SOURCE**  
- [ ] Tab labels + SF Symbols emphasis; primary CTA placement per 02  
- [ ] Swap empty-state copy to §3.4 strings (Desk / Fuel / Plant / Settle)  
- [ ] InterruptTray empty = collapsed; non-modal; never pauses time  
- [ ] Speed set unchanged: pause · 1× · 8× · 32× · Until next decision  
- [ ] Fuel closed stub silhouette — no invented marker times; open panel still §8 four-marker  
- [ ] VoiceOver strings for twin states + refreshed empties  
- [ ] Reduce Transparency / Reduce Motion branches still honored  

### Wait / do not invent
- [ ] Live DA ticket / credit / binding submit  
- [ ] Live gas confirm logic (panel chrome OK)  
- [ ] Outcome Lens, 7-role switcher, live trading chrome  
- [ ] Player-facing dark/light toggle (OS appearance is enough for P1)

**Nav freeze:** Desk | Fuel | Plant | Settle only.

---

## 5. Supervisor gate checklist

- [ ] File at `Design/Peaker-Tycoon-Texas/03-local-twin-and-vibe-pass-v1.md`  
- [ ] Optional token JSON at `Design/Peaker-Tycoon-Texas/tokens/control-glass-light-v1.json`  
- [ ] Extends 01 + 02; no contradiction on tabs, evidence, §8 speed, §8 gas-day, InterruptTray, Plant fields  
- [ ] Local twin: **never permanently occludes** primary content; Settings-first + one-time tip; residual chip status-row only  
- [ ] Exact copy strings present; no “Local twin unset…” sticky banner  
- [ ] Light vibe = Control Glass light mode (not neon / not rejected prototype)  
- [ ] Single teal accent retained; money/evidence/alarms keep redundant encoding  
- [ ] Empty copy friendly, plain language, no Desk trader jargon  
- [ ] No P2 Lens / P3b role switcher / live trading invention  
- [ ] Engineer can implement on `cursor/phase-0-ios-foundation-5a50` without inventing tokens or copy  

---

## 6. Key decisions summary

- **Local twin primary:** Settings → “Your local time zone”; clock always CT; twin caption only when set.  
- **First-run:** One-time gentle tip (Not now / Open Settings); dismiss never brings back a sticky body banner.  
- **Fallback chip:** Compact, in status row / below clock, dismissible; never overlays scroll content.  
- **Banned UX:** Permanent “Local twin unset…” (or similar) occluding Desk.  
- **Light vibe:** Brighter Control Glass paper-graphite shell; same teal `#2EC4B6`; calm day-ops feel.  
- **Copy:** Friendlier empty states with clear next action; no dense trader jargon on Desk stubs.  
- **Scope lock:** Desk | Fuel | Plant | Settle stubs only; §8 speed + gas markers + InterruptTray rules unchanged.  
- **Tokens:** Light semantic JSON companion for Engineer Color asset mapping; dark seeds in 02 remain valid for dark appearance.

---

*End of local twin + Control Glass light vibe pass v1. Parallel to Engineer layout fixes; domain stays UI-separated.*
