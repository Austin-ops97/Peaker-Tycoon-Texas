# ERCOT batch6 READY

- Timestamp (America/Chicago): 2026-09-24 14:46:44 CT
- Token HTTP status: 200
- Bearer: id_token when present (True)
- GET count: 51 (budget ≤90)
- Rate: MIN_INTERVAL=2.2s; backoff on 429
- Secrets source (path only): `/home/box/agent-data/box-secrets.json`
- Card key names used: ERCOT_SUBSCRIPTION_KEY, ERCOT_USERNAME, ERCOT_PASSWORD
- HTTP status tally 401/403/429: {'401': 0, '403': 0, '429': 5}

## DeliveryDate syntax (confirmed from batch2)
- Working: `from_to` → `deliveryDateFrom={date}&deliveryDateTo={date}`
- Note: Confirmed in batch2; bare deliveryDate=400. Reused without rediscovery.
- Bare `deliveryDate=` → 400 (do not use).

## Artifact From/To sample days (new vs batch2–5)
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2022-11-15 page=1 status=200 rows=0 totalRecords=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2022-11-15__page1.json` sha256=`87eda1625de69c521b1235ec795d8471416b67c6ef5aeb06d5087cba7cae45ef` note=empty_data
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-05-15 page=1 status=200 rows=1000 totalRecords=21792 bytes=49162 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-05-15__page1.json` sha256=`6a78348629131dc2dcbd7580921e017c613e4d0c5b8fab90b66d706df21f5061` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-05-15 page=2 status=200 rows=1000 totalRecords=21792 bytes=48824 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-05-15__page2.json` sha256=`bc6c66080ab8c178ce8f1f46f61d0fb3cdc6c437f6e3428b0c22fcc4a4dda10e` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-05-15 page=3 status=200 rows=1000 totalRecords=21792 bytes=48585 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-05-15__page3.json` sha256=`d44047c3a2c41b463265ef90eface5f5c840c860bd9ecf7923428c556664eefb` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-09-15 page=1 status=200 rows=1000 totalRecords=25128 bytes=49403 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-09-15__page1.json` sha256=`47e8e784db7d30123c625d3b93ee1c452532070c6c7aaddd50d154bf9bc61c8d` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-09-15 page=2 status=200 rows=1000 totalRecords=25128 bytes=49365 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-09-15__page2.json` sha256=`a1ae0076601d630dc17ef557900fa9a251f9d2cd89e8c80eb482236a01538a48` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-09-15 page=3 status=200 rows=1000 totalRecords=25128 bytes=49358 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-09-15__page3.json` sha256=`f1becc3f7daed53d8dccb3aa845a156207af06c1413838e1855c676be02c55da` note=rows
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2022-11-15 page=1 status=200 rows=0 totalRecords=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2022-11-15__page1.json` sha256=`584aa99c5b43bc1ebac083978be69bda21aa2371ea81e83b26adef157a539b05` note=empty_data
- **OK** np6-905-cd-spp_node_zone_hub date=2024-05-15 page=1 status=200 rows=1000 totalRecords=88320 bytes=51557 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-05-15__page1.json` sha256=`c89e0b527f66099769d89fa7c29366530be7b47a3fae0baae949b1760b216e97` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-05-15 page=2 status=200 rows=1000 totalRecords=88320 bytes=51536 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-05-15__page2.json` sha256=`3d2c2e6dac6d657ca732780245e65cfaf7980f82af6425741e3c13762c792688` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-05-15 page=3 status=200 rows=1000 totalRecords=88320 bytes=51444 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-05-15__page3.json` sha256=`3a56a545941ee03bf24ac1b425ada9b59e399305738b4453883c4de8111c93d0` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-09-15 page=1 status=200 rows=1000 totalRecords=101664 bytes=51502 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-09-15__page1.json` sha256=`4981915cd05278edb96318e1e222942d165f9d6cab9ca17f250e0761dfce031d` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-09-15 page=2 status=200 rows=1000 totalRecords=101664 bytes=51501 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-09-15__page2.json` sha256=`78e7c5d454302cdd5c5db0347623192c81762e8d34935a47a022547af400db6f` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-09-15 page=3 status=200 rows=1000 totalRecords=101664 bytes=50629 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-09-15__page3.json` sha256=`e874c6a0aaf005c24eca0ed5f5165a1a24bd4b2a42a0328c6d2c222626fff5a3` note=rows

