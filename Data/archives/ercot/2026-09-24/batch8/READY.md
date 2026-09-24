# ERCOT batch8 READY — 2023-10-15 NP6 priority + sparse densify

- Timestamp (America/Chicago): 2026-09-24 15:11:01 CT
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

## Artifact From/To sample days (new vs batch2–7; optional EMPTY probe)
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-04-15 page=1 status=200 rows=1000 totalRecords=21600 bytes=48640 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-04-15__page1.json` sha256=`ec47b5d9cbbc1edb56ea7480a99d05bb647c75997dc6ebf613ffd938201efe95` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-04-15 page=2 status=200 rows=1000 totalRecords=21600 bytes=48466 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-04-15__page2.json` sha256=`e4f9b5cdb66a1ad7d5968127fd07537aa70ed7d502450b43f40512d1dc5fcfb2` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-04-15 page=3 status=200 rows=1000 totalRecords=21600 bytes=48426 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-04-15__page3.json` sha256=`bb3510b9f4e3f02f8694ac45833ed4a6a2e62384c02d0c0ce8f3612688b15e0a` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-05-15 page=1 status=200 rows=1000 totalRecords=24072 bytes=49339 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-05-15__page1.json` sha256=`597e16d0915ecd2607cf7d320ff3bcdbd2dccb37cbaaaa5faf66a56b24f09d6e` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-05-15 page=2 status=200 rows=1000 totalRecords=24072 bytes=49365 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-05-15__page2.json` sha256=`9bdd79b5c3298a63577ea0b98fa3dae7f0fab37e26235f4c4b3c10bc67619fbd` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-05-15 page=3 status=200 rows=1000 totalRecords=24072 bytes=49380 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-05-15__page3.json` sha256=`c866a48afb706642aaa0848798f985b8f5cef85fb511e6b66069a4c1b45bbd75` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-04-15 page=1 status=200 rows=1000 totalRecords=87552 bytes=50716 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-04-15__page1.json` sha256=`9ddb3512673dbdbce7854e48c56d9f5f5ac300e5b01bf055b06eb1f82f8b3d7d` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-04-15 page=2 status=200 rows=1000 totalRecords=87552 bytes=50719 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-04-15__page2.json` sha256=`8504b70c7ca3d2afd6a289352182e4af5eae21490b3b5d72219b16b4fdbdce28` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-04-15 page=3 status=200 rows=1000 totalRecords=87552 bytes=50717 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-04-15__page3.json` sha256=`423dd557f4ece234d1283fd6faba480a6b4b689dc5b22377221d9410acb4423a` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-05-15 page=1 status=200 rows=1000 totalRecords=97440 bytes=51526 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-05-15__page1.json` sha256=`83084a5adf4ebe92be14110773d193d6707e524359849f70feb8ea8fe7ed813a` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-05-15 page=2 status=200 rows=1000 totalRecords=97440 bytes=51530 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-05-15__page2.json` sha256=`de1e2125ecc4cf04ea34f30286e8b59d0ee63e7e7d09b6b209a180f8d779f48c` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-05-15 page=3 status=200 rows=1000 totalRecords=97440 bytes=51564 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-05-15__page3.json` sha256=`19e43375c2c3a342a0ae37b596c81ad73a58c59e372c5d8aa9a470f9319970fb` note=rows

