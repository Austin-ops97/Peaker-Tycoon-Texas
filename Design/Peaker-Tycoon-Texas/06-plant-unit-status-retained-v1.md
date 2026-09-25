# Peaker Tycoon Texas — Design 06: Plant unit status (retained readouts) v1

**Owner:** UI/UX Graphics Designer  
**Date:** 2026-09-25  
**Partners:** iOS Development Engineer (implement), Supervisor iOS Game (gate)  
**Extends:** [`01-phone-first-screen-inventory-v1.md`](./01-phone-first-screen-inventory-v1.md) · [`04-iphone-nav-clarity-v1.md`](./04-iphone-nav-clarity-v1.md) · [`05-empty-lead-calm-reduce-motion-v1.md`](./05-empty-lead-calm-reduce-motion-v1.md)  
**Tokens:** Control Glass light — [`tokens/control-glass-light-v1.json`](./tokens/control-glass-light-v1.json) (**no new palette**)

**Supervisor verify:** PASS 2026-09-25 CT with binding amendment (v1.1). Engineer greenlit to land.
**Engineering ask:** Plant unit status with retained readouts (full game build-out #1). Soft waiting one-liner taps already at `88c7be2` — preserve.

**Changelog v1:** Two Plant modes — empty (Design 05) vs retained readouts (State · MW · Fuel flow). GAME/PROXY honesty. CTA `View unit status` unchanged. No prices / Confirm / Trade. Phone-only.
**Changelog v1.1 (Supervisor):** PASS with amendment — retained lead locked to `Unit status · read-only`; mode trigger “retained / game-physics” (not “live”).

**Changelog v1.1:** Vertical glass metric stack (02); optional State SF Symbols; ban on 02/03 offline headlines competing with title `Plant`.

**Changelog v1.1 Supervisor binding:** Retained lead ships **only** as `Unit status · read-only` — drop “Live unit readouts…” (“live” can read as SOURCE). Mode trigger wording: **retained / game-physics**, not “live.”

---

## 1. Purpose / out of scope

### Purpose
Make Plant a **playable read** of retained unit telemetry: when retained fields exist, show real State · MW · Fuel flow with evidence tags; when they do not, keep Design 05 empty-lead calm. One primary thumb CTA. Control Glass calm.

### Out of scope (hard locks)
- Prices, trading quotes, bid/offer chrome, Confirm, Trade, or any offer-build UI  
- Outcome Lens / 7-role switcher / Control Room Operator full board  
- Extra gauges for fields physics does not emit yet (temps, vibration, lube, etc.)  
- Twin/chrome that permanently covers Desk (03 ban)  
- New color system or decorative plant art / Lottie  
- Fuel nomination or Settle statement packs (later lands)  
- Desk offer-build (hold until coverage gates green)

---

## 2. Modes

| Mode | When | UI |
|------|------|-----|
| **Empty** | No retained unit fields (or all unknown / not wired) | Design 05 Plant empty-lead exactly |
| **Retained** | At least one of `state`, net `MW`, `fuel_flow` is retained / game-physics sampled | Lead shortens; three-field card shows real values + evidence chips |

Switch empty → retained: **instant** if Reduce Motion; optional ≤150 ms fade if not (Design 05 empty→content rule).

---

## 3. Empty mode (preserve Design 05)

| Slot | Spec |
|------|------|
| Title | `Plant` |
| Leading accent | 3×28 pt muted teal bar @ 40% (`cg.accent.teal`) |
| Lead | `Read-only unit status. State, power, and fuel flow show here when live.` (≤2 lines) |
| Quiet secondary | Three fields State · MW · Fuel flow with `—` placeholders |
| Evidence on stubs | Optional `GAME` or `PROXY` chip on unknown fields (04); tap → sheet spells **GAME** / **PROXY** in full |
| Soft waiting | Preserve Engineering Soft Plant waiting one-liner tap at `88c7be2` (do not remove or reword unless Eng asks) |
| CTA | `View unit status` → scroll/focus to the three-field card + short explainer (same as retained) |

---

## 4. Retained mode — layout

```
┌─────────────────────────────────────┐
│  ▌  Plant                           │  muted teal bar
│     Unit status · read-only         │  ≤1–2 line lead
│                                     │
│  ┌─────────────────────────────┐    │
│  │ State     ONLINE      GAME  │    │  field rows
│  │ MW        42.0        GAME  │    │
│  │ Fuel flow 310         GAME  │    │  MMBtu/h implied in label
│  └─────────────────────────────┘    │
│                                     │
│  [ View unit status ]               │  primary thumb CTA (04)
└─────────────────────────────────────┘
```

### Lead (retained)
Prefer shorter than empty:

| Slot | Spec |
|------|------|
| Title | `Plant` (unchanged) |
| Lead | **Ship:** `Unit status · read-only` (max 1–2 lines). Eng may keep Design 05 empty lead if copy churn is costly. **Do not** ship “Live unit readouts…” — “live” can read as SOURCE. |
| Accent | Same muted teal bar on title row |

**Ship lead (binding):** `Unit status · read-only` only.

### Three-field card

| Field label (player) | Data | Format | Unit / notes |
|----------------------|------|--------|--------------|
| `State` | §12.1 enum | Title case plain English (see §5) | No raw snake_case |
| `MW` | Net MW | Tabular figures; 1 decimal when fractional, else integer OK | Label is the unit — do **not** append “MW” twice |
| `Fuel flow` | `fuel_flow` | Tabular figures; 0–1 decimal | Append unit in secondary: `MMBtu/h` under or after value |

**Card chrome:** Prefer Design 02 **vertical glass metric rows** (one column stack). `cg.surface.elevated` + `cg.hairline` 1 pt; corner radius 12; 8-pt vertical rhythm. 1×3 horizontal only if Dynamic Type still stacks cleanly — default is vertical.

**Row anatomy (leading → trailing):**
1. Optional SF Symbol for State only (see §5) — 20 pt, secondary  
2. Label — `cg.text.secondary`, body/subheadline  
3. Value — `cg.text.primary`, title3 or body semibold, tabular  
4. Evidence chip — `GAME` or `PROXY` (or `SRC` only if true SOURCE telemetry lands later); tap → sheet spells full word  

If one field is still unknown while others are retained: show `—` for that field **with** `GAME`/`PROXY` chip — do not hide the row (keeps silhouette stable).

**Title lock:** Root title stays `Plant`. Do **not** revive Design 02/03 offline headlines (`Telemetry offline` / `Plant data is offline`) as competing primary titles — empty lead from Design 05 covers the wait state.

### Soft waiting one-liner
Preserve Soft Plant waiting tap at `88c7be2`. Placement: quiet under the field card or under lead — Engineering’s existing slot wins; Design does not invent a second waiting line.

---

## 5. State enum — player strings

Map retained §12.1 states to plain English (Control Room honesty; no jargon soup):

| Internal (Eng) | Player label | Optional SF Symbol (Design 02 lineage) |
|----------------|--------------|----------------------------------------|
| OFFLINE | Offline | `powerplug` |
| READY | Ready | — |
| STARTING | Starting | — |
| PURGING | Purging | — |
| FIRING | Firing | — |
| ACCELERATING | Accelerating | — |
| SYNCHRONIZING | Synchronizing | — |
| ONLINE | Online | `bolt.fill` |
| STOPPING | Stopping | — |
| COOLDOWN | Cooldown | — |
| TRIPPED | Tripped | `exclamationmark.triangle` |
| MAINTENANCE | Maintenance | — |

Symbols are **optional** (scan aid only). If Eng ships text-only State, that still PASSes. Do not invent custom glyphs.

**DERATED overlay:** If Eng emits derated with another state, show primary state as above and a secondary caption `Derated` under the value (same row or next line) — not a fourth field. Color stays Control Glass text; optional warning tint only if Eng already has a severity token — do **not** invent alarm chrome in this pack.

Unknown / future enum: show raw token only as last resort; prefer `—` + `GAME` until mapped.

---

## 6. Evidence tag honesty (GAME)

| Rule | Spec |
|------|------|
| Retained sim / game physics | Chip **`GAME`** — sheet title/body spell **GAME** |
| Approximate / stand-in | Chip **`PROXY`** — sheet spells **PROXY** |
| Real external feed (later) | Chip **`SRC`** / sheet **SOURCE** — only when true |
| Dense chip OK | Abbrev on chip; sheet always full word (01/05) |
| Never | Untagged numbers; fake SOURCE on game data; hover-only |

Honesty bar: if Engineering marks retained plant data as game-derived, UI must say **GAME**, not SOURCE.

---

## 7. CTA — `View unit status`

| Behavior | Spec |
|----------|------|
| Label | `View unit status` (Design 04 — **do not rename**) |
| Empty mode | Scrolls to / focuses three-field stub card; may open short explainer sheet |
| Retained mode | Same scroll/focus to field card; same explainer |
| Explainer sheet title | `Unit status` |
| Explainer body (plain English) | `This screen shows the unit’s state, power output in megawatts, and fuel flow. It’s read-only — you can’t start or stop the plant from here.` |
| Explainer must not | Name internal APIs; show prices; offer Confirm/Trade; list StatementLine-style codes |

One primary thumb CTA — no second competing button on Plant root.

---

## 8. Motion (Design 05)

| Motion | Default | Reduce Motion |
|--------|---------|---------------|
| Empty → retained populate | Optional fade ≤150 ms | Instant |
| CTA scroll-to-card | System scroll | Instant jump OK |
| Chip / sheet | System | No custom bounce |
| Coach/tips (if any on Plant) | Per Design 05 | No slide |

---

## 9. Hard locks (checklist for Eng + Supervisor)

- [ ] Empty mode = Design 05 Plant lead + `—` fields + teal bar  
- [ ] Retained mode = State · MW · Fuel flow real values; silhouette of three rows always  
- [ ] Retained lead **only** `Unit status · read-only` — no “live” wording; mode trigger = retained / game-physics  
- [ ] GAME/PROXY honesty; tap sheet spells full words  
- [ ] CTA `View unit status` → same scroll/explainer; no rename  
- [ ] Soft waiting one-liner taps preserved (`88c7be2`)  
- [ ] **No** prices, Confirm, Trade, offer chrome  
- [ ] **No** extra gauges for unpublished fields  
- [ ] Control Glass light tokens only  
- [ ] Twin/chrome never permanently cover Desk  
- [ ] Phone-only; Design 05 Reduce Motion honored  
- [ ] Land `Design/Peaker-Tycoon-Texas/06-plant-unit-status-retained-v1.md` **after Supervisor PASS**

---

## 10. Supervisor gate

- [x] Functional Plant read clearly empty vs retained  
- [x] §12.1 state labels plain English; DERATED as overlay only  
- [x] Evidence honesty (GAME vs PROXY vs SOURCE)  
- [x] 04 CTA + 05 empty-lead + Soft waiting preserved  
- [x] No trading / prices / Confirm  
- [x] No Lens / 7-role / decorative busywork  
- [x] Control Glass calm; phone-only  

---

## 11. Key decisions

1. **Stable three-row silhouette** — unknown fields stay as `—` so empty and retained don’t reshuffle layout  
2. **Short retained lead** — `Unit status · read-only` once data is present  
3. **GAME honesty** — game-derived retained telemetry never masquerades as SOURCE  
4. **One CTA** — `View unit status` for both modes  
5. **No control affordances** — Plant remains read-only in Phase 1  

---

## 12. Handoff order

1. Supervisor PASS on this pack  
2. Engineer lands doc on PR #1 + implements retained Plant UI  
3. Design next (after Eng asks): Fuel closed→open · Settle first statement · Desk offer-build (gates green only)
