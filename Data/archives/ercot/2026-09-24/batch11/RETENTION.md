# ERCOT retain — batch 11 (2026-09-25)

Eleventh SOURCE drop, beside batches 1–10. Every file that arrived with a `.sha256` sidecar matched that sidecar before it was copied. Thirty price-instance zips matched. None were excluded. JSON listings, reused listings, and artifact pages are retained and are not part of `source_batch_count`. `READY.md` and `download-meta.json` have no sidecar in this drop, same as earlier batches.

READY timestamp (America/Chicago): 2026-09-25 06:33:51 CT. Token HTTP status recorded there was 200. READY records no HTTP 401, 403, or 429 on this drop. No subscription key, password, username, or bearer token is in these files. Card key names appear as names only. NP4-180-ER and NP6-785-ER were not requested.

`source_batch_count` adds these 30 zips only. With the earlier 199, the manifest total is 229.

## Counted zips

### NP4-190-CD archive instances (14)

Posts run 2024-12-13 through 2025-11-15. Each CSV has hour endings `01:00` through `24:00` and one `DeliveryDate`. That delivery date is the civil day after the post. Header: `DeliveryDate`, `HourEnding`, `SettlementPoint`, `SettlementPointPrice`, `DSTFlag`. These are market files. They are not assigned to fictional sites.

| Zip | docId | postDatetime | DeliveryDate in the CSV | SHA-256 |
| --- | --- | --- | --- | --- |
| inst1 | 1060876405 | 2024-12-15T12:32:03.000 | 12/16/2024 | `9629e5ab9fe35605bf5c567dbd74a4e5ad76a9be15eaf35cb15bbb3ae285f6ba` |
| inst2 | 1103146021 | 2025-05-15T12:32:50.000 | 05/16/2025 | `261e85145a9ff4b212ad7c583e6dafe6b477a4a0f83abd7738764b9b7070025e` |
| inst3 | 1112207202 | 2025-06-15T12:32:17.000 | 06/16/2025 | `aa1bcfaa127923bda48549e3b7319b883805887801314655ca51b28813266f7c` |
| inst4 | 1121114317 | 2025-07-15T12:40:24.000 | 07/16/2025 | `9a607fa57a692dc8e3c7d16743d407b5a2ca39af4b1f47928985649c69894f80` |
| inst5 | 1140481884 | 2025-09-14T12:32:06.000 | 09/15/2025 | `ae8dc4672320ee1e4d40426c3fd933b16b6baa67fa0e3530709ba1d8c29516ca` |
| inst6 | 1150803180 | 2025-10-15T12:39:46.000 | 10/16/2025 | `ef0d426d0b46f9f2a5489ca89daf32d8c7da78dd6a1b9db61de24ea9027ef5bd` |
| inst7 | 1160958466 | 2025-11-15T12:41:59.000 | 11/16/2025 | `1e5a271d57cec664b7781566f7bd71a376cf9384fedb5fe38b689a75d0d55717` |
| inst8 | 1060344099 | 2024-12-13T12:32:30.000 | 12/14/2024 | `f3fb843ee9c1e0cc27b0988a9ce2e3cd65c586f7bdc5d574996ef71416a0c9b6` |
| inst9 | 1102560327 | 2025-05-13T12:56:10.000 | 05/14/2025 | `d82984f9b7c2a02dbe8771086b4923f1623096edb623f92bbbc2268bc7638e5c` |
| inst10 | 1111639570 | 2025-06-13T12:32:18.000 | 06/14/2025 | `33784ebcc8aba0d8787011e1c00fb40599a810af40423a773db4df2cf30ef21a` |
| inst11 | 1120499290 | 2025-07-13T12:32:15.000 | 07/14/2025 | `a76bac342c5ccba14d464dba99ebb1123db914abf0944b4c6af6e3f36de867a0` |
| inst12 | 1140156593 | 2025-09-13T12:32:20.000 | 09/14/2025 | `b7a00743085fc6491535dfa643d25368d3ac45ff5f1595950590293361e0e3df` |
| inst13 | 1150134105 | 2025-10-13T12:33:05.000 | 10/14/2025 | `e1983ba00ba979ab06e6dbc7ad6d61da0c864ce01a427c363e66d81a36dd0ce4` |
| inst14 | 1160251447 | 2025-11-13T12:32:18.000 | 11/14/2025 | `62696e8562fad7211093c3411a16f3d54bd75c97e8c47d3cbe45efed12a03585` |

