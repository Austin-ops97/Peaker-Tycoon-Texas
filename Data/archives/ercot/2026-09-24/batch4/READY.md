# ERCOT batch4 READY

- Timestamp (America/Chicago): 2026-09-24 14:11:59 CT
- Token HTTP status: 200
- Bearer: id_token when present (True)
- GET count: 50 (budget ≤90)
- Rate: MIN_INTERVAL=2.2s; backoff on 429
- Secrets source (path only): `/home/box/agent-data/box-secrets.json`
- Card key names used: ERCOT_SUBSCRIPTION_KEY, ERCOT_USERNAME, ERCOT_PASSWORD
- HTTP status tally 401/403/429: {'401': 0, '403': 0, '429': 0}

## DeliveryDate syntax (confirmed from batch2)
- Working: `from_to` → `deliveryDateFrom={date}&deliveryDateTo={date}`
- Note: Confirmed in batch2; bare deliveryDate=400. Reused without rediscovery.
- Bare `deliveryDate=` → 400 (do not use).

## Artifact From/To sample days (new vs batch2/batch3)
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-06-15 page=1 status=200 rows=1000 totalRecords=24288 bytes=49323 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-06-15__page1.json` sha256=`2544f371e1041546c7fbceee894fa2ef5f0e504ecedeb34790dff8e6638db789` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-06-15 page=2 status=200 rows=1000 totalRecords=24288 bytes=49334 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-06-15__page2.json` sha256=`07fc046aa20c080e2cea999b87ba54bba47c2a51ed395b6ba223c3f793c2a0d0` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-06-15 page=3 status=200 rows=1000 totalRecords=24288 bytes=49419 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-06-15__page3.json` sha256=`acf384f4487bd704383518c7018dbeb29aa3cbc4d958d39a7cb943488704e49b` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-10-15 page=1 status=200 rows=1000 totalRecords=22488 bytes=49353 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-10-15__page1.json` sha256=`56f572f61bdbfd33c48a283f90fdfe518fca9e7fd7a8b103ece953ccab80e364` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-10-15 page=2 status=200 rows=1000 totalRecords=22488 bytes=49034 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-10-15__page2.json` sha256=`d20ed50418eea9ed903eef6a6c10f60c65156b7c934ac30fa54724a5c88ebd32` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-10-15 page=3 status=200 rows=1000 totalRecords=22488 bytes=48851 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-10-15__page3.json` sha256=`8716f4f6169e21cf7dee87fcf2b0688c479b68751112fe8dffff86517163718a` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-01-15 page=1 status=200 rows=1000 totalRecords=21240 bytes=50258 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-01-15__page1.json` sha256=`f9a4b33f3e5731d9dee727b90839e1e39b3497491fb39a2f349174baa848c611` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-01-15 page=2 status=200 rows=1000 totalRecords=21240 bytes=50148 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-01-15__page2.json` sha256=`b0c137418aee4f62e378487f3acefebb8e8ab7d4148860e998f75572edbec274` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-01-15 page=3 status=200 rows=1000 totalRecords=21240 bytes=50205 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-01-15__page3.json` sha256=`7bfd26096bcfbc384a97a67c36b6695240c22ba06d98922046836e7e106fa0a1` note=rows
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2023-01-15 page=1 status=200 rows=0 totalRecords=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2023-01-15__page1.json` sha256=`3cbded8f51614a08b1339bcc0f2bf5456f7e021eb8c964cf65fcf8d59de75f87` note=empty_data
- **OK** np6-905-cd-spp_node_zone_hub date=2025-06-15 page=1 status=200 rows=1000 totalRecords=98304 bytes=51433 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-06-15__page1.json` sha256=`3c21cb3f76f0db0e8053e03ad7b36c7c0464ef9e43a081abf53c4f21df89ac50` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-06-15 page=2 status=200 rows=1000 totalRecords=98304 bytes=51430 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-06-15__page2.json` sha256=`b6a1d12bf02bc2732ace645303dc59d407c96ec6a871e0687fd7a6f47004efc6` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-06-15 page=3 status=200 rows=1000 totalRecords=98304 bytes=51394 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-06-15__page3.json` sha256=`a86bac459a0eaa32e27c14b832c3ac633e5ce1df243f9cdcfaa0e5c29bb481c6` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-10-15 page=1 status=200 rows=1000 totalRecords=91104 bytes=51610 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-10-15__page1.json` sha256=`6d8c3c75e9e39380e33e3d70c9ea1b14e98747116d57242f8f842fccff2bdcb6` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-10-15 page=2 status=200 rows=1000 totalRecords=91104 bytes=51511 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-10-15__page2.json` sha256=`a55945f834485d58b640ddc0ace2bdf18513adccff177552a60ee4ab7aa81b6e` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-10-15 page=3 status=200 rows=1000 totalRecords=91104 bytes=51559 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-10-15__page3.json` sha256=`8edb8b17385ea37f553c75fd9561d72096dcd729b0ed6adbc4720326d927d017` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-01-15 page=1 status=200 rows=1000 totalRecords=86112 bytes=52209 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-01-15__page1.json` sha256=`5f7d1f54c64f124b76fad1a67ba956fe9c47d246528deb695fc113f61bfd7e90` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-01-15 page=2 status=200 rows=1000 totalRecords=86112 bytes=52267 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-01-15__page2.json` sha256=`a2da58c450f7fc741020aa4f208465e471923a8285fa84b25cb67e142503a084` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-01-15 page=3 status=200 rows=1000 totalRecords=86112 bytes=52430 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-01-15__page3.json` sha256=`69fb58243191ac9d62eae496aaf470432fc455317e0e3a4db5e470c463d04ce5` note=rows
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2023-01-15 page=1 status=200 rows=0 totalRecords=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2023-01-15__page1.json` sha256=`1190d2dcc94c6e0e8e7f5f6c3824091e9b74441ec05e3ffc22d0d21e967a30c0` note=empty_data

