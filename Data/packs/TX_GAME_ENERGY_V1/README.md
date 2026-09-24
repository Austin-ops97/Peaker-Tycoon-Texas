# TX_GAME_ENERGY_V1 coverage manifest

This directory is the in-repo published manifest path for the Phase 0 five-year gate (§5, §27.1).

`coverage-manifest.json` is a **GATE stub**. It names the campaign era and the fictional proxy sites. It does not contain ERCOT settlement prices, settlement point IDs, pinned API paths, or publication times.

`claims_complete_source_coverage` is `false`. `rights_status` is `terms_accepted_internal_use_only` (internal packs for Austin and coworkers; not for sale). Commercial App Store redistribution is not authorized. `five_year_coverage_gate` and `campaign_chronology` fail until a real ingest replaces this file with a pack that has `source_batch_count > 0`, validated point IDs, and every campaign day present.

`pinned_api_path` for NP4-190-CD and NP6-905-CD is the artifact href copied from the 2026-09-24 catalog extract. Those rows are `pinned_not_ingested`. NP4-180-ER and NP6-785-ER are `absent_from_public_reports_catalog` with a null path. Archive hrefs are in `Data/docs/ercot-adapter-pins.md` because this manifest has no archive field. No price bytes are in this directory.
