# ERCOT batch10 READY — Option-2 densify EMPTY months (NP4/NP6)

- Timestamp (America/Chicago): 2026-09-25 06:18:32 CT
- Token HTTP status: 200
- Bearer: id_token when present (True)
- GET count: 42 (budget ≤90)
- Rate: MIN_INTERVAL=2.2s; backoff on 429
- Secrets source (path only): `/home/box/agent-data/box-secrets.json`
- Card key names used: ERCOT_SUBSCRIPTION_KEY, ERCOT_USERNAME, ERCOT_PASSWORD
- HTTP status tally 401/403/429: {'401': 0, '403': 0, '429': 0}

## DeliveryDate syntax (confirmed from batch2)
- Working: `from_to` → `deliveryDateFrom={date}&deliveryDateTo={date}`
- Note: Confirmed in batch2; bare deliveryDate=400. Reused without rediscovery.
- Bare `deliveryDate=` → 400 (do not use).

## Artifact From/To sample days (new vs batch2–9; optional EMPTY probe)
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2021-03-15 page=1 status=200 rows=0 totalRecords=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2021-03-15__page1.json` sha256=`0250581552c76399109bc13598e12a72270876dc1cf92ea73fe5e2a133be06c2` note=empty_data
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-04-15 page=1 status=200 rows=1000 totalRecords=23712 bytes=49326 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-04-15__page1.json` sha256=`f0e90f3576b57ed0900ae5512997efe8e9ac48e64b4fafa470cabcb96441704a` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-04-15 page=2 status=200 rows=1000 totalRecords=23712 bytes=49351 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-04-15__page2.json` sha256=`b0c2c7fe362d2f97f43f0f8717e6fab79757ace190e38bc3fcf7692b527d49f7` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-04-15 page=3 status=200 rows=1000 totalRecords=23712 bytes=49323 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-04-15__page3.json` sha256=`3d3b36268a197e79361062fdf4135405e5c433571d62ad938141932379a6f0f0` note=rows
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2021-03-15 page=1 status=200 rows=0 totalRecords=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2021-03-15__page1.json` sha256=`f88756ccca5720247d803844e1b1e376cc93a2cddb9ececcd3a9046c6eeb7d2b` note=empty_data
- **OK** np6-905-cd-spp_node_zone_hub date=2025-04-15 page=1 status=200 rows=1000 totalRecords=96000 bytes=51495 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-04-15__page1.json` sha256=`3624f8a4958352b2a7537215c0d384f5d6b53812812eb3fcdc417e4b6cc85dd6` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-04-15 page=2 status=200 rows=1000 totalRecords=96000 bytes=51466 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-04-15__page2.json` sha256=`95529f9d4b986218e1c5eee24d2836ae832c53f464d56e88ca19260575150995` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-04-15 page=3 status=200 rows=1000 totalRecords=96000 bytes=51455 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-04-15__page3.json` sha256=`d3fb851181ad152ca1734727d44ea72ea6df47e6e84324d196bf86d40eaaf410` note=rows

