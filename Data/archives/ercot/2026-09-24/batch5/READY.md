# ERCOT batch5 READY

- Timestamp (America/Chicago): 2026-09-24 14:28:17 CT
- Token HTTP status: 200
- Bearer: id_token when present (True)
- GET count: 27 (budget ≤90)
- Rate: MIN_INTERVAL=2.2s; backoff on 429
- Secrets source (path only): `/home/box/agent-data/box-secrets.json`
- Card key names used: ERCOT_SUBSCRIPTION_KEY, ERCOT_USERNAME, ERCOT_PASSWORD
- HTTP status tally 401/403/429: {'401': 0, '403': 0, '429': 0}

## DeliveryDate syntax (confirmed from batch2)
- Working: `from_to` → `deliveryDateFrom={date}&deliveryDateTo={date}`
- Note: Confirmed in batch2; bare deliveryDate=400. Reused without rediscovery.
- Bare `deliveryDate=` → 400 (do not use).

## Artifact From/To sample days (early window; new vs batch2–4)
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2021-04-15 page=1 status=200 rows=0 totalRecords=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2021-04-15__page1.json` sha256=`7ab10f95995a56cee0839645477aa7e212aea1dc6d1df1c4bbb3d8acf342bb4a` note=empty_data
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2022-07-15 page=1 status=200 rows=0 totalRecords=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2022-07-15__page1.json` sha256=`1d57e1ca7059f0141a956622875050258e24bbde2e6f0d0e88020731752d96b8` note=empty_data
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2023-04-15 page=1 status=200 rows=0 totalRecords=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2023-04-15__page1.json` sha256=`c03f25956c8ae65bd916ec339fb6936e227253f692abcee597f81f59fe27b81f` note=empty_data
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2021-04-15 page=1 status=200 rows=0 totalRecords=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2021-04-15__page1.json` sha256=`81ea9b47706060e7ecb7e6c44542dab8c155c051dedb640a209640d5a70f1afd` note=empty_data
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2022-07-15 page=1 status=200 rows=0 totalRecords=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2022-07-15__page1.json` sha256=`05ed522ec88e65028269e2478f7342fe82e8a07d723473c2945d0cedfb682d0f` note=empty_data
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2023-04-15 page=1 status=200 rows=0 totalRecords=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2023-04-15__page1.json` sha256=`8d5280a1c654119edd540fc16b2919293fb512f7a104234d45843d23f940c54b` note=empty_data

## NP4 early-window archive downloads (listings reused; new docIds)
- Reused listing page=2 `np4-190-cd_archive_page2.json` → `np4-190-cd_archive_page2_reused_from_batch4.json` sha256=`a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908` (copied from batch4; no GET)
- Reused listing page=3 `np4-190-cd_archive_page3.json` → `np4-190-cd_archive_page3_reused_from_batch3.json` sha256=`15cefe81cb08bf541e550468a4ea67c8f9d21695635bef1fb718d6acba49802a` (copied from batch3; no GET)
- **OK** docId=758641836 post=2021-02-14T14:55:01.000 status=200 bytes=88107 file=`np4-190-cd__inst1_20210214_758641836_DAMSPNP4190_csv.zip` sha256=`6616c68bd41419e804a2ce65608d8d3d34cdd5a1198d62f82415f6c3e783a137` src=np4-190-cd_archive_page3_reused_from_batch3.json
- **OK** docId=763408356 post=2021-03-15T12:33:05.000 status=200 bytes=78791 file=`np4-190-cd__inst2_20210315_763408356_DAMSPNP4190_csv.zip` sha256=`8ef15fd06af536688b09aa168871d41c6325edb89fa6259f21250ea0334dbc66` src=np4-190-cd_archive_page3_reused_from_batch3.json
- **OK** docId=768828508 post=2021-04-16T12:33:49.000 status=200 bytes=78356 file=`np4-190-cd__inst3_20210416_768828508_DAMSPNP4190_csv.zip` sha256=`190ddd317c569189d0b1d3614a17b5bcf7eaab04ce0f2e8d54ba9cc860b14839` src=np4-190-cd_archive_page2_reused_from_batch4.json
- **OK** docId=784624476 post=2021-07-16T12:33:37.000 status=200 bytes=77962 file=`np4-190-cd__inst4_20210716_784624476_DAMSPNP4190_csv.zip` sha256=`a9028fd1136237166235c48fb8c13c45b3f75980b6c6e144d4dd8005a8d0bea2` src=np4-190-cd_archive_page2_reused_from_batch4.json
- **OK** docId=817680531 post=2022-01-16T12:30:42.000 status=200 bytes=84583 file=`np4-190-cd__inst5_20220116_817680531_DAMSPNP4190_csv.zip` sha256=`ae406a101f81550da4cf1de08b576a9bde2ca77f6e2038327e9fc840f42f9f7c` src=np4-190-cd_archive_page2_reused_from_batch4.json
- **OK** docId=828536499 post=2022-03-16T12:44:06.000 status=200 bytes=89921 file=`np4-190-cd__inst6_20220316_828536499_DAMSPNP4190_csv.zip` sha256=`aa911c8fc359127e039d76c99809f7793bc57d2ddb08d535deb43a67ff349200` src=np4-190-cd_archive_page2_reused_from_batch4.json
- **OK** docId=852119649 post=2022-07-16T12:28:56.000 status=200 bytes=90582 file=`np4-190-cd__inst7_20220716_852119649_DAMSPNP4190_csv.zip` sha256=`1608a23c392acaa56a64958568255b36266afef5201cfef2705d054ef0644b63` src=np4-190-cd_archive_page2_reused_from_batch4.json