## NP4 archive downloads (listings reused; new docIds; EMPTY GATE near-days + densify)
- Reused listing page=1 `np4-190-cd_archive_page1.json` → `np4-190-cd_archive_page1_reused_from_batch7.json` sha256=`7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344` (copied from batch7; no GET)
- Reused listing page=2 `np4-190-cd_archive_page2.json` → `np4-190-cd_archive_page2_reused_from_batch7.json` sha256=`a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908` (copied from batch7; no GET)
- **OK** docId=845722536 post=2022-06-14T12:34:06.000 status=200 bytes=96571 file=`np4-190-cd__inst1_20220614_845722536_DAMSPNP4190_csv.zip` sha256=`45a4809dedf43734c406bc80ef40f95a3ad73caea87e82b9cf59accc545b9ae3` src=np4-190-cd_archive_page2_reused_from_batch7.json
- **OK** docId=922440865 post=2023-06-14T12:35:12.902 status=200 bytes=98008 file=`np4-190-cd__inst2_20230614_922440865_DAMSPNP4190_csv.zip` sha256=`2e171db2069e9cb11030efe49c58387e3fbbcb86dde19a41e88c373f757a1b05` src=np4-190-cd_archive_page2_reused_from_batch7.json
- **OK** docId=845515713 post=2022-06-13T12:33:59.000 status=200 bytes=96084 file=`np4-190-cd__inst3_20220613_845515713_DAMSPNP4190_csv.zip` sha256=`e27b50d03510e4ce2eab417ee6a2616b69cf52b5b81a8ebaed5ea02e8d2c2fe4` src=np4-190-cd_archive_page2_reused_from_batch7.json
- **OK** docId=922210881 post=2023-06-13T12:35:44.331 status=200 bytes=99711 file=`np4-190-cd__inst4_20230613_922210881_DAMSPNP4190_csv.zip` sha256=`21b9a4601a10209582e6e816e6e4e9b6ee0b48b6262600414f7c64c90dd62ed3` src=np4-190-cd_archive_page2_reused_from_batch7.json
- **OK** docId=995993477 post=2024-04-14T12:40:01.000 status=200 bytes=143062 file=`np4-190-cd__inst5_20240414_995993477_DAMSPNP4190_csv.zip` sha256=`c86f87289002d582663b107eed2c902abbb3f4f6c28d7fe0e7becb6994b9e898` src=np4-190-cd_archive_page1_reused_from_batch7.json
- **OK** docId=1036020038 post=2024-09-14T12:31:58.000 status=200 bytes=139841 file=`np4-190-cd__inst6_20240914_1036020038_DAMSPNP4190_csv.zip` sha256=`690aadd1019eaca3794cb878f8986ed7fecbccde4fd8d3d64818d9b65a7e835e` src=np4-190-cd_archive_page1_reused_from_batch7.json
- **OK** docId=1060611912 post=2024-12-14T12:32:08.000 status=200 bytes=152076 file=`np4-190-cd__inst7_20241214_1060611912_DAMSPNP4190_csv.zip` sha256=`487f4ebb0a36bd87dc0b1394a6822d41916ac824638522aa793e9976e0e0afc4` src=np4-190-cd_archive_page1_reused_from_batch7.json
- **OK** docId=1077745007 post=2025-02-14T12:32:07.000 status=200 bytes=154851 file=`np4-190-cd__inst8_20250214_1077745007_DAMSPNP4190_csv.zip` sha256=`e92c966469ad37ab26e634b872a2329db03fce1aa690b10159cc75b110be2e1d` src=np4-190-cd_archive_page1_reused_from_batch7.json
- **OK** docId=1102852065 post=2025-05-14T12:36:08.000 status=200 bytes=169922 file=`np4-190-cd__inst9_20250514_1102852065_DAMSPNP4190_csv.zip` sha256=`de6b6442e71842b4dafd4f9f324ceb1a6f081a82de677749cdae7306fafb4e21` src=np4-190-cd_archive_page1_reused_from_batch7.json
- **OK** docId=1003768678 post=2024-05-14T12:32:44.000 status=200 bytes=147464 file=`np4-190-cd__inst10_20240514_1003768678_DAMSPNP4190_csv.zip` sha256=`6e8c35a01580a1a8bcd74772796b4533a17599bd6fece8b2d3a5e62326ef5d9a` src=np4-190-cd_archive_page1_reused_from_batch7.json
- **OK** docId=1044071870 post=2024-10-14T12:35:21.000 status=200 bytes=150946 file=`np4-190-cd__inst11_20241014_1044071870_DAMSPNP4190_csv.zip` sha256=`55f3d366f8f44e0aae309f21101f9e280abe5e9df15f7a01e199b84c283611fe` src=np4-190-cd_archive_page1_reused_from_batch7.json
- **OK** docId=1069109760 post=2025-01-14T12:32:08.000 status=200 bytes=158588 file=`np4-190-cd__inst12_20250114_1069109760_DAMSPNP4190_csv.zip` sha256=`71c7e1eac8f4957afba1b4cc86e49e5fddab8c4997750de989c435546760d3ab` src=np4-190-cd_archive_page1_reused_from_batch7.json