## NP4 archive downloads (listings reused; new docIds; EMPTY GATE near-days + densify)
- Reused listing page=1 `np4-190-cd_archive_page1.json` → `np4-190-cd_archive_page1_reused_from_batch9.json` sha256=`7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344` (copied from batch9; no GET)
- Reused listing page=2 `np4-190-cd_archive_page2.json` → `np4-190-cd_archive_page2_reused_from_batch9.json` sha256=`a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908` (copied from batch9; no GET)
- **OK** docId=789966340 post=2021-08-15T12:33:15.000 status=200 bytes=78780 file=`np4-190-cd__inst1_20210815_789966340_DAMSPNP4190_csv.zip` sha256=`d7997dfd2c28424b195db9fe362ff82a7de526794453ef001d02392194f9500e` src=np4-190-cd_archive_page2_reused_from_batch9.json
- **OK** docId=806478424 post=2021-11-15T14:15:46.000 status=200 bytes=88595 file=`np4-190-cd__inst2_20211115_806478424_DAMSPNP4190_csv.zip` sha256=`fb9222e5db14f36367bd7ff01eed1f98b88aa85a5a332b88ef6f902bb6a53aa8` src=np4-190-cd_archive_page2_reused_from_batch9.json
- **OK** docId=828352459 post=2022-03-15T12:41:06.000 status=200 bytes=89954 file=`np4-190-cd__inst3_20220315_828352459_DAMSPNP4190_csv.zip` sha256=`b08391c43ae5d1a7620acdd2be17f74294985420fde87e277a10b6feb554d00b` src=np4-190-cd_archive_page2_reused_from_batch9.json
- **OK** docId=834093772 post=2022-04-15T12:30:37.000 status=200 bytes=93088 file=`np4-190-cd__inst4_20220415_834093772_DAMSPNP4190_csv.zip` sha256=`5a325bb4c11004d140b6395f376f834df60e333278e702ec061b849276c77e61` src=np4-190-cd_archive_page2_reused_from_batch9.json
- **OK** docId=864597486 post=2022-09-16T12:28:40.000 status=200 bytes=93528 file=`np4-190-cd__inst5_20220916_864597486_DAMSPNP4190_csv.zip` sha256=`bfed7395ff953b7b7df395c89695ebdef919f395fd266bb913dcf2b5b9b9daa0` src=np4-190-cd_archive_page2_reused_from_batch9.json
- **OK** docId=789622913 post=2021-08-13T12:33:39.000 status=200 bytes=78847 file=`np4-190-cd__inst6_20210813_789622913_DAMSPNP4190_csv.zip` sha256=`eb909c87ae63f55d833c174ca24af809b00d1b5dc8a44e650696192f378a2a64` src=np4-190-cd_archive_page2_reused_from_batch9.json
- **OK** docId=806112432 post=2021-11-13T12:35:41.000 status=200 bytes=87418 file=`np4-190-cd__inst7_20211113_806112432_DAMSPNP4190_csv.zip` sha256=`f13eb8d5cc9b64ddca612cfa3346ae7ca138554f66fe0c371bdac8d32618335c` src=np4-190-cd_archive_page2_reused_from_batch9.json
- **OK** docId=827982088 post=2022-03-13T12:37:29.000 status=200 bytes=89106 file=`np4-190-cd__inst8_20220313_827982088_DAMSPNP4190_csv.zip` sha256=`7cae5a49b8be20dbc5a82c036b71f82b799f71139a5a7f3348972f3939ea4fdb` src=np4-190-cd_archive_page2_reused_from_batch9.json
- **OK** docId=833716387 post=2022-04-13T12:28:15.000 status=200 bytes=93016 file=`np4-190-cd__inst9_20220413_833716387_DAMSPNP4190_csv.zip` sha256=`7c74b644d0470ad5a0fc7fe6a9de3c6fee0961cfb3a2f67df3e20e71aa8d5757` src=np4-190-cd_archive_page2_reused_from_batch9.json
- **OK** docId=863987055 post=2022-09-13T12:34:39.000 status=200 bytes=90794 file=`np4-190-cd__inst10_20220913_863987055_DAMSPNP4190_csv.zip` sha256=`fe2cc200c303cf80fa46a80c89f72c6123207add4536eec2761b9b6eae1d05b4` src=np4-190-cd_archive_page2_reused_from_batch9.json
- **OK** docId=981119077 post=2024-02-15T12:35:05.000 status=200 bytes=121847 file=`np4-190-cd__inst11_20240215_981119077_DAMSPNP4190_csv.zip` sha256=`1d30b197221113fa3f26e26e5b952de5a4bb495081e9ff918005c74d556be363` src=np4-190-cd_archive_page1_reused_from_batch9.json
- **OK** docId=1019633370 post=2024-07-14T12:32:21.000 status=200 bytes=142319 file=`np4-190-cd__inst12_20240714_1019633370_DAMSPNP4190_csv.zip` sha256=`109b55e8806e86f9a4372600f8d0ef48f607f91a387f3bcdb7935cbe7da716a4` src=np4-190-cd_archive_page1_reused_from_batch9.json

