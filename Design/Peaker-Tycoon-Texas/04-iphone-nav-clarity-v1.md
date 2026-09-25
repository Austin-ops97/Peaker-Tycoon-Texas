# Peaker Tycoon Texas — Design 04: iPhone nav clarity v1

**Owner:** UI/UX Graphics Designer  
**Date:** 2026-09-24  
**Partners:** iOS Development Engineer (implement on `cursor/phase-0-ios-foundation-5a50`), Supervisor iOS Game (gate)  
**Extends:** [`01-phone-first-screen-inventory-v1.md`](./01-phone-first-screen-inventory-v1.md) · [`02-phase1-shell-polish-control-glass-v1.md`](./02-phase1-shell-polish-control-glass-v1.md) · [`03-local-twin-and-vibe-pass-v1.md`](./03-local-twin-and-vibe-pass-v1.md)  
**Tokens:** keep Control Glass **light** from [`tokens/control-glass-light-v1.json`](./tokens/control-glass-light-v1.json) — no new palette pass

**Supervisor verify:** PASS 2026-09-24 CT — Austin friendliness bar + inventory §8 four-marker / no Lens / no 7-role / Control Glass light unchanged. Soft note for Engineer: keep Settle sheet player copy free of StatementLine/Award/OfferTranche names (IDs stay domain-only).

**Changelog v1:** Highest-value friendliness pass after Design 03 — clearer Desk next-action hierarchy, Fuel closed-state clarity, Settings twin picker affordance. iPhone stubs only.

---

## 1. Purpose / out of scope

### Purpose
Make the Phase 1 shell **obvious on iPhone**: what each tab is for, what to do next, and how to set local time — without trader jargon or sticky chrome.

### Out of scope (do not invent)
- Outcome Lens (Phase 2)
- 7-role switcher / firewalls (Phase 3b)
- Live offer / nomination / settlement math chrome
- New sticky banners over scroll (03 ban stands)
- Neon / rejected prototype revival
- Changing §8 gas four-marker times or verdict strings

---

## 2. Tab bar (always)

| Tab | SF Symbol | Label | Selected |
|-----|-----------|-------|----------|
| Desk | `briefcase.fill` | Desk | Teal tint `#2EC4B6` + medium weight label |
| Fuel | `flame.fill` | Fuel | same |
| Plant | `bolt.fill` | Plant | same |
| Settle | `doc.text.fill` | Settle | same |

- Always show **icon + text** (never icon-only).
- VoiceOver: “Desk”, “Fuel”, “Plant”, “Settle” — no jargon.
- No badges in Phase 1 except future interrupt count (leave API hook only).

---

## 3. One primary next action per tab

**Rule:** Every stub screen has **exactly one** primary CTA in the thumb zone (bottom ~25–30%, above tab bar safe area). Secondary links are text buttons or list rows.

| Tab | Primary CTA (stub) | When disabled / hidden |
|-----|--------------------|-------------------------|
| **Desk** | `Review today’s plan` | Never hide — on empty, still primary; opens Today checklist sheet or scrolls to checklist |
| **Fuel** | Closed: `See gas day timeline` · Open: `Review nomination` | Open CTA only when nomination window open (domain flag) |
| **Plant** | `View unit status` | Always (scrolls to / focuses state · MW · fuel flow card) |
| **Settle** | `Open latest statement` | If no statements: CTA becomes `How settlement works` (plain sheet) |

Primary button style: filled teal (`cg.accent.teal`), white label, 44 pt min height, full-width inset 16.

---

## 4. Desk — next-action hierarchy (highest priority)

**Visual stack (top → bottom):**

1. **Clock chrome** (CT always; local twin only when set — Design 03)
2. **Speed** menu Picker (pause · 1× · 8× · 32× · Until next decision)
3. **Next up** card (elevated glass) — plain title + one sentence + primary CTA
4. **Today** checklist (stub rows) — secondary
5. Optional exposure strip hooks — tertiary / muted

### Desk empty / stub copy

| Key | Copy |
|-----|------|
| `desk.next.title` | `Next up` |
| `desk.next.body` | `You’re on the trading desk. When offers open, you’ll build them here. For now, check today’s plan.` |
| `desk.next.cta` | `Review today’s plan` |
| `desk.today.title` | `Today` |
| `desk.today.empty` | `No checklist items yet. Day pieces will show up here as the market day runs.` |
| `desk.avoid` | No “DA tranche”, “credit headroom”, “regret”, “Lens” on Desk stubs |

**Hierarchy cue:** Next-up card uses `cg.surface.elevated` + teal hairline left edge (4 pt). Checklist uses recessed surface — visually quieter.

---

## 5. Fuel — closed-state clarity

When nomination is **not** open (default stub):

