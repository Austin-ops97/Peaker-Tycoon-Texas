# ERCOT batch11 READY — Option-2 densify EMPTY months (NP4/NP6)

- Timestamp (America/Chicago): 2026-09-25 06:33:51 CT
- Token HTTP status: 200
- Bearer: id_token when present (True)
- GET count: 49 (budget ≤90)
- Rate: MIN_INTERVAL=2.2s; backoff on 429
- Secrets source (path only): `/home/box/agent-data/box-secrets.json`
- Card key names used: ERCOT_SUBSCRIPTION_KEY, ERCOT_USERNAME, ERCOT_PASSWORD
- HTTP status tally 401/403/429: {'401': 0, '403': 0, '429': 0}

## DeliveryDate syntax (confirmed from batch2)
- Working: `from_to` → `deliveryDateFrom={date}&deliveryDateTo={date}`
- Note: Confirmed in batch2; bare deliveryDate=400. Reused without rediscovery.
- Bare `deliveryDate=` → 400 (do not use).

## Artifact From/To sample days (new vs batch2–10; optional EMPTY probe)
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-12-15 page=1 status=200 rows=1000 totalRecords=22800 bytes=49413 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-12-15__page1.json` sha256=`fb2c43016871e25d960133cb15e9824f5c4807947df3a3fe55719a08a621d9b4` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-12-15 page=2 status=200 rows=1000 totalRecords=22800 bytes=49390 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-12-15__page2.json` sha256=`f4b651a2f5938b9533e97a539386a9357da91f10c6bf33ecaa720dc09e9b80e1` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-12-15 page=3 status=200 rows=1000 totalRecords=22800 bytes=49359 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-12-15__page3.json` sha256=`b95b429379a2d7cfd0d118eaab52440117b7679095f0e9befb6a25601a2638f6` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-09-15 page=1 status=200 rows=1000 totalRecords=25128 bytes=49403 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-09-15__page1.json` sha256=`47e8e784db7d30123c625d3b93ee1c452532070c6c7aaddd50d154bf9bc61c8d` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-09-15 page=2 status=200 rows=1000 totalRecords=25128 bytes=49365 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-09-15__page2.json` sha256=`a1ae0076601d630dc17ef557900fa9a251f9d2cd89e8c80eb482236a01538a48` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-09-15 page=3 status=200 rows=1000 totalRecords=25128 bytes=49358 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-09-15__page3.json` sha256=`f1becc3f7daed53d8dccb3aa845a156207af06c1413838e1855c676be02c55da` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-12-15 page=1 status=200 rows=1000 totalRecords=92352 bytes=51518 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-12-15__page1.json` sha256=`eba3eaa3ccec82cbd5a7c13b1da83569db3fbbf1d7367dc78f16987a54aba337` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-12-15 page=2 status=200 rows=1000 totalRecords=92352 bytes=51493 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-12-15__page2.json` sha256=`d65f8cdbb70da1492284832bf6af18ccdf33fd33ed436cf9d120e0e91abb88ec` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-12-15 page=3 status=200 rows=1000 totalRecords=92352 bytes=51518 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-12-15__page3.json` sha256=`dc532544d05c2292492b878478ca8ddec442073bf2fc7e76a202b1a134e977bb` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-09-15 page=1 status=200 rows=1000 totalRecords=101664 bytes=51502 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-09-15__page1.json` sha256=`4981915cd05278edb96318e1e222942d165f9d6cab9ca17f250e0761dfce031d` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-09-15 page=2 status=200 rows=1000 totalRecords=101664 bytes=51501 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-09-15__page2.json` sha256=`78e7c5d454302cdd5c5db0347623192c81762e8d34935a47a022547af400db6f` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-09-15 page=3 status=200 rows=1000 totalRecords=101664 bytes=50629 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-09-15__page3.json` sha256=`e874c6a0aaf005c24eca0ed5f5165a1a24bd4b2a42a0328c6d2c222626fff5a3` note=rows

