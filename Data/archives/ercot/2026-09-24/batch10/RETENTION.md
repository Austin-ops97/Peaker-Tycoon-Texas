# ERCOT retain — batch 10 (2026-09-25)

Tenth SOURCE drop, beside batches 1–9. Every file that arrived with a `.sha256` sidecar matched that sidecar before it was copied. Twenty-eight price-instance zips matched. None were excluded. JSON listings, reused listings, and artifact pages are retained and are not part of `source_batch_count`. `READY.md` and `download-meta.json` have no sidecar in this drop, same as earlier batches.

READY timestamp (America/Chicago): 2026-09-25 06:18:32 CT. Token HTTP status recorded there was 200. READY records no HTTP 401, 403, or 429 on this drop. No subscription key, password, username, or bearer token is in these files. Card key names appear as names only. NP4-180-ER and NP6-785-ER were not requested.

`source_batch_count` adds these 28 zips only. With the earlier 171, the manifest total is 199.

## Counted zips

### NP4-190-CD archive instances (12)

Posts run 2021-08-13 through 2024-07-14. Each CSV has hour endings `01:00` through `24:00` and one `DeliveryDate`. That delivery date is the civil day after the post. Header: `DeliveryDate`, `HourEnding`, `SettlementPoint`, `SettlementPointPrice`, `DSTFlag`. These are market files. They are not assigned to fictional sites.

| Zip | docId | postDatetime | DeliveryDate in the CSV | SHA-256 |
| --- | --- | --- | --- | --- |
| inst1 | 789966340 | 2021-08-15T12:33:15.000 | 08/16/2021 | `d7997dfd2c28424b195db9fe362ff82a7de526794453ef001d02392194f9500e` |
| inst2 | 806478424 | 2021-11-15T14:15:46.000 | 11/16/2021 | `fb9222e5db14f36367bd7ff01eed1f98b88aa85a5a332b88ef6f902bb6a53aa8` |
| inst3 | 828352459 | 2022-03-15T12:41:06.000 | 03/16/2022 | `b08391c43ae5d1a7620acdd2be17f74294985420fde87e277a10b6feb554d00b` |
| inst4 | 834093772 | 2022-04-15T12:30:37.000 | 04/16/2022 | `5a325bb4c11004d140b6395f376f834df60e333278e702ec061b849276c77e61` |
| inst5 | 864597486 | 2022-09-16T12:28:40.000 | 09/17/2022 | `bfed7395ff953b7b7df395c89695ebdef919f395fd266bb913dcf2b5b9b9daa0` |
| inst6 | 789622913 | 2021-08-13T12:33:39.000 | 08/14/2021 | `eb909c87ae63f55d833c174ca24af809b00d1b5dc8a44e650696192f378a2a64` |
| inst7 | 806112432 | 2021-11-13T12:35:41.000 | 11/14/2021 | `f13eb8d5cc9b64ddca612cfa3346ae7ca138554f66fe0c371bdac8d32618335c` |
| inst8 | 827982088 | 2022-03-13T12:37:29.000 | 03/14/2022 | `7cae5a49b8be20dbc5a82c036b71f82b799f71139a5a7f3348972f3939ea4fdb` |
| inst9 | 833716387 | 2022-04-13T12:28:15.000 | 04/14/2022 | `7c74b644d0470ad5a0fc7fe6a9de3c6fee0961cfb3a2f67df3e20e71aa8d5757` |
| inst10 | 863987055 | 2022-09-13T12:34:39.000 | 09/14/2022 | `fe2cc200c303cf80fa46a80c89f72c6123207add4536eec2761b9b6eae1d05b4` |
| inst11 | 981119077 | 2024-02-15T12:35:05.000 | 02/16/2024 | `1d30b197221113fa3f26e26e5b952de5a4bb495081e9ff918005c74d556be363` |
| inst12 | 1019633370 | 2024-07-14T12:32:21.000 | 07/15/2024 | `109b55e8806e86f9a4372600f8d0ef48f607f91a387f3bcdb7935cbe7da716a4` |

Inst12’s post is 2024-07-14. Its CSV `DeliveryDate` is 07/15/2024. No NP4 zip in this drop has CSV `DeliveryDate` 03/15/2021. Live From/To for 2021-03-15 returned `totalRecords` 0 on both products.

NP4 listing page 1 was copied from batch 9 (`np4-190-cd_archive_page1_reused_from_batch9.json`, SHA-256 `7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344`). Page 2 was copied from batch 9 (`np4-190-cd_archive_page2_reused_from_batch9.json`, SHA-256 `a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908`). Listings are not counted.

### NP6-905-CD instances (16)

Each zip is one CSV and one hour/interval, not a full day. Header: `DeliveryDate`, `DeliveryHour`, `DeliveryInterval`, `SettlementPointName`, `SettlementPointType`, `SettlementPointPrice`, `DSTFlag`. A filename clock stamp is not always the CSV hour-ending. Hour-ending 24 stays on the same `DeliveryDate`.

