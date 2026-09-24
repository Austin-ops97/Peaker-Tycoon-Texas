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