## NP6 archive downloads (reused + new listings; new docIds; EMPTY GATE days)
- Reused listing `np6-905-cd_archive_page178.json` → `np6-905-cd_archive_page178_reused_for_batch10.json` sha256=`acfbade1e4fd23d531308fe1a398490291637c3dd68dc8925ca33605a355153c` (copied from batch4; no GET)
- Reused listing `np6-905-cd_archive_page158.json` → `np6-905-cd_archive_page158_reused_for_batch10.json` sha256=`34055b225a4a709f2b713bf234a31d6289f5ada54eb35f3574c0666f921b33ba` (copied from batch5; no GET)
- Reused listing `np6-905-cd_archive_page140.json` → `np6-905-cd_archive_page140_reused_for_batch10.json` sha256=`f90ed7398b7e7acc519d7572ad23c07fe3f5c1b2c151811404265effd1b8147d` (copied from batch4; no GET)
- Reused listing `np6-905-cd_archive_page90.json` → `np6-905-cd_archive_page90_reused_for_batch10.json` sha256=`d200ddf5ff8af1c8e6d5f4cbb82a7c60d79908a55fc6d3b27f93303b39a9341a` (copied from batch4; no GET)
- Reused listing `np6-905-cd_archive_page70.json` → `np6-905-cd_archive_page70_reused_for_batch10.json` sha256=`52d442271e92087edf752ddc73935a7b987cebd543d787aaa629a699f92b949f` (copied from batch4; no GET)
- **OK** docId=763403133 post=2021-03-15T11:47:04.959 status=200 bytes=3965 file=`np6-905-cd__inst1_20210315_763403133_SPPHLZNP6905_20210315_1145_csv.zip` sha256=`feda0ffd680afe682990ce657717f84b364d43565a823286b8dc5e723cbcbd4d` src=np6-905-cd_archive_page194.json
- **OK** docId=806458995 post=2021-11-15T11:47:06.101 status=200 bytes=5423 file=`np6-905-cd__inst2_20211115_806458995_SPPHLZNP6905_20211115_1145_csv.zip` sha256=`17df952d48bb193e8e29a396330463c76bf122b39c105c326f70e4b1a0d6ef85` src=np6-905-cd_archive_page171.json
- **OK** docId=1019888348 post=2024-07-15T11:47:01.000 status=200 bytes=6593 file=`np6-905-cd__inst3_20240715_1019888348_SPPHLZNP6905_20240715_1145_csv.zip` sha256=`a4af226b3e5b3d24b19a651cb375ac95e74afc606f21f781308c4731867d672e` src=np6-905-cd_archive_page77.json
- **OK** docId=1052807283 post=2024-11-15T23:47:01.000 status=200 bytes=6979 file=`np6-905-cd__inst4_20241115_1052807283_SPPHLZNP6905_20241115_2345_csv.zip` sha256=`ee952aefb48713cd3d2c88386803026f6b3fa22d34b69e087406845335ca00c7` src=np6-905-cd_archive_page65.json
- **OK** docId=1069383183 post=2025-01-15T11:47:01.000 status=200 bytes=6750 file=`np6-905-cd__inst5_20250115_1069383183_SPPHLZNP6905_20250115_1145_csv.zip` sha256=`197067b8e8de65e17aba9c25a3dd3f20cfa7eab99cdaa19ae6f244fd2d5d695b` src=np6-905-cd_archive_page60.json
- **OK** docId=1094508425 post=2025-04-15T11:47:01.000 status=200 bytes=7496 file=`np6-905-cd__inst6_20250415_1094508425_SPPHLZNP6905_20250415_1145_csv.zip` sha256=`fee3fc3429c22593b8b6cb4ecf39fd3605e849a86c0722c7f4408ec80016888d` src=np6-905-cd_archive_page51.json
- **OK** docId=792287108 post=2021-08-28T11:47:05.341 status=200 bytes=5367 file=`np6-905-cd__inst7_20210828_792287108_SPPHLZNP6905_20210828_1145_csv.zip` sha256=`7a84a44d4ce07cfadb50c596123d61b5f1b57f0403eb8feb62c44c58e707449e` src=np6-905-cd_archive_page178_reused_for_batch10.json
- **OK** docId=830179341 post=2022-03-25T11:47:06.851 status=200 bytes=4264 file=`np6-905-cd__inst8_20220325_830179341_SPPHLZNP6905_20220325_1145_csv.zip` sha256=`8e964998a313832c9cb3042d3bbab087fa5ab135f1cbfe5728c46fc89617fbb7` src=np6-905-cd_archive_page158_reused_for_batch10.json
- **OK** docId=831479095 post=2022-04-01T11:47:05.271 status=200 bytes=5716 file=`np6-905-cd__inst9_20220401_831479095_SPPHLZNP6905_20220401_1145_csv.zip` sha256=`2fd1002cd5120e923227db7a6981934156339ef62e77bb6d8e4948030f7d3e0f` src=np6-905-cd_archive_page158_reused_for_batch10.json
- **OK** docId=867041131 post=2022-09-28T11:47:05.742 status=200 bytes=5662 file=`np6-905-cd__inst10_20220928_867041131_SPPHLZNP6905_20220928_1145_csv.zip` sha256=`97cc85669e547a0b6db944f0ade4bead8e2cf87b7b745a15724b8967ed3f02ca` src=np6-905-cd_archive_page140_reused_for_batch10.json
- **OK** docId=984437037 post=2024-02-28T20:32:07.000 status=200 bytes=6917 file=`np6-905-cd__inst11_20240228_984437037_SPPHLZNP6905_20240228_2030_csv.zip` sha256=`ecef29b74f4434f60af6652f07e0f2548e642a429235c4d2ff8ada2e81b788c5` src=np6-905-cd_archive_page90_reused_for_batch10.json
- **OK** docId=1040595008 post=2024-10-01T11:47:01.000 status=200 bytes=6959 file=`np6-905-cd__inst12_20241001_1040595008_SPPHLZNP6905_20241001_1145_csv.zip` sha256=`ea9b24c397842c2695374e33bb647ccf45c5c29aa272ee071cc3f3b06bd740ad` src=np6-905-cd_archive_page70_reused_for_batch10.json
- **OK** docId=763404983 post=2021-03-15T12:02:05.101 status=200 bytes=3963 file=`np6-905-cd__inst13_20210315_763404983_SPPHLZNP6905_20210315_1200_csv.zip` sha256=`a316e7bf6e113bcc784bc120242e11ad8d04e3794d413929e9404c7fe6c91b2b` src=np6-905-cd_archive_page194.json
- **OK** docId=806460742 post=2021-11-15T12:02:05.711 status=200 bytes=5439 file=`np6-905-cd__inst14_20211115_806460742_SPPHLZNP6905_20211115_1200_csv.zip` sha256=`44c099778e0d73db3a677d84df89ebb8a0bcf90d1c11add7ee0b2ae47e2c1a0f` src=np6-905-cd_archive_page171.json
- **OK** docId=1019891638 post=2024-07-15T12:02:01.000 status=200 bytes=6373 file=`np6-905-cd__inst15_20240715_1019891638_SPPHLZNP6905_20240715_1200_csv.zip` sha256=`8d547c7ba5b29f8a43f0b1bc6c49ac0f92acfeb44c976f5c88f392d720bf01a4` src=np6-905-cd_archive_page77.json
- **OK** docId=1052784376 post=2024-11-15T21:32:01.000 status=200 bytes=7078 file=`np6-905-cd__inst16_20241115_1052784376_SPPHLZNP6905_20241115_2130_csv.zip` sha256=`6a6e610e37c3fec9fd847209d791f47c28d30ac69770a353c016be9be04b779b` src=np6-905-cd_archive_page65.json