## NP4 archive downloads (listings reused; new docIds; EMPTY GATE near-days + densify)
- Reused listing page=1 `np4-190-cd_archive_page1.json` → `np4-190-cd_archive_page1_reused_from_batch10.json` sha256=`7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344` (copied from batch10; no GET)
- Reused listing page=2 `np4-190-cd_archive_page2.json` → `np4-190-cd_archive_page2_reused_from_batch10.json` sha256=`a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908` (copied from batch10; no GET)
- **OK** docId=1060876405 post=2024-12-15T12:32:03.000 status=200 bytes=152838 file=`np4-190-cd__inst1_20241215_1060876405_DAMSPNP4190_csv.zip` sha256=`9629e5ab9fe35605bf5c567dbd74a4e5ad76a9be15eaf35cb15bbb3ae285f6ba` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1103146021 post=2025-05-15T12:32:50.000 status=200 bytes=168069 file=`np4-190-cd__inst2_20250515_1103146021_DAMSPNP4190_csv.zip` sha256=`261e85145a9ff4b212ad7c583e6dafe6b477a4a0f83abd7738764b9b7070025e` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1112207202 post=2025-06-15T12:32:17.000 status=200 bytes=159748 file=`np4-190-cd__inst3_20250615_1112207202_DAMSPNP4190_csv.zip` sha256=`aa1bcfaa127923bda48549e3b7319b883805887801314655ca51b28813266f7c` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1121114317 post=2025-07-15T12:40:24.000 status=200 bytes=168582 file=`np4-190-cd__inst4_20250715_1121114317_DAMSPNP4190_csv.zip` sha256=`9a607fa57a692dc8e3c7d16743d407b5a2ca39af4b1f47928985649c69894f80` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1140481884 post=2025-09-14T12:32:06.000 status=200 bytes=165102 file=`np4-190-cd__inst5_20250914_1140481884_DAMSPNP4190_csv.zip` sha256=`ae8dc4672320ee1e4d40426c3fd933b16b6baa67fa0e3530709ba1d8c29516ca` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1150803180 post=2025-10-15T12:39:46.000 status=200 bytes=171429 file=`np4-190-cd__inst6_20251015_1150803180_DAMSPNP4190_csv.zip` sha256=`ef0d426d0b46f9f2a5489ca89daf32d8c7da78dd6a1b9db61de24ea9027ef5bd` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1160958466 post=2025-11-15T12:41:59.000 status=200 bytes=171427 file=`np4-190-cd__inst7_20251115_1160958466_DAMSPNP4190_csv.zip` sha256=`1e5a271d57cec664b7781566f7bd71a376cf9384fedb5fe38b689a75d0d55717` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1060344099 post=2024-12-13T12:32:30.000 status=200 bytes=152688 file=`np4-190-cd__inst8_20241213_1060344099_DAMSPNP4190_csv.zip` sha256=`f3fb843ee9c1e0cc27b0988a9ce2e3cd65c586f7bdc5d574996ef71416a0c9b6` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1102560327 post=2025-05-13T12:56:10.000 status=200 bytes=170204 file=`np4-190-cd__inst9_20250513_1102560327_DAMSPNP4190_csv.zip` sha256=`d82984f9b7c2a02dbe8771086b4923f1623096edb623f92bbbc2268bc7638e5c` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1111639570 post=2025-06-13T12:32:18.000 status=200 bytes=162891 file=`np4-190-cd__inst10_20250613_1111639570_DAMSPNP4190_csv.zip` sha256=`33784ebcc8aba0d8787011e1c00fb40599a810af40423a773db4df2cf30ef21a` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1120499290 post=2025-07-13T12:32:15.000 status=200 bytes=170425 file=`np4-190-cd__inst11_20250713_1120499290_DAMSPNP4190_csv.zip` sha256=`a76bac342c5ccba14d464dba99ebb1123db914abf0944b4c6af6e3f36de867a0` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1140156593 post=2025-09-13T12:32:20.000 status=200 bytes=164945 file=`np4-190-cd__inst12_20250913_1140156593_DAMSPNP4190_csv.zip` sha256=`b7a00743085fc6491535dfa643d25368d3ac45ff5f1595950590293361e0e3df` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1150134105 post=2025-10-13T12:33:05.000 status=200 bytes=171406 file=`np4-190-cd__inst13_20251013_1150134105_DAMSPNP4190_csv.zip` sha256=`e1983ba00ba979ab06e6dbc7ad6d61da0c864ce01a427c363e66d81a36dd0ce4` src=np4-190-cd_archive_page1_reused_from_batch10.json
- **OK** docId=1160251447 post=2025-11-13T12:32:18.000 status=200 bytes=173799 file=`np4-190-cd__inst14_20251113_1160251447_DAMSPNP4190_csv.zip` sha256=`62696e8562fad7211093c3411a16f3d54bd75c97e8c47d3cbe45efed12a03585` src=np4-190-cd_archive_page1_reused_from_batch10.json