| Element | Spec |
|---------|------|
| Title | `Gas day` |
| Body | `Nomination isn’t open right now. You can still see the day’s timeline so clocks stay clear.` |
| Timeline | Four-marker **silhouette** (10:00 DA · 13:00 gas · 13:30 DAM target · archive actual) — muted/tertiary labels; do **not** invent times |
| Verdict slot | `Verdict unavailable — nomination not open` |
| Primary CTA | `See gas day timeline` (scrolls/expands silhouette; does not fake Confirm) |
| Confirm | **Hidden** until nomination open |

When open: full §8 panel per inventory §1.4.1 (four markers + verdict **before** Confirm). Design 03/01 binding — no regression to two markers.

Footnote (player-facing, no § jargon): `Timeline follows the gas-day clock rules.`

---

## 6. Plant & Settle — stub clarity (short)

### Plant
- Title: `Plant`
- Body: `Read-only unit status. You’ll see state, power output, and fuel flow when live data is connected.`
- Show three stub fields only: **State** · **MW** · **Fuel flow** — placeholders `—` with GAME/PROXY chip when unknown
- No prices, no extra gauges
- CTA: `View unit status`

### Settle
- Title: `Settlement`
- Body: `Statements and the audit trail land here after the day settles.`
- Empty: `No statements yet.`
- CTA: `How settlement works` → short sheet in plain English (money in/out for the day; tap a line later to see why — no product-code names)
- When fixtures exist: CTA → `Open latest statement`; audit chain uses StatementLine → Award → OfferTranche IDs (no invented graph)

---

## 7. Settings — twin picker affordance

Reinforce Design 03 with clearer **findability**:

| Element | Spec |
|---------|------|
| Settings row | Title `Your local time zone` · value `Not set` or zone friendly name |
| Chevron | Always show disclosure indicator |
| Leading icon | `clock` SF Symbol, secondary color |
| Hint under row | `Game deadlines always use Central Time. Local time is optional.` |
| Picker screen title | `Local time zone` |
| Search | Native searchable list of `TimeZone` identifiers with friendly labels |
| Actions | `Use my phone’s time zone` (primary text button) · `Clear local time` (destructive, only when set) |
| Replay tip | Footer link `Show local time tip` (reopens one-time tip sheet) |

**Never** put “Local twin unset” (or similar) over Desk scroll. Tip rules from 03 unchanged.

---

## 8. First-session coach (optional, 3 beats)

Non-blocking tip cards (sheet or bottom card **in chrome band**, never over List body):

1. **Desk** — `This is your desk. Start with today’s plan.` → Got it / Not now  
2. **Fuel** — `Fuel shows the gas-day clock. Confirm only when nomination is open.` → Got it / Not now  
3. **Settle** — `After the day, statements show up here.` → Got it / Not now  

- Persist `coachBeat{N}Dismissed`; never sticky-return  
- Replay: Settings → `Show navigation tips`  
- Skip Plant in first three beats (read-only; lower urgency)

---

## 9. Engineer checklist

- [x] Tab bar: 4 tabs, icon+text, teal selected, VoiceOver plain names  
- [x] Desk: Next-up card above Today; one primary CTA `Review today’s plan`  
- [x] Fuel closed: silhouette four-marker + copy above; Confirm hidden; CTA `See gas day timeline`  
- [x] Plant: three fields only; CTA `View unit status`  
- [x] Settle empty: plain empty + `How settlement works` sheet  
- [x] Settings twin: icon + chevron + hint + searchable picker + Use phone TZ / Clear  
- [x] Coach optional; never occludes scroll; respects 03 twin rules  
- [x] No Lens / 7-role / live trading chrome  
- [x] Supervisor PASS stamped 2026-09-24 — land doc at `Design/Peaker-Tycoon-Texas/04-iphone-nav-clarity-v1.md` on PR #1

---

## 10. Supervisor gate

- [ ] iPhone friendliness: obvious tabs + one next action per tab  
- [ ] Desk hierarchy clear (Next up > Today > tertiary)  
- [ ] Fuel closed-state clear; §8 four-marker not regressed when open  
- [ ] Settings twin picker easy to find; no occluding unset banner  
- [ ] Control Glass light tokens unchanged (03)  
- [ ] No Lens / 7-role / live trading  
- [ ] Copy plain; no § or product jargon in player strings  

---

## 11. Key decisions

1. **One primary CTA per tab** in thumb zone — reduces “what do I tap?”  
2. **Desk Next-up card** is the friendliness focus — checklist is secondary  
3. **Fuel closed** teaches timeline without fake Confirm  
4. **Settings twin** gets icon + searchable picker + “Use my phone’s time zone”  
5. **3-beat coach** optional, non-occluding, Settings-replayable  
6. **No new color system** — Control Glass light from 03 stands  
7. **Scope lock** stubs only  

---

*End Design 04 — iPhone nav clarity v1. Supervisor PASS 2026-09-24 — Engineer may land on PR #1.*
