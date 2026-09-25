# Changelog

## Unreleased — Phase 0 scaffold (not the §27.1 exit)

Spec sections touched: §1 (platform overridden), §2.1 chronology and bootstrap rule, §5 ingestion contract and manifest, §6 fictional sites and proxy math, §8 clock and speed as placeholders only, §24 determinism, save schema, and RNG sub-streams, §25 Phase 0 schemas (Campaign, Role identity, pack/observation/save documents), §26.3 `campaign_chronology` and `five_year_coverage_gate`, §27.1, §31.

### Added

- Swift package `PeakerKernel`: civil campaign calendar (2021-02-01 through 2025-12-31, 1795 strictly increasing days), America/Chicago quarter-hour counts, seeded SplitMix64 sub-streams, save schema 3.0.0 that rejects v2, replay from seed plus input log, bootstrap retirement at 90 completed days, area-proxy weights.
- Swift package `PeakerData`: ingestion stages (fetch refusal, SHA-256 retain, validate, reconcile, publish), coverage manifest loader, gate evaluators.
- In-repo GATE manifest at `Data/packs/TX_GAME_ENERGY_V1/coverage-manifest.json` and empty `TX_TRAIN_2019_2020` layout.
- JSON schemas under `Schemas/phase0`.
- iPhone placeholder shell with four tabs (Desk, Fuel, Plant, Settle), evidence chips, deadline chips, interrupt tray, and audit-chain shell.
- Design inventory committed at `Design/Peaker-Tycoon-Texas/01-phone-first-screen-inventory-v1.md`.
- Adapter notes at `Data/docs/ercot-adapter-pins.md`. Documents the public product-list URL, catalog pins, and the first retained batch. Does not store secrets or fictional-site point IDs.

### Gates

`campaign_chronology` and `five_year_coverage_gate` fail on the published stub. That is intentional. Phase 0 is not done per §31.3 until those tests pass on ingested coverage.

### Ambiguities (§31.4)

- The coverage sentence in §26.3 names AS price families. §28.2 keeps ancillary-service revenue out of release 1. The manifest selects no AS family, and the gate requires full AS days only when a family is selected. No AS series was invented.
- `campaign_chronology` can be checked on a generated calendar without prices. The golden test reads the published pack's `operating_days`, which is empty, so the golden test stays red until real coverage exists. A separate kernel test checks the generated calendar.
- ERCOT hour-ending numbering on DST days is not fully specified as a wire format here. The validator rejects a missing `dst_flag_raw` on a Chicago fall-back civil day and does not guess an ERCOT hour-ending code.
- §24.1 names a Web Worker and IndexedDB. R1 hosting is the iPhone app. The kernel stays free of I/O and UI so a later host can embed it. IndexedDB and Vite were not scaffolded.

### Not claimed

No settlement point IDs for the fictional sites. No complete five-year SOURCE coverage. NP4-180-ER and NP6-785-ER still have no Public API path.

### Rights lock (not an ingest)

Coverage manifest `rights_status` is `terms_accepted_internal_use_only`. Austin accepted the Data Portal terms for an internal build (Austin and coworkers; the game is not for sale). Commercial App Store redistribution is not authorized. Credentials stay out of git. That commit left `source_batch_count` at 0. A later retain set it to 6 without claiming complete coverage.

### Catalog pin (not an ingest)

NP4-190-CD and NP6-905-CD `pinned_api_path` values are the artifact hrefs copied from the 2026-09-24 catalog extract (HTTP 200, 116 products, SHA-256 `59a7daaad4e8c64a1f5e6b808299ce43667c92d38c38fe27a4fb118975889789`). Archive hrefs are in the adapter notes. NP4-180-ER and NP6-785-ER are absent from that catalog; their paths stay null. No raw catalog JSON or tokens were added.

### Design handoff and first SOURCE retain (not coverage complete)

Control Glass v1 is committed at `Design/Peaker-Tycoon-Texas/02-phase1-shell-polish-control-glass-v1.md`. It is a design document only. No chrome tokens were applied to PeakerKernel, PeakerData, or the app.

