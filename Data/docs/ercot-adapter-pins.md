# ERCOT adapter notes (not a pin of price paths)

Checked 2026-09-24 by reading public ERCOT pages. No API call was made. This file does not contain SOURCE prices, settlement point IDs, account secrets, or a fabricated artifact path.

Labels: a row is **documented** only when a public page states it. **UNKNOWN** means this pass did not find a page that states it. **GATE** means the campaign still cannot treat the item as resolved.

The coverage manifest keeps `pinned_api_path: null` until an authenticated catalog response is saved and reviewed. Do not hand-edit a slug into that field.

## Credentials and rights (GATE)

Username, password, and the API Explorer primary subscription key are not in this repository. Spec §5.1: credentials stay in the ingestion service, never in packs, browser or app code, exports, or saves.

API registration is not redistribution permission for a commercial game (spec §3). `rights_status` on the coverage manifest stays `unresolved`. The [Data Access Portal](https://www.ercot.com/services/mdt/data-portal) page says users must read and accept that site's Terms of Use before using API Explorer. This repository does not record acceptance of those terms.

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

Those three hrefs are an example for Hourly Resource Outage Capacity. They are not DAM or RT settlement paths. Artifact slugs are product-specific and must be copied from a live catalog response.

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

## What is still UNKNOWN / GATE

- Artifact href and archive href for NP4-190-CD, NP6-905-CD, NP4-180-ER, and NP6-785-ER. Not invented.
- Whether those four IDs are present on the live `GET /api/public-reports` catalog. NP4-190-CD and NP6-905-CD were named in the December 2023 beta list. Presence on 2026-09-24 was not checked.
- OpenAPI document URL and artifact query parameters.
- MIS directory paths (`MIS Posting Location` was N/A).
- EWS Option values for these products.
- Whether historic files actually cover 2021-02-01 through 2025-12-31 for the selected proxy points. The five-year gate stays red until bytes are ingested.
- Settlement point IDs for the fictional sites. Still null.
- Username, password, subscription key, tokens, terms acceptance, and commercial redistribution rights.

## Next ingest steps after access exists

Do these from a host that ERCOT's geographic limit allows (the known-limits page says regions outside the United States may be blocked). Keep secrets out of the repo.

1. Register on API Explorer and accept the site terms in ERCOT's own UI. Store the subscription key outside git.
2. POST the documented token URL. Keep the returned tokens out of git.
3. GET `https://api.ercot.com/api/public-reports` with the two documented headers. Save the raw response and its SHA-256 under the ingestion pipeline. Do not publish it as a price pack.
4. From that response, copy the artifact `href` and archive `href` for `emilId` NP4-190-CD and NP6-905-CD exactly as returned. Those copied strings are the first adapter pin. If an ID is missing, stop. Do not guess a slug from the NP3-233-CD example.
5. Repeat the lookup for NP4-180-ER and NP6-785-ER. If they are absent, the EMIL channel list points at Public and EWS, not Data Portal. Use a documented EWS or EMIL file route only after its URL is copied from a reply or page, or ask ERCOT. Do not synthesize `/api/public-reports/np4-180-er/...`.
6. Stay inside 30 requests per minute and 1,000 historic files per download. On HTTP 429, back off. An incomplete page must not be marked complete (spec §5.2).
7. Retain raw bytes, hash them, normalize, validate, and only then consider the coverage manifest. `source_batch_count` stays 0 until that ingest exists. Record redistribution rights in the manifest before any pack is shipped in the game.
