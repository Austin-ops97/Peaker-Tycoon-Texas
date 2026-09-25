# Peaker Tycoon Texas

Build Spec v3 is the source of truth. Equations and acceptance tests outrank narrative. This repository's companion notes live in [`docs/CURSOR_COMPANION.md`](docs/CURSOR_COMPANION.md) and defer to the spec on conflict.

**Release 1 platform is an iPhone app.** That is an Austin override of spec §1 and §28.2, which name a desktop browser, a Web Worker, and IndexedDB. Those hosting details are not the R1 path. The §24 determinism contract still stands: seeded RNG, no wall-clock reads inside the kernel, replay from seed plus input log, and no UI imports in the simulation core.

Phase 0 is **not** exited. `campaign_chronology` and `five_year_coverage_gate` fail until a real ERCOT pack is ingested. No trading loop is implemented.

## Layout

| Path | Role |
| --- | --- |
| `Sources/PeakerKernel` | Deterministic kernel. No SwiftUI, UIKit, files, or clock reads. |
| `Sources/PeakerData` | Ingestion scaffolding and the coverage manifest model. |
| `App/` | Xcode iPhone target. Four-tab placeholder shell only. |
| `Data/packs/TX_GAME_ENERGY_V1/coverage-manifest.json` | Published coverage manifest. GATE stub, not a price pack. |
| `Data/archives/TX_TRAIN_2019_2020` | Training-only bootstrap layout. No SOURCE rows. |
| `Config/` | Versioned GAME defaults and fictional proxy sites. |
| `Schemas/phase0` | JSON schemas for Phase 0 entities. |
| `Design/Peaker-Tycoon-Texas/01-phone-first-screen-inventory-v1.md` | UI/UX screen inventory. Look and feel stay with that owner. |
| `Tests/PeakerGateTests` | The two gates. They fail on this stub on purpose. |

## Placeholder shell

Root navigation is frozen:

1. Desk — Power Trader Now/Today and shaped DA ticket hooks
2. Fuel — nomination and blind-nomination explainer
3. Plant — read-only state, MW, and fuel flow; no price chrome
4. Settle — statement and audit-chain shell

Global chrome: Central game clock plus a local-time twin, a speed chip, a non-modal interrupt tray with an empty publisher, and Settings (evidence legend and accessibility stubs). There is no role switcher. `RoleId` exists only in the kernel.

The clock starts at the GAME morning-brief anchor (2021-02-01 08:00 CT). It is not the phone clock. Pause holds that instant. 1×, 8×, and 32× scrub the displayed label by that many game seconds per real second. Until next decision matches 1× and pauses at the placeholder 10:00 CT deadline. The scrub does not run the kernel.

Design 04 (`Design/Peaker-Tycoon-Texas/04-iphone-nav-clarity-v1.md`) sets the stub hierarchy. Desk leads with Next up and `Review today’s plan`, then Today, then a muted retained NP4 sample strip. That button opens a read-only sheet for the hub row currently on the strip and says the price is a retained sample, not a live price. Chevron buttons cycle one row at a time: `HB_HOUSTON` and `HB_NORTH` on 2021-02-10, `HB_WEST` on 2021-04-15, then `HB_HOUSTON` on 2022-07-15, `HB_NORTH` on 2023-10-15, and `HB_WEST` on 2024-08-15. Each card keeps the settlement code and adds Houston, North, or West underneath. Under the arrows: “These are retained historical samples, not a live market.” Settings → Evidence says saved samples are a partial history and the campaign is not fully filled, then the earliest and latest saved delivery dates, and that some settlement reports are not available yet. The detail page still lists the file counts. When the bundled day-ahead sample is present, Fuel’s lead is “Nomination is closed. These saved days have no publication time.” The four gas-day markers stay, the card lists those saved days, and there is no confirm button. With no sample, the lead stays “Nomination isn’t open right now. You can still see today’s timeline.” Plant shows the game-physics sample when the shell passes one: lead “Unit status · read-only”, then Online, 48 MW, and 480 MMBtu/h, each with a GAME chip. With no reading, the lead stays “Read-only unit status. State, power, and fuel flow show here when live.” and those three fields stay blank. The button stays View unit status. There are no prices. Settle’s lead is “Statements show up here after the day settles.” The empty line is still “No statements yet.” and its only action explains settlement in plain language. There is no offer ticket. After the local-time tip is clear, a coach card under the clock says the four tabs, then that Desk arrows cycle retained samples that are not live, then that Review today’s plan opens that sample to read. Got it advances. Not now holds the rest of the session. Settings → Show navigation tips replays the three tips. Settings home groups the rows under Local time, Tips, and Evidence.