Six verified price-instance zips, two artifact schemas, and two archive listings are under `Data/archives/ercot/2026-09-24/`, with sha256 sidecars and `RETENTION.md`. That commit set `source_batch_count` to 6. NP4-190-CD and NP6-905-CD status is `partial_batches_retained`. `claims_complete_source_coverage` stays false. The three RT zips are 2026-09-24 posts and are pipeline proof, not campaign days. ER products stay GATE.

### Clock bar no longer covers the desk

The clock bar is a `VStack` sibling above `TabView`, not a top `safeAreaInset`. Scroll content starts below the bar. The bar shows Central time only until a player zone is saved. Desk and Fuel deadline rows no longer say the twin is unset.

### Design 03 local time and light shell

`Design/Peaker-Tycoon-Texas/03-local-twin-and-vibe-pass-v1.md` and the light token JSON are in the repo. Settings stores `localTimeZoneIdentifier`. A one-time tip stores `localTwinTipDismissed` and does not return as a banner. Empty Desk, Fuel, Plant, and Settle copy matches that doc. Control Glass colors live in the app only. Coverage claims are unchanged.

### Batch 2 retain (still not coverage complete)

Six more NP6 price zips verified and landed in `Data/archives/ercot/2026-09-24/batch2/`. That commit moved `source_batch_count` from 6 to 12. Working artifact query is `deliveryDateFrom` and `deliveryDateTo` (`page` for later pages). Bare `deliveryDate` returned 400. 2021-02-15 is empty on both artifact endpoints. NP6 archive page 26 is the first probed page at or before 2025-12-31; page 197 is still in February 2021. The new zips’ delivery stamps are 2025-12-15, 2025-12-31 (three intervals), 2025-02-16, and 2021-02-09. They are samples, not proxy coverage. Point IDs stay null. ER products stay GATE.

### Batch 3 retain (still not coverage complete)

Thirteen more price zips verified and landed in `Data/archives/ercot/2026-09-24/batch3/` (6 NP6 Uri-window posts 2021-02-09 through 2021-02-19, and 7 NP4 archive posts 2021-02-09 through 2023-06-15). `source_batch_count` moved from 12 to 25. No zip was excluded. Live From/To is empty for 2021-08-15, 2022-02-15, and 2023-08-15 on both products. 2024-07-15 page samples are not full days. `claims_complete_source_coverage` stays false. ER products stay GATE.

### Settlement CSV parse (not coverage complete)

`ERCOTSettlementCSV` and `IngestionPipeline.parseRetainedSettlementCSV` turn retained NP4-190-CD and NP6-905-CD CSV bytes into `NormalizedObservation`. Settlement point names stay verbatim. `sourcePublishedAt` stays null. The helper validates and does not publish; a complete publish still requires `requestComplete: false` to succeed while publication times are missing. Zip inflate stays caller-owned. `claims_complete_source_coverage` stays false. `source_batch_count` stays 25. Proxy point ids and `covered_local_dates` stay empty.

### Shell clock scrub and Desk sample (not trading, not coverage)

Pause still holds the displayed GAME instant at the morning-brief anchor. 1×, 8×, and 32× add that many game seconds per real second in the app shell only. Until next decision matches 1× and pauses at the placeholder 10:00 CT chip. Reduce Motion still advances the digits, with no ornamental animation. The scrub does not call `CampaignKernel`. Desk shows a read-only card for bundled NP4 rows `HB_HOUSTON` 24.14 and `HB_NORTH` 27.18 ($/MWh, 2021-02-10 hour ending 01:00) when `market-sample-np4.csv` is in the app. There is no submit button. Coverage claims are unchanged.

### Design 04 iPhone nav clarity (stubs only)

`Design/Peaker-Tycoon-Texas/04-iphone-nav-clarity-v1.md` is the handoff. Tabs use filled icons plus plain names. Desk stacks Next up, then Today, then a muted retained-price sample. Each tab has one thumb-zone button. Fuel closed shows the four-marker silhouette and hides Confirm. Settle’s explainer stays in plain language. Settings adds a clock row, a searchable zone list, and “Use my phone’s time zone.” A three-beat coach sits under the clock and can be replayed from Settings. Coverage claims are unchanged.

