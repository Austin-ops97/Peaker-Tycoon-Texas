# ERCOT batch7 READY — 2022-11-15 NP6 priority + sparse densify

- Timestamp (America/Chicago): 2026-09-24 14:57:16 CT
- Token HTTP status: 200
- Bearer: id_token when present (True)
- GET count: 40 (budget ≤90)
- Rate: MIN_INTERVAL=2.2s; backoff on 429
- Secrets source (path only): `/home/box/agent-data/box-secrets.json`
- Card key names used: ERCOT_SUBSCRIPTION_KEY, ERCOT_USERNAME, ERCOT_PASSWORD
- HTTP status tally 401/403/429: {'401': 0, '403': 0, '429': 0}

## DeliveryDate syntax (confirmed from batch2)
- Working: `from_to` → `deliveryDateFrom={date}&deliveryDateTo={date}`
- Note: Confirmed in batch2; bare deliveryDate=400. Reused without rediscovery.
- Bare `deliveryDate=` → 400 (do not use).

## Artifact From/To sample days (new vs batch2–6; optional EMPTY probe)
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2023-10-15 page=1 status=200 rows=0 totalRecords=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2023-10-15__page1.json` sha256=`8ba65eea27dc31a9dce421c0fad3c500ae668e013ff1e9387c0138b49c50b1d3` note=empty_data
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-08-15 page=1 status=200 rows=1000 totalRecords=21960 bytes=49464 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-08-15__page1.json` sha256=`9629d3a6d641b7fc39890a9069ff3475ea8f198fda5569174881cd0ba0ee20bd` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-08-15 page=2 status=200 rows=1000 totalRecords=21960 bytes=49376 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-08-15__page2.json` sha256=`66bc652a4fb22afe31a4ebd99177f80b462c69dd2e34b1802d17a5aad353dc4d` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-08-15 page=3 status=200 rows=1000 totalRecords=21960 bytes=49352 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-08-15__page3.json` sha256=`1aa1c6b9ad61019d068692eae12e3b29809817fed1287fd943f5114d7801d645` note=rows
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2023-10-15 page=1 status=200 rows=0 totalRecords=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2023-10-15__page1.json` sha256=`68a87e9ee8813e3a61b37470264b6204f2b91029e8e0312fbb9272c32aaf15de` note=empty_data
- **OK** np6-905-cd-spp_node_zone_hub date=2024-08-15 page=1 status=200 rows=1000 totalRecords=88992 bytes=51536 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-08-15__page1.json` sha256=`ca58186fbb40a763cd369c8d655664ced1413e0a658e9ea610fc80536f6d5234` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-08-15 page=2 status=200 rows=1000 totalRecords=88992 bytes=51531 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-08-15__page2.json` sha256=`8c9f92113bdc63e337e41ee01f0c495101da29a5a091413ac4f1713d0ad4fdd9` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-08-15 page=3 status=200 rows=1000 totalRecords=88992 bytes=51437 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-08-15__page3.json` sha256=`e3ce036ea5b37bd096062f3030fffa3b651d3c6bdab542d22db333d859c0319a` note=rows

