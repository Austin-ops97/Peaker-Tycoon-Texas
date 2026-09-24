# ERCOT retain — batch 7 (2026-09-24)

Seventh SOURCE drop, beside batches 1–6. Every file that arrived with a `.sha256` sidecar matched that sidecar before it was copied. Twenty-four price-instance zips matched. None were excluded. JSON listings, reused listings, and artifact pages are retained and are not part of `source_batch_count`. `READY.md` and `download-meta.json` have no sidecar in this drop, same as earlier batches.

READY timestamp (America/Chicago): 2026-09-24 14:57:16 CT. Token HTTP status recorded there was 200. READY records no HTTP 401, 403, or 429 on this drop. No subscription key, password, username, or bearer token is in these files. Card key names appear as names only. NP4-180-ER and NP6-785-ER were not requested.

`source_batch_count` adds these 24 zips only. With the earlier 88, the manifest total is 112.

## Counted zips

### NP4-190-CD archive instances (12)

Posts run 2021-10-14 through 2024-08-14. Each CSV has hour endings `01:00` through `24:00` and one `DeliveryDate`. That delivery date is the civil day after the post. Header: `DeliveryDate`, `HourEnding`, `SettlementPoint`, `SettlementPointPrice`, `DSTFlag`. These are market files. They are not assigned to fictional sites.

| Zip | docId | postDatetime | DeliveryDate in the CSV | SHA-256 |
| --- | --- | --- | --- | --- |
| inst1 | 800715157 | 2021-10-14T13:22:19 | 10/15/2021 | `0006604e557538fde6e075a86921ad4632f400376142eb721c99248cef193110` |
| inst2 | 839606758 | 2022-05-14T12:29:06 | 05/15/2022 | `8da9407f599141e140f8e1dec3006cf69564dd883e63f9ed85073fa6717eb532` |
| inst3 | 943814264 | 2023-09-14T12:35:10.887 | 09/15/2023 | `ff8471f3456a737040ee4878493e239ae57a1c16995fee1a8b774c4c5ae092b9` |
| inst4 | 950846495 | 2023-10-14T12:35:55.983 | 10/15/2023 | `74cde0d2f53ea638a4491e952be65b1af8fbab9bbc1f562a4811ef68c474f6c8` |
| inst5 | 800890479 | 2021-10-15T12:33:27 | 10/16/2021 | `d14d8e54f8778c001bae017084efe1cbb3bcd5708cd56361ae5efad9906de39e` |
| inst6 | 839796340 | 2022-05-15T12:28:00 | 05/16/2022 | `4649a1389e526cd8e551b9d939da0e9ceb215d7bc59d6a0229fb187822ba25f1` |
| inst7 | 944048824 | 2023-09-15T12:34:35.534 | 09/16/2023 | `cc6abf462f1af9ec5e13a9c8ae3e3220a5f1b3878aa310efded29c32beb24aea` |
| inst8 | 951071094 | 2023-10-15T12:34:51.247 | 10/16/2023 | `b482d43b867c2336101054464e609c6617d5857f179defd6d87a58830ebd8750` |
| inst9 | 958212331 | 2023-11-14T12:36:43.097 | 11/15/2023 | `d9e52d2b0b8eb0fb9099b9f6b5293102f154e7a8dea47d8cd605f42fd9919936` |
| inst10 | 980871702 | 2024-02-14T12:36:29 | 02/15/2024 | `868a215cd7361f4130df47adb2d5899964391aa7d501abc9307383670d15fca9` |
| inst11 | 1011809802 | 2024-06-14T12:32:40 | 06/15/2024 | `35a9575f3f2f0e7b39764497d52021aed11c02c5133f21e923ab8b67e519917e` |
| inst12 | 1027771043 | 2024-08-14T12:32:41 | 08/15/2024 | `6c4bfdd14e14c3737bae7a451bb4f5535e4ed72f8e4fc2969572cb91d4c0a67c` |

NP4 listing page 1 was copied from batch 6 (`np4-190-cd_archive_page1_reused_from_batch6.json`, SHA-256 `7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344`). Page 2 was copied from batch 6 (`np4-190-cd_archive_page2_reused_from_batch6.json`, SHA-256 `a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908`). Listings are not counted.

The post on 2023-10-14 covers DeliveryDate 10/15/2023. That is an archive file for the day whose live From/To is empty in this drop. It is not a live From/To result. The post on 2023-10-15 covers DeliveryDate 10/16/2023, not 2023-10-15.

### NP6-905-CD instances (12)

Each zip is one CSV and one hour/interval, not a full day. Header: `DeliveryDate`, `DeliveryHour`, `DeliveryInterval`, `SettlementPointName`, `SettlementPointType`, `SettlementPointPrice`, `DSTFlag`.