## NP6 archive downloads (reused + new listings; new docIds; EMPTY GATE days)
- Reused listing `np6-905-cd_archive_page105.json` → `np6-905-cd_archive_page105_reused_for_batch8.json` sha256=`fe21a49c87475edf927a71a861abf3c632235759133a9cc4d6d4af4e9fc57216` (copied from batch6; no GET)
- **OK** docId=951298480 post=2023-10-16T11:47:06.268 status=200 bytes=5152 file=`np6-905-cd__inst1_20231016_951298480_SPPHLZNP6905_20231016_1145_csv.zip` sha256=`e854f8afe1ecbb54dfb689eb60c3667fe128c51de384b65c8b8b811b87606757` src=np6-905-cd_archive_page103.json
- **OK** docId=951300953 post=2023-10-16T12:02:08.723 status=200 bytes=5341 file=`np6-905-cd__inst2_20231016_951300953_SPPHLZNP6905_20231016_1200_csv.zip` sha256=`13c9a35daa9e10b70859d7e2e34a0363fe4a85162fb2177591f10803b662af63` src=np6-905-cd_archive_page103.json
- **OK** docId=951347463 post=2023-10-16T16:47:06.911 status=200 bytes=5146 file=`np6-905-cd__inst3_20231016_951347463_SPPHLZNP6905_20231016_1645_csv.zip` sha256=`052b26e527b284c20e13c5f51056fb47d1b3f5c6f4d7af25812fd994a2aed972` src=np6-905-cd_archive_page103.json
- **OK** docId=951412251 post=2023-10-16T23:47:07.285 status=200 bytes=6044 file=`np6-905-cd__inst4_20231016_951412251_SPPHLZNP6905_20231016_2345_csv.zip` sha256=`1ae12f72703aff97638cc8ff994f95677248ac654b395646c4d1ef1d4a6c4266` src=np6-905-cd_archive_page103.json
- **OK** docId=951410364 post=2023-10-16T23:32:06.347 status=200 bytes=6149 file=`np6-905-cd__inst5_20231016_951410364_SPPHLZNP6905_20231016_2330_csv.zip` sha256=`53614216e4fed81c50a6a7bfb431a03b1b086261d3de4a3ae4ed89f29b52bad9` src=np6-905-cd_archive_page103.json
- **OK** docId=951343893 post=2023-10-16T16:32:06.575 status=200 bytes=5296 file=`np6-905-cd__inst6_20231016_951343893_SPPHLZNP6905_20231016_1630_csv.zip` sha256=`852983df7f167a8e91ce3fe74461ec411c4ead0a303a46aacb219b0b2d0b97e2` src=np6-905-cd_archive_page103.json
- **OK** docId=951271256 post=2023-10-16T09:32:05.782 status=200 bytes=5507 file=`np6-905-cd__inst7_20231016_951271256_SPPHLZNP6905_20231016_0930_csv.zip` sha256=`dba8194126b05ea72047dba23602f4005d50fb52ba694b79b00ffa22eb47f4be` src=np6-905-cd_archive_page103.json
- **OK** docId=948745148 post=2023-10-05T11:47:07.241 status=200 bytes=4785 file=`np6-905-cd__inst8_20231005_948745148_SPPHLZNP6905_20231005_1145_csv.zip` sha256=`f9664345429bc197d0f039a19a432e335a3d57321537d8c586c0eaf153d47e11` src=np6-905-cd_archive_page105_reused_for_batch8.json
- **OK** docId=948509536 post=2023-10-04T11:47:06.538 status=200 bytes=5875 file=`np6-905-cd__inst9_20231004_948509536_SPPHLZNP6905_20231004_1145_csv.zip` sha256=`7df7c1f024786d7ccd9cd6acd8545dfed076b05dfef159269f5fa6ae2237c647` src=np6-905-cd_archive_page105_reused_for_batch8.json
- **OK** docId=957482934 post=2023-11-11T11:47:12.138 status=200 bytes=6156 file=`np6-905-cd__inst10_20231111_957482934_SPPHLZNP6905_20231111_1145_csv.zip` sha256=`892a1ed7655a8f7873d516f699bc98e6d8104da4a63f6c5edf6e55afd267fd3a` src=np6-905-cd_archive_page101.json
- **OK** docId=954382592 post=2023-10-29T11:47:05.931 status=200 bytes=6316 file=`np6-905-cd__inst11_20231029_954382592_SPPHLZNP6905_20231029_1145_csv.zip` sha256=`bb23c4c04d8114e72c2eae97847d17c2157d648ccfebaa54d85415d189faead0` src=np6-905-cd_archive_page102.json
- **OK** docId=951349800 post=2023-10-16T17:02:08.629 status=200 bytes=4785 file=`np6-905-cd__inst12_20231016_951349800_SPPHLZNP6905_20231016_1700_csv.zip` sha256=`ee071eac1a5367a795252fccf1b2f3f46f72a5911b1836279719082bb076a31f` src=np6-905-cd_archive_page103.json
- **OK** docId=951063935 post=2023-10-15T11:47:08.176 status=200 bytes=5349 file=`np6-905-cd__inst13_20231015_951063935_SPPHLZNP6905_20231015_1145_csv.zip` sha256=`7fed90104b63b4bd34feaa61780a0a01f618d2fb35830f2529ff8fc3ddeda40f` src=np6-905-cd_archive_page104.json supplemental=2023-10-15
- **OK** docId=951066597 post=2023-10-15T12:02:07.699 status=200 bytes=5367 file=`np6-905-cd__inst14_20231015_951066597_SPPHLZNP6905_20231015_1200_csv.zip` sha256=`ed56385183182998f37c509e68a3572a107d304c8126b6593db7095270017fbb` src=np6-905-cd_archive_page104.json supplemental=2023-10-15
- **OK** docId=951013077 post=2023-10-15T06:47:07.405 status=200 bytes=4857 file=`np6-905-cd__inst15_20231015_951013077_SPPHLZNP6905_20231015_0645_csv.zip` sha256=`47417935ccc241a9dfe56f36f9c5bcfed986dbc38dfe0ca2bf6ed4dbfa499ce1` src=np6-905-cd_archive_page104.json supplemental=2023-10-15
- **OK** docId=951109856 post=2023-10-15T16:47:06.100 status=200 bytes=4790 file=`np6-905-cd__inst16_20231015_951109856_SPPHLZNP6905_20231015_1645_csv.zip` sha256=`072696c2ac39601ee15e38d95fed0a93051273683c42eaeadccbc4fbf68db398` src=np6-905-cd_archive_page104.json supplemental=2023-10-15
- **OK** docId=950949179 post=2023-10-15T00:02:07.446 status=200 bytes=6761 file=`np6-905-cd__inst17_20231015_950949179_SPPHLZNP6905_20231015_0000_csv.zip` sha256=`d95a66c5b31824a16336f29de4bd1243b41a1c7ced5d51874024cd0b71f7e5fd` src=np6-905-cd_archive_page104.json supplemental=2023-10-15
- **OK** docId=951171010 post=2023-10-15T23:47:07.313 status=200 bytes=6598 file=`np6-905-cd__inst18_20231015_951171010_SPPHLZNP6905_20231015_2345_csv.zip` sha256=`d98a4d624b1bff8b9fd8cb31ea730314f4a358b1ec250fd90ec4aeb9544cc138` src=np6-905-cd_archive_page104.json supplemental=2023-10-15
- **OK** docId=950839049 post=2023-10-14T11:47:06.340 status=200 bytes=6856 file=`np6-905-cd__inst19_20231014_950839049_SPPHLZNP6905_20231014_1145_csv.zip` sha256=`5175b34d75d1f54be0d4747b5cea86271387901d720164048c53965f08b00922` src=np6-905-cd_archive_page104.json supplemental=2023-10-15
- **OK** docId=950841377 post=2023-10-14T12:02:07.155 status=200 bytes=6691 file=`np6-905-cd__inst20_20231014_950841377_SPPHLZNP6905_20231014_1200_csv.zip` sha256=`a778a9a42dad8d2da4a02a746c91f4d2dea5b63dc4b6a16e7728bd6dcc7fbb59` src=np6-905-cd_archive_page104.json supplemental=2023-10-15

