# ERCOT batch3 READY

- Timestamp (America/Chicago): 2026-09-24 13:54:45 CT
- Token HTTP status: 200
- Bearer: [redacted] when present (True)
- GET count: 30 (budget ≤90)
- Rate: MIN_INTERVAL=2.2s; backoff on 429
- Secrets source (path only): `[redacted-secrets-store]`
- Card key names used: ERCOT_SUBSCRIPTION_KEY, ERCOT_USERNAME, ERCOT_PASSWORD
- HTTP status tally 401/403/429: {'401': 0, '403': 0, '429': 0}

## DeliveryDate syntax (confirmed from batch2)
- Working: `from_to` → `deliveryDateFrom={date}&deliveryDateTo={date}`
- Note: Confirmed in batch2; bare deliveryDate=400. Reused without rediscovery.
- Bare `deliveryDate=` → 400 (do not use).

## Artifact From/To sample days (new vs batch2)
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-07-15 page=1 status=200 rows=1000 totalRecords=21816 bytes=49452 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-07-15__page1.json` sha256=`7a9abb722d50f0a2c3a215249f761d584f08c20d960b770991e5cc8a7e0bf3ca` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-07-15 page=2 status=200 rows=1000 totalRecords=21816 bytes=49371 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-07-15__page2.json` sha256=`ed490df9653319fd4ca6523fa44925ee632980a3f0f489528275980d05e9c935` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-07-15 page=3 status=200 rows=1000 totalRecords=21816 bytes=49324 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-07-15__page3.json` sha256=`3efbe32c8fd6d99e51dc7b9e7dde8fc6529b8eb023eeda785599ff2a4b066957` note=rows
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2023-08-15 page=1 status=200 rows=0 totalRecords=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2023-08-15__page1.json` sha256=`01740b78c6b4f4a3d22db4cf26e1df8d2a3593a0cb73d336a51855e13858a35c` note=empty_data
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2022-02-15 page=1 status=200 rows=0 totalRecords=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2022-02-15__page1.json` sha256=`0b844e7043cefc774a9f4c21d1fb0a1b0c284ac935c2744add8ae4505417a13f` note=empty_data
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2021-08-15 page=1 status=200 rows=0 totalRecords=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2021-08-15__page1.json` sha256=`b45e2ab51db8bb0ed363852af209adc5f79be3cdcdec53d9a77f8bccf00b9b75` note=empty_data
- **OK** np6-905-cd-spp_node_zone_hub date=2024-07-15 page=1 status=200 rows=1000 totalRecords=88416 bytes=51671 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-07-15__page1.json` sha256=`98f8aee4901f04fe66a51b1868a910639a33bba528de18ff086d02574e3bc211` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-07-15 page=2 status=200 rows=1000 totalRecords=88416 bytes=51616 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-07-15__page2.json` sha256=`b3e30c5b1c25130162ba1ce2b904a8adf934626b8252a89849f78e0e078aaf1c` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-07-15 page=3 status=200 rows=1000 totalRecords=88416 bytes=51683 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-07-15__page3.json` sha256=`844d5a41ee2e1ad8142ed6ddc8b300a3989ef5ca18dec451579d41772d93192c` note=rows
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2023-08-15 page=1 status=200 rows=0 totalRecords=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2023-08-15__page1.json` sha256=`ffa00cc46533bf6f02676ea0a725fc3941a475556c8de7da819e579c26afeebb` note=empty_data
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2022-02-15 page=1 status=200 rows=0 totalRecords=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2022-02-15__page1.json` sha256=`151f4457cdb71d7593952785ffe37be11e03360d542beeb36506d319ecad0d97` note=empty_data
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2021-08-15 page=1 status=200 rows=0 totalRecords=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2021-08-15__page1.json` sha256=`4a3724d6af5d1a954ee8101b6df253babce568017f3deca9e034bfb2bf64a0a9` note=empty_data

