# ERCOT retain — batch 9 (2026-09-25)

Ninth SOURCE drop, beside batches 1–8. Every file that arrived with a `.sha256` sidecar matched that sidecar before it was copied. Twenty-seven price-instance zips matched. None were excluded. JSON listings, reused listings, and artifact pages are retained and are not part of `source_batch_count`. `READY.md` and `download-meta.json` have no sidecar in this drop, same as earlier batches.

READY timestamp (America/Chicago): 2026-09-25 05:54:18 CT. Token HTTP status recorded there was 200. READY records no HTTP 401, 403, or 429 on this drop. No subscription key, password, username, or bearer token is in these files. Card key names appear as names only. NP4-180-ER and NP6-785-ER were not requested.

`source_batch_count` adds these 27 zips only. With the earlier 144, the manifest total is 171.

## Counted zips

### NP4-190-CD archive instances (11)

Posts run 2022-09-14 through 2025-12-14. Each CSV has hour endings `01:00` through `24:00` and one `DeliveryDate`. That delivery date is the civil day after the post. Header: `DeliveryDate`, `HourEnding`, `SettlementPoint`, `SettlementPointPrice`, `DSTFlag`. These are market files. They are not assigned to fictional sites.

| Zip | docId | postDatetime | DeliveryDate in the CSV | SHA-256 |
| --- | --- | --- | --- | --- |
| inst1 | 870330412 | 2022-10-14T13:01:56.000 | 10/15/2022 | `d804d241e2140ef0db7a5b962657acc5afa6ed9eed85b5205a1fa1e5cdfbae6e` |
| inst2 | 870524105 | 2022-10-15T12:33:58.000 | 10/16/2022 | `a0e3a3616ea58f255246c50367a7702379dd7ebb54113e708b3010e0cc6061ff` |
| inst3 | 1085553446 | 2025-03-14T12:32:17.000 | 03/15/2025 | `9da98ab9a3daaefd42fe31282a131627a967f23728f9d24b62e562c03ef608db` |
| inst4 | 1111925321 | 2025-06-14T12:32:11.000 | 06/15/2025 | `eef594a293aea62cfc7298c6768d2b2f7d8fa65601a2ba21b38539fced136748` |
| inst5 | 1120795566 | 2025-07-14T12:32:24.000 | 07/15/2025 | `856f354e3b6bf2aaa10936753a6ae90479d48e41625f6f350c765710e726e6bc` |
| inst6 | 1130328246 | 2025-08-14T12:33:09.000 | 08/15/2025 | `931e7e5c0113efea1318daceef82f0bb42dd56ffa132009e4bbfb0aaa7222bf3` |
| inst7 | 1150481984 | 2025-10-14T12:32:21.000 | 10/15/2025 | `d713da5d9267d06653e653f0d70bb79c36344fad4ec06629e32b0089a0ccd46a` |
| inst8 | 1160606903 | 2025-11-14T12:32:16.000 | 11/15/2025 | `8ac18351e0e554d7aed559a28c82640cb0e9511b325e54edca152566f1fbe398` |
| inst9 | 1171255543 | 2025-12-14T12:32:35.000 | 12/15/2025 | `70dfe2f602b0e477d2783134fc2f3e2493611e74d9186330dda7ee22775d7bb0` |
| inst10 | 864191087 | 2022-09-14T12:34:14.000 | 09/15/2022 | `2dd2d70bc14cf7452990c44ddeb137ff689a92d489f0d53396424c0fc701d9a0` |
| inst11 | 1052416414 | 2024-11-14T12:32:13.000 | 11/15/2024 | `5fc5605bbb7932175e749c42a3bfd4584525358b4f438bb3ff7fe91c6540ad11` |

Inst11’s post is 2024-11-14. Its CSV `DeliveryDate` is 11/15/2024. Live From/To for 2024-11-15 returned rows; only pages 1–3 were kept. That page set is not a full day. The archive zip is a separate retained day-ahead file.

No zip in this drop has CSV `DeliveryDate` 06/15/2023. Live From/To for 2023-06-15 returned `totalRecords` 0 on both products. An earlier batch 8 NP4 zip (docId 922440865, post 2023-06-14) already has DeliveryDate 06/15/2023. This drop does not add a real-time interval for that day.

NP4 listing page 1 was copied from batch 8 (`np4-190-cd_archive_page1_reused_from_batch8.json`, SHA-256 `7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344`). Page 2 was copied from batch 8 (`np4-190-cd_archive_page2_reused_from_batch8.json`, SHA-256 `a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908`). Listings are not counted.

### NP6-905-CD instances (16)

Each zip is one CSV and one hour/interval, not a full day. Header: `DeliveryDate`, `DeliveryHour`, `DeliveryInterval`, `SettlementPointName`, `SettlementPointType`, `SettlementPointPrice`, `DSTFlag`.