Inst5’s post is 2025-09-14. Its CSV `DeliveryDate` is 09/15/2025. Inst1’s post is 2024-12-15. Its CSV `DeliveryDate` is 12/16/2024, not 12/15/2024. This drop recorded no live From/To day with `totalRecords` 0.

NP4 listing page 1 was copied from batch 10 (`np4-190-cd_archive_page1_reused_from_batch10.json`, SHA-256 `7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344`). Page 2 was copied from batch 10 (`np4-190-cd_archive_page2_reused_from_batch10.json`, SHA-256 `a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908`). Listings are not counted.

### NP6-905-CD instances (16)

Each zip is one CSV and one hour/interval, not a full day. Header: `DeliveryDate`, `DeliveryHour`, `DeliveryInterval`, `SettlementPointName`, `SettlementPointType`, `SettlementPointPrice`, `DSTFlag`. A filename clock stamp is not always the CSV hour-ending.

| Zip | docId | postDatetime | DeliveryDate | Hour / interval | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| inst1 | 1061418502 | 2024-12-17T11:47:01.000 | 12/17/2024 | 12 / 3 | `b30b8741faaa6c454081e0a40a96a7d1f1ef59ee102f50f6d399c6fcb12e3509` |
| inst2 | 1103137699 | 2025-05-15T11:47:01.000 | 05/15/2025 | 12 / 3 | `195177a6fabfc29f62cf3009e274f0c1380e5818c29236a18e3c464396389d39` |
| inst3 | 1112199482 | 2025-06-15T11:47:01.000 | 06/15/2025 | 12 / 3 | `f84d301c258483ef3f88bc1ccb22ebbfab254cec482c3b66923cd6cd862221a8` |
| inst4 | 1121104301 | 2025-07-15T11:47:02.000 | 07/15/2025 | 12 / 3 | `d85c4944b60d7e595062a1c31883abef21d27e90f1af60a6b27ed20a29790eb6` |
| inst5 | 1140146883 | 2025-09-13T11:47:01.000 | 09/13/2025 | 12 / 3 | `0cba2a1105c15a0cab91bd42ee67d551063ef70e0415b426b2bb123451ea178d` |
| inst6 | 1150680441 | 2025-10-15T04:32:03.000 | 10/15/2025 | 5 / 2 | `f981237a8041139a940afe1251fc0231c82acfff87028ad16125672d76f913eb` |
| inst7 | 1150653966 | 2025-10-15T02:17:02.000 | 10/15/2025 | 3 / 1 | `c5f8f391c32a9d74bea11373a2af111eaf61b19475671f7c000e30041f8b6f79` |
| inst8 | 1160868375 | 2025-11-15T06:47:02.000 | 11/15/2025 | 7 / 3 | `03e4a4f6c1fc29cc66f8f042f15000790b1c4f88b17c7cfdd6d255478df1f792` |
| inst9 | 1055538591 | 2024-11-26T02:32:02.000 | 11/26/2024 | 3 / 2 | `2330b49173b545ae29f590544d423abf0688506844da7f71c35f94c2973e922a` |
| inst10 | 1094511369 | 2025-04-15T12:02:01.000 | 04/15/2025 | 12 / 4 | `2cda73d593f1e235a60584644a125f4752b8fccbb280fc76b1308f1f457356c4` |
| inst11 | 1069385896 | 2025-01-15T12:02:01.000 | 01/15/2025 | 12 / 4 | `60e6bf5d280a2c7e7370667422204fdce3999890d2d8e2e522aeab04da13afab` |
| inst12 | 1129060942 | 2025-08-10T12:02:02.000 | 08/10/2025 | 12 / 4 | `faa4d705ac34a297d67aa2d56cb370f303cfa090fae0ee904545e2d94f72a4f3` |
| inst13 | 1061432384 | 2024-12-17T12:47:01.000 | 12/17/2024 | 13 / 3 | `31b1402070f4806d161ab3c9cbea8e9aa0125e6881bfd37626e345a130666b02` |
| inst14 | 1103140502 | 2025-05-15T12:02:02.000 | 05/15/2025 | 12 / 4 | `cb6f44e6937c1c12db79b8c9831599c3ab2647e2332411816e7ce1e0bc8d5373` |
| inst15 | 1112202253 | 2025-06-15T12:02:01.000 | 06/15/2025 | 12 / 4 | `a4fa9543e77b4cb94c34d22b8f9ea784056fb1828579a2d80b172968f8c24fc8` |
| inst16 | 1121107288 | 2025-07-15T12:02:01.000 | 07/15/2025 | 12 / 4 | `c9da6db911bf03fd2d9d3e4d250def713919d0b9a96a08f32b81638a68ba33e2` |