## NP4 archive downloads (listings reused; new docIds; EMPTY GATE near-days + densify)
- Reused listing page=1 `np4-190-cd_archive_page1.json` → `np4-190-cd_archive_page1_reused_from_batch6.json` sha256=`7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344` (copied from batch6; no GET)
- Reused listing page=2 `np4-190-cd_archive_page2.json` → `np4-190-cd_archive_page2_reused_from_batch6.json` sha256=`a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908` (copied from batch6; no GET)
- **OK** docId=800715157 post=2021-10-14T13:22:19.000 status=200 bytes=86023 file=`np4-190-cd__inst1_20211014_800715157_DAMSPNP4190_csv.zip` sha256=`0006604e557538fde6e075a86921ad4632f400376142eb721c99248cef193110` src=np4-190-cd_archive_page2_reused_from_batch6.json
- **OK** docId=839606758 post=2022-05-14T12:29:06.000 status=200 bytes=95012 file=`np4-190-cd__inst2_20220514_839606758_DAMSPNP4190_csv.zip` sha256=`8da9407f599141e140f8e1dec3006cf69564dd883e63f9ed85073fa6717eb532` src=np4-190-cd_archive_page2_reused_from_batch6.json
- **OK** docId=943814264 post=2023-09-14T12:35:10.887 status=200 bytes=95866 file=`np4-190-cd__inst3_20230914_943814264_DAMSPNP4190_csv.zip` sha256=`ff8471f3456a737040ee4878493e239ae57a1c16995fee1a8b774c4c5ae092b9` src=np4-190-cd_archive_page2_reused_from_batch6.json
- **OK** docId=950846495 post=2023-10-14T12:35:55.983 status=200 bytes=99676 file=`np4-190-cd__inst4_20231014_950846495_DAMSPNP4190_csv.zip` sha256=`74cde0d2f53ea638a4491e952be65b1af8fbab9bbc1f562a4811ef68c474f6c8` src=np4-190-cd_archive_page2_reused_from_batch6.json
- **OK** docId=800890479 post=2021-10-15T12:33:27.000 status=200 bytes=84201 file=`np4-190-cd__inst5_20211015_800890479_DAMSPNP4190_csv.zip` sha256=`d14d8e54f8778c001bae017084efe1cbb3bcd5708cd56361ae5efad9906de39e` src=np4-190-cd_archive_page2_reused_from_batch6.json
- **OK** docId=839796340 post=2022-05-15T12:28:00.000 status=200 bytes=94371 file=`np4-190-cd__inst6_20220515_839796340_DAMSPNP4190_csv.zip` sha256=`4649a1389e526cd8e551b9d939da0e9ceb215d7bc59d6a0229fb187822ba25f1` src=np4-190-cd_archive_page2_reused_from_batch6.json
- **OK** docId=944048824 post=2023-09-15T12:34:35.534 status=200 bytes=95590 file=`np4-190-cd__inst7_20230915_944048824_DAMSPNP4190_csv.zip` sha256=`cc6abf462f1af9ec5e13a9c8ae3e3220a5f1b3878aa310efded29c32beb24aea` src=np4-190-cd_archive_page2_reused_from_batch6.json
- **OK** docId=951071094 post=2023-10-15T12:34:51.247 status=200 bytes=100536 file=`np4-190-cd__inst8_20231015_951071094_DAMSPNP4190_csv.zip` sha256=`b482d43b867c2336101054464e609c6617d5857f179defd6d87a58830ebd8750` src=np4-190-cd_archive_page2_reused_from_batch6.json
- **OK** docId=958212331 post=2023-11-14T12:36:43.097 status=200 bytes=126155 file=`np4-190-cd__inst9_20231114_958212331_DAMSPNP4190_csv.zip` sha256=`d9e52d2b0b8eb0fb9099b9f6b5293102f154e7a8dea47d8cd605f42fd9919936` src=np4-190-cd_archive_page2_reused_from_batch6.json
- **OK** docId=980871702 post=2024-02-14T12:36:29.000 status=200 bytes=133053 file=`np4-190-cd__inst10_20240214_980871702_DAMSPNP4190_csv.zip` sha256=`868a215cd7361f4130df47adb2d5899964391aa7d501abc9307383670d15fca9` src=np4-190-cd_archive_page1_reused_from_batch6.json
- **OK** docId=1011809802 post=2024-06-14T12:32:40.000 status=200 bytes=146213 file=`np4-190-cd__inst11_20240614_1011809802_DAMSPNP4190_csv.zip` sha256=`35a9575f3f2f0e7b39764497d52021aed11c02c5133f21e923ab8b67e519917e` src=np4-190-cd_archive_page1_reused_from_batch6.json
- **OK** docId=1027771043 post=2024-08-14T12:32:41.000 status=200 bytes=145243 file=`np4-190-cd__inst12_20240814_1027771043_DAMSPNP4190_csv.zip` sha256=`6c4bfdd14e14c3737bae7a451bb4f5535e4ed72f8e4fc2969572cb91d4c0a67c` src=np4-190-cd_archive_page1_reused_from_batch6.json

