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
- Adapter notes at `Data/docs/ercot-adapter-pins.md`. Documents the public product-list URL and EMIL pages. Does not pin price artifact paths, secrets, or point IDs.

### Gates

`campaign_chronology` and `five_year_coverage_gate` fail on the published stub. That is intentional. Phase 0 is not done per §31.3 until those tests pass on ingested coverage.

### Ambiguities (§31.4)

- The coverage sentence in §26.3 names AS price families. §28.2 keeps ancillary-service revenue out of release 1. The manifest selects no AS family, and the gate requires full AS days only when a family is selected. No AS series was invented.
- `campaign_chronology` can be checked on a generated calendar without prices. The golden test reads the published pack's `operating_days`, which is empty, so the golden test stays red until real coverage exists. A separate kernel test checks the generated calendar.
- ERCOT hour-ending numbering on DST days is not fully specified as a wire format here. The validator rejects a missing `dst_flag_raw` on a Chicago fall-back civil day and does not guess an ERCOT hour-ending code.
- §24.1 names a Web Worker and IndexedDB. R1 hosting is the iPhone app. The kernel stays free of I/O and UI so a later host can embed it. IndexedDB and Vite were not scaffolded.

### Not claimed

No SOURCE prices, settlement point IDs, pinned API paths, or publication timestamps.

### Rights lock (not an ingest)

Coverage manifest `rights_status` is `terms_accepted_internal_use_only`. Austin accepted the Data Portal terms for an internal build (Austin and coworkers; the game is not for sale). Commercial App Store redistribution is not authorized. Credentials stay out of git. `source_batch_count` remains 0.
