# ERCOT retain — batch 3 (2026-09-24)

Third SOURCE drop, beside batch 1 and batch 2. Every file with a `.sha256` sidecar matched that sidecar before it was copied. Thirteen price-instance zips matched. None were excluded. JSON listings, reused listings, and artifact pages are retained and are not part of `source_batch_count`.

READY timestamp (America/Chicago): 2026-09-24 13:54:45 CT. Token HTTP status recorded there was 200. No 401, 403, or 429 on the final responses. No subscription key, password, username, or bearer token is in these files. NP4-180-ER and NP6-785-ER were not requested.

`source_batch_count` adds these 13 zips only. With the earlier 12, the manifest total is 25.

## Counted zips

### NP6-905-CD Uri window (6)

Posts run 2021-02-09 through 2021-02-19. Each zip is one CSV and one hour/interval, not a full day. CSV `DeliveryDate` matches the post’s civil day. Header: `DeliveryDate`, `DeliveryHour`, `DeliveryInterval`, `SettlementPointName`, `SettlementPointType`, `SettlementPointPrice`, `DSTFlag`.

| Zip | docId | postDatetime | DeliveryDate | Hour / interval | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| inst1 `…20210209_1315_csv.zip` | 757800273 | 2021-02-09T13:17:05.290 | 02/09/2021 | 14 / 1 | `f1730a120c3f9f33ffe79ed952f7d6710f36dc643700c07feecca16f68948f8d` |
| inst2 `…20210211_1145_csv.zip` | 758130553 | 2021-02-11T11:47:04.288 | 02/11/2021 | 12 / 3 | `912375c130fe9f7e2336076516bf77e2c4c330dc3c41ebc57bdd68fede28c05a` |
| inst3 `…20210213_1145_csv.zip` | 758461769 | 2021-02-13T11:47:04.406 | 02/13/2021 | 12 / 3 | `e92a31140c299e8e1fa17f32bd3e0f722c43bc3250a4a6cd2ad0230b42ed4b81` |
| inst4 `…20210215_1145_csv.zip` | 758785321 | 2021-02-15T11:47:04.471 | 02/15/2021 | 12 / 3 | `eefd14f01636039f7feabc3c063eeb5d4b45b3dbcd81626137a31d162dd24958` |
| inst5 `…20210217_1145_csv.zip` | 759129410 | 2021-02-17T11:47:04.277 | 02/17/2021 | 12 / 3 | `0e91ae35205e3df5b54abdef7bd3094a789e3ed685fc3ac156031e323d43eb6d` |
| inst6 `…20210219_0600_csv.zip` | 759417965 | 2021-02-19T06:02:05.059 | 02/19/2021 | 6 / 4 | `34c9f4344fd1c70498bf7d615f86fed1cc88611e3f6fcb275a13c88a5d902c3e` |

The page 197 listing these came from was copied from batch 2 (`np6-905-cd_archive_page197_reused_from_batch2.json`, SHA-256 `56285d26c6a7c530b88319aad9a9a70ef3b20530996150fda0d9b3975e6d7851`). It was not fetched again.

### NP4-190-CD archive instances (7)

Posts run 2021-02-09 through 2023-06-15. Each CSV has hour endings `01:00` through `24:00` and one `DeliveryDate`. That delivery date is the civil day after the post. Header: `DeliveryDate`, `HourEnding`, `SettlementPoint`, `SettlementPointPrice`, `DSTFlag`. These are market files. They are not assigned to fictional sites.

| Zip | docId | postDatetime | DeliveryDate in the CSV | SHA-256 |
| --- | --- | --- | --- | --- |
| inst1 | 757802224 | 2021-02-09T13:39:48 | 02/10/2021 | `048061390b5072756e3ca1f232dc0f6d7ffd72440fa914d2f993663117afe8da` |
| inst2 | 758799242 | 2021-02-15T13:17:52 | 02/16/2021 | `e9c2bf5f587c71d064374397438f7597c8b0b98a6eebb665b117a543e52f9ebb` |
| inst3 | 759484356 | 2021-02-19T14:36:31 | 02/20/2021 | `f60576df8cf822cce1d4d2a9b2a323a90f7173cb7914dbd28d778b0c3c7fd987` |
| inst4 | 763581329 | 2021-03-16T12:33:55 | 03/17/2021 | `957f39de6b2a154a0a925cdaf414279c218f0e8440cb44be7e0f9e930b479b2b` |
| inst5 | 790144271 | 2021-08-16T12:34:58 | 08/17/2021 | `4b97ae126fb11b28c186d882795cef2ead339a00ee69a1d27a34e28e314d7814` |
| inst6 | 845921117 | 2022-06-15T12:34:03 | 06/16/2022 | `54d5fcf952de1601f4641487a9ec7fbf2a21aaa1d3e40cc9a14b4875dd6e7bc3` |
| inst7 | 922670819 | 2023-06-15T12:45:56.754 | 06/16/2023 | `538aa86b135b5a061506913a9877db0901c0b6afe1eff356ca2e680d877cf5df` |

NP4 listing pages 2 and 3 were copied from batch 2 and were not fetched again.

## Not counted

Live `deliveryDateFrom` / `deliveryDateTo` samples:

- Empty (`totalRecords` 0) on both products for 2021-08-15, 2022-02-15, and 2023-08-15. Those days still need archive `?download=` or the absent ER products.
- 2024-07-15 has rows. NP4 `_meta` is 21816 records / 22 pages. NP6 `_meta` is 88416 records / 89 pages. Only pages 1–3 (1000 rows each) are retained. That is not a full day.

New NP6 archive listing pages 80, 90, 140, 150, and 185 are listings only.

## Not claimed

No zip was excluded. Five-year coverage is not complete. Proxy `covered_local_dates` stay empty. `source_point_id` stays null. Settlement point names inside the CSVs were not mapped to fictional sites. NP4-180-ER and NP6-785-ER stay absent. No Public API path is invented for them.