## NP6 archive downloads (reused + new listings; new docIds; EMPTY GATE days)
- Reused listing `np6-905-cd_archive_page135.json` → `np6-905-cd_archive_page135_reused_for_batch7.json` sha256=`44fcd5a84f043032a35dfeaf06ec156751eac31b3c09e631d21d9e25f1d86d60` (copied from batch6; no GET)
- **OK** docId=876906627 post=2022-11-15T11:47:06.106 status=200 bytes=5587 file=`np6-905-cd__inst1_20221115_876906627_SPPHLZNP6905_20221115_1145_csv.zip` sha256=`0cf5b0132f717b4b934bfddf92a3b5d2dfc3938c1499eb488d4cac717bad6da0` src=np6-905-cd_archive_page136.json
- **OK** docId=876693618 post=2022-11-14T11:47:06.465 status=200 bytes=6045 file=`np6-905-cd__inst2_20221114_876693618_SPPHLZNP6905_20221114_1145_csv.zip` sha256=`e1c6aa4cb14744f76177bb1bc1fb23a137c7865cf53de960b51040c0990fe77f` src=np6-905-cd_archive_page136.json
- **OK** docId=877116040 post=2022-11-16T11:47:07.309 status=200 bytes=5976 file=`np6-905-cd__inst3_20221116_877116040_SPPHLZNP6905_20221116_1145_csv.zip` sha256=`8bfc6e9c9727fa9af3112607732145f956d125a8fc9436e85ddb64df18019371` src=np6-905-cd_archive_page136.json
- **OK** docId=877324251 post=2022-11-17T11:47:06.016 status=200 bytes=5115 file=`np6-905-cd__inst4_20221117_877324251_SPPHLZNP6905_20221117_1145_csv.zip` sha256=`49680dfc573f033d7ef5eeb82cce9ffe882c8f1844557dba3b23f442c260cd37` src=np6-905-cd_archive_page135_reused_for_batch7.json
- **OK** docId=877531745 post=2022-11-18T11:47:05.227 status=200 bytes=4509 file=`np6-905-cd__inst5_20221118_877531745_SPPHLZNP6905_20221118_1145_csv.zip` sha256=`c42cfbccfbc97ef8f5c33242f4d284a9e330d820727311675c582be2340141b7` src=np6-905-cd_archive_page135_reused_for_batch7.json
- **OK** docId=876908682 post=2022-11-15T12:02:07.696 status=200 bytes=5862 file=`np6-905-cd__inst6_20221115_876908682_SPPHLZNP6905_20221115_1200_csv.zip` sha256=`1dc7797a637a3bb1ac0618a5c9bb6d0b6afa8d93e8b4d91bf7a77c5b5a96d8ed` src=np6-905-cd_archive_page136.json
- **OK** docId=874412523 post=2022-11-03T11:47:06.365 status=200 bytes=5532 file=`np6-905-cd__inst7_20221103_874412523_SPPHLZNP6905_20221103_1145_csv.zip` sha256=`315a0bc825ad6ec4be6bc36325aed2f5b5ae70a57e41a3900dae70221c2b770d` src=np6-905-cd_archive_page137.json
- **OK** docId=871747934 post=2022-10-21T11:47:05.670 status=200 bytes=5495 file=`np6-905-cd__inst8_20221021_871747934_SPPHLZNP6905_20221021_1145_csv.zip` sha256=`a4b9e93859197ad22af949a830670d6e3a3c4d969a3783841e8001b84831cf7b` src=np6-905-cd_archive_page138.json
- **OK** docId=869702031 post=2022-10-11T11:47:05.740 status=200 bytes=5619 file=`np6-905-cd__inst9_20221011_869702031_SPPHLZNP6905_20221011_1145_csv.zip` sha256=`d6810a6981e143020594e62af083940302ffe3eb1c78f4d3a037a7071ff39d80` src=np6-905-cd_archive_page139.json
- **OK** docId=859152746 post=2022-08-20T11:47:06.851 status=200 bytes=4395 file=`np6-905-cd__inst10_20220820_859152746_SPPHLZNP6905_20220820_1145_csv.zip` sha256=`00869a329e83ef69e9221069a423c7be1f9af2a004efa99995ad67703f7bc55e` src=np6-905-cd_archive_page144.json
- **OK** docId=897926418 post=2023-02-23T11:47:05.795 status=200 bytes=6295 file=`np6-905-cd__inst11_20230223_897926418_SPPHLZNP6905_20230223_1145_csv.zip` sha256=`db9d4c30b360a98ef5d861f0a52d9ac9487ae1582be622f6dd27459b95102d7f` src=np6-905-cd_archive_page126.json
- **OK** docId=920842188 post=2023-06-07T11:47:05.393 status=200 bytes=4695 file=`np6-905-cd__inst12_20230607_920842188_SPPHLZNP6905_20230607_1145_csv.zip` sha256=`f896554be90b94f4dbd4ea07e819d0800a5075796b94893cd888ee177d337494` src=np6-905-cd_archive_page116.json