Two zips have CSV `DeliveryDate` 12/17/2024: inst1 (hour 12 interval 3) and inst13 (hour 13 interval 3). Inst6’s filename stamp 04:30 is hour 5 interval 2 on 10/15/2025. Inst7’s stamp 02:15 is hour 3 interval 1 on 10/15/2025. Inst8’s stamp 06:45 is hour 7 interval 3 on 11/15/2025. Inst9’s stamp 02:30 is hour 3 interval 2 on 11/26/2024. Inst13’s stamp 12:45 is hour 13 interval 3 on 12/17/2024. Inst10, inst11, and inst12 add a second interval on days that already had hour 12 interval 3 (04/15/2025, 01/15/2025, and 08/10/2025). Each file is one interval.

Reused listings: page 65 from batch 10 (`…page65_reused_for_batch11.json`, SHA-256 `3acce119431ed3547a5601194a94a383adf352d37152877e4dc5885877759ea6`), page 51 from batch 10 (`…page51_reused_for_batch11.json`, SHA-256 `bc563ebd52e907b7df981f7835cb10feef4b3cae35c173b49ba8419f79135a7d`), page 60 from batch 10 (`…page60_reused_for_batch11.json`, SHA-256 `8fae02d68d49bf2bfe3b6e82e6c51fef5d6d6edb697fac58cca22e7b4e2d3ec6`), and page 40 from batch 9 (`…page40_reused_for_batch11.json`, SHA-256 `8f6c27ad5b16aeda56f482ff6fff4cbe68f56a600c460d7a947a91de34110135`). New listing pages 62, 48, 45, 42, 37, 34, and 31 are listings only.

## Not counted

Live `deliveryDateFrom` / `deliveryDateTo` pages. Both days returned rows. Only pages 1–3 were kept. That is not a full day.

| Day | NP4-190-CD | NP6-905-CD |
| --- | --- | --- |
| 2024-12-15 | 22800 records / pages 1–3 kept | 92352 records / pages 1–3 kept |
| 2025-09-15 | 25128 records / pages 1–3 kept | 101664 records / pages 1–3 kept |

This drop recorded no live From/To day with `totalRecords` 0. Archive samples now include days in 2024-12 and in 2025-05, 2025-06, 2025-07, 2025-09, 2025-10, and 2025-11. Those files are samples, not a live From/To fill and not a full day.

## Not claimed

No zip was excluded. Five-year coverage is not complete. Proxy `covered_local_dates` stay empty. `source_point_id` stays null. Settlement point names inside the CSVs were not mapped to fictional sites. NP4-180-ER and NP6-785-ER stay absent. No Public API path is invented for them. `RetainedSettlementArchive` still opens batch2 through batch10 only. That read does not fill proxy coverage.
