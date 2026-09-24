# ERCOT retain — 2026-09-24 supervisor drop

First SOURCE batch. This folder stores the raw bytes from that drop after each file’s SHA-256 matched both its sidecar and `READY.md`. It is not five-year coverage. It does not assign settlement point IDs to the fictional sites. No subscription key, password, username, or bearer token is in these files.

READY timestamp (America/Chicago): 2026-09-24 11:47:42 CT. Token HTTP status recorded there was 200. Rate policy recorded there was about 2.2 seconds between requests. No 401, 403, or 429 on the final responses. NP4-180-ER and NP6-785-ER were not requested.

`download-meta.json` is the drop’s provenance record. It sets `id_token_used` to true and does not contain a token string. SHA-256 of the retained copy: `f08de017233df7d20f1b1269c2733f04271343ac1fa08f7fe3b65a2724eb942f`.

`source_batch_count` counts verified **price-instance zips** only. That integer is 6 (3 DAM + 3 RT). Schemas and archive listings are retained beside them and are not part of the count.

## SHA-256 (matches READY and sidecars)

| SHA-256 | Bytes | File |
| --- | ---: | --- |
| `739d2b7bbe16813a0993a502a41879bbac7fbb6f1fa67231f8f7aa645a2c4814` | 1037 | `api-public-reports-np4-190-cd-dam_stlmnt_pnt_prices.json` |
| `0f97b6a116fc18d62d456804d48e55e7925dd3c2d780651509a5608536aa7e94` | 208162 | `api-public-reports-archive-np4-190-cd.json` |
| `dbce8665da1402553de701caf7b3746735920366e08623f7e7e31e68747850a4` | 1361 | `api-public-reports-np6-905-cd-spp_node_zone_hub.json` |
| `6863bd3de875bede12758eb8b798222b6259eff80b3f90753f4a5bc58bd60c9b` | 223449 | `api-public-reports-archive-np6-905-cd.json` |
| `91c52f21bf6ba2194fc7abc7f9a190aee6f0c97f68282aa50620154791dedecd` | 166340 | `api-public-reports-archive-np4-190-cd__inst1_20251231_1177367606_DAMSPNP4190_csv.zip` |
| `d818f53f2b80cd2307dfe3e02c8257abc1fc23c5cf5355ea32be58f22d1bc498` | 167367 | `api-public-reports-archive-np4-190-cd__inst2_20251230_1177000125_DAMSPNP4190_csv.zip` |
| `c28d5ba26f7b78f36fc1d33160a4d92d2d5b035aa8a8d7d167732e920d4e7447` | 172563 | `api-public-reports-archive-np4-190-cd__inst3_20251229_1176609385_DAMSPNP4190_csv.zip` |
| `9651f2404a9bc84fe3757d1dc93fd35f85781ea67a300e49bb15056a7c883eda` | 8305 | `api-public-reports-archive-np6-905-cd__inst1_20260924_1278458786_SPPHLZNP6905_20260924_1130_csv.zip` |
| `895744e6fa0dd99685fb251e5705a528abe0498855271b3fe91e5c4d36537f2e` | 8269 | `api-public-reports-archive-np6-905-cd__inst2_20260924_1278455140_SPPHLZNP6905_20260924_1115_csv.zip` |
| `5b89d12874e1934810f7c40f36d7a4e936aa6b864124a5f7ae3588a866f2fe6f` | 8100 | `api-public-reports-archive-np6-905-cd__inst3_20260924_1278451464_SPPHLZNP6905_20260924_1100_csv.zip` |

Each sidecar is `<file>.sha256` in `sha256sum` form (`<hash><two spaces><filename>`).

## What the endpoints returned

Artifact hrefs, with no query parameters, returned field schema JSON, not price rows.

- NP4-190-CD schema fields: `deliveryDate`, `hourEnding`, `settlementPoint`, `settlementPointPrice`, `DSTFlag`. `reportEMIL` is NP4-190-CD. `reportId` is 12331.
- NP6-905-CD schema fields: `deliveryDate`, `deliveryHour`, `deliveryInterval`, `settlementPoint`, `settlementPointType`, `settlementPointPrice`, `DSTFlag`. `reportEMIL` is NP6-905-CD. `reportId` is 12301.