## New NP6 archive listing pages (not in batch2–6; pages 136–139 target 2022-11-15)
- page=136 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-11-06T14:47:06.901 newest=2022-11-17T00:32:05.857 file=`np6-905-cd_archive_page136.json` sha256=`97b75c665ba1846f8ff9d0e58122443ba79a39b010b193d6984c15520f4ce336`
- page=137 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-10-27T05:47:04.891 newest=2022-11-06T14:32:06.043 file=`np6-905-cd_archive_page137.json` sha256=`6213e1bb9060195e847bc4ccb9eb1e620c0ec94e4cc14e9ae006291a724c3b0b`
- page=138 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-10-16T19:47:05.842 newest=2022-10-27T05:32:06.197 file=`np6-905-cd_archive_page138.json` sha256=`1ab1860eceb7b4a4ed47c97abcf0fd384690c5957c3f10d4d210686dc575d3fd`
- page=139 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-10-06T09:47:05.913 newest=2022-10-16T19:32:05.991 file=`np6-905-cd_archive_page139.json` sha256=`23095ae225edb7c76455ae54c6a8a73e203049841d6ad481f0bc6409a9f73ed6`
- page=144 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-08-15T07:47:06.209 newest=2022-08-25T17:32:05.783 file=`np6-905-cd_archive_page144.json` sha256=`71b30b055670c962776c74dd37a60e521ebb93ec4a6f58808bd06f9db70d2a1c`
- page=126 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-02-18T18:47:05.335 newest=2023-03-01T04:32:06.187 file=`np6-905-cd_archive_page126.json` sha256=`ad915c9b047553bcb817d5cff1af2c70bc9f91c3d9db62c9ba8313e39e52ea7a`
- page=116 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-06-03T00:17:10.050 newest=2023-06-13T10:02:09.226 file=`np6-905-cd_archive_page116.json` sha256=`96fddea8317616781db743b4f00fc0297249fbf44195bd63174ef2d408d54946`
- page=98 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-12-07T10:17:07.188 newest=2023-12-17T20:02:08.000 file=`np6-905-cd_archive_page98.json` sha256=`f60397aa537a284c1096e17c1f96938e78b80b561b5aae018c3f834f222ef5a9`

## Target civil-day archive hits (priority 2022-11-15 + prior EMPTY GATEs)
- **HIT** product=np6 gate_civil_day=2022-11-15 post=2022-11-15 docId=876906627
- **HIT** product=np6 gate_civil_day=2022-11-15 post=2022-11-15 docId=876908682

## GATEs / empty / absent
- **ABSENT** NP4-180-ER  — No invented path; leave GATE (same as batch2–6 Option-2 scope).
- **ABSENT** NP6-785-ER  — No invented path; leave GATE (same as batch2–6 Option-2 scope).
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices 2023-10-15 — live artifact From/To returned 0 rows; use archive
- **EMPTY** np6-905-cd-spp_node_zone_hub 2023-10-15 — live artifact From/To returned 0 rows; use archive

## Blocks / notes
- none observed
- note: NP4 gap picks: [(800715157, '2021-10-14'), (839606758, '2022-05-14'), (943814264, '2023-09-14'), (950846495, '2023-10-14'), (800890479, '2021-10-15'), (839796340, '2022-05-15'), (944048824, '2023-09-15'), (951071094, '2023-10-15'), (958212331, '2023-11-14'), (980871702, '2024-02-14'), (1011809802, '2024-06-14'), (1027771043, '2024-08-14')]
- note: NP6 2022-11-15 priority picks so far: [(876906627, '2022-11-15', 'SPPHLZNP6905_20221115_1145_csv'), (876693618, '2022-11-14', 'SPPHLZNP6905_20221114_1145_csv'), (877116040, '2022-11-16', 'SPPHLZNP6905_20221116_1145_csv')]
- note: NP6 gap picks: [(876906627, '2022-11-15', 'SPPHLZNP6905_20221115_1145_csv'), (876693618, '2022-11-14', 'SPPHLZNP6905_20221114_1145_csv'), (877116040, '2022-11-16', 'SPPHLZNP6905_20221116_1145_csv'), (877324251, '2022-11-17', 'SPPHLZNP6905_20221117_1145_csv'), (877531745, '2022-11-18', 'SPPHLZNP6905_20221118_1145_csv'), (876908682, '2022-11-15', 'SPPHLZNP6905_20221115_1200_csv'), (874412523, '2022-11-03', 'SPPHLZNP6905_20221103_1145_csv'), (871747934, '2022-10-21', 'SPPHLZNP6905_20221021_1145_csv'), (869702031, '2022-10-11', 'SPPHLZNP6905_20221011_1145_csv'), (859152746, '2022-08-20', 'SPPHLZNP6905_20220820_1145_csv'), (897926418, '2023-02-23', 'SPPHLZNP6905_20230223_1145_csv'), (920842188, '2023-06-07', 'SPPHLZNP6905_20230607_1145_csv')]
- note: NP6 2022-11-15 hit in picks: True

## Leak-check
- No subscription keys, passwords, usernames, or bearer tokens intentionally written.
- Private token JSON deleted after run.
- Leak-check: PASS (no credential/token substrings in READY/meta/json text outputs).