| Zip | docId | postDatetime | DeliveryDate | Hour / interval | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| inst1 | 996244718 | 2024-04-15T11:47:08.000 | 04/15/2024 | 12 / 3 | `95169946f1d88aefd9c34e9e3d156acfdd7ec12adbbaf86a2ddf67fd996c92c9` |
| inst2 | 1004024077 | 2024-05-15T11:47:01.000 | 05/15/2024 | 12 / 3 | `c545c9cf614eeb34d58c8f59fc17af9ec96c60c7850db6bd1a5fc805c9a49fb0` |
| inst3 | 1027648078 | 2024-08-14T02:02:01.000 | 08/14/2024 | 2 / 4 | `819f76edca0a7165bb50b93f88d4fbfb6b1d2993b976dd932a48b8f5bb2651b7` |
| inst4 | 1027638231 | 2024-08-14T01:02:02.000 | 08/14/2024 | 1 / 4 | `e6d4d1479a5a33fafed667a0f980a96471c9e8724307f90c755a1e83de87404d` |
| inst5 | 902256955 | 2023-03-15T11:47:05.154 | 03/15/2023 | 12 / 3 | `e0ce354e552c6e42e42cd0e502d8676368711f7c8bc3b9ddc0190898e202d4ae` |
| inst6 | 823198232 | 2022-02-15T11:47:09.103 | 02/15/2022 | 12 / 3 | `2d5861fe5eb5bde0cb8d26a606375e080f025f600756d85ba19cf115c8ac3a51` |
| inst7 | 965439880 | 2023-12-14T11:47:07.000 | 12/14/2023 | 12 / 3 | `fdf25a60650e251cf5d6c01ebc66ae080daf39b6fb2264542840ec5347e8e569` |
| inst8 | 884144459 | 2022-12-20T11:47:04.996 | 12/20/2022 | 12 / 3 | `cacadeb70c4102cf9f926fcdc76f9204237de29dfd19079b18c816c27562635b` |
| inst9 | 915637170 | 2023-05-15T11:47:05.530 | 05/15/2023 | 12 / 3 | `508424c4716347bdfc71fec37f2e56657ddaa4bd4a91b3be5d6d32aab12f2d8d` |
| inst10 | 1129060801 | 2025-08-10T11:47:01.000 | 08/10/2025 | 12 / 3 | `b3d3e6b78a75b807ee637f0350400975e6bdf8088b6e60cf94022385795bc315` |
| inst11 | 996247209 | 2024-04-15T12:02:15.000 | 04/15/2024 | 12 / 4 | `7a12f13632bc5f4dd52ec71b76c00ad7795b0db746ef2ffc1ccde40345734af8` |
| inst12 | 1004026609 | 2024-05-15T12:02:01.000 | 05/15/2024 | 12 / 4 | `0f4b399cb5c198320000d4349ea33f0af112a4441d4a83c29877818f67436104` |
| inst13 | 1027635609 | 2024-08-14T00:47:07.000 | 08/14/2024 | 1 / 3 | `25ea78fe3edff39b028e8d6ec4d6ef346850d258b535ca6234d8188fe5b4110a` |
| inst14 | 1034394040 | 2024-09-08T11:47:01.000 | 09/08/2024 | 12 / 3 | `92dfc12c7dde6065e91d765ee877b9751da0d4041506b52ba348074f90615cac` |
| inst15 | 902259659 | 2023-03-15T12:02:08.178 | 03/15/2023 | 12 / 4 | `a0e7f2fb0eea52e5689849724af843d73ddec345ae333c59bb017a834fa766d7` |
| inst16 | 823199982 | 2022-02-15T12:02:07.556 | 02/15/2022 | 12 / 4 | `bf7f31051a0bfd5b55a388331ae230ef32173aa8136b77564b0ccdb1fe051316` |

Two zips have CSV `DeliveryDate` 02/15/2022: inst6 (hour 12 interval 3) and inst16 (hour 12 interval 4). They are archive samples. This drop did not re-query the live endpoint for 2022-02-15. An earlier batch 4 NP4 zip already has DeliveryDate 02/15/2022. These intervals are not a live From/To fill and not a full day.

Reused listings: page 98 from batch 7 (`…page98_reused_for_batch9.json`, SHA-256 `f60397aa537a284c1096e17c1f96938e78b80b561b5aae018c3f834f222ef5a9`), page 132 from batch 5 (`…page132_reused_for_batch9.json`, SHA-256 `ceb8761682fe9b0322e2096b4386d48785afe319df86a279e825ca01557f8aec`), page 118 from batch 4 (`…page118_reused_for_batch9.json`, SHA-256 `7640392a4860a744c72fabc0df1a8b6d5809262ae88946900faa4cebb57597fd`), and page 40 from batch 4 (`…page40_reused_for_batch9.json`, SHA-256 `8f6c27ad5b16aeda56f482ff6fff4cbe68f56a600c460d7a947a91de34110135`). New listing pages 86, 83, 75, 72, 124, and 162 are listings only.

## Not counted

Live `deliveryDateFrom` / `deliveryDateTo` pages.

| Day | NP4-190-CD | NP6-905-CD |
| --- | --- | --- |
| 2023-06-15 | 0 records | 0 records |
| 2024-11-15 | 22656 records / pages 1–3 kept | 91776 records / pages 1–3 kept |

2024-11-15 pages are not a full day. 2023-06-15 is empty on the live fetch.

## Not claimed

No zip was excluded. Five-year coverage is not complete. Proxy `covered_local_dates` stay empty. `source_point_id` stays null. Settlement point names inside the CSVs were not mapped to fictional sites. NP4-180-ER and NP6-785-ER stay absent. No Public API path is invented for them. `RetainedSettlementArchive` still opens batch2 through batch8 only. That read does not fill proxy coverage.
