# ERCOT retain — batch 4 (2026-09-24)

Fourth SOURCE drop, beside batches 1–3. Every file that arrived with a `.sha256` sidecar matched that sidecar before it was copied. Twenty-four price-instance zips matched. None were excluded. JSON listings, reused listings, and artifact pages are retained and are not part of `source_batch_count`. `READY.md` and `download-meta.json` have no sidecar in this drop, same as earlier batches.

READY timestamp (America/Chicago): 2026-09-24 14:11:59 CT. Token HTTP status recorded there was 200. No 401, 403, or 429 on the final responses. No subscription key, password, username, or bearer token is in these files. Card key names appear as names only. NP4-180-ER and NP6-785-ER were not requested.

`source_batch_count` adds these 24 zips only. With the earlier 25, the manifest total is 49.

## Counted zips

### NP6-905-CD mid-campaign landmarks (10)

Each zip is one CSV and one hour/interval (hour 12, interval 3), not a full day. CSV `DeliveryDate` matches the post’s civil day. Header: `DeliveryDate`, `DeliveryHour`, `DeliveryInterval`, `SettlementPointName`, `SettlementPointType`, `SettlementPointPrice`, `DSTFlag`.

| Zip | docId | postDatetime | DeliveryDate | Hour / interval | SHA-256 |
| --- | --- | --- | --- | --- | --- |
| inst1 `…20250315_1145_csv.zip` | 1085818452 | 2025-03-15T11:47:01 | 03/15/2025 | 12 / 3 | `d310d5a2c31988ad20337070778f3a6f19f3da21ec6c71890e637bdae867fd55` |
| inst2 `…20250210_1145_csv.zip` | 1076607155 | 2025-02-10T11:47:01 | 02/10/2025 | 12 / 3 | `0a595967d235ae11de3dcc14c9949bb056d298c0f336104c9e9b16c2a27b7e26` |
| inst3 `…20240615_1145_csv.zip` | 1012057209 | 2024-06-15T11:47:01 | 06/15/2024 | 12 / 3 | `c3afe5f8e40188e31909701e7374b439d9f9383c01ffd1b5d2b035dbce1af36f` |
| inst4 `…20240305_1145_csv.zip` | 985866907 | 2024-03-05T11:47:08 | 03/05/2024 | 12 / 3 | `71811ff36349690ae2422af29a72b865dd3e2d4119acb751c6f6a87e0ae03108` |
| inst5 `…20230820_1145_csv.zip` | 937884071 | 2023-08-20T11:47:06.189 | 08/20/2023 | 12 / 3 | `97698b93c944ed7c4727e5938c7b990ad8df9225fd7b811194ae083a01ea3ccf` |
| inst6 `…20230214_1145_csv.zip` | 895996716 | 2023-02-14T11:47:05.139 | 02/14/2023 | 12 / 3 | `d56596da9dac7e02e611e8facd8aacf1bc021765876cb6226797e0c95f61af9d` |
| inst7 `…20221001_1145_csv.zip` | 867649897 | 2022-10-01T11:47:05.725 | 10/01/2022 | 12 / 3 | `98153268f3a1ddca1aacaf3a829050b08c7e6f0f4d1eab14ae84153797c7779c` |
| inst8 `…20220620_1145_csv.zip` | 846902783 | 2022-06-20T11:47:05.974 | 06/20/2022 | 12 / 3 | `10d295ae4e058a40047e181537258170aa2daa0516d762fa73890729b722245b` |
| inst9 `…20210901_1145_csv.zip` | 793006546 | 2021-09-01T11:47:05.816 | 09/01/2021 | 12 / 3 | `ff44f9f1ddaf13cf4c355af47712cc538c729db6fc8d0d662924a8c9c99c6cf8` |
| inst10 `…20210620_1145_csv.zip` | 780039888 | 2021-06-20T11:47:04.929 | 06/20/2021 | 12 / 3 | `1b6ec84380c3e0a5787c9bd79180c2789b622cec15026e2670a7fe2ded737330` |

The archive pages these docIds came from were copied from batch 2 or batch 3 and were not fetched again (`np6-905-cd_archive_page54`, `57`, `80`, `90`, `109`, `127`, `140`, `150`, `178`, `185`, filenames `…_reused_for_landmarks.json`).

### NP4-190-CD archive instances (14)

Posts run 2021-05-16 through 2025-09-15. Each CSV has hour endings `01:00` through `24:00` and one `DeliveryDate`. That delivery date is the civil day after the post. Header: `DeliveryDate`, `HourEnding`, `SettlementPoint`, `SettlementPointPrice`, `DSTFlag`. These are market files. They are not assigned to fictional sites.

