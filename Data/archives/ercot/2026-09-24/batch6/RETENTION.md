# ERCOT retain — batch 6 (2026-09-24)

Sixth SOURCE drop, beside batches 1–5. Every file that arrived with a `.sha256` sidecar matched that sidecar before it was copied. Twenty-five price-instance zips matched. None were excluded. JSON listings, reused listings, and artifact pages are retained and are not part of `source_batch_count`. `READY.md` and `download-meta.json` have no sidecar in this drop, same as earlier batches.

READY timestamp (America/Chicago): 2026-09-24 14:46:44 CT. Token HTTP status recorded there was 200. READY records five HTTP 429 responses; backoff finished and the retained bytes match their sidecars. No 401 or 403 on the final responses. No subscription key, password, username, or bearer token is in these files. Card key names appear as names only. NP4-180-ER and NP6-785-ER were not requested.

`source_batch_count` adds these 25 zips only. With the earlier 63, the manifest total is 88.

## Counted zips

### NP4-190-CD archive instances (14)

Posts run 2021-04-14 through 2024-01-14. Each CSV has hour endings `01:00` through `24:00` and one `DeliveryDate`. That delivery date is the civil day after the post. Header: `DeliveryDate`, `HourEnding`, `SettlementPoint`, `SettlementPointPrice`, `DSTFlag`. These are market files. They are not assigned to fictional sites.

| Zip | docId | postDatetime | DeliveryDate in the CSV | SHA-256 |
| --- | --- | --- | --- | --- |
| inst1 | 768484164 | 2021-04-14T12:33:09 | 04/15/2021 | `7c3ef076e8f01ad619359691f80b3e407f74fd02e55995a99b274ccdd5375d7f` |
| inst2 | 851721131 | 2022-07-14T12:28:32 | 07/15/2022 | `8621a831d886fc311cf14468e666bb0972415966055d34d2c29ccc541a6d7267` |
| inst3 | 889403190 | 2023-01-14T12:33:44.769 | 01/15/2023 | `0219dc94e7cbcd9c3e1d0e208b9345dd2a334f92682c59b3f04defe11cebde27` |
| inst4 | 908799936 | 2023-04-14T12:34:12.221 | 04/15/2023 | `57f27dcb0493b4c26cf88af645d5a601335fddbcb4255bf82b32da42ad0f1bc0` |
| inst5 | 778995380 | 2021-06-14T12:33:02 | 06/15/2021 | `5c66d8a83f4188731edb05be8d074835ce4d7ae7d2b8c3eb65e8d0a684e7d83f` |
| inst6 | 795352419 | 2021-09-14T12:33:43 | 09/15/2021 | `12479a5f668779be025db9ba19adb2c79e6887718d1277f3374a60de3acc4482` |
| inst7 | 806282994 | 2021-11-14T12:33:41 | 11/15/2021 | `cec661aec325d89e2aaffd7d755c1d419104f4ccfb52866d0027661770845799` |
| inst8 | 833904939 | 2022-04-14T12:28:34 | 04/15/2022 | `81b9d6838f2fb4120c3eca1433c051ffd9f7e7b049c5dae266731a7d2d7c1611` |
| inst9 | 857947135 | 2022-08-14T12:27:33 | 08/15/2022 | `e76a54b42a8061948b214ea1c9ba9ff7e84e10d07fc4730d0be170f618127013` |
| inst10 | 876700070 | 2022-11-14T12:34:42 | 11/15/2022 | `431cd103baad8a3219793380ca83d8d2f7bf8338e0f4e6a7ad7dfc49e86e9662` |
| inst11 | 896008634 | 2023-02-14T13:08:28.554 | 02/15/2023 | `a3c31dded071039f8f0458f344d02dd66381f47ed96630af5b705b0c81ec356d` |
| inst12 | 915418450 | 2023-05-14T12:35:47.684 | 05/15/2023 | `ca638759a5e9465d6cf5e9d916922595c0b13fcd5e70af64abde0054ae85323e` |
| inst13 | 929271813 | 2023-07-14T12:35:06.227 | 07/15/2023 | `f459100982f3f0164c4514f573f6d6cd0af8395806efdca94952df0d948b5c47` |
| inst14 | 973099207 | 2024-01-14T12:35:50 | 01/15/2024 | `61968b0dfe69fca3d0af37f5844b17d3a54a6f3b74758a4d2956f148541384ab` |

NP4 listing page 1 was copied from batch 4 (`np4-190-cd_archive_page1_reused_from_batch4.json`, SHA-256 `7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344`). Page 2 was copied from batch 5 (`np4-190-cd_archive_page2_reused_from_batch5.json`, SHA-256 `a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908`). Listings are not counted.

The posts on 2021-04-14, 2022-07-14, 2023-01-14, and 2023-04-14 cover DeliveryDate 04/15/2021, 07/15/2022, 01/15/2023, and 04/15/2023. Those are archive files for days whose live From/To was empty in earlier drops. They are not a new live From/To result.

### NP6-905-CD instances (11)

