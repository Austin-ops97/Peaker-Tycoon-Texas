# ERCOT adapter notes

Public pages were read on 2026-09-24. A later catalog extract, also dated 2026-09-24, supplied the price-product hrefs below. Supervisor drops the same day retained SOURCE batches under `Data/archives/ercot/2026-09-24/`, `batch2/`, `batch3/`, `batch4/`, `batch5/`, and `batch6/`. This file does not store the raw catalog JSON or tokens. It does not assign settlement point IDs to the fictional sites, and it does not claim five-year coverage.

Labels: **pinned** means the string was copied from the catalog extract. **ABSENT** means the extract's product list did not contain that EMIL ID. **UNKNOWN** means neither a public page nor the extract stated it. **GATE** means the campaign still cannot treat the item as resolved.

`pinned_api_path` on the coverage manifest is the artifact href only. The manifest schema has no separate archive field, so archive hrefs live in this file. SHA-256 inventories are the `RETENTION.md` files under `Data/archives/ercot/2026-09-24/`, `batch2/`, `batch3/`, `batch4/`, `batch5/`, `batch6/`, `batch7/`, and `batch8/`. `source_batch_count` is 144 verified price-instance zips. Coverage is partial. NP4-180-ER and NP6-785-ER remain GATE.

## Credentials and rights

Owner decision, recorded 2026-09-24. This is a rights lock, not an ingest. No secret is stored here.

- Austin accepted the Data Portal/API terms at https://www.ercot.com/help/terms/data-portal.
- Intended use: internal build for Austin and coworkers only. The game is not for sale.
- The owner accepts the realistic downside that the API account may be closed.
- Commercial App Store redistribution is **not** authorized and must not be recorded as authorized.
- Coverage manifest `rights_status` is `terms_accepted_internal_use_only` (owner-approved internal pack use).
- Username, password, subscription key, and tokens remain **out of this repository**. Access is still GATE. That is separate from this rights wording.
- Spec §5.1 still applies: credentials stay in the ingestion service, never in packs, the app, exports, or saves.
- The catalog list was already fetched. Do not invent further slugs. The first price-instance batch is retained under `Data/archives/ercot/2026-09-24/`. It is not five-year coverage.

## What is documented

### Public API catalog request