Archive listings are JSON with `_meta`, `product`, `archives[]` (`docId`, `friendlyName`, `postDatetime`, `_links.endpoint.href`), and `_links`. Instance href shape is `?download=<docId>`. Page 1 used `pageSize` 1000, sorted by `postDatetime` descending.

- NP4-190-CD page 1: 1000 archives, `totalRecords` 4529, `totalPages` 5. Posts on the page run 2023-12-28 through 2026-09-23. 735 of those 1000 posts fall inside 2021-02-01 through 2025-12-31. The page does not reach the campaign start.
- NP6-905-CD page 1: 1000 archives, `totalRecords` 434735, `totalPages` 435. Posts on the page run 2026-09-14 through 2026-09-24. 0 of those 1000 posts fall inside 2021-02-01 through 2025-12-31.

## Price-instance zips (light unzip)

Each zip contains one CSV. Unzipped CSVs are not stored again. Settlement point names inside the CSVs are file contents. They are not mapped onto Bayou Bend, Prairie Junction, Mesquite Ridge, or Red Mesa. `source_point_id` stays null.

### NP4-190-CD (DAM)

Header on all three: `DeliveryDate`, `HourEnding`, `SettlementPoint`, `SettlementPointPrice`, `DSTFlag`. Each file has 25848 data rows, 1077 distinct `SettlementPoint` values, hour endings `01:00` through `24:00`, and `DSTFlag` `N` only. One `DeliveryDate` per file.

| Batch | docId | postDatetime | DeliveryDate in the CSV | Inside campaign end 2025-12-31? |
| --- | --- | --- | --- | --- |
| inst1 | 1177367606 | 2025-12-31T12:32:29 | 01/01/2026 | No. The post is inside the window. The delivery date is the next civil day. |
| inst2 | 1177000125 | 2025-12-30T12:33:26 | 12/31/2025 | Delivery date is inside the window. This is one market file, not proxy-point coverage. |
| inst3 | 1176609385 | 2025-12-29T12:47:10 | 12/30/2025 | Delivery date is inside the window. This is one market file, not proxy-point coverage. |

CSV names inside the zips: `cdr.00012331.0000000000000000.20251231.123229.DAMSPNP4190.csv`, `cdr.00012331.0000000000000000.20251230.123326.DAMSPNP4190.csv`, `cdr.00012331.0000000000000000.20251229.124710.DAMSPNP4190.csv`.

### NP6-905-CD (RT) — pipeline proof, not campaign days

Header on all three: `DeliveryDate`, `DeliveryHour`, `DeliveryInterval`, `SettlementPointName`, `SettlementPointType`, `SettlementPointPrice`, `DSTFlag`. The CSV column is `SettlementPointName`. The artifact schema names the same idea `settlementPoint`. Each file has 1136 data rows, one delivery date, and one hour/interval. `DSTFlag` is `N` only. These posts are 2026-09-24, after campaign end 2025-12-31. They prove the archive download path. They are not campaign coverage days.

| Batch | docId | postDatetime | DeliveryDate | Hour / interval |
| --- | --- | --- | --- | --- |
| inst1 | 1278458786 | 2026-09-24T11:32:02 | 09/24/2026 | 12 / 2 |
| inst2 | 1278455140 | 2026-09-24T11:17:01 | 09/24/2026 | 12 / 1 |
| inst3 | 1278451464 | 2026-09-24T11:02:01 | 09/24/2026 | 11 / 4 |

## Not claimed

- Five-year coverage for 2021-02-01 through 2025-12-31 is not complete.
- Proxy `covered_local_dates` stay empty. Proven delivery dates above are not assigned to fictional sites.
- NP4-180-ER and NP6-785-ER stay absent. No Public API path is invented for them. Next research is an EWS/EMIL historic route after a URL is copied, or ask ERCOT.
