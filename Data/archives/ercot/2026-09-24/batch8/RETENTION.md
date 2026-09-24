# ERCOT retain — batch 8 (2026-09-24)

Eighth SOURCE drop, beside batches 1–7. Every file that arrived with a `.sha256` sidecar matched that sidecar before it was copied. Thirty-two price-instance zips matched. None were excluded. JSON listings, reused listings, and artifact pages are retained and are not part of `source_batch_count`. `READY.md` and `download-meta.json` have no sidecar in this drop, same as earlier batches.

READY timestamp (America/Chicago): 2026-09-24 15:11:01 CT. Token HTTP status recorded there was 200. READY records no HTTP 401, 403, or 429 on this drop. No subscription key, password, username, or bearer token is in these files. Card key names appear as names only. NP4-180-ER and NP6-785-ER were not requested.

`source_batch_count` adds these 32 zips only. With the earlier 112, the manifest total is 144.

## Counted zips

### NP4-190-CD archive instances (12)

Posts run 2022-06-13 through 2025-05-14. Each CSV has hour endings `01:00` through `24:00` and one `DeliveryDate`. That delivery date is the civil day after the post. Header: `DeliveryDate`, `HourEnding`, `SettlementPoint`, `SettlementPointPrice`, `DSTFlag`. These are market files. They are not assigned to fictional sites.

| Zip | docId | postDatetime | DeliveryDate in the CSV | SHA-256 |
| --- | --- | --- | --- | --- |
| inst1 | 845722536 | 2022-06-14T12:34:06 | 06/15/2022 | `45a4809dedf43734c406bc80ef40f95a3ad73caea87e82b9cf59accc545b9ae3` |
| inst2 | 922440865 | 2023-06-14T12:35:12.902 | 06/15/2023 | `2e171db2069e9cb11030efe49c58387e3fbbcb86dde19a41e88c373f757a1b05` |
| inst3 | 845515713 | 2022-06-13T12:33:59 | 06/14/2022 | `e27b50d03510e4ce2eab417ee6a2616b69cf52b5b81a8ebaed5ea02e8d2c2fe4` |
| inst4 | 922210881 | 2023-06-13T12:35:44.331 | 06/14/2023 | `21b9a4601a10209582e6e816e6e4e9b6ee0b48b6262600414f7c64c90dd62ed3` |
| inst5 | 995993477 | 2024-04-14T12:40:01 | 04/15/2024 | `c86f87289002d582663b107eed2c902abbb3f4f6c28d7fe0e7becb6994b9e898` |
| inst6 | 1036020038 | 2024-09-14T12:31:58 | 09/15/2024 | `690aadd1019eaca3794cb878f8986ed7fecbccde4fd8d3d64818d9b65a7e835e` |
| inst7 | 1060611912 | 2024-12-14T12:32:08 | 12/15/2024 | `487f4ebb0a36bd87dc0b1394a6822d41916ac824638522aa793e9976e0e0afc4` |
| inst8 | 1077745007 | 2025-02-14T12:32:07 | 02/15/2025 | `e92c966469ad37ab26e634b872a2329db03fce1aa690b10159cc75b110be2e1d` |
| inst9 | 1102852065 | 2025-05-14T12:36:08 | 05/15/2025 | `de6b6442e71842b4dafd4f9f324ceb1a6f081a82de677749cdae7306fafb4e21` |
| inst10 | 1003768678 | 2024-05-14T12:32:44 | 05/15/2024 | `6e8c35a01580a1a8bcd74772796b4533a17599bd6fece8b2d3a5e62326ef5d9a` |
| inst11 | 1044071870 | 2024-10-14T12:35:21 | 10/15/2024 | `55f3d366f8f44e0aae309f21101f9e280abe5e9df15f7a01e199b84c283611fe` |
| inst12 | 1069109760 | 2025-01-14T12:32:08 | 01/15/2025 | `71c7e1eac8f4957afba1b4cc86e49e5fddab8c4997750de989c435546760d3ab` |

NP4 listing page 1 was copied from batch 7 (`np4-190-cd_archive_page1_reused_from_batch7.json`, SHA-256 `7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344`). Page 2 was copied from batch 7 (`np4-190-cd_archive_page2_reused_from_batch7.json`, SHA-256 `a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908`). Listings are not counted.

### NP6-905-CD instances (20)

Each zip is one CSV and one hour/interval, not a full day. Header: `DeliveryDate`, `DeliveryHour`, `DeliveryInterval`, `SettlementPointName`, `SettlementPointType`, `SettlementPointPrice`, `DSTFlag`.