## NP6 mid-campaign landmark archive downloads (listings reused; new docIds)
- Reused listing `np6-905-cd_archive_page54.json` → `np6-905-cd_archive_page54_reused_for_landmarks.json` sha256=`a67c8489f646dc9273fe6e6af53a84e1c2e52fd32cdd5220fa443e9a475a4f14` (copied from batch2; no GET)
- Reused listing `np6-905-cd_archive_page57.json` → `np6-905-cd_archive_page57_reused_for_landmarks.json` sha256=`cecc23e1d5b97948c85175472432dc82289206977f37332366bdcb6e5a34b348` (copied from batch2; no GET)
- Reused listing `np6-905-cd_archive_page80.json` → `np6-905-cd_archive_page80_reused_for_landmarks.json` sha256=`9892fc225c43c65eb5ffeffedf60305d532112070601a63cd26e302c5c4073a8` (copied from batch3; no GET)
- Reused listing `np6-905-cd_archive_page90.json` → `np6-905-cd_archive_page90_reused_for_landmarks.json` sha256=`d200ddf5ff8af1c8e6d5f4cbb82a7c60d79908a55fc6d3b27f93303b39a9341a` (copied from batch3; no GET)
- Reused listing `np6-905-cd_archive_page109.json` → `np6-905-cd_archive_page109_reused_for_landmarks.json` sha256=`dad65c2b1bcc037666b8507bb933ca4615c99f4957f71759155e234bc51455af` (copied from batch2; no GET)
- Reused listing `np6-905-cd_archive_page127.json` → `np6-905-cd_archive_page127_reused_for_landmarks.json` sha256=`30dc72ac867daa5c6dfde318b370d700a5470322e798042f694d5489f382ed3b` (copied from batch2; no GET)
- Reused listing `np6-905-cd_archive_page140.json` → `np6-905-cd_archive_page140_reused_for_landmarks.json` sha256=`f90ed7398b7e7acc519d7572ad23c07fe3f5c1b2c151811404265effd1b8147d` (copied from batch3; no GET)
- Reused listing `np6-905-cd_archive_page150.json` → `np6-905-cd_archive_page150_reused_for_landmarks.json` sha256=`9d59d9f5b2c8c2b457a7570f9e3a228c5bad7fc79fe77df0d9a8ccd4399327f1` (copied from batch3; no GET)
- Reused listing `np6-905-cd_archive_page178.json` → `np6-905-cd_archive_page178_reused_for_landmarks.json` sha256=`acfbade1e4fd23d531308fe1a398490291637c3dd68dc8925ca33605a355153c` (copied from batch2; no GET)
- Reused listing `np6-905-cd_archive_page185.json` → `np6-905-cd_archive_page185_reused_for_landmarks.json` sha256=`11bb0f2ee238db333843f14a56828a3164b65556e15fb1aae96ae838613d7b61` (copied from batch3; no GET)
- **OK** docId=1085818452 post=2025-03-15T11:47:01.000 status=200 bytes=6719 file=`np6-905-cd__inst1_20250315_1085818452_SPPHLZNP6905_20250315_1145_csv.zip` sha256=`d310d5a2c31988ad20337070778f3a6f19f3da21ec6c71890e637bdae867fd55` src=np6-905-cd_archive_page54.json
- **OK** docId=1076607155 post=2025-02-10T11:47:01.000 status=200 bytes=7493 file=`np6-905-cd__inst2_20250210_1076607155_SPPHLZNP6905_20250210_1145_csv.zip` sha256=`0a595967d235ae11de3dcc14c9949bb056d298c0f336104c9e9b16c2a27b7e26` src=np6-905-cd_archive_page57.json
- **OK** docId=1012057209 post=2024-06-15T11:47:01.000 status=200 bytes=7101 file=`np6-905-cd__inst3_20240615_1012057209_SPPHLZNP6905_20240615_1145_csv.zip` sha256=`c3afe5f8e40188e31909701e7374b439d9f9383c01ffd1b5d2b035dbce1af36f` src=np6-905-cd_archive_page80.json
- **OK** docId=985866907 post=2024-03-05T11:47:08.000 status=200 bytes=6199 file=`np6-905-cd__inst4_20240305_985866907_SPPHLZNP6905_20240305_1145_csv.zip` sha256=`71811ff36349690ae2422af29a72b865dd3e2d4119acb751c6f6a87e0ae03108` src=np6-905-cd_archive_page90.json
- **OK** docId=937884071 post=2023-08-20T11:47:06.189 status=200 bytes=4685 file=`np6-905-cd__inst5_20230820_937884071_SPPHLZNP6905_20230820_1145_csv.zip` sha256=`97698b93c944ed7c4727e5938c7b990ad8df9225fd7b811194ae083a01ea3ccf` src=np6-905-cd_archive_page109.json
- **OK** docId=895996716 post=2023-02-14T11:47:05.139 status=200 bytes=6044 file=`np6-905-cd__inst6_20230214_895996716_SPPHLZNP6905_20230214_1145_csv.zip` sha256=`d56596da9dac7e02e611e8facd8aacf1bc021765876cb6226797e0c95f61af9d` src=np6-905-cd_archive_page127.json
- **OK** docId=867649897 post=2022-10-01T11:47:05.725 status=200 bytes=4426 file=`np6-905-cd__inst7_20221001_867649897_SPPHLZNP6905_20221001_1145_csv.zip` sha256=`98153268f3a1ddca1aacaf3a829050b08c7e6f0f4d1eab14ae84153797c7779c` src=np6-905-cd_archive_page140.json
- **OK** docId=846902783 post=2022-06-20T11:47:05.974 status=200 bytes=5981 file=`np6-905-cd__inst8_20220620_846902783_SPPHLZNP6905_20220620_1145_csv.zip` sha256=`10d295ae4e058a40047e181537258170aa2daa0516d762fa73890729b722245b` src=np6-905-cd_archive_page150.json
- **OK** docId=793006546 post=2021-09-01T11:47:05.816 status=200 bytes=5387 file=`np6-905-cd__inst9_20210901_793006546_SPPHLZNP6905_20210901_1145_csv.zip` sha256=`ff44f9f1ddaf13cf4c355af47712cc538c729db6fc8d0d662924a8c9c99c6cf8` src=np6-905-cd_archive_page178.json
- **OK** docId=780039888 post=2021-06-20T11:47:04.929 status=200 bytes=5441 file=`np6-905-cd__inst10_20210620_780039888_SPPHLZNP6905_20210620_1145_csv.zip` sha256=`1b6ec84380c3e0a5787c9bd79180c2789b622cec15026e2670a7fe2ded737330` src=np6-905-cd_archive_page185.json