## New NP6 archive listing pages (not in batch2–9; pages target EMPTY densify months)
- page=194 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2021-03-13T02:32:06.082 newest=2021-03-23T13:17:06.301 file=`np6-905-cd_archive_page194.json` sha256=`0667d964a7f6c6c9daf6aa2c13f8d8a49abd916ec2d7cf2b08afedbb5d8896ce`
- page=171 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2021-11-07T16:02:10.145 newest=2021-11-18T01:47:05.690 file=`np6-905-cd_archive_page171.json` sha256=`d86d477786ab789ab554478b2986b93af6d9e6ad0e1a7e3220770f6b46a503bf`
- page=77 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2024-07-13T20:32:01.000 newest=2024-07-24T06:17:01.000 file=`np6-905-cd_archive_page77.json` sha256=`c4542772d2417d833b660780235f6d92efb53035144dc22ea1812a79bddbc290`
- page=65 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2024-11-15T19:32:01.000 newest=2024-11-26T05:17:01.000 file=`np6-905-cd_archive_page65.json` sha256=`3acce119431ed3547a5601194a94a383adf352d37152877e4dc5885877759ea6`
- page=60 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2025-01-06T21:32:01.000 newest=2025-01-17T07:17:01.000 file=`np6-905-cd_archive_page60.json` sha256=`8fae02d68d49bf2bfe3b6e82e6c51fef5d6d6edb697fac58cca22e7b4e2d3ec6`
- page=51 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2025-04-10T16:32:01.000 newest=2025-04-21T02:17:01.000 file=`np6-905-cd_archive_page51.json` sha256=`bc563ebd52e907b7df981f7835cb10feef4b3cae35c173b49ba8419f79135a7d`