| Zip | docId | postDatetime | DeliveryDate | Hour / interval | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| inst1 | 876906627 | 2022-11-15T11:47:06.106 | 11/15/2022 | 12 / 3 | `0cf5b0132f717b4b934bfddf92a3b5d2dfc3938c1499eb488d4cac717bad6da0` |
| inst2 | 876693618 | 2022-11-14T11:47:06.465 | 11/14/2022 | 12 / 3 | `e1c6aa4cb14744f76177bb1bc1fb23a137c7865cf53de960b51040c0990fe77f` |
| inst3 | 877116040 | 2022-11-16T11:47:07.309 | 11/16/2022 | 12 / 3 | `8bfc6e9c9727fa9af3112607732145f956d125a8fc9436e85ddb64df18019371` |
| inst4 | 877324251 | 2022-11-17T11:47:06.016 | 11/17/2022 | 12 / 3 | `49680dfc573f033d7ef5eeb82cce9ffe882c8f1844557dba3b23f442c260cd37` |
| inst5 | 877531745 | 2022-11-18T11:47:05.227 | 11/18/2022 | 12 / 3 | `c42cfbccfbc97ef8f5c33242f4d284a9e330d820727311675c582be2340141b7` |
| inst6 | 876908682 | 2022-11-15T12:02:07.696 | 11/15/2022 | 12 / 4 | `1dc7797a637a3bb1ac0618a5c9bb6d0b6afa8d93e8b4d91bf7a77c5b5a96d8ed` |
| inst7 | 874412523 | 2022-11-03T11:47:06.365 | 11/03/2022 | 12 / 3 | `315a0bc825ad6ec4be6bc36325aed2f5b5ae70a57e41a3900dae70221c2b770d` |
| inst8 | 871747934 | 2022-10-21T11:47:05.670 | 10/21/2022 | 12 / 3 | `a4b9e93859197ad22af949a830670d6e3a3c4d969a3783841e8001b84831cf7b` |
| inst9 | 869702031 | 2022-10-11T11:47:05.740 | 10/11/2022 | 12 / 3 | `d6810a6981e143020594e62af083940302ffe3eb1c78f4d3a037a7071ff39d80` |
| inst10 | 859152746 | 2022-08-20T11:47:06.851 | 08/20/2022 | 12 / 3 | `00869a329e83ef69e9221069a423c7be1f9af2a004efa99995ad67703f7bc55e` |
| inst11 | 897926418 | 2023-02-23T11:47:05.795 | 02/23/2023 | 12 / 3 | `db9d4c30b360a98ef5d861f0a52d9ac9487ae1582be622f6dd27459b95102d7f` |
| inst12 | 920842188 | 2023-06-07T11:47:05.393 | 06/07/2023 | 12 / 3 | `f896554be90b94f4dbd4ea07e819d0800a5075796b94893cd888ee177d337494` |

Inst1 and inst6 are one interval each on 2022-11-15 (hour 12, intervals 3 and 4). They are archive samples for a day whose live From/To was empty in batch 6. This drop did not re-query that live endpoint. They are not a full day and not a live From/To fill. No NP6 CSV in this drop has DeliveryDate 10/15/2023.

Reused listing: page 135 from batch 6 (`…page135_reused_for_batch7.json`, SHA-256 `44fcd5a84f043032a35dfeaf06ec156751eac31b3c09e631d21d9e25f1d86d60`). New listing pages 136, 137, 138, 139, 144, 126, 116, and 98 are listings only.

## Not counted

Live `deliveryDateFrom` / `deliveryDateTo` pages. Only pages 1–3 were kept where rows exist. That is not a full day.

| Day | NP4-190-CD | NP6-905-CD |
| --- | --- | --- |
| 2023-10-15 | empty (`totalRecords` 0) | empty (`totalRecords` 0) |
| 2024-08-15 | 21960 records / 22 pages | 88992 records / 89 pages |

2023-10-15 still needs an archive download whose real-time CSV `DeliveryDate` is that day, or the absent ER products. The NP4 zip posted 2023-10-14 covers DeliveryDate 10/15/2023. That is one day-ahead file, not a live From/To fill, and there is no NP6 interval for 2023-10-15 in this drop.

## Not claimed

No zip was excluded. Five-year coverage is not complete. Proxy `covered_local_dates` stay empty. `source_point_id` stays null. Settlement point names inside the CSVs were not mapped to fictional sites. NP4-180-ER and NP6-785-ER stay absent. No Public API path is invented for them. `RetainedSettlementArchive` opens these zips the same way as batch2 through batch6: sidecar check, then inflate, then parse. That read does not fill proxy coverage.