### Batch 4 retain (still not coverage complete)

Twenty-four more price zips verified and landed in `Data/archives/ercot/2026-09-24/batch4/` (10 NP6 mid-campaign landmarks, each one interval, and 14 NP4 archive posts 2021-05-16 through 2025-09-15). `source_batch_count` moved from 25 to 49. No zip was excluded. Live From/To is empty for 2023-01-15 on both products. Page samples for 2025-06-15, 2024-10-15, and 2024-01-15 are not full days. `claims_complete_source_coverage` stays false. ER products stay GATE.

### Retained zip read path (not coverage complete)

`RetainedSettlementArchive` opens verified price zips in `batch2`, `batch3`, and `batch4`, checks the `.sha256` sidecar, inflates the CSV member, and parses it with the existing NP4/NP6 parser. It does not fetch and does not publish. 2023-01-15 stays an empty live From/To day. `claims_complete_source_coverage` stays false.

### Batch 5 retain (still not coverage complete)

Fourteen more price zips verified and landed in `Data/archives/ercot/2026-09-24/batch5/` (7 NP4 archive posts 2021-02-14 through 2022-07-16, and 7 NP6 intervals). `source_batch_count` moved from 49 to 63. No zip was excluded. Live From/To is empty for 2021-04-15, 2022-07-15, and 2023-04-15 on both products. Nearby archive zips do not fill those days: NP4 delivery dates are the next civil day, and each NP6 zip is one interval. `claims_complete_source_coverage` stays false. ER products stay GATE.

### Batch 5 on the retained read path (not coverage complete)

`RetainedSettlementArchive` now opens verified price zips in `batch5` as well as `batch2`, `batch3`, and `batch4`. The path still checks the `.sha256` sidecar, inflates the CSV member, and parses it. It does not fetch and does not publish. The batch 5 NP4 zip posted 2021-02-14 covers DeliveryDate 02/15/2021, not a live From/To fill of an empty day. `claims_complete_source_coverage` stays false.

### Retained sample inventory (not coverage complete)

`RetainedSampleInventory` reads verified batch2–batch5 price zips and lists CSV delivery dates per NP4-190-CD and NP6-905-CD. The list is written to `Data/archives/ercot/2026-09-24/retained-sample-inventory.json` and `.md`. It does not fetch, does not publish, and does not fill proxy `covered_local_dates`. Live From/To stays empty for 2021-04-15, 2022-07-15, 2023-01-15, and 2023-04-15. NP4-180-ER and NP6-785-ER stay absent. `claims_complete_source_coverage` stays false.

### Batch 6 retain (still not coverage complete)

Twenty-five more price zips verified and landed in `Data/archives/ercot/2026-09-24/batch6/` (14 NP4 archive posts 2021-04-14 through 2024-01-14, and 11 NP6 intervals). `source_batch_count` moved from 63 to 88. No zip was excluded. Live From/To is empty for 2022-11-15 on both products. Archive delivery dates in this drop include 2021-04-15, 2022-07-15, 2023-01-15, and 2023-04-15. Each NP6 file is one interval. `claims_complete_source_coverage` stays false. ER products stay GATE.

### Batch 6 on the retained read path (not coverage complete)

`RetainedSettlementArchive` now opens verified price zips in `batch6` as well as `batch2` through `batch5`. The path still checks the `.sha256` sidecar, inflates the CSV member, and parses it. It does not fetch and does not publish. The batch 6 NP4 zip posted 2021-04-14 has DeliveryDate 04/15/2021. `claims_complete_source_coverage` stays false.

### Sample inventory includes batch 6 (not coverage complete)

`RetainedSampleInventory` now scans batch6 with batch2–batch5. The JSON and markdown artifacts list 42 day-ahead files and 40 real-time files. Live From/To empty in this drop is 2022-11-15. Archive samples now include 2021-04-15, 2022-07-15, 2023-01-15, and 2023-04-15. Settings → Evidence reads the bundled copy, so the saved-price counts follow those files. `claims_complete_source_coverage` stays false.

### Settings sample stub (not coverage complete)