## New NP6 archive listing pages (not in batch2–7; pages 101–104 target 2023-10-15)
- page=101 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-11-06T04:32:06.879 newest=2023-11-16T14:17:07.148 file=`np6-905-cd_archive_page101.json` sha256=`65a7af467ed2c1f0c2f86723456f28680ee11183012abbd96d23a875380d4e60`
- page=102 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-10-26T19:32:06.284 newest=2023-11-06T04:17:06.351 file=`np6-905-cd_archive_page102.json` sha256=`7b739fb48d308a2315866aa890f84069d9a55c66a2f64bb9afae11dbaf79e30b`
- page=103 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-10-16T09:32:05.782 newest=2023-10-26T19:17:05.704 file=`np6-905-cd_archive_page103.json` sha256=`0c1eb95c612311f32ae2b20ca2ab5049c71e805a2d0ebf9c5dbc2cc6229c5969`
- page=104 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-10-05T23:32:07.052 newest=2023-10-16T09:17:05.996 file=`np6-905-cd_archive_page104.json` sha256=`c5c4b9ee220f0cebc14c76e553eb22ae2fd20fa4725b366a56ba01979f6dd1ec`
- page=107 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-09-04T17:32:06.592 newest=2023-09-15T03:17:10.729 file=`np6-905-cd_archive_page107.json` sha256=`2c75fe4e6babb7ce4e51d1b029c186ab89dcbf5b643cf0ea76976267b17a3d5d`
- page=99 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-11-27T00:32:07.031 newest=2023-12-07T10:17:07.188 file=`np6-905-cd_archive_page99.json` sha256=`d6878a32aa1aa3ff4aa3695f8e63413a287cf0d9695883aba5af0bb45f03db22`