## Target civil-day archive hits (EMPTY-month densify)
- **HIT** product=np4 gate_civil_day=2021-11-15 post=2021-11-15 docId=806478424
- **HIT** product=np4 gate_civil_day=2024-07-15 post=2024-07-14 docId=1019633370
- **HIT** product=np6 gate_civil_day=2021-03-15 post=2021-03-15 docId=763403133
- **HIT** product=np6 gate_civil_day=2021-11-15 post=2021-11-15 docId=806458995
- **HIT** product=np6 gate_civil_day=2024-07-15 post=2024-07-15 docId=1019888348
- **HIT** product=np6 gate_civil_day=2024-11-15 post=2024-11-15 docId=1052807283
- **HIT** product=np6 gate_civil_day=2025-01-15 post=2025-01-15 docId=1069383183
- **HIT** product=np6 gate_civil_day=2025-04-15 post=2025-04-15 docId=1094508425
- **HIT** product=np6 gate_civil_day=2021-08-28 post=2021-08-28 docId=792287108
- **HIT** product=np6 gate_civil_day=2022-03-25 post=2022-03-25 docId=830179341
- **HIT** product=np6 gate_civil_day=2022-04-01 post=2022-04-01 docId=831479095
- **HIT** product=np6 gate_civil_day=2022-09-28 post=2022-09-28 docId=867041131
- **HIT** product=np6 gate_civil_day=2024-02-28 post=2024-02-28 docId=984437037
- **HIT** product=np6 gate_civil_day=2024-10-01 post=2024-10-01 docId=1040595008
- **HIT** product=np6 gate_civil_day=2021-03-15 post=2021-03-15 docId=763404983
- **HIT** product=np6 gate_civil_day=2021-11-15 post=2021-11-15 docId=806460742
- **HIT** product=np6 gate_civil_day=2024-07-15 post=2024-07-15 docId=1019891638
- **HIT** product=np6 gate_civil_day=2024-11-15 post=2024-11-15 docId=1052784376