Settings → Evidence shows a read-only row, Saved price samples, and a detail page with day-ahead and real-time file counts from the bundled inventory. The row says coverage is incomplete. Real-time dates are described as short samples. Empty live-fetch days and reports missing from the public catalog are one sentence each. There is no new thumb-zone button. `claims_complete_source_coverage` stays false.

### Batch 7 retain (still not coverage complete)

Twenty-four more price zips verified and landed in `Data/archives/ercot/2026-09-24/batch7/` (12 NP4 archive posts 2021-10-14 through 2024-08-14, and 12 NP6 intervals). `source_batch_count` moved from 88 to 112. No zip was excluded. Live From/To is empty for 2023-10-15 on both products. Two NP6 intervals have DeliveryDate 2022-11-15 (hour 12, intervals 3 and 4). The NP4 zip posted 2023-10-14 covers DeliveryDate 10/15/2023. The NP4 zip posted 2023-10-15 covers 10/16/2023. Each NP6 file is one interval. `claims_complete_source_coverage` stays false. ER products stay GATE. The read path still opens batch2 through batch6 only.

### Sample inventory includes batch 7 (not coverage complete)

`RetainedSampleInventory` now scans batch7 with batch2–batch6. The JSON and markdown artifacts list 54 day-ahead files and 52 real-time files (54 and 46 delivery dates). Live From/To empty in this drop is 2023-10-15. The day-ahead file posted 2023-10-14 has that delivery date. There is no real-time interval for 2023-10-15. Archive samples now include two real-time intervals on 2022-11-15. Settings → Evidence reads the bundled copy, so the saved-price counts follow those files. `claims_complete_source_coverage` stays false.

### Batch 7 on the retained read path (not coverage complete)

`RetainedSettlementArchive` now opens verified price zips in `batch7` as well as `batch2` through `batch6`. The path still checks the `.sha256` sidecar, inflates the CSV member, and parses it. It does not fetch and does not publish. The batch 7 NP6 zip posted 2022-11-15 11:45 has DeliveryDate 11/15/2022, hour 12, interval 3. `claims_complete_source_coverage` stays false.

### Desk source sample cycle (not trading)

The Desk SOURCE strip shows one retained day-ahead hub row at a time. Chevron buttons and dots cycle Houston on 2021-02-10 (24.14 $/MWh), North on 2021-02-10 (27.18 $/MWh), and West on 2021-04-15 (18.87 $/MWh), each hour ending 01:00. Those decimals are copied from retained NP4 archive rows. The thumb button stays Review today’s plan. Coverage claims are unchanged.

### Batch 8 retain (still not coverage complete)

Thirty-two more price zips verified and landed in `Data/archives/ercot/2026-09-24/batch8/` (12 NP4 archive posts 2022-06-13 through 2025-05-14, and 20 NP6 intervals). `source_batch_count` moved from 112 to 144. No zip was excluded. This drop recorded no new empty live From/To day. Five NP6 zips have DeliveryDate 2023-10-15. The filename stamp 2023-10-15 00:00 has DeliveryDate 2023-10-14, hour 24 interval 4. Each NP6 file is one interval. `claims_complete_source_coverage` stays false. ER products stay GATE. The read path still opens batch2 through batch7 only.

### Sample inventory includes batch 8 (not coverage complete)

`RetainedSampleInventory` now scans batch8 with batch2–batch7. The JSON and markdown artifacts list 66 day-ahead files and 72 real-time files (66 and 53 delivery dates). The latest retain recorded no new empty live From/To day. 2023-10-15 moves to the earlier-empty list because archive samples now include real-time intervals on that delivery date (hour 12 intervals 3 and 4, hour 7 interval 3, hour 17 interval 3, and hour 24 interval 3). The filename stamp 2023-10-15 00:00 stays on 2023-10-14. Settings → Evidence reads the bundled copy. `claims_complete_source_coverage` stays false.

### Batch 8 on the retained read path (not coverage complete)