## NP4 archive downloads (listings reused; new docIds; EMPTY GATE near-days + densify)
- Reused listing page=1 `np4-190-cd_archive_page1.json` → `np4-190-cd_archive_page1_reused_from_batch4.json` sha256=`7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344` (copied from batch4; no GET)
- Reused listing page=2 `np4-190-cd_archive_page2.json` → `np4-190-cd_archive_page2_reused_from_batch5.json` sha256=`a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908` (copied from batch5; no GET)
- **OK** docId=768484164 post=2021-04-14T12:33:09.000 status=200 bytes=79089 file=`np4-190-cd__inst1_20210414_768484164_DAMSPNP4190_csv.zip` sha256=`7c3ef076e8f01ad619359691f80b3e407f74fd02e55995a99b274ccdd5375d7f` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=851721131 post=2022-07-14T12:28:32.000 status=200 bytes=90764 file=`np4-190-cd__inst2_20220714_851721131_DAMSPNP4190_csv.zip` sha256=`8621a831d886fc311cf14468e666bb0972415966055d34d2c29ccc541a6d7267` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=889403190 post=2023-01-14T12:33:44.769 status=200 bytes=91884 file=`np4-190-cd__inst3_20230114_889403190_DAMSPNP4190_csv.zip` sha256=`0219dc94e7cbcd9c3e1d0e208b9345dd2a334f92682c59b3f04defe11cebde27` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=908799936 post=2023-04-14T12:34:12.221 status=200 bytes=98373 file=`np4-190-cd__inst4_20230414_908799936_DAMSPNP4190_csv.zip` sha256=`57f27dcb0493b4c26cf88af645d5a601335fddbcb4255bf82b32da42ad0f1bc0` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=778995380 post=2021-06-14T12:33:02.000 status=200 bytes=81897 file=`np4-190-cd__inst5_20210614_778995380_DAMSPNP4190_csv.zip` sha256=`5c66d8a83f4188731edb05be8d074835ce4d7ae7d2b8c3eb65e8d0a684e7d83f` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=795352419 post=2021-09-14T12:33:43.000 status=200 bytes=74311 file=`np4-190-cd__inst6_20210914_795352419_DAMSPNP4190_csv.zip` sha256=`12479a5f668779be025db9ba19adb2c79e6887718d1277f3374a60de3acc4482` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=806282994 post=2021-11-14T12:33:41.000 status=200 bytes=87854 file=`np4-190-cd__inst7_20211114_806282994_DAMSPNP4190_csv.zip` sha256=`cec661aec325d89e2aaffd7d755c1d419104f4ccfb52866d0027661770845799` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=833904939 post=2022-04-14T12:28:34.000 status=200 bytes=91717 file=`np4-190-cd__inst8_20220414_833904939_DAMSPNP4190_csv.zip` sha256=`81b9d6838f2fb4120c3eca1433c051ffd9f7e7b049c5dae266731a7d2d7c1611` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=857947135 post=2022-08-14T12:27:33.000 status=200 bytes=92043 file=`np4-190-cd__inst9_20220814_857947135_DAMSPNP4190_csv.zip` sha256=`e76a54b42a8061948b214ea1c9ba9ff7e84e10d07fc4730d0be170f618127013` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=876700070 post=2022-11-14T12:34:42.000 status=200 bytes=93763 file=`np4-190-cd__inst10_20221114_876700070_DAMSPNP4190_csv.zip` sha256=`431cd103baad8a3219793380ca83d8d2f7bf8338e0f4e6a7ad7dfc49e86e9662` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=896008634 post=2023-02-14T13:08:28.554 status=200 bytes=93612 file=`np4-190-cd__inst11_20230214_896008634_DAMSPNP4190_csv.zip` sha256=`a3c31dded071039f8f0458f344d02dd66381f47ed96630af5b705b0c81ec356d` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=915418450 post=2023-05-14T12:35:47.684 status=200 bytes=93052 file=`np4-190-cd__inst12_20230514_915418450_DAMSPNP4190_csv.zip` sha256=`ca638759a5e9465d6cf5e9d916922595c0b13fcd5e70af64abde0054ae85323e` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=929271813 post=2023-07-14T12:35:06.227 status=200 bytes=100176 file=`np4-190-cd__inst13_20230714_929271813_DAMSPNP4190_csv.zip` sha256=`f459100982f3f0164c4514f573f6d6cd0af8395806efdca94952df0d948b5c47` src=np4-190-cd_archive_page2_reused_from_batch5.json
- **OK** docId=973099207 post=2024-01-14T12:35:50.000 status=200 bytes=151795 file=`np4-190-cd__inst14_20240114_973099207_DAMSPNP4190_csv.zip` sha256=`61968b0dfe69fca3d0af37f5844b17d3a54a6f3b74758a4d2956f148541384ab` src=np4-190-cd_archive_page1_reused_from_batch4.json

