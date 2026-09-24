# ERCOT adapter notes

Public pages were read on 2026-09-24. A later catalog extract, also dated 2026-09-24, supplied the price-product hrefs below. This commit does not repeat that call, does not store the raw catalog JSON, and does not store tokens. It does not contain SOURCE prices, settlement point IDs, account secrets, or a slug that was not in that extract.

Labels: **pinned** means the string was copied from the catalog extract. **ABSENT** means the extract's product list did not contain that EMIL ID. **UNKNOWN** means neither a public page nor the extract stated it. **GATE** means the campaign still cannot treat the item as resolved.

`pinned_api_path` on the coverage manifest is the artifact href only. The manifest schema has no separate archive field, so archive hrefs live in this file. No price bytes were downloaded.

## Credentials and rights

Owner decision, recorded 2026-09-24. This is a rights lock, not an ingest. No secret is stored here.

- Austin accepted the Data Portal/API terms at https://www.ercot.com/help/terms/data-portal.
- Intended use: internal build for Austin and coworkers only. The game is not for sale.
- The owner accepts the realistic downside that the API account may be closed.
- Commercial App Store redistribution is **not** authorized and must not be recorded as authorized.
- Coverage manifest `rights_status` is `terms_accepted_internal_use_only` (owner-approved internal pack use).
- Username, password, subscription key, and tokens remain **out of this repository**. Access is still GATE. That is separate from this rights wording.
- Spec §5.1 still applies: credentials stay in the ingestion service, never in packs, the app, exports, or saves.
- The catalog list was already fetched. Do not invent further slugs. Price bytes are still not downloaded.

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

Sections on that same page titled "Retrieving a list of reports within an EMIL Product" ("Coming Soon"), "Retrieving data from a EMIL Product Artifact", and "Getting history archives for an EMIL Product" did not include a request procedure in the page text read on 2026-09-24. Query parameters for an artifact are **UNKNOWN**.

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

Next path for those two archives: a documented EWS or EMIL file route only after a URL is copied from a reply or a page, or ask ERCOT.

## What is still UNKNOWN / GATE

- OpenAPI document URL and artifact query parameters.
- MIS directory paths (`MIS Posting Location` was N/A).
- EWS Option values for these products.
- Whether historic files actually cover 2021-02-01 through 2025-12-31 for the selected proxy points. The five-year gate stays red until bytes are ingested.
- Settlement point IDs for the fictional sites. Still null.
- Username, password, subscription key, and tokens. They stay out of git. Access is GATE. Terms acceptance for internal use is already recorded above. Commercial App Store redistribution is not authorized.

## Next ingest steps after access exists

Do these from a host that ERCOT's geographic limit allows (the known-limits page says regions outside the United States may be blocked). Keep secrets out of the repo.

1. Terms at https://www.ercot.com/help/terms/data-portal are already accepted for internal use. Store the subscription key outside git. Do not commit it.
2. POST the documented token URL. Keep the returned tokens out of git.
3. The 2026-09-24 catalog GET is already recorded above (HTTP 200, 116 products, SHA-256 in this file). Do not commit the raw JSON or a token. This pass did not download price bytes.
4. NP4-190-CD and NP6-905-CD artifact and archive hrefs are already copied above. Do not replace them with a guessed slug.
5. NP4-180-ER and NP6-785-ER are absent. Do not invent a Public API path for either. Use a documented EWS or EMIL file route only after a URL is copied from a reply or page, or ask ERCOT.
6. Stay inside 30 requests per minute and 1,000 historic files per download. On HTTP 429, back off. An incomplete page must not be marked complete (spec §5.2).
7. Retain raw bytes, hash them, normalize, validate, and only then consider the coverage manifest. `source_batch_count` stays 0 until that ingest exists. Internal pack rights are already `terms_accepted_internal_use_only`. Commercial App Store redistribution stays unauthorized.
