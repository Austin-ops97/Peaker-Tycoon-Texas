# ERCOT retain — batch 2 (2026-09-24)

Second SOURCE drop, kept beside the first retain in `Data/archives/ercot/2026-09-24/`. Every file in READY’s `file=` / `sha256=` list matched its sidecar and its bytes before it was copied. Four syntax bodies are not in that READY list; each matched its own sidecar and is kept as the query-syntax proof. JSON listings, schemas, and artifact pages are not price-instance batches. No subscription key, password, username, or bearer token is in these files. `card_key_names_used` in `download-meta.json` is `[redacted]`.

READY timestamp (America/Chicago): 2026-09-24 11:52:42 CT. Part A fix: 2026-09-24 11:54:29 CT. Token HTTP status recorded there was 200. No 401, 403, or 429 on the final responses. NP4-180-ER and NP6-785-ER were not requested.

`source_batch_count` adds only the six verified NP6 price-instance zips. With batch 1’s six zips, the manifest total is 12.

## Query syntax (proven from retained bodies)

Working artifact query, both products:

`deliveryDateFrom={date}&deliveryDateTo={date}`

Later pages add `&page=N`. The saved page-3 DAM body for 2025-02-15 has `_meta.currentPage` 3 and the same From/To pair.

Bare `deliveryDate=` is rejected. The retained `*syntax_eq*` files are HTTP 400, `BAD_REQUEST`, message “One or more of the query parameters specified are not available for this resource,” `data: ["deliveryDate"]`.

| File | SHA-256 | What it is |
| --- | --- | --- |
| `np4-190-cd-dam_stlmnt_pnt_prices__syntax_eq__2025-12-31.json` | `73d9b440fd97600386504dc065082446a28a65c27165a9b226525a16e72fe579` | NP4 400 for `deliveryDate=` |
| `np6-905-cd-spp_node_zone_hub__syntax_eq__2025-12-31.json` | `8c23f62922b3b94b16744d739dd10ae1aba7029103316e47e4a9fed839d8d213` | NP6 400 for `deliveryDate=` |
| `np4-190-cd-dam_stlmnt_pnt_prices__syntax_from_to__2025-12-31.json` | `e03d59d79c0fbf3e53c4d509987b5dd88eab4ad29911f250f19739cb5b1b4cc3` | Same bytes as NP4 2025-12-31 page 1 |
| `np6-905-cd-spp_node_zone_hub__syntax_from_to__2025-12-31.json` | `4684126c0433da5a327e6b5a377beceae756ef6a441ed0daad828e1bf4659c4c` | Same bytes as NP6 2025-12-31 page 1 |

`download-meta.json` also lists six earlier `deliveryDate=` 400 SHA-256 values under `artifact_queries_false_positive_eq_400`. Those blobs are not in this folder. The page files that are here are the later From/To responses, not those 400 bodies.

## Artifact row samples (page cap 3)

Each non-empty page holds 1000 `data` rows. Totals below are `_meta.totalRecords` / `_meta.totalPages` on the retained pages. These pages are not full-day files and are not counted in `source_batch_count`.

| Product | deliveryDateFrom/To | totalRecords | totalPages | Pages retained |
| --- | --- | ---: | ---: | --- |
| NP4-190-CD | 2025-12-31 | 25848 | 26 | 1–3 |
| NP4-190-CD | 2025-02-15 | 23352 | 24 | 1–3 |
| NP6-905-CD | 2025-12-31 | 104544 | 105 | 1–3 |
| NP6-905-CD | 2025-02-15 | 94560 | 95 | 1–3 |
| NP4-190-CD | 2021-02-15 | 0 | 0 | page 1, `data` empty |
| NP6-905-CD | 2021-02-15 | 0 | 0 | page 1, `data` empty |

GATE: 2021-02-15 is empty on the live artifact API for both products when queried with `deliveryDateFrom` / `deliveryDateTo`. Early-campaign days need the archive `?download=<docId>` path, or the still-absent ER products. From/To alone does not supply that day.

SHA-256 for the row and empty pages is the READY list copied into this folder as `<file>.sha256`.

## NP6 archive paging

Archive page requests used `?page=N` (`download-meta.json` records `https://api.ercot.com/api/public-reports/archive/np6-905-cd?page=2`, and that body’s `_meta.currentPage` is 2). `pageSize` is 1000. Sort on these pages is `postDatetime: DESC`.