## Target civil-day archive hits (priority 2023-10-15 + prior EMPTY GATEs)
- **HIT** product=np6 gate_civil_day=2023-10-15 post=2023-10-15 docId=951063935 supplemental
- **HIT** product=np6 gate_civil_day=2023-10-15 post=2023-10-15 docId=951066597 supplemental
- **HIT** product=np6 gate_civil_day=2023-10-15 post=2023-10-15 docId=951013077 supplemental
- **HIT** product=np6 gate_civil_day=2023-10-15 post=2023-10-15 docId=951109856 supplemental
- **HIT** product=np6 gate_civil_day=2023-10-15 post=2023-10-15 docId=950949179 supplemental
- **HIT** product=np6 gate_civil_day=2023-10-15 post=2023-10-15 docId=951171010 supplemental

## GATEs / empty / absent
- **ABSENT** NP4-180-ER  — No invented path; leave GATE (same as batch2–7 Option-2 scope).
- **ABSENT** NP6-785-ER  — No invented path; leave GATE (same as batch2–7 Option-2 scope).

## Blocks / notes
- none observed
- note: NP4 gap picks: [(845722536, '2022-06-14'), (922440865, '2023-06-14'), (845515713, '2022-06-13'), (922210881, '2023-06-13'), (995993477, '2024-04-14'), (1036020038, '2024-09-14'), (1060611912, '2024-12-14'), (1077745007, '2025-02-14'), (1102852065, '2025-05-14'), (1003768678, '2024-05-14'), (1044071870, '2024-10-14'), (1069109760, '2025-01-14')]
- note: NP6 2023-10-15 priority picks so far: [(951298480, '2023-10-16', 'SPPHLZNP6905_20231016_1145_csv'), (951300953, '2023-10-16', 'SPPHLZNP6905_20231016_1200_csv'), (951347463, '2023-10-16', 'SPPHLZNP6905_20231016_1645_csv'), (951412251, '2023-10-16', 'SPPHLZNP6905_20231016_2345_csv'), (951410364, '2023-10-16', 'SPPHLZNP6905_20231016_2330_csv'), (951343893, '2023-10-16', 'SPPHLZNP6905_20231016_1630_csv'), (951271256, '2023-10-16', 'SPPHLZNP6905_20231016_0930_csv')]
- note: NP6 gap picks: [(951298480, '2023-10-16', 'SPPHLZNP6905_20231016_1145_csv'), (951300953, '2023-10-16', 'SPPHLZNP6905_20231016_1200_csv'), (951347463, '2023-10-16', 'SPPHLZNP6905_20231016_1645_csv'), (951412251, '2023-10-16', 'SPPHLZNP6905_20231016_2345_csv'), (951410364, '2023-10-16', 'SPPHLZNP6905_20231016_2330_csv'), (951343893, '2023-10-16', 'SPPHLZNP6905_20231016_1630_csv'), (951271256, '2023-10-16', 'SPPHLZNP6905_20231016_0930_csv'), (948745148, '2023-10-05', 'SPPHLZNP6905_20231005_1145_csv'), (948509536, '2023-10-04', 'SPPHLZNP6905_20231004_1145_csv'), (957482934, '2023-11-11', 'SPPHLZNP6905_20231111_1145_csv'), (954382592, '2023-10-29', 'SPPHLZNP6905_20231029_1145_csv'), (951349800, '2023-10-16', 'SPPHLZNP6905_20231016_1700_csv')]
- note: NP6 2023-10-15 hit in picks: False
- note: Supplemental NP6 2023-10-15 exact picks: [(951063935, 'SPPHLZNP6905_20231015_1145_csv'), (951066597, 'SPPHLZNP6905_20231015_1200_csv'), (951013077, 'SPPHLZNP6905_20231015_0645_csv'), (951109856, 'SPPHLZNP6905_20231015_1645_csv'), (950949179, 'SPPHLZNP6905_20231015_0000_csv'), (951171010, 'SPPHLZNP6905_20231015_2345_csv'), (950839049, 'SPPHLZNP6905_20231014_1145_csv'), (950841377, 'SPPHLZNP6905_20231014_1200_csv')]

## Leak-check
- No subscription keys, passwords, usernames, or bearer tokens intentionally written.
- Private token JSON deleted after run.
- Leak-check: PASS (no credential/token substrings in READY/meta/json text outputs).