`RetainedSettlementArchive` now opens verified price zips in `batch8` as well as `batch2` through `batch7`. The path still checks the `.sha256` sidecar, inflates the CSV member, and parses it. It does not fetch and does not publish. The batch 8 NP6 zip posted 2023-10-15 11:45 has DeliveryDate 10/15/2023, hour 12, interval 3 (`HB_SOUTH` -3.31). `claims_complete_source_coverage` stays false.

### Desk source sample cycle includes later years (not trading)

The same one-row strip now also cycles Houston on 2022-07-15 (43.75 $/MWh), North on 2023-10-15 (22.41 $/MWh), and West on 2024-08-15 (20.02 $/MWh), hour ending 01:00. Those decimals were copied from retained NP4 zips after the sidecar matched. The thumb button stays Review today’s plan. Coverage claims are unchanged.

### Desk hub names and Evidence date span (not trading)

The Desk sample card still shows the settlement code and adds Houston, North, South, or West under `HB_HOUSTON`, `HB_NORTH`, `HB_SOUTH`, and `HB_WEST`. Other codes stay code-only. Settings → Evidence, under “Coverage is incomplete.”, shows the earliest and latest delivery dates in the bundled inventory. File counts stay on the detail page. `claims_complete_source_coverage` stays false.

### Desk plan button opens the selected sample (not trading)

Review today’s plan still uses that title. It opens a read-only sheet for the hub row currently on the strip: friendly name, settlement code, delivery date, hour ending, and the sample price. The sheet says “Retained sample — not live.” Done, the drag indicator, and a swipe dismiss it and return to Desk. Reduce Motion turns off the present animation. The six-row cycle is unchanged. Nothing on the sheet confirms, trades, or submits. `claims_complete_source_coverage` stays false.

### Fuel, Plant, and Settle empty lines (not trading)

Each tab keeps one thumb button and a shorter lead. Fuel: “Nomination isn’t open right now, so this screen only shows the day’s timeline.” The four gas-day markers and the closed verdict stay, and Confirm stays off. Plant: “State, power output, and fuel flow stay blank until a reading is connected.” Those three fields stay blank. Settle: “Statements show up here after the day settles.” The empty line is still “No statements yet.” and the sheet is still “How settlement works.” Settings → Your local time zone still opens the time zone picker.

### First-launch coach (not trading)

The three tips under the clock now teach the four tabs, the Desk sample arrows, and the read-only plan sheet. Got it advances. Not now dismisses the current tip and holds the rest of the session. Settings → Show navigation tips plays them again. The local-time tip still comes first. The card stays in the chrome band.

### Evidence copy for a new player (not a coverage claim)

Settings → Evidence now says saved samples are a partial history and the campaign is not fully filled. The row still shows the delivery-date span, and it adds that some settlement reports are not available yet. The detail page still lists the day-ahead and real-time file counts. A real-time date is still a short sample, not a full day. `claims_complete_source_coverage` stays false.

### Desk sample caption (not a live market)

Under the Desk hub arrows, a muted line says “These are retained historical samples, not a live market.” It stays in the scroll content while the hubs cycle. The thumb button is unchanged. `claims_complete_source_coverage` stays false.

### Settings section headers (not a behavior change)

Settings home groups the existing rows under Local time, Tips, and Evidence. The time-zone picker, the two tip buttons, and the saved-sample sentences are unchanged. Closing Settings still returns to Desk with no extra banner.

### Fuel closed timeline (not a nomination)

Fuel says the tab is waiting and nomination isn’t open yet. The four gas-day markers and the button See gas day timeline stay. Confirm stays off. The old “Verdict unavailable” line is now “No result yet — nomination is still closed.”

### Plant waiting for a reading (not dispatch)

Plant says it is waiting for a connected reading, and that this is not a live dispatch. State, MW, and fuel flow stay blank. The button stays View unit status. The card still has no prices.

### Settle waiting for a statement (not a live settle)

Settle says the tab is waiting, statements aren’t ready yet, and this isn’t a live settle. The empty line is still “No statements yet.” The sheet still explains money in and money out, and it says none is ready yet. The button stays How settlement works.

### VoiceOver hints on the shell (not a copy change)