## NP6 archive downloads (reused + new listings; new docIds; EMPTY GATE days)
- Reused listing `np6-905-cd_archive_page65.json` → `np6-905-cd_archive_page65_reused_for_batch11.json` sha256=`3acce119431ed3547a5601194a94a383adf352d37152877e4dc5885877759ea6` (copied from batch10; no GET)
- Reused listing `np6-905-cd_archive_page51.json` → `np6-905-cd_archive_page51_reused_for_batch11.json` sha256=`bc563ebd52e907b7df981f7835cb10feef4b3cae35c173b49ba8419f79135a7d` (copied from batch10; no GET)
- Reused listing `np6-905-cd_archive_page60.json` → `np6-905-cd_archive_page60_reused_for_batch11.json` sha256=`8fae02d68d49bf2bfe3b6e82e6c51fef5d6d6edb697fac58cca22e7b4e2d3ec6` (copied from batch10; no GET)
- Reused listing `np6-905-cd_archive_page40.json` → `np6-905-cd_archive_page40_reused_for_batch11.json` sha256=`8f6c27ad5b16aeda56f482ff6fff4cbe68f56a600c460d7a947a91de34110135` (copied from batch9; no GET)
- **OK** docId=1061418502 post=2024-12-17T11:47:01.000 status=200 bytes=5274 file=`np6-905-cd__inst1_20241217_1061418502_SPPHLZNP6905_20241217_1145_csv.zip` sha256=`b30b8741faaa6c454081e0a40a96a7d1f1ef59ee102f50f6d399c6fcb12e3509` src=np6-905-cd_archive_page62.json
- **OK** docId=1103137699 post=2025-05-15T11:47:01.000 status=200 bytes=7734 file=`np6-905-cd__inst2_20250515_1103137699_SPPHLZNP6905_20250515_1145_csv.zip` sha256=`195177a6fabfc29f62cf3009e274f0c1380e5818c29236a18e3c464396389d39` src=np6-905-cd_archive_page48.json
- **OK** docId=1112199482 post=2025-06-15T11:47:01.000 status=200 bytes=7624 file=`np6-905-cd__inst3_20250615_1112199482_SPPHLZNP6905_20250615_1145_csv.zip` sha256=`f84d301c258483ef3f88bc1ccb22ebbfab254cec482c3b66923cd6cd862221a8` src=np6-905-cd_archive_page45.json
- **OK** docId=1121104301 post=2025-07-15T11:47:02.000 status=200 bytes=7507 file=`np6-905-cd__inst4_20250715_1121104301_SPPHLZNP6905_20250715_1145_csv.zip` sha256=`d85c4944b60d7e595062a1c31883abef21d27e90f1af60a6b27ed20a29790eb6` src=np6-905-cd_archive_page42.json
- **OK** docId=1140146883 post=2025-09-13T11:47:01.000 status=200 bytes=7729 file=`np6-905-cd__inst5_20250913_1140146883_SPPHLZNP6905_20250913_1145_csv.zip` sha256=`0cba2a1105c15a0cab91bd42ee67d551063ef70e0415b426b2bb123451ea178d` src=np6-905-cd_archive_page37.json
- **OK** docId=1150680441 post=2025-10-15T04:32:03.000 status=200 bytes=7576 file=`np6-905-cd__inst6_20251015_1150680441_SPPHLZNP6905_20251015_0430_csv.zip` sha256=`f981237a8041139a940afe1251fc0231c82acfff87028ad16125672d76f913eb` src=np6-905-cd_archive_page34.json
- **OK** docId=1150653966 post=2025-10-15T02:17:02.000 status=200 bytes=7666 file=`np6-905-cd__inst7_20251015_1150653966_SPPHLZNP6905_20251015_0215_csv.zip` sha256=`c5f8f391c32a9d74bea11373a2af111eaf61b19475671f7c000e30041f8b6f79` src=np6-905-cd_archive_page34.json
- **OK** docId=1160868375 post=2025-11-15T06:47:02.000 status=200 bytes=8382 file=`np6-905-cd__inst8_20251115_1160868375_SPPHLZNP6905_20251115_0645_csv.zip` sha256=`03e4a4f6c1fc29cc66f8f042f15000790b1c4f88b17c7cfdd6d255478df1f792` src=np6-905-cd_archive_page31.json
- **OK** docId=1055538591 post=2024-11-26T02:32:02.000 status=200 bytes=7313 file=`np6-905-cd__inst9_20241126_1055538591_SPPHLZNP6905_20241126_0230_csv.zip` sha256=`2330b49173b545ae29f590544d423abf0688506844da7f71c35f94c2973e922a` src=np6-905-cd_archive_page65_reused_for_batch11.json
- **OK** docId=1094511369 post=2025-04-15T12:02:01.000 status=200 bytes=7402 file=`np6-905-cd__inst10_20250415_1094511369_SPPHLZNP6905_20250415_1200_csv.zip` sha256=`2cda73d593f1e235a60584644a125f4752b8fccbb280fc76b1308f1f457356c4` src=np6-905-cd_archive_page51_reused_for_batch11.json
- **OK** docId=1069385896 post=2025-01-15T12:02:01.000 status=200 bytes=6610 file=`np6-905-cd__inst11_20250115_1069385896_SPPHLZNP6905_20250115_1200_csv.zip` sha256=`60e6bf5d280a2c7e7370667422204fdce3999890d2d8e2e522aeab04da13afab` src=np6-905-cd_archive_page60_reused_for_batch11.json
- **OK** docId=1129060942 post=2025-08-10T12:02:02.000 status=200 bytes=7513 file=`np6-905-cd__inst12_20250810_1129060942_SPPHLZNP6905_20250810_1200_csv.zip` sha256=`faa4d705ac34a297d67aa2d56cb370f303cfa090fae0ee904545e2d94f72a4f3` src=np6-905-cd_archive_page40_reused_for_batch11.json
- **OK** docId=1061432384 post=2024-12-17T12:47:01.000 status=200 bytes=6682 file=`np6-905-cd__inst13_20241217_1061432384_SPPHLZNP6905_20241217_1245_csv.zip` sha256=`31b1402070f4806d161ab3c9cbea8e9aa0125e6881bfd37626e345a130666b02` src=np6-905-cd_archive_page62.json
- **OK** docId=1103140502 post=2025-05-15T12:02:02.000 status=200 bytes=7804 file=`np6-905-cd__inst14_20250515_1103140502_SPPHLZNP6905_20250515_1200_csv.zip` sha256=`cb6f44e6937c1c12db79b8c9831599c3ab2647e2332411816e7ce1e0bc8d5373` src=np6-905-cd_archive_page48.json
- **OK** docId=1112202253 post=2025-06-15T12:02:01.000 status=200 bytes=7660 file=`np6-905-cd__inst15_20250615_1112202253_SPPHLZNP6905_20250615_1200_csv.zip` sha256=`a4fa9543e77b4cb94c34d22b8f9ea784056fb1828579a2d80b172968f8c24fc8` src=np6-905-cd_archive_page45.json
- **OK** docId=1121107288 post=2025-07-15T12:02:01.000 status=200 bytes=7590 file=`np6-905-cd__inst16_20250715_1121107288_SPPHLZNP6905_20250715_1200_csv.zip` sha256=`c9da6db911bf03fd2d9d3e4d250def713919d0b9a96a08f32b81638a68ba33e2` src=np6-905-cd_archive_page42.json