## NP6 archive downloads (reused + new listings; new docIds; EMPTY GATE days)
- Reused listing `np6-905-cd_archive_page147.json` → `np6-905-cd_archive_page147_reused_for_batch6.json` sha256=`645da241224a3d3925b78afccac9697107273fe56ef3c0a65041016e79ba212f` (copied from batch5; no GET)
- Reused listing `np6-905-cd_archive_page191.json` → `np6-905-cd_archive_page191_reused_for_batch6.json` sha256=`6d99cf01cdf5225d881c6634b218ab7647475ad75ef4b78fd3d50a6a7a47d363` (copied from batch5; no GET)
- **OK** docId=851917168 post=2022-07-15T11:47:06.702 status=200 bytes=4387 file=`np6-905-cd__inst1_20220715_851917168_SPPHLZNP6905_20220715_1145_csv.zip` sha256=`4bdf94ad6d951548543207aa1bb11609f52753981e093fb7eae537e62a458a72` src=np6-905-cd_archive_page147_reused_for_batch6.json
- **OK** docId=768652939 post=2021-04-15T12:02:16.259 status=200 bytes=4063 file=`np6-905-cd__inst2_20210415_768652939_SPPHLZNP6905_20210415_1200_csv.zip` sha256=`0b5414d2f0bb21b9cc3f33cec5fbfcaa11d283a3e6c1da97bdab0835571168c0` src=np6-905-cd_archive_page191_reused_for_batch6.json
- **OK** docId=889599083 post=2023-01-15T11:47:05.078 status=200 bytes=5643 file=`np6-905-cd__inst3_20230115_889599083_SPPHLZNP6905_20230115_1145_csv.zip` sha256=`2abc5cb3f7aabfa1a0837b3fff3fc24684597caee9a0cf91b7e5a05679f22b03` src=np6-905-cd_archive_page130.json
- **OK** docId=908142435 post=2023-04-11T11:47:07.146 status=200 bytes=4558 file=`np6-905-cd__inst4_20230411_908142435_SPPHLZNP6905_20230411_1145_csv.zip` sha256=`762d9d0ecddb0dd09abd566288b7512e1d7e83eb3a3e02f176a4332afb44a3d5` src=np6-905-cd_archive_page122.json
- **OK** docId=860746717 post=2022-08-28T11:47:06.544 status=200 bytes=4403 file=`np6-905-cd__inst5_20220828_860746717_SPPHLZNP6905_20220828_1145_csv.zip` sha256=`3a581c88c4b4bdfa5e4e00ede9b4742b3b467bb4978218f3b2c143d252fc9e44` src=np6-905-cd_archive_page143.json
- **OK** docId=878136884 post=2022-11-21T11:47:05.288 status=200 bytes=4912 file=`np6-905-cd__inst6_20221121_878136884_SPPHLZNP6905_20221121_1145_csv.zip` sha256=`78bcd14a41e8b2ca3a412347c8de171105be03f72f9615bf654e47e67e566a0a` src=np6-905-cd_archive_page135.json
- **OK** docId=838433812 post=2022-05-08T11:47:05.434 status=200 bytes=5806 file=`np6-905-cd__inst7_20220508_838433812_SPPHLZNP6905_20220508_1145_csv.zip` sha256=`919bc3549d9f400311e0bafd12732498db6d55f985e0d5437e112664976ee700` src=np6-905-cd_archive_page154.json
- **OK** docId=928108758 post=2023-07-09T11:47:07.162 status=200 bytes=5884 file=`np6-905-cd__inst8_20230709_928108758_SPPHLZNP6905_20230709_1145_csv.zip` sha256=`badf3599fd287580df087293e6d021b4c93fd0648ae00dc9f1102f4f40ab3ac7` src=np6-905-cd_archive_page113.json
- **OK** docId=947107104 post=2023-09-28T11:47:06.191 status=200 bytes=6153 file=`np6-905-cd__inst9_20230928_947107104_SPPHLZNP6905_20230928_1145_csv.zip` sha256=`86df779cf127bd0a0037b6d855b11b21e686cab3ea647fb1564f342fcb9cdcc5` src=np6-905-cd_archive_page105.json
- **OK** docId=972598466 post=2024-01-12T11:47:07.000 status=200 bytes=6455 file=`np6-905-cd__inst10_20240112_972598466_SPPHLZNP6905_20240112_1145_csv.zip` sha256=`e340a665ea39715aef9f3c04d66141b4fafb066d66297c48bef2c14ebd1fa930` src=np6-905-cd_archive_page95.json