Tab names stay Desk, Fuel, Plant, and Settle, with a short hint after each name. The hub arrows, the sample caption, the four thumb buttons, the Fuel, Plant, and Settle leads, the Settings tip rows, and the coach buttons Got it and Not now now have hints. Visible sentences are unchanged. Got it and Not now are separate VoiceOver controls.

### Larger text reflow (not a copy change)

At accessibility text sizes the clock and coach scroll in a band above the tabs, so they do not cover Desk or the thumb button. The clock and speed chip stack, thumb-button titles wrap, hub dots can drop under the arrows, and the plan and settlement sheets scroll. Default text size keeps the clock on one row beside the speed chip. Visible sentences are unchanged.

### Desk line after the coach (not a second tour)

After Got it finishes the three tips, or after Not now, Desk shows “Next, use the arrows to cycle saved hubs, or open Review today’s plan.” It sits in the Desk scroll under Next up. It hides again while a tip is on screen, including Settings → Show navigation tips. The thumb button and the clock stay where they were.

### Design 05 empty-lead calm and Reduce Motion (not trading)

Next up, Gas day, Plant, and Settlement use a muted teal bar and a title2 title. Next up no longer says you are on the trading desk. Fuel’s lead is “Nomination isn’t open right now. You can still see today’s timeline.” Plant’s lead is “Read-only unit status. State, power, and fuel flow show here when live.” Settle’s lead is “Statements show up here after the day settles.” Each of those three tabs has a quiet next line pointing at its existing button. When Reduce Motion is on, coach, tips, and sheets appear and leave without a slide, and tab changes are instant. The post-coach Desk line is unchanged. `claims_complete_source_coverage` stays false.

### Waiting lines use the same action as the thumb button

“Next, See gas day timeline.” scrolls to the four markers. “Next, View unit status.” scrolls to State, MW, and fuel flow. “Next, How settlement works.” opens the same explanation sheet. Visible sentences are unchanged. Desk is unchanged.

### Batch 11 retain (not coverage)

Thirty more price zips verified and landed in `Data/archives/ercot/2026-09-24/batch11/` (14 NP4 archive posts 2024-12-13 through 2025-11-15, and 16 NP6 intervals). `source_batch_count` moved from 199 to 229. No zip was excluded. This drop recorded no live From/To day with `totalRecords` 0. 2024-12-15 and 2025-09-15 From/To pages have rows; only pages 1–3 were retained. The NP4 zip posted 2025-09-14 covers DeliveryDate 09/15/2025. The NP4 zip posted 2024-12-15 covers DeliveryDate 12/16/2024, not 12/15/2024. Two NP6 intervals have DeliveryDate 2024-12-17 (hour 12 interval 3 and hour 13 interval 3). The NP6 filename stamp 2025-10-15 04:30 has DeliveryDate 10/15/2025, hour 5 interval 2. Archive samples now include days in 2024-12 and in 2025-05, 2025-06, 2025-07, 2025-09, 2025-10, and 2025-11. Each NP6 file is one interval. `claims_complete_source_coverage` stays false. ER products stay GATE. The read path still opens batch2 through batch10 only.

### Batch 10 sample inventory (not coverage)

`RetainedSampleInventory` now scans batch10 with batch2–batch9. The JSON and markdown artifacts list 89 day-ahead files and 104 real-time files (89 and 75 delivery dates). Live From/To empty in this drop is 2021-03-15. No day-ahead hours are retained for that date. Two real-time intervals are (hour 12, intervals 3 and 4). 2023-06-15 moves to the earlier archive-sample list. Settings → Evidence reads the bundled copy. `claims_complete_source_coverage` stays false.

### Batch 10 read path (not coverage)

`RetainedSettlementArchive` now opens verified price zips in `batch10` as well as `batch2` through `batch9`. The path still checks the `.sha256` sidecar, inflates the CSV member, and parses it. It does not fetch and does not publish. The batch 10 NP6 zip posted 2021-03-15 11:45 has DeliveryDate 03/15/2021, hour 12 interval 3 (`HB_HOUSTON` 17.5). `claims_complete_source_coverage` stays false.

### Batch 10 retain (not coverage)