The [Using the API](https://developer.ercot.com/applications/pubapi/user-guide/using-api/) guide shows a GET of the product list. The curl, Java, and Python samples on that page use:

`https://api.ercot.com/api/public-reports`

Required headers named on that page:

- `Ocp-Apim-Subscription-Key`
- `Authorization: Bearer` with the ID token

The JavaScript sample on the same page requests `https://api.ercot.com/api/public-report/` (singular). That disagrees with the other three samples. This note does not treat the singular path as the pin.

A sample JSON body on that page, for product `NP3-233-CD` only, includes:

- self: `https://api.ercot.com/api/public-reports/np3-233-cd`
- artifact endpoint: `https://api.ercot.com/api/public-reports/np3-233-cd/hourly_res_outage_cap`
- archive: `https://api.ercot.com/api/public-reports/archive/np3-233-cd`

Those three hrefs are an example for Hourly Resource Outage Capacity. They are not pins for this repository.

Sections on that same page titled "Retrieving a list of reports within an EMIL Product" ("Coming Soon"), "Retrieving data from a EMIL Product Artifact", and "Getting history archives for an EMIL Product" did not include a request procedure in the page text read on 2026-09-24.

A GET of each pinned artifact href with no query parameters returned field-schema JSON (`report`, `fields`, `_links`), not price rows. Those bodies are in the first retain. Searchable field names are inside the schema files.

Batch 2 exercised the date filter. The working query is `deliveryDateFrom={date}&deliveryDateTo={date}`, with `&page=N` for later pages. Bare `deliveryDate=` returns HTTP 400 and names `deliveryDate` as unavailable. Details and SHA-256 values are in `Data/archives/ercot/2026-09-24/batch2/RETENTION.md`.

### Authentication URL (not a data path)

[Registration and Authentication](https://developer.ercot.com/applications/pubapi/user-guide/registration-and-authentication/) documents a POST to:

`https://ercotb2c.b2clogin.com/ercotb2c.onmicrosoft.com/B2C_1_PUBAPI-ROPC-FLOW/oauth2/v2.0/token`

Documented parameters include `grant_type=password`, `response_type=id_token`, and `client_id=fec253ea-0d06-4272-a5e6-b478baeecd70`. That client id is the public parameter printed in ERCOT's own examples. It is not an account secret. The page says ID tokens last one hour and are not refreshed. The examples also return `access_token` and `id_token`. Which token the price calls require is the value placed in `Authorization: Bearer` after that login. Do not store a token in git.

### Limits

[Known limits](https://developer.ercot.com/applications/pubapi/known-limits/) documents:

- 30 requests per minute. Excess calls return HTTP 429 with `error_key` `throttled`.
- Historic-file downloads, API and WebUI, are limited to 1,000 files at a time.
- Regions outside the United States may be blocked from `*.ercot.com`.
- API data starts at each product's activation date in the Public Data API. Earlier data is historic-file download only, retained at least 7 years. Activation dates are referred to the release notes.

### OpenAPI

The [Data Access Portal](https://www.ercot.com/services/mdt/data-portal) page says API Explorer is a RESTful framework based on OpenAPI standards. The [Public API specifications](https://developer.ercot.com/api_specifications/pubapi/pubapi/) page does not contain a schema. It points readers back to the client documentation. No OpenAPI JSON or YAML URL was on the pages read here. The specification file location is **UNKNOWN / GATE**.

### EMIL product pages (not API paths)

These are public Market Information List pages. Each page's MIS Posting Location field was N/A, so no MIS folder path is pinned.

| EMIL ID | Page title (as shown) | Report Type ID on the page | Channel on the page | File types on the page | In the 2023-12-11 Public API beta list? |
| --- | --- | --- | --- | --- | --- |
| NP4-190-CD | DAM Settlement Point Prices | 12331 | Public, EWS, Data Portal | zip, csv, xml | Yes. [Release notes](https://developer.ercot.com/applications/pubapi/relnotes/), 2023 Beta Release. |
| NP6-905-CD | Settlement Point Prices at Resource Nodes, Hubs and Load Zones | 12301 | Public, EWS, Data Portal | zip, csv, xml | Yes. Same beta list. |
| NP4-180-ER | Historical DAM Load Zone and Hub Prices | 13060 | Public, EWS | zip, xlsx | Not in the beta list or later release-note bullets read on 2026-09-24. |
| NP6-785-ER | Historical RTM Load Zone and Hub Prices | 13061 | Public, EWS | zip, xlsx | Not in those bullets. Spec §5.1 pairs this with NP4-180-ER. Included so the RT archive is not silently dropped. |

Product page URLs:

- https://www.ercot.com/mp/data-products/data-product-details?id=NP4-190-CD
- https://www.ercot.com/mp/data-products/data-product-details?id=NP6-905-CD
- https://www.ercot.com/mp/data-products/data-product-details?id=NP4-180-ER
- https://www.ercot.com/mp/data-products/data-product-details?id=NP6-785-ER

EMIL display duration on those pages: 31 for NP4-190-CD, 7 for NP6-905-CD, N/A for both historical archives. That is on-site display metadata, not a statement that Feb 2021–Dec 2025 files are in the API.

[EWS GetReports](https://developer.ercot.com/applications/ews/Report%20Messages/GetReports/) documents a report-list message whose `Request/Option` is a Report ID, and whose reply includes a download URL. This pass did not find a sentence that equates EMIL Report Type ID 12331, 12301, 13060, or 13061 with that EWS Option. That mapping is **UNKNOWN**. Do not send those integers as if the equivalence were already proven.

## Catalog extract (pins copied, not an ingest)

Evidence from the supplied extract. The raw catalog body is not in git.

- Fetch date: 2026-09-24 (11:22:43 America/Chicago)
- Catalog HTTP status: 200
- Product count: 116
- SHA-256 of `public-reports-raw.json`: `59a7daaad4e8c64a1f5e6b808299ce43667c92d38c38fe27a4fb118975889789`

### Pinned from the extract

NP4-190-CD was FOUND. These strings are copied verbatim.

- Artifact (this is `pinned_api_path` in the coverage manifest): `https://api.ercot.com/api/public-reports/np4-190-cd/dam_stlmnt_pnt_prices`
- Archive: `https://api.ercot.com/api/public-reports/archive/np4-190-cd`
- Product self (catalog link, not a price pin): `https://api.ercot.com/api/public-reports/np4-190-cd`
- Bundle (catalog link, not a price pin): `https://api.ercot.com/api/public-reports/bundle/np4-190-cd`

NP6-905-CD was FOUND. These strings are copied verbatim.

- Artifact (this is `pinned_api_path` in the coverage manifest): `https://api.ercot.com/api/public-reports/np6-905-cd/spp_node_zone_hub`
- Archive: `https://api.ercot.com/api/public-reports/archive/np6-905-cd`
- Product self (catalog link, not a price pin): `https://api.ercot.com/api/public-reports/np6-905-cd`
- Bundle (catalog link, not a price pin): `https://api.ercot.com/api/public-reports/bundle/np6-905-cd`

No other artifact slug is pinned. The NP3-233-CD path above is only the public guide's example.

### Absent from the Public API catalog (still GATE)

NP4-180-ER and NP6-785-ER were ABSENT from the live `GET /api/public-reports` body (116 products; substring search negative). No path is synthesized for them. Spec §5.1 still requires the historic DAM and RT hub/load-zone archives. `pinned_api_path` stays null. Status on the coverage manifest is `absent_from_public_reports_catalog`.

Next path for those two archives: a documented EWS or EMIL historic route only after a URL is copied from a reply or a page, or ask ERCOT. No Public API slug is invented.

## Archive listing shape (observed 2026-09-24)

GET of each archive href with no query parameters returned JSON:

- `_meta`: `totalRecords`, `pageSize`, `totalPages`, `currentPage`, `query` (page 1 `sortedBy` was `postDatetime: DESC`)
- `product`
- `archives[]`: `docId`, `friendlyName`, `postDatetime`, `_links.endpoint.href`
- `_links`

Instance download shape, copied from those hrefs:

`?download=<docId>`

on `https://api.ercot.com/api/public-reports/archive/np4-190-cd` and `https://api.ercot.com/api/public-reports/archive/np6-905-cd`.

Pagination: `pageSize` 1000.

- NP4-190-CD page 1: 1000 archives, `totalRecords` 4529, `totalPages` 5. Posts on that page run 2023-12-28 through 2026-09-23. 735 of those 1000 posts fall in 2021-02-01 through 2025-12-31. Page 1 does not reach the campaign start.
- NP6-905-CD page 1: 1000 archives, `totalRecords` 434735, `totalPages` 435. Posts on that page run 2026-09-14 through 2026-09-24. 0 of those 1000 posts fall in 2021-02-01 through 2025-12-31.

## Artifact endpoints until query parameters are applied

GET of each pinned artifact href, with no query parameters, returned schema JSON, not price rows. Retained files and SHA-256 values are in `Data/archives/ercot/2026-09-24/RETENTION.md`.

- NP4-190-CD schema fields: `deliveryDate`, `hourEnding`, `settlementPoint`, `settlementPointPrice`, `DSTFlag`.
- NP6-905-CD schema fields: `deliveryDate`, `deliveryHour`, `deliveryInterval`, `settlementPoint`, `settlementPointType`, `settlementPointPrice`, `DSTFlag`.

The DAM CSV header matches those names (`DeliveryDate`, `HourEnding`, `SettlementPoint`, `SettlementPointPrice`, `DSTFlag`). The RT CSV header uses `SettlementPointName` where the schema says `settlementPoint`.

## First retained batch

Six price-instance zips verified against READY and sha256 sidecars, plus the two schemas and two page-1 archive listings. Inventory and SHA-256 values: `Data/archives/ercot/2026-09-24/RETENTION.md`.

Batch 1 contributed 6 price-instance zips (3 DAM and 3 RT). Batch 2 added 6. Batch 3 added 13. The manifest uses one integer. The total is 25. That count is retained zip files, not campaign days.

NP4-190-CD and NP6-905-CD status is `partial_batches_retained`. `pinned_api_path` is unchanged. `claims_complete_source_coverage` stays false. Five-year gates stay fail-closed. Settlement `source_point_id` stays null.

DAM CSV delivery dates proven in-file: 2025-12-30 (docId 1176609385), 2025-12-31 (docId 1177000125), and 2026-01-01 (docId 1177367606). The 2026-01-01 file posted 2025-12-31, so the post is inside the campaign window and the delivery date is not. None of these dates are written onto proxy `covered_local_dates`.

The three NP6-905-CD zips posted 2026-09-24 (docIds 1278458786, 1278455140, 1278451464). CSV `DeliveryDate` is 09/24/2026, after campaign end 2025-12-31. Each file is one hour and one interval. They are SOURCE pipeline proof, not campaign coverage days.

## Batch 2 retain

Path: `Data/archives/ercot/2026-09-24/batch2/`. SHA-256 inventory: `RETENTION.md` in that folder. Six newly verified NP6 price zips are the only files from this drop added to `source_batch_count`.

Working artifact query, copied from the responses:

`deliveryDateFrom={date}&deliveryDateTo={date}`

and `&page=N`. Bare `deliveryDate=` returned HTTP 400.

Artifact row samples, page cap 3 (totals from `_meta`, not a full download):

- NP4-190-CD 2025-12-31: 25848 records, 26 pages.
- NP4-190-CD 2025-02-15: 23352 records, 24 pages.
- NP6-905-CD 2025-12-31: 104544 records, 105 pages.
- NP6-905-CD 2025-02-15: 94560 records, 95 pages.
- 2021-02-15 is empty on both products (`totalRecords` 0). GATE: early-campaign days need archive `?download=<docId>`, or the ER products. `deliveryDateFrom` / `deliveryDateTo` alone did not return that day.

NP6 archive paging uses `page`. Page 26 is the first probed page whose posts reach on or before 2025-12-31 (546 of 1000 posts in 2021-02-01 through 2025-12-31; the page also contains January 2026 posts). Page 197 is still in February 2021 (oldest post 2021-02-09, all 1000 posts in the campaign window).

The six in-range NP6 zips, each one interval: delivery stamps 2025-12-15, 2025-12-31 (three intervals), 2025-02-16, and 2021-02-09 (Uri-window sample, docId 757717538). Those stamps are recorded in the batch 2 retention note. They are not written onto proxy `covered_local_dates`. `source_point_id` stays null. Distinct settlement-point strings seen in the samples are in `batch2/observed-settlement-point-names.txt` and are not a mapping.

NP4 archive listing pages 2–5 are retained as listings only. Batch 2 added no NP4 instance zip. Batch 3 later added seven NP4 instance zips; see below.

## Batch 3 retain

Path: `Data/archives/ercot/2026-09-24/batch3/`. SHA-256 inventory: `RETENTION.md` in that folder. Thirteen verified price zips were added (6 NP6, 7 NP4). No zip failed its sidecar. Listings and artifact pages are not counted.

GATE: live `deliveryDateFrom` / `deliveryDateTo` returned `totalRecords` 0 for 2021-08-15, 2022-02-15, and 2023-08-15 on both NP4-190-CD and NP6-905-CD. Those days still need archive `?download=<docId>` or the ER products. 2021-02-15 from batch 2 remains empty the same way.

2024-07-15 From/To responses have rows (NP4 21816 records / 22 pages, NP6 88416 / 89 pages). Only pages 1–3 were retained. That is not full-day coverage.

NP6 Uri-window posts in this drop run 2021-02-09 through 2021-02-19. NP4 archive posts run 2021-02-09 through 2023-06-15. CSV delivery dates are in the batch 3 retention note. They are not written onto proxy `covered_local_dates`.

## Batch 4 retain

Path: `Data/archives/ercot/2026-09-24/batch4/`. SHA-256 inventory: `RETENTION.md` in that folder. Twenty-four verified price zips were added (10 NP6 landmarks, 14 NP4). No zip failed its sidecar. Listings and artifact pages are not counted. `source_batch_count` is 49 (6 + 6 + 13 + 24).

GATE: live `deliveryDateFrom` / `deliveryDateTo` returned `totalRecords` 0 for 2023-01-15 on both NP4-190-CD and NP6-905-CD. That day still needs an archive download whose CSV delivery date is 2023-01-15, or the ER products. The NP4 zip posted 2023-01-16 in this drop covers DeliveryDate 01/17/2023, not 2023-01-15. Earlier empty From/To days (2021-02-15, 2021-08-15, 2022-02-15, 2023-08-15) stay empty the same way.

`RetainedSettlementArchive` can open the verified price zips in batch2, batch3, batch4, batch5, batch6, and batch7 and parse the CSV member. That read path checks the `.sha256` sidecar first. It does not fetch, does not publish a complete pack, and does not fill proxy coverage. `Data/archives/ercot/2026-09-24/retained-sample-inventory.json` lists the CSV delivery dates from that read. The list is a sample inventory, not complete coverage.

2025-06-15, 2024-10-15, and 2024-01-15 From/To responses have rows. Only pages 1–3 were retained on each product. That is not full-day coverage. NP6 landmark zips are one interval each (hour 12, interval 3). They are not proxy coverage.

## Batch 5 retain

Path: `Data/archives/ercot/2026-09-24/batch5/`. SHA-256 inventory: `RETENTION.md` in that folder. Fourteen verified price zips were added (7 NP4, 7 NP6). No zip failed its sidecar. Listings and EMPTY artifact pages are not counted. `source_batch_count` is 63 (6 + 6 + 13 + 24 + 14).

GATE: live `deliveryDateFrom` / `deliveryDateTo` returned `totalRecords` 0 for 2021-04-15, 2022-07-15, and 2023-04-15 on both NP4-190-CD and NP6-905-CD. Archive densify was used for nearby posts. Those three days still need an archive download whose CSV delivery date is that day, or the ER products. The NP4 zip posted 2021-04-16 covers DeliveryDate 04/17/2021, not 2021-04-15. The NP4 zip posted 2022-07-16 covers DeliveryDate 07/17/2022, not 2022-07-15. The NP6 zip posted 2021-04-15 is one interval (hour 12, interval 3), not a full day. The NP6 zip posted 2021-10-12 has DeliveryDate 10/11/2021 (hour 24, interval 4). Earlier empty From/To days stay empty the same way.

## Batch 6 retain

Path: `Data/archives/ercot/2026-09-24/batch6/`. SHA-256 inventory: `RETENTION.md` in that folder. Twenty-five verified price zips were added (14 NP4, 11 NP6). No zip failed its sidecar. Listings and artifact pages are not counted. `source_batch_count` is 88 (6 + 6 + 13 + 24 + 14 + 25). The read path opens batch2 through batch6.

GATE: live `deliveryDateFrom` / `deliveryDateTo` returned `totalRecords` 0 for 2022-11-15 on both NP4-190-CD and NP6-905-CD. The NP4 zip posted 2022-11-14 covers DeliveryDate 11/15/2022. There is no NP6 interval for 2022-11-15 in this drop. Archive files in this drop include delivery dates 2021-04-15, 2022-07-15, 2023-01-15, and 2023-04-15. Each NP6 file is one interval. 2024-05-15 and 2025-09-15 From/To responses have rows. Only pages 1–3 were retained. That is not a full day.

## Batch 7 retain

Path: `Data/archives/ercot/2026-09-24/batch7/`. SHA-256 inventory: `RETENTION.md` in that folder. Twenty-four verified price zips were added (12 NP4, 12 NP6). No zip failed its sidecar. Listings and artifact pages are not counted. `source_batch_count` is 112 (6 + 6 + 13 + 24 + 14 + 25 + 24). The read path opens batch2 through batch7.

GATE: live `deliveryDateFrom` / `deliveryDateTo` returned `totalRecords` 0 for 2023-10-15 on both NP4-190-CD and NP6-905-CD. The NP4 zip posted 2023-10-14 covers DeliveryDate 10/15/2023. The NP4 zip posted 2023-10-15 covers DeliveryDate 10/16/2023, not 2023-10-15. There is no NP6 interval whose CSV DeliveryDate is 2023-10-15. Two NP6 zips have DeliveryDate 11/15/2022 (hour 12, intervals 3 and 4, docIds 876906627 and 876908682). Those are archive samples. This drop did not re-query the live endpoint for 2022-11-15. 2024-08-15 From/To responses have rows. Only pages 1–3 were retained. That is not a full day.

## Batch 8 retain

Path: `Data/archives/ercot/2026-09-24/batch8/`. SHA-256 inventory: `RETENTION.md` in that folder. Thirty-two verified price zips were added (12 NP4, 20 NP6). No zip failed its sidecar. Listings and artifact pages are not counted. `source_batch_count` is 144 (6 + 6 + 13 + 24 + 14 + 25 + 24 + 32). The read path still opens batch2 through batch7 only.

GATE: this drop recorded no live `deliveryDateFrom` / `deliveryDateTo` day with `totalRecords` 0. 2024-04-15 and 2025-05-15 From/To responses have rows. Only pages 1–3 were retained. That is not a full day. Five NP6 zips have CSV DeliveryDate 10/15/2023 (hour 12 intervals 3 and 4, hour 7 interval 3, hour 17 interval 3, and hour 24 interval 3). The NP6 zip whose filename stamp is 2023-10-15 00:00 has DeliveryDate 10/14/2023, hour 24 interval 4. Those are archive samples. This drop did not re-query the live endpoint for 2023-10-15.

## What is still UNKNOWN / GATE

- OpenAPI document URL. The date-range query above is observed. Other artifact filters are not pinned.
- MIS directory paths (`MIS Posting Location` was N/A).
- EWS Option values for these products. NP4-180-ER and NP6-785-ER stay GATE until a copied EWS or EMIL URL exists.
- Whether historic files cover 2021-02-01 through 2025-12-31 for the selected proxy points. The five-year gate stays red. This batch does not.
- Settlement point IDs for the fictional sites. Still null.
- Username, password, subscription key, and tokens. They stay out of git. Access is GATE. Terms acceptance for internal use is already recorded above. Commercial App Store redistribution is not authorized.

## Next ingest steps after access exists

Do these from a host that ERCOT's geographic limit allows (the known-limits page says regions outside the United States may be blocked). Keep secrets out of the repo.

1. Terms at https://www.ercot.com/help/terms/data-portal are already accepted for internal use. Store the subscription key outside git. Do not commit it.
2. POST the documented token URL. Keep the returned tokens out of git.
3. The 2026-09-24 catalog GET is already recorded above (HTTP 200, 116 products, SHA-256 in this file). Do not commit the raw catalog JSON or a token.
4. NP4-190-CD and NP6-905-CD artifact and archive hrefs are already copied above. Do not replace them with a guessed slug. Use `deliveryDateFrom` and `deliveryDateTo`, not bare `deliveryDate`. Twelve price zips are retained. 2021-02-15 was empty on the artifact API, so early days still need archive `?download=` or the ER products. NP6 page 1 had no in-era posts; page 26 is the first probed page at the campaign end, and page 197 is still in February 2021.
5. NP4-180-ER and NP6-785-ER are absent. Do not invent a Public API path for either. Use a documented EWS or EMIL historic route only after a URL is copied from a reply or page, or ask ERCOT.
6. Stay inside 30 requests per minute and 1,000 historic files per download. On HTTP 429, back off. An incomplete page must not be marked complete (spec §5.2).
7. Further batches follow the same retain, hash, normalize, and validate path before any coverage day is published. `source_batch_count` is 144 verified price zips (6 + 6 + 13 + 24 + 14 + 25 + 24 + 32). It is not a complete-coverage claim. This drop recorded no new empty live From/To day. Archive NP6 intervals for 2023-10-15 are samples, not a live From/To fill and not proxy coverage. Internal pack rights stay `terms_accepted_internal_use_only`. Commercial App Store redistribution stays unauthorized.