## GATEs / empty / absent
- **ABSENT** NP4-180-ER  — No invented path; leave GATE (same as batch2–9 Option-2 scope).
- **ABSENT** NP6-785-ER  — No invented path; leave GATE (same as batch2–9 Option-2 scope).
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices 2021-03-15 — live artifact From/To returned 0 rows; use archive
- **EMPTY** np6-905-cd-spp_node_zone_hub 2021-03-15 — live artifact From/To returned 0 rows; use archive

## Blocks / notes
- none observed
- note: NP4 gap picks: [(789966340, '2021-08-15'), (806478424, '2021-11-15'), (828352459, '2022-03-15'), (834093772, '2022-04-15'), (864597486, '2022-09-16'), (789622913, '2021-08-13'), (806112432, '2021-11-13'), (827982088, '2022-03-13'), (833716387, '2022-04-13'), (863987055, '2022-09-13'), (981119077, '2024-02-15'), (1019633370, '2024-07-14')]
- note: NP6 EMPTY-month priority picks so far: [(763403133, '2021-03-15', 'SPPHLZNP6905_20210315_1145_csv'), (806458995, '2021-11-15', 'SPPHLZNP6905_20211115_1145_csv'), (1019888348, '2024-07-15', 'SPPHLZNP6905_20240715_1145_csv'), (1052807283, '2024-11-15', 'SPPHLZNP6905_20241115_2345_csv'), (1069383183, '2025-01-15', 'SPPHLZNP6905_20250115_1145_csv'), (1094508425, '2025-04-15', 'SPPHLZNP6905_20250415_1145_csv')]
- note: NP6 gap picks: [(763403133, '2021-03-15', 'SPPHLZNP6905_20210315_1145_csv'), (806458995, '2021-11-15', 'SPPHLZNP6905_20211115_1145_csv'), (1019888348, '2024-07-15', 'SPPHLZNP6905_20240715_1145_csv'), (1052807283, '2024-11-15', 'SPPHLZNP6905_20241115_2345_csv'), (1069383183, '2025-01-15', 'SPPHLZNP6905_20250115_1145_csv'), (1094508425, '2025-04-15', 'SPPHLZNP6905_20250415_1145_csv'), (792287108, '2021-08-28', 'SPPHLZNP6905_20210828_1145_csv'), (830179341, '2022-03-25', 'SPPHLZNP6905_20220325_1145_csv'), (831479095, '2022-04-01', 'SPPHLZNP6905_20220401_1145_csv'), (867041131, '2022-09-28', 'SPPHLZNP6905_20220928_1145_csv'), (984437037, '2024-02-28', 'SPPHLZNP6905_20240228_2030_csv'), (1040595008, '2024-10-01', 'SPPHLZNP6905_20241001_1145_csv'), (763404983, '2021-03-15', 'SPPHLZNP6905_20210315_1200_csv'), (806460742, '2021-11-15', 'SPPHLZNP6905_20211115_1200_csv'), (1019891638, '2024-07-15', 'SPPHLZNP6905_20240715_1200_csv'), (1052784376, '2024-11-15', 'SPPHLZNP6905_20241115_2130_csv')]
- note: NP6 densify months in picks: ['2021-03', '2021-08', '2021-11', '2022-03', '2022-04', '2022-09', '2024-02', '2024-07', '2024-10', '2024-11', '2025-01', '2025-04']

## Leak-check
- No subscription keys, passwords, usernames, or bearer tokens intentionally written.
- Private token JSON deleted after run.
- Leak-check: PASS (no credential/token substrings in READY/meta/json text outputs).