Each zip is one CSV and one hour/interval, not a full day. Header: `DeliveryDate`, `DeliveryHour`, `DeliveryInterval`, `SettlementPointName`, `SettlementPointType`, `SettlementPointPrice`, `DSTFlag`.

| Zip | docId | postDatetime | DeliveryDate | Hour / interval | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| inst1 | 851917168 | 2022-07-15T11:47:06.702 | 07/15/2022 | 12 / 3 | `4bdf94ad6d951548543207aa1bb11609f52753981e093fb7eae537e62a458a72` |
| inst2 | 768652939 | 2021-04-15T12:02:16.259 | 04/15/2021 | 12 / 4 | `0b5414d2f0bb21b9cc3f33cec5fbfcaa11d283a3e6c1da97bdab0835571168c0` |
| inst3 | 889599083 | 2023-01-15T11:47:05.078 | 01/15/2023 | 12 / 3 | `2abc5cb3f7aabfa1a0837b3fff3fc24684597caee9a0cf91b7e5a05679f22b03` |
| inst4 | 908142435 | 2023-04-11T11:47:07.146 | 04/11/2023 | 12 / 3 | `762d9d0ecddb0dd09abd566288b7512e1d7e83eb3a3e02f176a4332afb44a3d5` |
| inst5 | 860746717 | 2022-08-28T11:47:06.544 | 08/28/2022 | 12 / 3 | `3a581c88c4b4bdfa5e4e00ede9b4742b3b467bb4978218f3b2c143d252fc9e44` |
| inst6 | 878136884 | 2022-11-21T11:47:05.288 | 11/21/2022 | 12 / 3 | `78bcd14a41e8b2ca3a412347c8de171105be03f72f9615bf654e47e67e566a0a` |
| inst7 | 838433812 | 2022-05-08T11:47:05.434 | 05/08/2022 | 12 / 3 | `919bc3549d9f400311e0bafd12732498db6d55f985e0d5437e112664976ee700` |
| inst8 | 928108758 | 2023-07-09T11:47:07.162 | 07/09/2023 | 12 / 3 | `badf3599fd287580df087293e6d021b4c93fd0648ae00dc9f1102f4f40ab3ac7` |
| inst9 | 947107104 | 2023-09-28T11:47:06.191 | 09/28/2023 | 12 / 3 | `86df779cf127bd0a0037b6d855b11b21e686cab3ea647fb1564f342fcb9cdcc5` |
| inst10 | 972598466 | 2024-01-12T11:47:07 | 01/12/2024 | 12 / 3 | `e340a665ea39715aef9f3c04d66141b4fafb066d66297c48bef2c14ebd1fa930` |
| inst11 | 909008794 | filename stamp 2023-04-15 11:45 | 04/15/2023 | 12 / 3 | `e71a49834a93ed83b28678873b8bd332dce56cad931c2e17aae8fcda07876251` |

READY and `download-meta.json` list ten NP6 instance records. Inst11 is in this drop with a matching sidecar. Its CSV `DeliveryDate` is 04/15/2023, hour 12, interval 3. A full post timestamp for that zip is not written in READY.

Inst1, inst2, inst3, and inst11 are one interval each on 2022-07-15, 2021-04-15, 2023-01-15, and 2023-04-15. They are not full days. Batch 5 already has a different NP6 interval on 2021-04-15 (hour 12, interval 3).

Reused listings: page 147 from batch 5 (`…page147_reused_for_batch6.json`, SHA-256 `645da241224a3d3925b78afccac9697107273fe56ef3c0a65041016e79ba212f`) and page 191 from batch 5 (`…page191_reused_for_batch6.json`, SHA-256 `6d99cf01cdf5225d881c6634b218ab7647475ad75ef4b78fd3d50a6a7a47d363`). New listing pages 130, 122, 143, 135, 154, 113, 105, and 95 are listings only.

## Not counted

Live `deliveryDateFrom` / `deliveryDateTo` pages. Only pages 1–3 were kept where rows exist. That is not a full day.

| Day | NP4-190-CD | NP6-905-CD |
| --- | --- | --- |
| 2022-11-15 | empty (`totalRecords` 0) | empty (`totalRecords` 0) |
| 2024-05-15 | 21792 records / 22 pages | 88320 records / 89 pages |
| 2025-09-15 | 25128 records / 26 pages | 101664 records / 102 pages |

2022-11-15 still needs an archive download whose real-time CSV `DeliveryDate` is that day, or the absent ER products. The NP4 zip posted 2022-11-14 covers DeliveryDate 11/15/2022. That is one day-ahead file, not a live From/To fill, and there is no NP6 interval for 2022-11-15 in this drop.

## Not claimed

No zip was excluded. Five-year coverage is not complete. Proxy `covered_local_dates` stay empty. `source_point_id` stays null. Settlement point names inside the CSVs were not mapped to fictional sites. NP4-180-ER and NP6-785-ER stay absent. No Public API path is invented for them. `RetainedSettlementArchive` still opens batch2 through batch5 only. This folder is retained bytes, not yet on that read path.