## NP6 Uri-window archive downloads (page197 listing reused from batch2)
- Reused listing: `np6-905-cd_archive_page197_reused_from_batch2.json` sha256=`56285d26c6a7c530b88319aad9a9a70ef3b20530996150fda0d9b3975e6d7851` (bytes copied from batch2 listing; no GET)
- **OK** docId=757800273 post=2021-02-09T13:17:05.290 status=200 bytes=3958 file=`np6-905-cd__inst1_20210209_757800273_SPPHLZNP6905_20210209_1315_csv.zip` sha256=`f1730a120c3f9f33ffe79ed952f7d6710f36dc643700c07feecca16f68948f8d`
- **OK** docId=758130553 post=2021-02-11T11:47:04.288 status=200 bytes=5360 file=`np6-905-cd__inst2_20210211_758130553_SPPHLZNP6905_20210211_1145_csv.zip` sha256=`912375c130fe9f7e2336076516bf77e2c4c330dc3c41ebc57bdd68fede28c05a`
- **OK** docId=758461769 post=2021-02-13T11:47:04.406 status=200 bytes=5625 file=`np6-905-cd__inst3_20210213_758461769_SPPHLZNP6905_20210213_1145_csv.zip` sha256=`e92a31140c299e8e1fa17f32bd3e0f722c43bc3250a4a6cd2ad0230b42ed4b81`
- **OK** docId=758785321 post=2021-02-15T11:47:04.471 status=200 bytes=5669 file=`np6-905-cd__inst4_20210215_758785321_SPPHLZNP6905_20210215_1145_csv.zip` sha256=`eefd14f01636039f7feabc3c063eeb5d4b45b3dbcd81626137a31d162dd24958`
- **OK** docId=759129410 post=2021-02-17T11:47:04.277 status=200 bytes=3978 file=`np6-905-cd__inst5_20210217_759129410_SPPHLZNP6905_20210217_1145_csv.zip` sha256=`0e91ae35205e3df5b54abdef7bd3094a789e3ed685fc3ac156031e323d43eb6d`
- **OK** docId=759417965 post=2021-02-19T06:02:05.059 status=200 bytes=5393 file=`np6-905-cd__inst6_20210219_759417965_SPPHLZNP6905_20210219_0600_csv.zip` sha256=`34c9f4344fd1c70498bf7d615f86fed1cc88611e3f6fcb275a13c88a5d902c3e`

## NP4 archive instance downloads (listings reused from batch2 pages 2–3)
- Reused listing page=3: `np4-190-cd_archive_page3_reused_from_batch2.json` sha256=`15cefe81cb08bf541e550468a4ea67c8f9d21695635bef1fb718d6acba49802a`
- Reused listing page=2: `np4-190-cd_archive_page2_reused_from_batch2.json` sha256=`a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908`
- **OK** docId=757802224 post=2021-02-09T13:39:48.000 status=200 bytes=79376 file=`np4-190-cd__inst1_20210209_757802224_DAMSPNP4190_csv.zip` sha256=`048061390b5072756e3ca1f232dc0f6d7ffd72440fa914d2f993663117afe8da` src=np4-190-cd_archive_page3.json
- **OK** docId=758799242 post=2021-02-15T13:17:52.000 status=200 bytes=85258 file=`np4-190-cd__inst2_20210215_758799242_DAMSPNP4190_csv.zip` sha256=`e9c2bf5f587c71d064374397438f7597c8b0b98a6eebb665b117a543e52f9ebb` src=np4-190-cd_archive_page3.json
- **OK** docId=759484356 post=2021-02-19T14:36:31.000 status=200 bytes=79642 file=`np4-190-cd__inst3_20210219_759484356_DAMSPNP4190_csv.zip` sha256=`f60576df8cf822cce1d4d2a9b2a323a90f7173cb7914dbd28d778b0c3c7fd987` src=np4-190-cd_archive_page3.json
- **OK** docId=763581329 post=2021-03-16T12:33:55.000 status=200 bytes=80719 file=`np4-190-cd__inst4_20210316_763581329_DAMSPNP4190_csv.zip` sha256=`957f39de6b2a154a0a925cdaf414279c218f0e8440cb44be7e0f9e930b479b2b` src=np4-190-cd_archive_page3.json
- **OK** docId=790144271 post=2021-08-16T12:34:58.000 status=200 bytes=79055 file=`np4-190-cd__inst5_20210816_790144271_DAMSPNP4190_csv.zip` sha256=`4b97ae126fb11b28c186d882795cef2ead339a00ee69a1d27a34e28e314d7814` src=np4-190-cd_archive_page2.json
- **OK** docId=845921117 post=2022-06-15T12:34:03.000 status=200 bytes=95570 file=`np4-190-cd__inst6_20220615_845921117_DAMSPNP4190_csv.zip` sha256=`54d5fcf952de1601f4641487a9ec7fbf2a21aaa1d3e40cc9a14b4875dd6e7bc3` src=np4-190-cd_archive_page2.json
- **OK** docId=922670819 post=2023-06-15T12:45:56.754 status=200 bytes=100295 file=`np4-190-cd__inst7_20230615_922670819_DAMSPNP4190_csv.zip` sha256=`538aa86b135b5a061506913a9877db0901c0b6afe1eff356ca2e680d877cf5df` src=np4-190-cd_archive_page2.json