| Zip | docId | postDatetime | DeliveryDate | Hour / interval | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| inst1 | 763403133 | 2021-03-15T11:47:04.959 | 03/15/2021 | 12 / 3 | `feda0ffd680afe682990ce657717f84b364d43565a823286b8dc5e723cbcbd4d` |
| inst2 | 806458995 | 2021-11-15T11:47:06.101 | 11/15/2021 | 12 / 3 | `17df952d48bb193e8e29a396330463c76bf122b39c105c326f70e4b1a0d6ef85` |
| inst3 | 1019888348 | 2024-07-15T11:47:01.000 | 07/15/2024 | 12 / 3 | `a4af226b3e5b3d24b19a651cb375ac95e74afc606f21f781308c4731867d672e` |
| inst4 | 1052807283 | 2024-11-15T23:47:01.000 | 11/15/2024 | 24 / 3 | `ee952aefb48713cd3d2c88386803026f6b3fa22d34b69e087406845335ca00c7` |
| inst5 | 1069383183 | 2025-01-15T11:47:01.000 | 01/15/2025 | 12 / 3 | `197067b8e8de65e17aba9c25a3dd3f20cfa7eab99cdaa19ae6f244fd2d5d695b` |
| inst6 | 1094508425 | 2025-04-15T11:47:01.000 | 04/15/2025 | 12 / 3 | `fee3fc3429c22593b8b6cb4ecf39fd3605e849a86c0722c7f4408ec80016888d` |
| inst7 | 792287108 | 2021-08-28T11:47:05.341 | 08/28/2021 | 12 / 3 | `7a84a44d4ce07cfadb50c596123d61b5f1b57f0403eb8feb62c44c58e707449e` |
| inst8 | 830179341 | 2022-03-25T11:47:06.851 | 03/25/2022 | 12 / 3 | `8e964998a313832c9cb3042d3bbab087fa5ab135f1cbfe5728c46fc89617fbb7` |
| inst9 | 831479095 | 2022-04-01T11:47:05.271 | 04/01/2022 | 12 / 3 | `2fd1002cd5120e923227db7a6981934156339ef62e77bb6d8e4948030f7d3e0f` |
| inst10 | 867041131 | 2022-09-28T11:47:05.742 | 09/28/2022 | 12 / 3 | `97cc85669e547a0b6db944f0ade4bead8e2cf87b7b745a15724b8967ed3f02ca` |
| inst11 | 984437037 | 2024-02-28T20:32:07.000 | 02/28/2024 | 21 / 2 | `ecef29b74f4434f60af6652f07e0f2548e642a429235c4d2ff8ada2e81b788c5` |
| inst12 | 1040595008 | 2024-10-01T11:47:01.000 | 10/01/2024 | 12 / 3 | `ea9b24c397842c2695374e33bb647ccf45c5c29aa272ee071cc3f3b06bd740ad` |
| inst13 | 763404983 | 2021-03-15T12:02:05.101 | 03/15/2021 | 12 / 4 | `a316e7bf6e113bcc784bc120242e11ad8d04e3794d413929e9404c7fe6c91b2b` |
| inst14 | 806460742 | 2021-11-15T12:02:05.711 | 11/15/2021 | 12 / 4 | `44c099778e0d73db3a677d84df89ebb8a0bcf90d1c11add7ee0b2ae47e2c1a0f` |
| inst15 | 1019891638 | 2024-07-15T12:02:01.000 | 07/15/2024 | 12 / 4 | `8d547c7ba5b29f8a43f0b1bc6c49ac0f92acfeb44c976f5c88f392d720bf01a4` |
| inst16 | 1052784376 | 2024-11-15T21:32:01.000 | 11/15/2024 | 22 / 2 | `6a6e610e37c3fec9fd847209d791f47c28d30ac69770a353c016be9be04b779b` |

Two zips have CSV `DeliveryDate` 03/15/2021: inst1 (hour 12 interval 3) and inst13 (hour 12 interval 4). They are archive samples. Live From/To for 2021-03-15 returned no rows. These intervals are not a live From/To fill and not a full day. Inst4’s filename stamp is 2024-11-15 23:45; the CSV is hour 24 interval 3 on 11/15/2024. Inst11’s stamp 20:30 is hour 21 interval 2 on 02/28/2024. Inst16’s stamp 21:30 is hour 22 interval 2 on 11/15/2024.

Reused listings: page 178 from batch 4 (`…page178_reused_for_batch10.json`, SHA-256 `acfbade1e4fd23d531308fe1a398490291637c3dd68dc8925ca33605a355153c`), page 158 from batch 5 (`…page158_reused_for_batch10.json`, SHA-256 `34055b225a4a709f2b713bf234a31d6289f5ada54eb35f3574c0666f921b33ba`), page 140 from batch 4 (`…page140_reused_for_batch10.json`, SHA-256 `f90ed7398b7e7acc519d7572ad23c07fe3f5c1b2c151811404265effd1b8147d`), page 90 from batch 4 (`…page90_reused_for_batch10.json`, SHA-256 `d200ddf5ff8af1c8e6d5f4cbb82a7c60d79908a55fc6d3b27f93303b39a9341a`), and page 70 from batch 4 (`…page70_reused_for_batch10.json`, SHA-256 `52d442271e92087edf752ddc73935a7b987cebd543d787aaa629a699f92b949f`). New listing pages 194, 171, 77, 65, 60, and 51 are listings only.

## Not counted

Live `deliveryDateFrom` / `deliveryDateTo` pages.

| Day | NP4-190-CD | NP6-905-CD |
| --- | --- | --- |
| 2021-03-15 | 0 records | 0 records |
| 2025-04-15 | 23712 records / pages 1–3 kept | 96000 records / pages 1–3 kept |

2025-04-15 pages are not a full day. 2021-03-15 is empty on the live fetch. Months 2024-12 and 2025-05, 2025-06, 2025-07, 2025-09, 2025-10, and 2025-11 were not recorded as live From/To empty in this drop. They are a note for a later batch, not a gate in this inventory.

## Not claimed

No zip was excluded. Five-year coverage is not complete. Proxy `covered_local_dates` stay empty. `source_point_id` stays null. Settlement point names inside the CSVs were not mapped to fictional sites. NP4-180-ER and NP6-785-ER stay absent. No Public API path is invented for them. `RetainedSettlementArchive` still opens batch2 through batch9 only. That read does not fill proxy coverage.