## New NP6 archive listing pages (not in batch2–10; pages target EMPTY densify months)
- page=62 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2024-12-17T01:47:01.000 newest=2024-12-27T11:32:01.000 file=`np6-905-cd_archive_page62.json` sha256=`08f9da9b3d5389205b8a381fcf0559a048bca590a467fb6f4ccf4e5bac903125`
- page=48 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2025-05-11T22:47:01.000 newest=2025-05-22T08:32:01.000 file=`np6-905-cd_archive_page48.json` sha256=`0fc8a72e4427983421c2f9cc64fb44513e9b8195c672f19dddb0e5625e6943e1`
- page=45 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2025-06-12T04:47:01.000 newest=2025-06-22T14:32:04.000 file=`np6-905-cd_archive_page45.json` sha256=`d0f07389986e2b8a1732be30a6ef400098bb26e137fc75c2426da718879b5136`
- page=42 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2025-07-13T10:47:01.000 newest=2025-07-23T20:32:01.000 file=`np6-905-cd_archive_page42.json` sha256=`91313b09aaa874f836456ee9c26b5d43c8719ec5c026e0f76b963e02e08824e8`
- page=37 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2025-09-03T12:47:01.000 newest=2025-09-13T22:32:02.000 file=`np6-905-cd_archive_page37.json` sha256=`d49e5f97c483d67575863a76225a074e65c4cc34c3dee12eb6d39f9674374012`
- page=34 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2025-10-04T18:47:01.000 newest=2025-10-15T04:32:03.000 file=`np6-905-cd_archive_page34.json` sha256=`f8fe67bfad287600b850ef32c9dad96ef2cfb0c924fb46441a1186a9a0ca6f05`
- page=31 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2025-11-04T23:47:01.000 newest=2025-11-15T09:32:01.000 file=`np6-905-cd_archive_page31.json` sha256=`e04c8caabd3f3cbd8f629acd51c88c9a5a116eab18c457dc64b1f308d7a45bce`