## New NP6 archive listing pages (not in batch2)
- page=80 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2024-06-11T22:17:02.000 newest=2024-06-22T08:02:01.000 file=`np6-905-cd_archive_page80.json` sha256=`9892fc225c43c65eb5ffeffedf60305d532112070601a63cd26e302c5c4073a8`
- page=90 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2024-02-28T17:17:10.000 newest=2024-03-10T04:02:09.000 file=`np6-905-cd_archive_page90.json` sha256=`d200ddf5ff8af1c8e6d5f4cbb82a7c60d79908a55fc6d3b27f93303b39a9341a`
- page=140 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-09-25T22:47:07.717 newest=2022-10-06T08:32:05.785 file=`np6-905-cd_archive_page140.json` sha256=`f90ed7398b7e7acc519d7572ad23c07fe3f5c1b2c151811404265effd1b8147d`
- page=150 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-06-13T18:47:06.421 newest=2022-06-24T04:32:08.735 file=`np6-905-cd_archive_page150.json` sha256=`9d59d9f5b2c8c2b457a7570f9e3a228c5bad7fc79fe77df0d9a8ccd4399327f1`
- page=185 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2021-06-14T05:17:05.014 newest=2021-06-24T15:02:07.486 file=`np6-905-cd_archive_page185.json` sha256=`11bb0f2ee238db333843f14a56828a3164b65556e15fb1aae96ae838613d7b61`

## GATEs / empty / absent
- **ABSENT** NP4-180-ER  — No invented path; leave GATE (same as batch2 Option-2 scope).
- **ABSENT** NP6-785-ER  — No invented path; leave GATE (same as batch2 Option-2 scope).
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices 2023-08-15 — live artifact From/To returned 0 rows; use archive for early window
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices 2022-02-15 — live artifact From/To returned 0 rows; use archive for early window
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices 2021-08-15 — live artifact From/To returned 0 rows; use archive for early window
- **EMPTY** np6-905-cd-spp_node_zone_hub 2023-08-15 — live artifact From/To returned 0 rows; use archive for early window
- **EMPTY** np6-905-cd-spp_node_zone_hub 2022-02-15 — live artifact From/To returned 0 rows; use archive for early window
- **EMPTY** np6-905-cd-spp_node_zone_hub 2021-08-15 — live artifact From/To returned 0 rows; use archive for early window

## Blocks / notes
- none observed
- note: NP6 Uri picks from page197: [757800273, 758130553, 758461769, 758785321, 759129410, 759417965]
- note: NP4 archive picks: [(757802224, '2021-02-09'), (758799242, '2021-02-15'), (759484356, '2021-02-19'), (763581329, '2021-03-16'), (790144271, '2021-08-16'), (845921117, '2022-06-15'), (922670819, '2023-06-15')]

## Leak-check
- No subscription keys, passwords, usernames, or bearer tokens intentionally written.
- Private token JSON deleted after run.
- Leak-check: PASS (no credential/token substrings in READY/meta/json text outputs).