Twenty-eight more price zips verified and landed in `Data/archives/ercot/2026-09-24/batch10/` (12 NP4 archive posts 2021-08-13 through 2024-07-14, and 16 NP6 intervals). `source_batch_count` moved from 171 to 199. No zip was excluded. Live From/To is empty for 2021-03-15 on both products. No NP4 zip in this drop has DeliveryDate 03/15/2021. Two NP6 intervals have DeliveryDate 2021-03-15 (hour 12, intervals 3 and 4). The NP4 zip posted 2024-07-14 covers DeliveryDate 07/15/2024. The NP6 filename stamp 2024-11-15 23:45 has DeliveryDate 11/15/2024, hour 24 interval 3. 2025-04-15 From/To pages have rows; only pages 1–3 were retained. Months 2024-12 and 2025-05, 2025-06, 2025-07, 2025-09, 2025-10, and 2025-11 were not recorded as live From/To empty in this drop. Each NP6 file is one interval. `claims_complete_source_coverage` stays false. ER products stay GATE. The read path still opens batch2 through batch9 only.

### Fuel closed readout from saved day-ahead rows (not a nomination)

When the bundled day-ahead sample has rows, Fuel’s lead is “Nomination is closed. These saved days have no publication time.” The four markers stay. The card lists those delivery dates, says the publication time isn’t saved, and says it is not a gas volume. Confirm stays off. With no rows, the Design 05 lead stays. Settle still says “No statements yet.” The price files are not a statement. Desk’s sample card and plan sheet add “Hub price”, “Not a repeated hour.”, and “No publication time saved with this row.” from the parsed fields. `claims_complete_source_coverage` stays false.

### Batch 9 sample inventory (not coverage)

`RetainedSampleInventory` now scans batch9 with batch2–batch8. The JSON and markdown artifacts list 77 day-ahead files and 88 real-time files (77 and 63 delivery dates). Live From/To empty in this drop is 2023-06-15. The day-ahead hours on that date come from the earlier batch 8 file. No real-time interval is retained for 2023-06-15. Two new real-time intervals have DeliveryDate 2022-02-15 (hour 12, intervals 3 and 4). Settings → Evidence reads the bundled copy. `claims_complete_source_coverage` stays false.

### Batch 9 read path (not coverage)

`RetainedSettlementArchive` now opens verified price zips in `batch9` as well as `batch2` through `batch8`. The path still checks the `.sha256` sidecar, inflates the CSV member, and parses it. It does not fetch and does not publish. The batch 9 NP4 zip posted 2024-11-14 has DeliveryDate 11/15/2024, hour ending 01:00 (`HB_HOUSTON` 12.03). `claims_complete_source_coverage` stays false.

### Batch 9 retain (not coverage)

Twenty-seven more price zips verified and landed in `Data/archives/ercot/2026-09-24/batch9/` (11 NP4 archive posts 2022-09-14 through 2025-12-14, and 16 NP6 intervals). `source_batch_count` moved from 144 to 171. No zip was excluded. Live From/To is empty for 2023-06-15 on both products. No zip in this drop has DeliveryDate 06/15/2023. Two NP6 intervals have DeliveryDate 2022-02-15 (hour 12, intervals 3 and 4). The NP4 zip posted 2024-11-14 covers DeliveryDate 11/15/2024. 2024-11-15 From/To pages have rows; only pages 1–3 were retained. Each NP6 file is one interval. `claims_complete_source_coverage` stays false. ER products stay GATE. The read path still opens batch2 through batch8 only.

### Plant unit status from a game-physics sample (not a meter, not trading)

Design 06 is at `Design/Peaker-Tycoon-Texas/06-plant-unit-status-retained-v1.md`. Plant stays on the Design 05 empty lead and blank State, MW, and fuel flow when no reading is passed in. The shell passes `PlantUnitReading.gamePhysicsSample`: Online, 48 MW, and 480 MMBtu/h. Those two figures use a documented heat rate of 10 MMBtu per MWh. The lead is “Unit status · read-only”. Each field has a GAME chip. Derated, when set, is a caption under State, not a fourth field. View unit status still scrolls to the card and now also opens the read-only explainer. The waiting line uses that same action. There are no prices. `claims_complete_source_coverage` stays false.