| Zip | docId | postDatetime | DeliveryDate in the CSV | SHA-256 |
| --- | --- | --- | --- | --- |
| inst1 | 773997684 | 2021-05-16T12:33:57 | 05/17/2021 | `0d802da55599b3617b19b5d903cc5b25e3577800be99a74234aff768ac08d7fe` |
| inst2 | 812053445 | 2021-12-16T12:28:40 | 12/17/2021 | `b48a0afef5281804688ad2730ca6c374a56fec0a650ec2f6ae3cbaf0215bab29` |
| inst3 | 823014576 | 2022-02-14T12:35:43 | 02/15/2022 | `28bb3ba6851835ba3e47eea5dce78e8e09b6bbeb75bd611836e24e29eebd869a` |
| inst4 | 864393539 | 2022-09-15T12:34:15 | 09/16/2022 | `ed46d108a9b4491564d002689c6dcd05de8ccf79e1488b763f123ea9a35201da` |
| inst5 | 883319168 | 2022-12-16T12:34:03 | 12/17/2022 | `236a788a8bac0189ce5aaa03bfde5ddae99e4327e87faebed981ee3324df3478` |
| inst6 | 889808030 | 2023-01-16T12:33:29.051 | 01/17/2023 | `563a63da0980591d7c77176431b403416ef1295f99908c4e8d5f8a3ea49add58` |
| inst7 | 902478925 | 2023-03-16T12:38:40.702 | 03/17/2023 | `24caa35ffceb78dcbbe3b4340ce2bb01ad51693edbd0c3372fb7c0b98775315a` |
| inst8 | 936965305 | 2023-08-16T12:36:12.216 | 08/17/2023 | `94abf66d4d758d3e77351e87a911a786306230dd1a00a4d3700f41992f7baa3e` |
| inst9 | 965447681 | 2023-12-14T12:36:25 | 12/15/2023 | `0821746cf1ca86de2a2590a54dce56f618abe42006800703eca4db0c63bfc21c` |
| inst10 | 988639722 | 2024-03-16T12:36:02 | 03/17/2024 | `ad93f683cacb545b8de39d6021d89ab21d7ee9e922f03abf58b2c638eae12605` |
| inst11 | 1020166966 | 2024-07-16T12:33:37 | 07/17/2024 | `148e411c94430c652b8093c3e5ca67f0b279695030e69dd7d7575de86d1b057b` |
| inst12 | 1052688105 | 2024-11-15T12:32:13 | 11/16/2024 | `bd6d9a5a72ca5f9570d1d5e3e94650c25e890ef3d74f43bbf8513f85878837e2` |
| inst13 | 1094526170 | 2025-04-15T13:22:06 | 04/16/2025 | `36dadedc25866c013d541ca322dcf7935dcba52543c2aa9122ee1905dc4563dc` |
| inst14 | 1140793955 | 2025-09-15T12:15:51 | 09/16/2025 | `46bcf0d8a15700dcccd5627e2008ff0c21b1e675674a705f934ba52ac671135e` |

NP4 listing page 2 was copied from batch 2 (`np4-190-cd_archive_page2_reused_from_batch2.json`, SHA-256 `a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908`). Page 1 is new (`np4-190-cd_archive_page1.json`, SHA-256 `7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344`). Listings are not counted.

## Not counted

Live `deliveryDateFrom` / `deliveryDateTo` samples. Only pages 1–3 were kept where rows exist. That is not a full day.

| Day | NP4-190-CD | NP6-905-CD |
| --- | --- | --- |
| 2025-06-15 | 24288 records / 25 pages | 98304 records / 99 pages |
| 2024-10-15 | 22488 records / 23 pages | 91104 records / 92 pages |
| 2024-01-15 | 21240 records / 22 pages | 86112 records / 87 pages |
| 2023-01-15 | empty (`totalRecords` 0) | empty (`totalRecords` 0) |

2023-01-15 still needs an archive `?download=` whose CSV `DeliveryDate` is that day, or the absent ER products. The NP4 zip posted 2023-01-16 covers DeliveryDate 01/17/2023, not 2023-01-15.

New NP6 archive listing pages 40, 70, 100, 118, and 165 are listings only.

## Not claimed

No zip was excluded. Five-year coverage is not complete. Proxy `covered_local_dates` stay empty. `source_point_id` stays null. Settlement point names inside the CSVs were not mapped to fictional sites. NP4-180-ER and NP6-785-ER stay absent. No Public API path is invented for them.