## Target civil-day archive hits (EMPTY-month densify)
- **HIT** product=np4 gate_civil_day=2024-12-15 post=2024-12-15 docId=1060876405
- **HIT** product=np4 gate_civil_day=2025-05-15 post=2025-05-15 docId=1103146021
- **HIT** product=np4 gate_civil_day=2025-06-15 post=2025-06-15 docId=1112207202
- **HIT** product=np4 gate_civil_day=2025-07-15 post=2025-07-15 docId=1121114317
- **HIT** product=np4 gate_civil_day=2025-09-15 post=2025-09-14 docId=1140481884
- **HIT** product=np4 gate_civil_day=2025-10-15 post=2025-10-15 docId=1150803180
- **HIT** product=np4 gate_civil_day=2025-11-15 post=2025-11-15 docId=1160958466
- **HIT** product=np6 gate_civil_day=2025-05-15 post=2025-05-15 docId=1103137699
- **HIT** product=np6 gate_civil_day=2025-06-15 post=2025-06-15 docId=1112199482
- **HIT** product=np6 gate_civil_day=2025-07-15 post=2025-07-15 docId=1121104301
- **HIT** product=np6 gate_civil_day=2025-10-15 post=2025-10-15 docId=1150680441
- **HIT** product=np6 gate_civil_day=2025-10-15 post=2025-10-15 docId=1150653966
- **HIT** product=np6 gate_civil_day=2025-11-15 post=2025-11-15 docId=1160868375
- **HIT** product=np6 gate_civil_day=2025-04-15 post=2025-04-15 docId=1094511369
- **HIT** product=np6 gate_civil_day=2025-01-15 post=2025-01-15 docId=1069385896
- **HIT** product=np6 gate_civil_day=2025-05-15 post=2025-05-15 docId=1103140502
- **HIT** product=np6 gate_civil_day=2025-06-15 post=2025-06-15 docId=1112202253
- **HIT** product=np6 gate_civil_day=2025-07-15 post=2025-07-15 docId=1121107288

