# ERCOT retain — batch 5 (2026-09-24)

Fifth SOURCE drop, beside batches 1–4. Every file that arrived with a `.sha256` sidecar matched that sidecar before it was copied. Fourteen price-instance zips matched. None were excluded. JSON listings, reused listings, and EMPTY artifact pages are retained and are not part of `source_batch_count`. `READY.md` and `download-meta.json` have no sidecar in this drop, same as earlier batches.

READY timestamp (America/Chicago): 2026-09-24 14:28:17 CT. Token HTTP status recorded there was 200. No 401, 403, or 429 on the final responses. No subscription key, password, username, or bearer token is in these files. Card key names appear as names only. NP4-180-ER and NP6-785-ER were not requested.

`source_batch_count` adds these 14 zips only. With the earlier 49, the manifest total is 63.

## Counted zips

### NP4-190-CD archive instances (7)

Posts run 2021-02-14 through 2022-07-16. Each CSV has hour endings `01:00` through `24:00` and one `DeliveryDate`. That delivery date is the civil day after the post. Header: `DeliveryDate`, `HourEnding`, `SettlementPoint`, `SettlementPointPrice`, `DSTFlag`. These are market files. They are not assigned to fictional sites.

| Zip | docId | postDatetime | DeliveryDate in the CSV | SHA-256 |
| --- | --- | --- | --- | --- |
| inst1 | 758641836 | 2021-02-14T14:55:01 | 02/15/2021 | `6616c68bd41419e804a2ce65608d8d3d34cdd5a1198d62f82415f6c3e783a137` |
| inst2 | 763408356 | 2021-03-15T12:33:05 | 03/16/2021 | `8ef15fd06af536688b09aa168871d41c6325edb89fa6259f21250ea0334dbc66` |
| inst3 | 768828508 | 2021-04-16T12:33:49 | 04/17/2021 | `190ddd317c569189d0b1d3614a17b5bcf7eaab04ce0f2e8d54ba9cc860b14839` |
| inst4 | 784624476 | 2021-07-16T12:33:37 | 07/17/2021 | `a9028fd1136237166235c48fb8c13c45b3f75980b6c6e144d4dd8005a8d0bea2` |
| inst5 | 817680531 | 2022-01-16T12:30:42 | 01/17/2022 | `ae406a101f81550da4cf1de08b576a9bde2ca77f6e2038327e9fc840f42f9f7c` |
| inst6 | 828536499 | 2022-03-16T12:44:06 | 03/17/2022 | `aa911c8fc359127e039d76c99809f7793bc57d2ddb08d535deb43a67ff349200` |
| inst7 | 852119649 | 2022-07-16T12:28:56 | 07/17/2022 | `1608a23c392acaa56a64958568255b36266afef5201cfef2705d054ef0644b63` |

NP4 listing page 2 was copied from batch 4 (`np4-190-cd_archive_page2_reused_from_batch4.json`, SHA-256 `a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908`). Page 3 was copied from batch 3 (`np4-190-cd_archive_page3_reused_from_batch3.json`, SHA-256 `15cefe81cb08bf541e550468a4ea67c8f9d21695635bef1fb718d6acba49802a`). Listings are not counted. The NP4 zip posted 2021-04-16 covers DeliveryDate 04/17/2021, not 2021-04-15. The NP4 zip posted 2022-07-16 covers DeliveryDate 07/17/2022, not 2022-07-15.

### NP6-905-CD early-window instances (7)

Each zip is one CSV and one hour/interval, not a full day. Header: `DeliveryDate`, `DeliveryHour`, `DeliveryInterval`, `SettlementPointName`, `SettlementPointType`, `SettlementPointPrice`, `DSTFlag`.

