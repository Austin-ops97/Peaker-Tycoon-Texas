# Peaker Tycoon Texas — Design 05: Empty-lead visual calm + Reduce Motion v1

**Owner:** UI/UX Graphics Designer  
**Date:** 2026-09-24  
**Partners:** iOS Development Engineer (implement on `cursor/phase-0-ios-foundation-5a50`), Supervisor iOS Game (gate)  
**Extends:** [`01-phone-first-screen-inventory-v1.md`](./01-phone-first-screen-inventory-v1.md) · [`02-phase1-shell-polish-control-glass-v1.md`](./02-phase1-shell-polish-control-glass-v1.md) · [`03-local-twin-and-vibe-pass-v1.md`](./03-local-twin-and-vibe-pass-v1.md) · [`04-iphone-nav-clarity-v1.md`](./04-iphone-nav-clarity-v1.md)  
**Tokens:** Control Glass light — [`tokens/control-glass-light-v1.json`](./tokens/control-glass-light-v1.json) (**no new palette**; reuse muted teal)

**Supervisor verify:** PASS 2026-09-24 CT with binding Desk amendment (v1.1). Empty-lead pattern, Reduce Motion, locks approved. Engineer implement wait: Supervisor greenlight after this stamp; Fuel/Plant/Settle waiting one-liners stay queued until Mac smoke of Desk what’s-next also PASSes.

**Changelog v1:** Visual calm for empty/stub leads on Desk|Fuel|Plant|Settle + Reduce Motion rules for coach/tips. Phase 1 shell only.

**Changelog v1.1:** Desk §3 — do **not** replace Engineering soft what’s-next at `cd8276b`. Title stays `Next up`. Lead/quiet pointer keeps (or sits beside) post-coach line: “Next, use the arrows to cycle saved hubs, or open Review today’s plan.” Quiet under Next up; hides while a tip is on screen. Drop trading-forward “You’re on the trading desk…” copy while coverage gates are red. Teal bar + visual pattern still apply; CTA `Review today’s plan` unchanged.

---

## 1. Purpose / out of scope

### Purpose
Make empty and stub screens feel **calm, scannable, and finished** on iPhone light Control Glass — typography + spacing + one muted teal accent line. No illustrations. Honor Reduce Motion.

### Out of scope (hard locks)
- Outcome Lens / 7-role switcher / live trading UI (coverage gates still red)
- Twin/chrome that permanently covers Desk scroll (03 ban stands)
- New color system or neon revival
- Changing §8 gas four-marker times, verdict strings, or 04 CTA labels
- Heavy illustration / Lottie / decorative plant art

---

## 2. Empty-lead layout pattern (all four tabs)

**Anatomy (top → bottom inside scroll content, below clock/speed chrome):**

```
┌─────────────────────────────────────┐
│  ▌  Title (title2 / semibold)       │  ← 3 pt muted teal leading bar
│     One-sentence lead (body)        │
│                                     │
│     [ optional quiet secondary ]    │
│                                     │
│     …… spacing ……                   │
│     Primary CTA (04 thumb zone)     │  ← unchanged from Design 04
└─────────────────────────────────────┘
```

### Spec

| Element | Token / rule |
|---------|----------------|
| Leading accent | Vertical bar **3×28 pt**, fill `cg.accent.teal` @ **40% opacity** (muted — not full CTA teal) |
| Title | SF Pro **title2**, semibold, `cg.text.primary` |
| Lead body | SF Pro **body**, regular, `cg.text.secondary`; max **2 lines** preferred; never trader jargon |
| Card (optional) | If lead sits in a card: `cg.surface.elevated` + `cg.hairline` 1 pt; corner radius 12 |
| Vertical rhythm | 8-pt grid; title→body **8**; body→CTA **24–32** |
| Illustration | **None** — empty space is intentional calm, not a broken UI |
| Alignment | Leading (LTR); accent bar aligns to title cap height |

### Do not
- Center huge SF Symbol as “empty art” (small 20 pt symbol **inline** with title is OK if it aids scan)
- Rainbow accents / multiple accent colors
- Skeleton shimmer on true empty (use static calm; shimmer only while **loading** and Reduce Motion off — same as 02/03 Audit empty)

---

## 3. Per-tab empty / stub leads

Player-facing strings stay plain. Prefer 04 wording where it already exists; this pack defines **visual** + tight leads.

### Desk (v1.1 binding — preserve Engineering what’s-next)
| Slot | Spec |
|------|------|
| Title | `Next up` (**do not rename**) |
| Soft what’s-next | **Do not replace** Engineering soft Desk what’s-next already at `cd8276b`. Design 05 adds visual calm (teal bar + spacing) around it — not a copy rewrite of that card. |
| Lead / quiet pointer | Keep (or sit beside) Engineering’s post-coach line: `Next, use the arrows to cycle saved hubs, or open Review today’s plan.` Place **quiet under Next up**. **Hide** this quiet line while any tip/coach is on screen. |
| Drop (while coverage gates red) | Do **not** ship trading-forward: `You’re on the trading desk. When offers open, you’ll build them here.` (or similar). |
| Quiet secondary (checklist) | Today checklist empty may still use: `No checklist items yet.` |
| Accent | Teal bar on Next-up card only (not on every checklist row) |
| CTA | `Review today’s plan` (04) — unchanged |