## NP4 archive instance downloads (extra campaign months + page1 2024/2025)
- Reused listing page=2: `np4-190-cd_archive_page2_reused_from_batch2.json` sha256=`a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908`
- New listing page=1 status=200 class=in_range_or_mixed n=1000 in_range=734 oldest=2023-12-29T12:34:59.000 newest=2026-09-24T12:51:24.000 file=`np4-190-cd_archive_page1.json` sha256=`7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344`
- **OK** docId=773997684 post=2021-05-16T12:33:57.000 status=200 bytes=81964 file=`np4-190-cd__inst1_20210516_773997684_DAMSPNP4190_csv.zip` sha256=`0d802da55599b3617b19b5d903cc5b25e3577800be99a74234aff768ac08d7fe` src=np4-190-cd_archive_page2.json
- **OK** docId=812053445 post=2021-12-16T12:28:40.000 status=200 bytes=87731 file=`np4-190-cd__inst2_20211216_812053445_DAMSPNP4190_csv.zip` sha256=`b48a0afef5281804688ad2730ca6c374a56fec0a650ec2f6ae3cbaf0215bab29` src=np4-190-cd_archive_page2.json
- **OK** docId=823014576 post=2022-02-14T12:35:43.000 status=200 bytes=88071 file=`np4-190-cd__inst3_20220214_823014576_DAMSPNP4190_csv.zip` sha256=`28bb3ba6851835ba3e47eea5dce78e8e09b6bbeb75bd611836e24e29eebd869a` src=np4-190-cd_archive_page2.json
- **OK** docId=864393539 post=2022-09-15T12:34:15.000 status=200 bytes=92579 file=`np4-190-cd__inst4_20220915_864393539_DAMSPNP4190_csv.zip` sha256=`ed46d108a9b4491564d002689c6dcd05de8ccf79e1488b763f123ea9a35201da` src=np4-190-cd_archive_page2.json
- **OK** docId=883319168 post=2022-12-16T12:34:03.000 status=200 bytes=92959 file=`np4-190-cd__inst5_20221216_883319168_DAMSPNP4190_csv.zip` sha256=`236a788a8bac0189ce5aaa03bfde5ddae99e4327e87faebed981ee3324df3478` src=np4-190-cd_archive_page2.json
- **OK** docId=889808030 post=2023-01-16T12:33:29.051 status=200 bytes=93207 file=`np4-190-cd__inst6_20230116_889808030_DAMSPNP4190_csv.zip` sha256=`563a63da0980591d7c77176431b403416ef1295f99908c4e8d5f8a3ea49add58` src=np4-190-cd_archive_page2.json
- **OK** docId=902478925 post=2023-03-16T12:38:40.702 status=200 bytes=95594 file=`np4-190-cd__inst7_20230316_902478925_DAMSPNP4190_csv.zip` sha256=`24caa35ffceb78dcbbe3b4340ce2bb01ad51693edbd0c3372fb7c0b98775315a` src=np4-190-cd_archive_page2.json
- **OK** docId=936965305 post=2023-08-16T12:36:12.216 status=200 bytes=112585 file=`np4-190-cd__inst8_20230816_936965305_DAMSPNP4190_csv.zip` sha256=`94abf66d4d758d3e77351e87a911a786306230dd1a00a4d3700f41992f7baa3e` src=np4-190-cd_archive_page2.json
- **OK** docId=965447681 post=2023-12-14T12:36:25.000 status=200 bytes=136924 file=`np4-190-cd__inst9_20231214_965447681_DAMSPNP4190_csv.zip` sha256=`0821746cf1ca86de2a2590a54dce56f618abe42006800703eca4db0c63bfc21c` src=np4-190-cd_archive_page2.json
- **OK** docId=988639722 post=2024-03-16T12:36:02.000 status=200 bytes=147879 file=`np4-190-cd__inst10_20240316_988639722_DAMSPNP4190_csv.zip` sha256=`ad93f683cacb545b8de39d6021d89ab21d7ee9e922f03abf58b2c638eae12605` src=np4-190-cd_archive_page1.json
- **OK** docId=1020166966 post=2024-07-16T12:33:37.000 status=200 bytes=140722 file=`np4-190-cd__inst11_20240716_1020166966_DAMSPNP4190_csv.zip` sha256=`148e411c94430c652b8093c3e5ca67f0b279695030e69dd7d7575de86d1b057b` src=np4-190-cd_archive_page1.json
- **OK** docId=1052688105 post=2024-11-15T12:32:13.000 status=200 bytes=151728 file=`np4-190-cd__inst12_20241115_1052688105_DAMSPNP4190_csv.zip` sha256=`bd6d9a5a72ca5f9570d1d5e3e94650c25e890ef3d74f43bbf8513f85878837e2` src=np4-190-cd_archive_page1.json
- **OK** docId=1094526170 post=2025-04-15T13:22:06.000 status=200 bytes=163541 file=`np4-190-cd__inst13_20250415_1094526170_DAMSPNP4190_csv.zip` sha256=`36dadedc25866c013d541ca322dcf7935dcba52543c2aa9122ee1905dc4563dc` src=np4-190-cd_archive_page1.json
- **OK** docId=1140793955 post=2025-09-15T12:15:51.000 status=200 bytes=166841 file=`np4-190-cd__inst14_20250915_1140793955_DAMSPNP4190_csv.zip` sha256=`46bcf0d8a15700dcccd5627e2008ff0c21b1e675674a705f934ba52ac671135e` src=np4-190-cd_archive_page1.json