| Zip | docId | postDatetime | DeliveryDate | Hour / interval | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| inst1 `…20210219_0545_csv.zip` | 759415177 | 2021-02-19T05:47:04.572 | 02/19/2021 | 6 / 3 | `6316fff071c9db64c79e39fc5ba3f8c109191b20c6dc8c0eb42e742a3a9d6e83` |
| inst2 `…20210415_1145_csv.zip` | 768651349 | 2021-04-15T11:47:05.629 | 04/15/2021 | 12 / 3 | `a57ce1d72352549dd80e2634e5aa81db265019d7341ca4ef09845611c17d0a95` |
| inst3 `…20220115_1145_csv.zip` | 817499214 | 2022-01-15T11:47:05.037 | 01/15/2022 | 12 / 3 | `cab963886cdbaf215f5a2155f1bc3d6f09160c28ca6665589bbc0c683445f282` |
| inst4 `…20210519_0430_csv.zip` | 774460998 | 2021-05-19T04:32:07.829 | 05/19/2021 | 5 / 2 | `14ea22ba27c330dd7c090b1642341888ca90d0cf9196db1e21fb6e1cfe217814` |
| inst5 `…20210720_1630_csv.zip` | 785365684 | 2021-07-20T16:32:06.862 | 07/20/2021 | 17 / 2 | `65dc5bacd6874e7a04d7a5bed0c1045ee1fce247616bf12e1d74b1eddf07a6ba` |
| inst6 `…20211012_0000_csv.zip` | 800246894 | 2021-10-12T00:02:05.891 | 10/11/2021 | 24 / 4 | `9b183eb5a8499494d66a33a4f5c7bf334308bbdefb416abe291e066f1cbc4bd9` |
| inst7 `…20211213_1100_csv.zip` | 811491049 | 2021-12-13T11:02:06.567 | 12/13/2021 | 11 / 4 | `df36718ce7c423ab63da358f7fe3795ea64a37145c082566adfd0215c6fecefe` |

Inst2 is one interval on 2021-04-15. Live From/To for that day is still empty. Inst6’s hour-ending 24 interval 4 has DeliveryDate 10/11/2021, the previous civil day. These stamps are market files, not proxy coverage.

Archive pages for these docIds: page 197 copied from batch 3 (`np6-905-cd_archive_page197_reused_for_early.json`, SHA-256 `56285d26c6a7c530b88319aad9a9a70ef3b20530996150fda0d9b3975e6d7851`), page 191 copied from batch 2 (`…page191_reused_for_early.json`, SHA-256 `6d99cf01cdf5225d881c6634b218ab7647475ad75ef4b78fd3d50a6a7a47d363`), page 165 copied from batch 4 (`…page165_reused_for_early.json`, SHA-256 `ee1dca123065887a2c4a03fd862e5d07405e0ecee22a40dc1108a626e9996142`), page 127 copied from batch 4 (`…page127_reused_for_early.json`, SHA-256 `30dc72ac867daa5c6dfde318b370d700a5470322e798042f694d5489f382ed3b`). New listing pages 188, 182, 174, and 168 supplied inst4–inst7. Pages 158, 147, and 132 are listings only.

## Not counted

Live `deliveryDateFrom` / `deliveryDateTo` pages. Each retained page is empty.

| Day | NP4-190-CD | NP6-905-CD |
| --- | --- | --- |
| 2021-04-15 | empty (`totalRecords` 0) | empty (`totalRecords` 0) |
| 2022-07-15 | empty (`totalRecords` 0) | empty (`totalRecords` 0) |
| 2023-04-15 | empty (`totalRecords` 0) | empty (`totalRecords` 0) |

Those three days still need an archive `?download=` whose CSV `DeliveryDate` is that day, or the absent ER products. Archive densify was used for nearby posts. It did not fill these live From/To days.

## Not claimed

No zip was excluded. Five-year coverage is not complete. Proxy `covered_local_dates` stay empty. `source_point_id` stays null. Settlement point names inside the CSVs were not mapped to fictional sites. NP4-180-ER and NP6-785-ER stay absent. No Public API path is invented for them. `RetainedSettlementArchive` still opens batch2, batch3, and batch4 only. This folder is retained bytes, not a change to that read path.