### Fuel (closed)
| Slot | Spec |
|------|------|
| Title | `Gas day` |
| Lead | `Nomination isn’t open right now. You can still see today’s timeline.` |
| Quiet secondary | Four-marker **silhouette** below lead (04/§8) — tertiary labels |
| Accent | Teal bar on title row only |
| CTA | `See gas day timeline` (04); Confirm **hidden** |

### Plant
| Slot | Spec |
|------|------|
| Title | `Plant` |
| Lead | `Read-only unit status. State, power, and fuel flow show here when live.` |
| Quiet secondary | Three fields State · MW · Fuel flow with `—` placeholders |
| Accent | Teal bar on title row |
| CTA | `View unit status` (04) |

### Settle
| Slot | Spec |
|------|------|
| Title | `Settlement` |
| Lead | `Statements show up here after the day settles.` |
| Quiet secondary | `No statements yet.` |
| Accent | Teal bar on title row |
| CTA | `How settlement works` → plain-English sheet (**no** StatementLine / Award / OfferTranche names in player UI — 04 soft constraint) |

---

## 4. Reduce Motion

| Motion | Default | `accessibilityReduceMotion == true` |
|--------|---------|-------------------------------------|
| Coach / local-twin tip appear | Optional short fade **or** slide-up ≤220 ms | **Instant** appear (opacity 1) — **no slide** |
| Coach / tip dismiss | Fade 150 ms | Instant remove |
| Tab switch | System default | Prefer **cross-dissolve** or instant; no custom parallax |
| InterruptTray (when non-empty later) | Slide+fade per 02 | Fade only or instant |
| Empty → content populate | Optional fade-in | Instant |
| Loading shimmer (Audit etc.) | Allowed if loading | **Off** — static recessed placeholder |
| Primary CTA press | Light highlight / haptic OK | Highlight OK; skip celebratory bounce |

**Rule:** Coach and twin tip **never** use slide when Reduce Motion is on. Prefer cross-dissolve or instant everywhere custom motion exists.

---

## 5. Optional — Desk SOURCE strip calm chips

**Only if Engineering still needs hub-name chips on the Desk SOURCE strip.**

| Rule | Spec |
|------|------|
| Chip | Capsule, `cg.surface.recessed`, hairline; label `cg.text.secondary` 12–13 pt |
| Dense abbrev | `SRC` / `GAME` / `PROXY` / `GATE` OK on chip |
| Tap sheet | Must spell **SOURCE** (and GAME / PROXY / GATE in full) — unchanged |
| Hub names | Plain English hub label beside chip if needed (e.g. market / plant / fuel) — **no** dense codes as the only label |
| Count | Max **3** visible chips in strip; overflow → “More” |
| Motion | No bounce on appear if Reduce Motion |

If Engineering does **not** need this, skip entire §5 — empty-lead + Reduce Motion alone satisfy Design 05.

---

## 6. Twin / chrome reminder (non-negotiable)

- Settings-first local twin; caption only when set  
- One-time tip only; never sticky-return over Desk  
- Residual chip status-row only; **never** overlay List/ScrollView  
- Empty-lead cards live **in** scroll content, not in a floating layer over it  

---

## 7. Engineer checklist

- [ ] Empty-lead pattern on Desk|Fuel|Plant|Settle: muted teal bar + title + ≤2-line lead + 04 CTA  
- [ ] Desk: preserve `cd8276b` what’s-next; title `Next up`; quiet post-coach pointer under Next up (hide while tip on); **no** trading-forward desk lead while coverage gates red  
- [ ] No empty-state illustrations  
- [ ] Reduce Motion: coach/tip **no slide**; cross-dissolve or instant elsewhere as table  
- [ ] Settle sheet plain English only (04 soft constraint)  
- [ ] Optional SOURCE chips only if eng needs; SRC→SOURCE sheet unchanged  
- [ ] Twin/chrome never permanently cover Desk  
- [ ] No Lens / 7-role / trading UI  
- [ ] Land `Design/Peaker-Tycoon-Texas/05-empty-lead-calm-reduce-motion-v1.md` **after Supervisor PASS**

---

## 8. Supervisor gate

- [ ] Calm empty leads, illustration-free, one muted teal accent  
- [ ] Reduce Motion table clear and shippable  
- [ ] 04 CTAs / §8 Fuel silhouette / twin rules preserved  
- [ ] Optional SOURCE chips gated on eng need  
- [ ] No Lens / 7-role / trading UI  
- [ ] Control Glass light tokens unchanged  

---

## 9. Key decisions

1. **One muted teal leading bar** = empty-lead identity (not a second accent system)  
2. **Typography + spacing only** — no illustrations  
3. **Reduce Motion kills tip/coach slides** — instant or cross-dissolve  
4. **04 CTA copy and hierarchy unchanged** — this is visual calm, not a nav rewrite  
4a. **Desk v1.1:** preserve `cd8276b` what’s-next; title `Next up`; quiet post-coach pointer; no trading-forward lead while gates red  
5. **SOURCE chips optional** — only if Engineering asks  
6. **Scope lock** Phase 1 shell while coverage gates red  

---

*End Design 05 v1.1 — Supervisor PASS with Desk amendment stamped; await Supervisor greenlight before Engineer land/implement.*