- Page 26 is the first probed page whose posts reach on or before 2025-12-31. Oldest post `2025-12-26T07:32:01`, newest `2026-01-05T17:17:01`. 546 of 1000 posts fall in 2021-02-01 through 2025-12-31.
- Page 197 is still inside February 2021. Oldest `2021-02-09T02:32:04.115`, newest `2021-02-19T12:02:04.334`. All 1000 posts on that page fall in the campaign window.

Other probe pages (2, 13, 20, 23, 25, 27, 54, 57, 109, 127, 178, 191, 204, 218, 230) are retained as listings. SHA-256 values are in READY and the sidecars.

## Six in-range NP6 zips (these increment the batch count)

Each zip has one CSV. Header: `DeliveryDate`, `DeliveryHour`, `DeliveryInterval`, `SettlementPointName`, `SettlementPointType`, `SettlementPointPrice`, `DSTFlag`. Each file is one hour and one interval, not a full day. Delivery stamps are inside 2021-02-01 through 2025-12-31. They are campaign-adjacent samples for those stamps. They are not proxy-point coverage. The September 2026 batch 1 RT zips stay pipeline proof and are not coverage days.

| Zip | docId | postDatetime | DeliveryDate | Hour / interval | Data rows | SHA-256 |
| --- | --- | --- | --- | --- | ---: | --- |
| inst1 `…20251215_2130_csv.zip` | 1171744358 | 2025-12-15T21:32:01 | 12/15/2025 | 22 / 2 | 1089 | `2914037dca57e1d241571aaf0f66b73897a2e975e80eb7eaa27f8707f2bc2790` |
| inst2 `…20210209_0230_csv.zip` | 757717538 | 2021-02-09T02:32:04.115 | 02/09/2021 | 3 / 2 | 725 | `92ac0bf995dab0c0abd8c5274f6523fce6133d4cb793c4b4a1b941380fec4210` |
| inst3 `…20251231_2345_csv.zip` | 1177533089 | 2025-12-31T23:47:01 | 12/31/2025 | 24 / 3 | 1089 | `95769073d69168da6a45ed6e6f538af369175bf32e441c56a67923104feea769` |
| inst4 `…20251231_2330_csv.zip` | 1177529812 | 2025-12-31T23:32:01 | 12/31/2025 | 24 / 2 | 1089 | `c92dbbae05987ff6daffe4cd9bc9a4803a0764b5965653f926a5b7d47c6be4b0` |
| inst5 `…20251231_2315_csv.zip` | 1177524979 | 2025-12-31T23:17:01 | 12/31/2025 | 24 / 1 | 1089 | `2185619ddf1f9e3f6dc8232c2e5d08e6c68eed37d93c029707f2b8f31f9dd157` |
| inst6 `…20250216_1900_csv.zip` | 1078358046 | 2025-02-16T19:02:04 | 02/16/2025 | 19 / 4 | 985 | `41fe05f856cdf2c2cd47694224869f563ebe872a60f292bc088fd5bcb93ff8e8` |

inst2 is a 2021-02-09 sample inside the Uri window. It does not fill 2021-02-15, which is still empty on the artifact API.

## NP4 archive listings, pages 2–5

Listings only. No NP4 instance zip was downloaded in this drop. `totalRecords` on these pages is 4529.

| Page | Archives | Oldest post | Newest post | SHA-256 |
| --- | ---: | --- | --- | --- |
| 2 | 1000 | 2021-04-03T12:33:43 | 2023-12-27T12:34:48 | `a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908` |
| 3 | 1000 | 2018-07-08T12:31:58 | 2021-04-02T12:33:15 | `15cefe81cb08bf541e550468a4ea67c8f9d21695635bef1fb718d6acba49802a` |
| 4 | 1000 | 2015-10-12T13:01:31 | 2018-07-07T12:26:46 | `a07533ad983656c181c1fd5b4fc94a667c1fc45a2021aa9b723abb5a07edf988` |
| 5 | 529 | 2014-05-01T12:59:25 | 2015-10-11T13:03:30 | `3f805150d725072a352b32995483573b3555435ea90d3bb26f513e58804aa6d4` |

## Settlement point strings

`observed-settlement-point-names.txt` lists distinct strings seen in the six NP6 zip CSVs (1121 names) and in the non-empty artifact JSON pages (1082 DAM names and 1082 RT names on pages 1–3 only). They are not assigned to Bayou Bend, Prairie Junction, Mesquite Ridge, or Red Mesa. Proxy `source_point_id` stays null. Proxy `covered_local_dates` stay empty.

## Not claimed

Five-year coverage is not complete. September 2026 batch 1 RT samples are not coverage days. 2021-02-15 is not present on the artifact API. NP4-180-ER and NP6-785-ER stay absent. No Public API path is invented for them.