## New NP6 archive listing pages (not in batch2/batch3)
- page=40 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2025-08-02T14:32:01.000 newest=2025-08-13T00:17:01.000 file=`np6-905-cd_archive_page40.json` sha256=`8f6c27ad5b16aeda56f482ff6fff4cbe68f56a600c460d7a947a91de34110135`
- page=70 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2024-09-24T02:32:01.000 newest=2024-10-04T12:17:01.000 file=`np6-905-cd_archive_page70.json` sha256=`52d442271e92087edf752ddc73935a7b987cebd543d787aaa629a699f92b949f`
- page=100 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-11-16T13:32:08.935 newest=2023-11-26T23:17:06.811 file=`np6-905-cd_archive_page100.json` sha256=`d26850d9729559534b580be2c8a3405f1034c424a6c915315cf528c757b84a96`
- page=118 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-05-13T03:32:05.233 newest=2023-05-23T13:17:07.701 file=`np6-905-cd_archive_page118.json` sha256=`7640392a4860a744c72fabc0df1a8b6d5809262ae88946900faa4cebb57597fd`
- page=165 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-01-08T12:02:04.819 newest=2022-01-18T21:47:06.736 file=`np6-905-cd_archive_page165.json` sha256=`ee1dca123065887a2c4a03fd862e5d07405e0ecee22a40dc1108a626e9996142`