## GATEs / empty / absent
- **ABSENT** NP4-180-ER  — No invented path; leave GATE (same as batch2–10 Option-2 scope).
- **ABSENT** NP6-785-ER  — No invented path; leave GATE (same as batch2–10 Option-2 scope).

## Blocks / notes
- none observed
- note: NP4 gap picks: [(1060876405, '2024-12-15'), (1103146021, '2025-05-15'), (1112207202, '2025-06-15'), (1121114317, '2025-07-15'), (1140481884, '2025-09-14'), (1150803180, '2025-10-15'), (1160958466, '2025-11-15'), (1060344099, '2024-12-13'), (1102560327, '2025-05-13'), (1111639570, '2025-06-13'), (1120499290, '2025-07-13'), (1140156593, '2025-09-13'), (1150134105, '2025-10-13'), (1160251447, '2025-11-13')]
- note: NP6 EMPTY-month priority picks so far: [(1061418502, '2024-12-17', 'SPPHLZNP6905_20241217_1145_csv'), (1103137699, '2025-05-15', 'SPPHLZNP6905_20250515_1145_csv'), (1112199482, '2025-06-15', 'SPPHLZNP6905_20250615_1145_csv'), (1121104301, '2025-07-15', 'SPPHLZNP6905_20250715_1145_csv'), (1140146883, '2025-09-13', 'SPPHLZNP6905_20250913_1145_csv'), (1150680441, '2025-10-15', 'SPPHLZNP6905_20251015_0430_csv'), (1150653966, '2025-10-15', 'SPPHLZNP6905_20251015_0215_csv'), (1160868375, '2025-11-15', 'SPPHLZNP6905_20251115_0645_csv')]
- note: NP6 gap picks: [(1061418502, '2024-12-17', 'SPPHLZNP6905_20241217_1145_csv'), (1103137699, '2025-05-15', 'SPPHLZNP6905_20250515_1145_csv'), (1112199482, '2025-06-15', 'SPPHLZNP6905_20250615_1145_csv'), (1121104301, '2025-07-15', 'SPPHLZNP6905_20250715_1145_csv'), (1140146883, '2025-09-13', 'SPPHLZNP6905_20250913_1145_csv'), (1150680441, '2025-10-15', 'SPPHLZNP6905_20251015_0430_csv'), (1150653966, '2025-10-15', 'SPPHLZNP6905_20251015_0215_csv'), (1160868375, '2025-11-15', 'SPPHLZNP6905_20251115_0645_csv'), (1055538591, '2024-11-26', 'SPPHLZNP6905_20241126_0230_csv'), (1094511369, '2025-04-15', 'SPPHLZNP6905_20250415_1200_csv'), (1069385896, '2025-01-15', 'SPPHLZNP6905_20250115_1200_csv'), (1129060942, '2025-08-10', 'SPPHLZNP6905_20250810_1200_csv'), (1061432384, '2024-12-17', 'SPPHLZNP6905_20241217_1245_csv'), (1103140502, '2025-05-15', 'SPPHLZNP6905_20250515_1200_csv'), (1112202253, '2025-06-15', 'SPPHLZNP6905_20250615_1200_csv'), (1121107288, '2025-07-15', 'SPPHLZNP6905_20250715_1200_csv')]
- note: NP6 densify months in picks: ['2024-11', '2024-12', '2025-01', '2025-04', '2025-05', '2025-06', '2025-07', '2025-08', '2025-09', '2025-10', '2025-11']

## Leak-check
- No subscription keys, passwords, usernames, or bearer tokens intentionally written.
- Private token JSON deleted after run.
- Leak-check: PASS (no credential/token substrings in READY/meta/json text outputs).

