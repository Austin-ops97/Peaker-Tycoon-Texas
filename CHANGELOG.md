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

### Batch 7 on the retained read path (not coverage complete)

`RetainedSettlementArchive` now opens verified price zips in `batch7` as well as `batch2` through `batch6`. The path still checks the `.sha256` sidecar, inflates the CSV member, and parses it. It does not fetch and does not publish. The batch 7 NP6 zip posted 2022-11-15 11:45 has DeliveryDate 11/15/2022, hour 12, interval 3. `claims_complete_source_coverage` stays false.

### Desk source sample cycle (not trading)

The Desk SOURCE strip shows one retained day-ahead hub row at a time. Chevron buttons and dots cycle Houston on 2021-02-10 (24.14 $/MWh), North on 2021-02-10 (27.18 $/MWh), and West on 2021-04-15 (18.87 $/MWh), each hour ending 01:00. Those decimals are copied from retained NP4 archive rows. The thumb button stays Review today’s plan. Coverage claims are unchanged.