## NP6 early-window archive downloads (reused + new listings; new docIds)
- Reused listing `np6-905-cd_archive_page197.json` → `np6-905-cd_archive_page197_reused_for_early.json` sha256=`56285d26c6a7c530b88319aad9a9a70ef3b20530996150fda0d9b3975e6d7851` (copied from batch3; no GET)
- Reused listing `np6-905-cd_archive_page191.json` → `np6-905-cd_archive_page191_reused_for_early.json` sha256=`6d99cf01cdf5225d881c6634b218ab7647475ad75ef4b78fd3d50a6a7a47d363` (copied from batch2; no GET)
- Reused listing `np6-905-cd_archive_page165.json` → `np6-905-cd_archive_page165_reused_for_early.json` sha256=`ee1dca123065887a2c4a03fd862e5d07405e0ecee22a40dc1108a626e9996142` (copied from batch4; no GET)
- Reused listing `np6-905-cd_archive_page127.json` → `np6-905-cd_archive_page127_reused_for_early.json` sha256=`30dc72ac867daa5c6dfde318b370d700a5470322e798042f694d5489f382ed3b` (copied from batch4; no GET)
- **OK** docId=759415177 post=2021-02-19T05:47:04.572 status=200 bytes=5402 file=`np6-905-cd__inst1_20210219_759415177_SPPHLZNP6905_20210219_0545_csv.zip` sha256=`6316fff071c9db64c79e39fc5ba3f8c109191b20c6dc8c0eb42e742a3a9d6e83` src=np6-905-cd_archive_page197_reused_from_batch2.json
- **OK** docId=768651349 post=2021-04-15T11:47:05.629 status=200 bytes=4095 file=`np6-905-cd__inst2_20210415_768651349_SPPHLZNP6905_20210415_1145_csv.zip` sha256=`a57ce1d72352549dd80e2634e5aa81db265019d7341ca4ef09845611c17d0a95` src=np6-905-cd_archive_page191.json
- **OK** docId=817499214 post=2022-01-15T11:47:05.037 status=200 bytes=5633 file=`np6-905-cd__inst3_20220115_817499214_SPPHLZNP6905_20220115_1145_csv.zip` sha256=`cab963886cdbaf215f5a2155f1bc3d6f09160c28ca6665589bbc0c683445f282` src=np6-905-cd_archive_page165.json
- **OK** docId=774460998 post=2021-05-19T04:32:07.829 status=200 bytes=4973 file=`np6-905-cd__inst4_20210519_774460998_SPPHLZNP6905_20210519_0430_csv.zip` sha256=`14ea22ba27c330dd7c090b1642341888ca90d0cf9196db1e21fb6e1cfe217814` src=np6-905-cd_archive_page188.json
- **OK** docId=785365684 post=2021-07-20T16:32:06.862 status=200 bytes=4780 file=`np6-905-cd__inst5_20210720_785365684_SPPHLZNP6905_20210720_1630_csv.zip` sha256=`65dc5bacd6874e7a04d7a5bed0c1045ee1fce247616bf12e1d74b1eddf07a6ba` src=np6-905-cd_archive_page182.json
- **OK** docId=800246894 post=2021-10-12T00:02:05.891 status=200 bytes=5691 file=`np6-905-cd__inst6_20211012_800246894_SPPHLZNP6905_20211012_0000_csv.zip` sha256=`9b183eb5a8499494d66a33a4f5c7bf334308bbdefb416abe291e066f1cbc4bd9` src=np6-905-cd_archive_page174.json
- **OK** docId=811491049 post=2021-12-13T11:02:06.567 status=200 bytes=4239 file=`np6-905-cd__inst7_20211213_811491049_SPPHLZNP6905_20211213_1100_csv.zip` sha256=`df36718ce7c423ab63da358f7fe3795ea64a37145c082566adfd0215c6fecefe` src=np6-905-cd_archive_page168.json