## New NP6 archive listing pages (not in batch2–5)
- page=130 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-01-08T02:32:05.062 newest=2023-01-18T12:17:07.431 file=`np6-905-cd_archive_page130.json` sha256=`65860232403da9437538c81ab6957c2bc36bfe26615ffef76adf2096b90f55d6`
- page=122 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-04-01T11:32:08.087 newest=2023-04-11T21:17:06.461 file=`np6-905-cd_archive_page122.json` sha256=`00ae7611e1c14bcb22150e59bec0cb061aa797c019c7f3d6f4800b3925186f70`
- page=143 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-08-25T17:32:05.783 newest=2022-09-05T03:17:06.630 file=`np6-905-cd_archive_page143.json` sha256=`ff28e01705d10a39c441107a4d223b8bc323b4e69ded8d418707990363c27879`
- page=135 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-11-17T00:32:05.857 newest=2022-11-27T10:17:06.237 file=`np6-905-cd_archive_page135.json` sha256=`44fcd5a84f043032a35dfeaf06ec156751eac31b3c09e631d21d9e25f1d86d60`
- page=154 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-05-03T03:32:05.114 newest=2022-05-13T13:17:06.703 file=`np6-905-cd_archive_page154.json` sha256=`986fdba7593e7355be743052856b1c5e61b3b0901c134e60f1f9400231a57eca`
- page=113 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-07-04T06:02:07.260 newest=2023-07-14T15:47:05.620 file=`np6-905-cd_archive_page113.json` sha256=`c34d66cf330a803ff8ffa2a15a1b92203b6fbed182ccefb7cacc512b429c80cb`
- page=105 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-09-25T13:02:08.512 newest=2023-10-05T22:47:06.316 file=`np6-905-cd_archive_page105.json` sha256=`fe21a49c87475edf927a71a861abf3c632235759133a9cc4d6d4af4e9fc57216`
- page=95 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2024-01-07T16:02:14.000 newest=2024-01-18T01:47:07.000 file=`np6-905-cd_archive_page95.json` sha256=`198884c0ec2f993ccc2ed64a06fa8728bcc4fe40b50b4b6cca717111f3a60024`

## Target civil-day archive hits (EMPTY GATE windows)
- **HIT** product=np4 gate_civil_day=2021-04-15 post=2021-04-14 docId=768484164
- **HIT** product=np4 gate_civil_day=2022-07-15 post=2022-07-14 docId=851721131
- **HIT** product=np4 gate_civil_day=2023-01-15 post=2023-01-14 docId=889403190
- **HIT** product=np4 gate_civil_day=2023-04-15 post=2023-04-14 docId=908799936
- **HIT** product=np6 gate_civil_day=2022-07-15 post=2022-07-15 docId=851917168
- **HIT** product=np6 gate_civil_day=2021-04-15 post=2021-04-15 docId=768652939
- **HIT** product=np6 gate_civil_day=2023-01-15 post=2023-01-15 docId=889599083

## GATEs / empty / absent
- **ABSENT** NP4-180-ER  — No invented path; leave GATE (same as batch2–5 Option-2 scope).
- **ABSENT** NP6-785-ER  — No invented path; leave GATE (same as batch2–5 Option-2 scope).
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices 2022-11-15 — live artifact From/To returned 0 rows; use archive
- **EMPTY** np6-905-cd-spp_node_zone_hub 2022-11-15 — live artifact From/To returned 0 rows; use archive

## Blocks / notes
- {'phase': '429', 'attempt': 1, 'url': 'https://api.ercot.com/api/public-reports/archive/np6-905-cd?page=113', 'backoff_s': 2.2}
- {'phase': '429', 'attempt': 2, 'url': 'https://api.ercot.com/api/public-reports/archive/np6-905-cd?page=113', 'backoff_s': 4.4}
- {'phase': '429', 'attempt': 1, 'url': 'https://api.ercot.com/api/public-reports/archive/np4-190-cd?download=889403190', 'backoff_s': 2.2}
- {'phase': '429', 'attempt': 2, 'url': 'https://api.ercot.com/api/public-reports/archive/np4-190-cd?download=889403190', 'backoff_s': 4.4}
- {'phase': '429', 'attempt': 3, 'url': 'https://api.ercot.com/api/public-reports/archive/np4-190-cd?download=889403190', 'backoff_s': 8.8}
- note: NP4 gap picks: [(768484164, '2021-04-14'), (851721131, '2022-07-14'), (889403190, '2023-01-14'), (908799936, '2023-04-14'), (778995380, '2021-06-14'), (795352419, '2021-09-14'), (806282994, '2021-11-14'), (833904939, '2022-04-14'), (857947135, '2022-08-14'), (876700070, '2022-11-14'), (896008634, '2023-02-14'), (915418450, '2023-05-14'), (929271813, '2023-07-14'), (973099207, '2024-01-14')]
- note: NP6 gap picks: [(851917168, '2022-07-15'), (768652939, '2021-04-15'), (889599083, '2023-01-15'), (908142435, '2023-04-11'), (860746717, '2022-08-28'), (878136884, '2022-11-21'), (838433812, '2022-05-08'), (928108758, '2023-07-09'), (947107104, '2023-09-28'), (972598466, '2024-01-12')]

## Leak-check
- No subscription keys, passwords, usernames, or bearer tokens intentionally written.
- Private token JSON deleted after run.
- Leak-check: PASS (no credential/token substrings in READY/meta/json text outputs).