## GATEs / empty / absent
- **ABSENT** NP4-180-ER  — No invented path; leave GATE (same as batch2/batch3 Option-2 scope).
- **ABSENT** NP6-785-ER  — No invented path; leave GATE (same as batch2/batch3 Option-2 scope).
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices 2023-01-15 — live artifact From/To returned 0 rows; use archive for early window
- **EMPTY** np6-905-cd-spp_node_zone_hub 2023-01-15 — live artifact From/To returned 0 rows; use archive for early window

## Blocks / notes
- none observed
- note: NP6 landmark picks: [(1085818452, '2025-03-15'), (1076607155, '2025-02-10'), (1012057209, '2024-06-15'), (985866907, '2024-03-05'), (937884071, '2023-08-20'), (895996716, '2023-02-14'), (867649897, '2022-10-01'), (846902783, '2022-06-20'), (793006546, '2021-09-01'), (780039888, '2021-06-20')]
- note: NP4 archive picks: [(773997684, '2021-05-16'), (812053445, '2021-12-16'), (823014576, '2022-02-14'), (864393539, '2022-09-15'), (883319168, '2022-12-16'), (889808030, '2023-01-16'), (902478925, '2023-03-16'), (936965305, '2023-08-16'), (965447681, '2023-12-14'), (988639722, '2024-03-16'), (1020166966, '2024-07-16'), (1052688105, '2024-11-15'), (1094526170, '2025-04-15'), (1140793955, '2025-09-15')]

## Leak-check
- No subscription keys, passwords, usernames, or bearer tokens intentionally written.
- Private token JSON deleted after run.
- Leak-check: PASS (no credential/token substrings in READY/meta/json text outputs).