| Zip | docId | postDatetime | DeliveryDate | Hour / interval | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| inst1 | 951298480 | 2023-10-16T11:47:06.268 | 10/16/2023 | 12 / 3 | `e854f8afe1ecbb54dfb689eb60c3667fe128c51de384b65c8b8b811b87606757` |
| inst2 | 951300953 | 2023-10-16T12:02:08.723 | 10/16/2023 | 12 / 4 | `13c9a35daa9e10b70859d7e2e34a0363fe4a85162fb2177591f10803b662af63` |
| inst3 | 951347463 | 2023-10-16T16:47:06.911 | 10/16/2023 | 17 / 3 | `052b26e527b284c20e13c5f51056fb47d1b3f5c6f4d7af25812fd994a2aed972` |
| inst4 | 951412251 | 2023-10-16T23:47:07.285 | 10/16/2023 | 24 / 3 | `1ae12f72703aff97638cc8ff994f95677248ac654b395646c4d1ef1d4a6c4266` |
| inst5 | 951410364 | 2023-10-16T23:32:06.347 | 10/16/2023 | 24 / 2 | `53614216e4fed81c50a6a7bfb431a03b1b086261d3de4a3ae4ed89f29b52bad9` |
| inst6 | 951343893 | 2023-10-16T16:32:06.575 | 10/16/2023 | 17 / 2 | `852983df7f167a8e91ce3fe74461ec411c4ead0a303a46aacb219b0b2d0b97e2` |
| inst7 | 951271256 | 2023-10-16T09:32:05.782 | 10/16/2023 | 10 / 2 | `dba8194126b05ea72047dba23602f4005d50fb52ba694b79b00ffa22eb47f4be` |
| inst8 | 948745148 | 2023-10-05T11:47:07.241 | 10/05/2023 | 12 / 3 | `f9664345429bc197d0f039a19a432e335a3d57321537d8c586c0eaf153d47e11` |
| inst9 | 948509536 | 2023-10-04T11:47:06.538 | 10/04/2023 | 12 / 3 | `7df7c1f024786d7ccd9cd6acd8545dfed076b05dfef159269f5fa6ae2237c647` |
| inst10 | 957482934 | 2023-11-11T11:47:12.138 | 11/11/2023 | 12 / 3 | `892a1ed7655a8f7873d516f699bc98e6d8104da4a63f6c5edf6e55afd267fd3a` |
| inst11 | 954382592 | 2023-10-29T11:47:05.931 | 10/29/2023 | 12 / 3 | `bb23c4c04d8114e72c2eae97847d17c2157d648ccfebaa54d85415d189faead0` |
| inst12 | 951349800 | 2023-10-16T17:02:08.629 | 10/16/2023 | 17 / 4 | `ee071eac1a5367a795252fccf1b2f3f46f72a5911b1836279719082bb076a31f` |
| inst13 | 951063935 | 2023-10-15T11:47:08.176 | 10/15/2023 | 12 / 3 | `7fed90104b63b4bd34feaa61780a0a01f618d2fb35830f2529ff8fc3ddeda40f` |
| inst14 | 951066597 | 2023-10-15T12:02:07.699 | 10/15/2023 | 12 / 4 | `ed56385183182998f37c509e68a3572a107d304c8126b6593db7095270017fbb` |
| inst15 | 951013077 | 2023-10-15T06:47:07.405 | 10/15/2023 | 7 / 3 | `47417935ccc241a9dfe56f36f9c5bcfed986dbc38dfe0ca2bf6ed4dbfa499ce1` |
| inst16 | 951109856 | 2023-10-15T16:47:06.100 | 10/15/2023 | 17 / 3 | `072696c2ac39601ee15e38d95fed0a93051273683c42eaeadccbc4fbf68db398` |
| inst17 | 950949179 | 2023-10-15T00:02:07.446 | 10/14/2023 | 24 / 4 | `d95a66c5b31824a16336f29de4bd1243b41a1c7ced5d51874024cd0b71f7e5fd` |
| inst18 | 951171010 | 2023-10-15T23:47:07.313 | 10/15/2023 | 24 / 3 | `d98a4d624b1bff8b9fd8cb31ea730314f4a358b1ec250fd90ec4aeb9544cc138` |
| inst19 | 950839049 | 2023-10-14T11:47:06.340 | 10/14/2023 | 12 / 3 | `5175b34d75d1f54be0d4747b5cea86271387901d720164048c53965f08b00922` |
| inst20 | 950841377 | 2023-10-14T12:02:07.155 | 10/14/2023 | 12 / 4 | `a778a9a42dad8d2da4a02a746c91f4d2dea5b63dc4b6a16e7728bd6dcc7fbb59` |

Five zips have CSV `DeliveryDate` 10/15/2023: inst13 (hour 12 interval 3), inst14 (hour 12 interval 4), inst15 (hour 7 interval 3), inst16 (hour 17 interval 3), and inst18 (hour 24 interval 3). They are archive samples for a day whose live From/To was empty in batch 7. This drop did not re-query that live endpoint. They are not a full day and not a live From/To fill.

Inst17’s filename stamp is 2023-10-15 00:00. Its CSV `DeliveryDate` is 10/14/2023, hour 24, interval 4. That is the previous civil day, not a 2023-10-15 delivery row. Inst19 and inst20 are 2023-10-14 posts with DeliveryDate 10/14/2023.

Reused listing: page 105 from batch 6 (`…page105_reused_for_batch8.json`, SHA-256 `fe21a49c87475edf927a71a861abf3c632235759133a9cc4d6d4af4e9fc57216`). New listing pages 101, 102, 103, 104, 107, and 99 are listings only.

## Not counted

Live `deliveryDateFrom` / `deliveryDateTo` pages. This drop recorded no empty day (`totalRecords` 0). Only pages 1–3 were kept where rows exist. That is not a full day.

| Day | NP4-190-CD | NP6-905-CD |
| --- | --- | --- |
| 2024-04-15 | 21600 records / 22 pages | 87552 records / 88 pages |
| 2025-05-15 | 24072 records / 25 pages | 97440 records / 98 pages |

## Not claimed

No zip was excluded. Five-year coverage is not complete. Proxy `covered_local_dates` stay empty. `source_point_id` stays null. Settlement point names inside the CSVs were not mapped to fictional sites. NP4-180-ER and NP6-785-ER stay absent. No Public API path is invented for them. The read path still opens batch2 through batch7 only. This retain does not fill proxy coverage.