## New NP6 archive listing pages (not in batch2–4)
- page=188 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2021-05-13T23:47:05.177 newest=2021-05-24T09:32:15.670 file=`np6-905-cd_archive_page188.json` sha256=`d5a290cc842f3dccb05a0f05c245ff85090d41a6c4900d84269ef11a9b967c99`
- page=182 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2021-07-15T11:47:05.425 newest=2021-07-25T21:02:05.049 file=`np6-905-cd_archive_page182.json` sha256=`b7dc1662ce88361b9c9841f4f2e7f865da3e91fcd1a57b9def09a4f43b60bc5a`
- page=174 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2021-10-06T19:17:04.601 newest=2021-10-17T05:02:05.369 file=`np6-905-cd_archive_page174.json` sha256=`0f50103392ca725dade65f4e85a5eb6e491e60d3040cefb87635d3accb52d61e`
- page=168 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2021-12-08T06:17:06.757 newest=2021-12-18T16:02:04.950 file=`np6-905-cd_archive_page168.json` sha256=`b06e600c0dafda88cec822ab4bfcc4d44f4cd1bf39d0a89872369bdeed4b6577`
- page=158 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-03-22T11:17:08.783 newest=2022-04-01T21:02:06.534 file=`np6-905-cd_archive_page158.json` sha256=`34055b225a4a709f2b713bf234a31d6289f5ada54eb35f3574c0666f921b33ba`
- page=147 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-07-15T01:17:08.230 newest=2022-07-25T11:02:08.581 file=`np6-905-cd_archive_page147.json` sha256=`645da241224a3d3925b78afccac9697107273fe56ef3c0a65041016e79ba212f`
- page=132 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-12-18T06:17:06.102 newest=2022-12-28T16:02:05.262 file=`np6-905-cd_archive_page132.json` sha256=`ceb8761682fe9b0322e2096b4386d48785afe319df86a279e825ca01557f8aec`

## GATEs / empty / absent
- **ABSENT** NP4-180-ER  — No invented path; leave GATE (same as batch2–4 Option-2 scope).
- **ABSENT** NP6-785-ER  — No invented path; leave GATE (same as batch2–4 Option-2 scope).
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices 2021-04-15 — live artifact From/To returned 0 rows; use archive for early window
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices 2022-07-15 — live artifact From/To returned 0 rows; use archive for early window
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices 2023-04-15 — live artifact From/To returned 0 rows; use archive for early window
- **EMPTY** np6-905-cd-spp_node_zone_hub 2021-04-15 — live artifact From/To returned 0 rows; use archive for early window
- **EMPTY** np6-905-cd-spp_node_zone_hub 2022-07-15 — live artifact From/To returned 0 rows; use archive for early window
- **EMPTY** np6-905-cd-spp_node_zone_hub 2023-04-15 — live artifact From/To returned 0 rows; use archive for early window

## Blocks / notes
- none observed
- note: NP4 gap picks: [(758641836, '2021-02-14'), (763408356, '2021-03-15'), (768828508, '2021-04-16'), (784624476, '2021-07-16'), (817680531, '2022-01-16'), (828536499, '2022-03-16'), (852119649, '2022-07-16')]
- note: NP6 gap picks: [(759415177, '2021-02-19'), (768651349, '2021-04-15'), (817499214, '2022-01-15'), (774460998, '2021-05-19'), (785365684, '2021-07-20'), (800246894, '2021-10-12'), (811491049, '2021-12-13')]

## Leak-check
- No subscription keys, passwords, usernames, or bearer tokens intentionally written.
- Private token JSON deleted after run.
- Leak-check: PASS (no credential/token substrings in READY/meta/json text outputs).

