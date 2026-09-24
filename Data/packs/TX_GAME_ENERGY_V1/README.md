# TX_GAME_ENERGY_V1 coverage manifest

This directory is the in-repo published manifest path for the Phase 0 five-year gate (§5, §27.1).

`coverage-manifest.json` is still a **GATE** document. It names the campaign era and the fictional proxy sites. `source_batch_count` is 63 because sixty-three price-instance zips verified (6 + 6 + 13 + 24 + 14 in `Data/archives/ercot/2026-09-24/batch5/`). That count is not five-year coverage. September 2026 RT samples are not coverage days. Live From/To is empty for 2021-02-15, 2021-04-15, 2021-08-15, 2022-02-15, 2022-07-15, 2023-01-15, 2023-04-15, and 2023-08-15. Proxy `source_point_id` values stay null. `operating_days` stays empty.

A read path (`RetainedSettlementArchive`) can open the verified batch2–batch5 price zips and parse them. That is retained samples only, not complete coverage. Live From/To for 2021-04-15, 2022-07-15, 2023-01-15, and 2023-04-15 is still empty.

`claims_complete_source_coverage` is `false`. `rights_status` is `terms_accepted_internal_use_only` (internal packs for Austin and coworkers; not for sale). Commercial App Store redistribution is not authorized. `five_year_coverage_gate` and `campaign_chronology` stay fail-closed until every selected proxy has a point ID and every campaign day is present, and until every source product status is `ingested`.

`pinned_api_path` for NP4-190-CD and NP6-905-CD is still the artifact href copied from the 2026-09-24 catalog extract. Those rows are `partial_batches_retained`. NP4-180-ER and NP6-785-ER are `absent_from_public_reports_catalog` with a null path. Archive hrefs and the retained SHA list are in `Data/docs/ercot-adapter-pins.md` and `Data/archives/ercot/2026-09-24/RETENTION.md`. The three RT zips are 2026-09-24 posts, outside campaign end 2025-12-31, and are pipeline proof rather than campaign days.