Open `App/PeakerTycoon.xcodeproj` in Xcode 16 or newer on a Mac. The app target links the local `PeakerKernel` and `PeakerData` packages. This environment has no Mac worker and cannot run `xcodebuild`, so the SwiftUI target has not been compiled here.

## Tests

On Linux or macOS, from the repository root, with Swift 6:

```bash
swift test --filter PeakerKernelTests
swift test --filter PeakerDataTests
swift test --filter PeakerGateTests
```

Or:

```bash
bash Scripts/verify-phase0-stub.sh
```

`PeakerKernelTests` and `PeakerDataTests` should pass. `PeakerGateTests` should fail until `Data/packs/TX_GAME_ENERGY_V1/coverage-manifest.json` records ingested SOURCE coverage. A full `swift test` is red for that reason. Do not flip the completeness flag without a real ingest.

## Data GATE (still blocked)

Before the campaign can ship (§5, §27.1, §29.2):

- NP4-190-CD and NP6-905-CD artifact paths are pinned from the 2026-09-24 catalog extract. See [`Data/docs/ercot-adapter-pins.md`](Data/docs/ercot-adapter-pins.md). Two hundred twenty-nine verified price zips are retained under `Data/archives/ercot/2026-09-24/` (`source_batch_count` 229, including batch 11’s 30 zips). That is not five-year coverage. This drop recorded no live From/To day with zero rows. 2024-12-15 and 2025-09-15 From/To pages have rows; only pages 1–3 were kept. The day-ahead zip posted 2025-09-14 covers DeliveryDate 09/15/2025. The day-ahead zip posted 2024-12-15 covers DeliveryDate 12/16/2024, not 12/15/2024. Archive samples now include days in 2024-12 and in 2025-05, 2025-06, 2025-07, 2025-09, 2025-10, and 2025-11. Those files are samples, not a full day. NP4-180-ER and NP6-785-ER are absent from that catalog and still GATE. The OpenAPI file URL and credentials are still GATE. Internal pack use is owner-approved. Commercial App Store redistribution is not authorized.
- Authenticate with the documented token and subscription key. Credentials stay out of packs, the app, and saves.
- Ingest DA and RT settlement coverage for every selected proxy point for every civil day from 2021-02-01 through 2025-12-31.
- Rights lock: `terms_accepted_internal_use_only` (Austin and coworkers, not for sale). Commercial App Store redistribution is not authorized. Retained batches are not a completed price ingest for the fictional sites.
- Assign validated settlement point IDs. The four sites in `Config/proxy-sites.json` are fictional and have null point IDs.
- Fill `TX_TRAIN_2019_2020` with hub-level 2019–2020 DA/RT SPP, still labeled training-only, or keep the retirement rule on an explicit empty archive.
- Ancillary-service prices are not selected. Release 1 is energy-only (§4, §20, §28.2). The gate checks AS families only when the manifest selects them.

Report IDs `NP4-190-CD`, `NP6-905-CD`, `NP4-180-ER`, and `NP6-785-ER` are the spec's product labels (§5.1, §30). They are not URLs.

## What this commit does not do

No offer ticket logic, settlement math, plant physics, Lens, Fund II, regulation screens, graphics system, or seven-role UI.
