# ERCOT batch2 READY

- Timestamp (America/Chicago): 2026-09-24 11:52:42 CT (Part A fix: 2026-09-24 11:54:29 CT)
- Token HTTP status: 200 (fixA re-auth: 200)
- Bearer: id_token when present (True)
- GET count (initial+fixA): ~51 (budget ≤80)
- Rate: MIN_INTERVAL=2.2s; backoff on 429

## A) Artifact deliveryDate query syntax
### np4-190-cd-dam_stlmnt_pnt_prices
- Working attempt: `from_to`
- Template: `deliveryDateFrom={date}&deliveryDateTo={date}`
  - try `from_to` → status=200 bytes=49310 rows=1000 is_error=False err=None
### np6-905-cd-spp_node_zone_hub
- Working attempt: `from_to`
- Template: `deliveryDateFrom={date}&deliveryDateTo={date}`
  - try `from_to` → status=200 bytes=51402 rows=1000 is_error=False err=None

## A) Date fetches (row responses)
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-12-31 page=1 status=200 rows=1000 totalRecords=25848 totalPages=26 bytes=49310 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-12-31__page1.json` sha256=`e03d59d79c0fbf3e53c4d509987b5dd88eab4ad29911f250f19739cb5b1b4cc3` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-12-31 page=2 status=200 rows=1000 totalRecords=25848 totalPages=26 bytes=49392 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-12-31__page2.json` sha256=`520f54ca3491cdfe79fa6f976d7da8b7c744cf043cd42c21a3546cbf7c250125` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-12-31 page=3 status=200 rows=1000 totalRecords=25848 totalPages=26 bytes=49336 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-12-31__page3.json` sha256=`7097aff8220585dc1c93d83e11541f58d7bcd213a97b36a28bbf827913dde746` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-02-15 page=1 status=200 rows=1000 totalRecords=23352 totalPages=24 bytes=49202 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-02-15__page1.json` sha256=`0dcd3966e2287c67aa283ca82d2b50103cd5df17c7881b19f0121c5d16042f55` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-02-15 page=2 status=200 rows=1000 totalRecords=23352 totalPages=24 bytes=49207 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-02-15__page2.json` sha256=`eb649404273fbf5e680727d2044d64a0d6366d041183f5f1ef81324012671a79` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2025-02-15 page=3 status=200 rows=1000 totalRecords=23352 totalPages=24 bytes=49388 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2025-02-15__page3.json` sha256=`e31b4953d9ff20e3e7eab4b68274e8ca0a8714d3fd4d55c20b9d7e7fceba72ae` note=rows
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2021-02-15 page=1 status=200 rows=0 totalRecords=0 totalPages=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2021-02-15__page1.json` sha256=`50775d26f2e8f9a79c7aaf0c274d18cf45a947329189b73a12dd33550e323312` note=empty_data
- **OK** np6-905-cd-spp_node_zone_hub date=2025-12-31 page=1 status=200 rows=1000 totalRecords=104544 totalPages=105 bytes=51402 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-12-31__page1.json` sha256=`4684126c0433da5a327e6b5a377beceae756ef6a441ed0daad828e1bf4659c4c` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-12-31 page=2 status=200 rows=1000 totalRecords=104544 totalPages=105 bytes=51455 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-12-31__page2.json` sha256=`700889f75ac976767413c428aaa1ba321e1824c5823323014d2959905c8a3ae0` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-12-31 page=3 status=200 rows=1000 totalRecords=104544 totalPages=105 bytes=51334 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-12-31__page3.json` sha256=`12fa0da8346730736a8782723076be877435f5903d93de79d0ec5853ebf8178c` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-02-15 page=1 status=200 rows=1000 totalRecords=94560 totalPages=95 bytes=51023 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-02-15__page1.json` sha256=`5c7e4b1903f693b5157c05ff7e27ba186f8fee5c227a5ea447626436230efa22` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-02-15 page=2 status=200 rows=1000 totalRecords=94560 totalPages=95 bytes=51249 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-02-15__page2.json` sha256=`cce564e42e06e55da6d4a60a405b8df61416fcd9a2509d283ed041e40fbc0913` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2025-02-15 page=3 status=200 rows=1000 totalRecords=94560 totalPages=95 bytes=51240 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2025-02-15__page3.json` sha256=`95f8ad8770ea26466ee40287e101a1ba67a2e6b50a008e8aa58ee76f0be1d407` note=rows
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2021-02-15 page=1 status=200 rows=0 totalRecords=0 totalPages=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2021-02-15__page1.json` sha256=`0280f2a0026f705898dccc2bd3fec962c06fa1374f8b2489e03b74119e53e7a6` note=empty_data

## B) NP6 archive paging
- page param: `page` (page2 currentPage=2)
- first_non_future_page: 26
- last_in_rangeish_page: 197
- Probes:
  - page=2 status=200 class=future n=1000 in_range=0 oldest=2026-09-03T15:32:02.000 newest=2026-09-14T01:47:01.000 file=`np6-905-cd_archive_page2.json` sha256=`bca1f96ad734ad005aa79c985a477b9f1accfd9329bf0b34a44a13b625396d70`
  - page=218 status=200 class=past n=1000 in_range=0 oldest=2020-07-05T09:32:03.829 newest=2020-07-15T19:17:04.069 file=`np6-905-cd_archive_page218.json` sha256=`08cb641501d2844115d02353afd6cccb80dae9c80d1aa10814c0e0ec03377096`
  - page=109 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-08-14T18:17:07.281 newest=2023-08-25T04:02:09.555 file=`np6-905-cd_archive_page109.json` sha256=`dad65c2b1bcc037666b8507bb933ca4615c99f4957f71759155e234bc51455af`
  - page=54 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2025-03-09T16:17:01.000 newest=2025-03-20T02:02:04.000 file=`np6-905-cd_archive_page54.json` sha256=`a67c8489f646dc9273fe6e6af53a84e1c2e52fd32cdd5220fa443e9a475a4f14`
  - page=27 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2025-12-15T21:32:01.000 newest=2025-12-26T07:17:02.000 file=`np6-905-cd_archive_page27.json` sha256=`09d13c8f1064d4b425771d7004c7192c44975722f2d4db0cfa0f491f7b3ae515`
  - page=13 status=200 class=future n=1000 in_range=0 oldest=2026-05-12T00:02:01.000 newest=2026-05-22T09:47:01.000 file=`np6-905-cd_archive_page13.json` sha256=`a71fd09944dafa9cda8df3fd3489de5c3627595b1fd3ecf8d9d8aba1df81faec`
  - page=20 status=200 class=future n=1000 in_range=0 oldest=2026-02-26T19:47:01.000 newest=2026-03-09T07:32:01.000 file=`np6-905-cd_archive_page20.json` sha256=`a355debb1e03b3f7b629c9a1ddfbd8d75cc2f59aaa0101028e0a0ee5ffc471e1`
  - page=23 status=200 class=future n=1000 in_range=0 oldest=2026-01-26T13:47:01.000 newest=2026-02-05T23:32:01.000 file=`np6-905-cd_archive_page23.json` sha256=`79d9886f651c5c392773da73bd5446cb4f47fe90053353c971f37d8ac930b0fa`
  - page=25 status=200 class=future n=1000 in_range=0 oldest=2026-01-05T17:32:01.000 newest=2026-01-16T03:32:01.000 file=`np6-905-cd_archive_page25.json` sha256=`de81f1ef8e4a57842e6961b7310da2de02ac556483fdac26beac9ed267b58dbf`
  - page=26 status=200 class=in_range_or_mixed n=1000 in_range=546 oldest=2025-12-26T07:32:01.000 newest=2026-01-05T17:17:01.000 file=`np6-905-cd_archive_page26.json` sha256=`d52e38a602c50238d6cd95ace28aa05f4cee0a7fb10f3dd81380eff989b7a737`
  - page=230 status=200 class=past n=1000 in_range=0 oldest=2020-03-02T09:02:05.666 newest=2020-03-12T19:47:03.637 file=`np6-905-cd_archive_page230.json` sha256=`71c444645e9e85abb47a067e2fc74ddad4622e37bb0e539119762151d496c08e`
  - page=127 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-02-08T05:47:04.884 newest=2023-02-18T15:32:06.064 file=`np6-905-cd_archive_page127.json` sha256=`30dc72ac867daa5c6dfde318b370d700a5470322e798042f694d5489f382ed3b`
  - page=178 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2021-08-26T00:47:05.228 newest=2021-09-05T10:32:05.779 file=`np6-905-cd_archive_page178.json` sha256=`acfbade1e4fd23d531308fe1a398490291637c3dd68dc8925ca33605a355153c`
  - page=204 status=200 class=past n=1000 in_range=0 oldest=2020-11-28T04:32:04.385 newest=2020-12-08T14:17:03.972 file=`np6-905-cd_archive_page204.json` sha256=`4698988fd376c1a09b16b59d2871adec36c4bf7ec56098a93787c1ca68dde0cb`
  - page=191 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2021-04-12T15:17:07.335 newest=2021-04-23T01:02:05.774 file=`np6-905-cd_archive_page191.json` sha256=`6d99cf01cdf5225d881c6634b218ab7647475ad75ef4b78fd3d50a6a7a47d363`
  - page=197 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2021-02-09T02:32:04.115 newest=2021-02-19T12:02:04.334 file=`np6-905-cd_archive_page197.json` sha256=`56285d26c6a7c530b88319aad9a9a70ef3b20530996150fda0d9b3975e6d7851`
- Feb2025 fill probes:
  - page=57 status=200 n_feb2025=1000 oldest=2025-02-06T09:17:01.000 newest=2025-02-16T19:02:04.000 file=`np6-905-cd_archive_page57.json` sha256=`cecc23e1d5b97948c85175472432dc82289206977f37332366bdcb6e5a34b348`
- In-range instance downloads:
  - **OK** docId=1171744358 post=2025-12-15T21:32:01.000 status=200 bytes=8126 file=`np6-905-cd__inst1_20251215_1171744358_SPPHLZNP6905_20251215_2130_csv.zip` sha256=`2914037dca57e1d241571aaf0f66b73897a2e975e80eb7eaa27f8707f2bc2790`
  - **OK** docId=757717538 post=2021-02-09T02:32:04.115 status=200 bytes=3941 file=`np6-905-cd__inst2_20210209_757717538_SPPHLZNP6905_20210209_0230_csv.zip` sha256=`92ac0bf995dab0c0abd8c5274f6523fce6133d4cb793c4b4a1b941380fec4210`
  - **OK** docId=1177533089 post=2025-12-31T23:47:01.000 status=200 bytes=5725 file=`np6-905-cd__inst3_20251231_1177533089_SPPHLZNP6905_20251231_2345_csv.zip` sha256=`95769073d69168da6a45ed6e6f538af369175bf32e441c56a67923104feea769`
  - **OK** docId=1177529812 post=2025-12-31T23:32:01.000 status=200 bytes=5725 file=`np6-905-cd__inst4_20251231_1177529812_SPPHLZNP6905_20251231_2330_csv.zip` sha256=`c92dbbae05987ff6daffe4cd9bc9a4803a0764b5965653f926a5b7d47c6be4b0`
  - **OK** docId=1177524979 post=2025-12-31T23:17:01.000 status=200 bytes=5760 file=`np6-905-cd__inst5_20251231_1177524979_SPPHLZNP6905_20251231_2315_csv.zip` sha256=`2185619ddf1f9e3f6dc8232c2e5d08e6c68eed37d93c029707f2b8f31f9dd157`
  - **OK** docId=1078358046 post=2025-02-16T19:02:04.000 status=200 bytes=7288 file=`np6-905-cd__inst6_20250216_1078358046_SPPHLZNP6905_20250216_1900_csv.zip` sha256=`41fe05f856cdf2c2cd47694224869f563ebe872a60f292bc088fd5bcb93ff8e8`

## C) NP4 archive pages 2–5 (listings only)
- page=2 status=200 n=1000 oldest=2021-04-03T12:33:43.000 newest=2023-12-27T12:34:48.000 file=`np4-190-cd_archive_page2.json` sha256=`a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908`
- page=3 status=200 n=1000 oldest=2018-07-08T12:31:58.000 newest=2021-04-02T12:33:15.000 file=`np4-190-cd_archive_page3.json` sha256=`15cefe81cb08bf541e550468a4ea67c8f9d21695635bef1fb718d6acba49802a`
- page=4 status=200 n=1000 oldest=2015-10-12T13:01:31.000 newest=2018-07-07T12:26:46.000 file=`np4-190-cd_archive_page4.json` sha256=`a07533ad983656c181c1fd5b4fc94a667c1fc45a2021aa9b723abb5a07edf988`
- page=5 status=200 n=529 oldest=2014-05-01T12:59:25.000 newest=2015-10-11T13:03:30.000 file=`np4-190-cd_archive_page5.json` sha256=`3f805150d725072a352b32995483573b3555435ea90d3bb26f513e58804aa6d4`

## Blocks / notes
- none observed (no 401/403/429 on final responses)
- note: Part A corrected: bare deliveryDate returns 400; From/To is the hasRange convention.
- note: Prior eq 'rows=1' were error payloads (data:["deliveryDate"]); reclassified.

## Leak-check
- No subscription keys, passwords, usernames, or bearer tokens intentionally written.
- Token JSON under private/ deleted after run.
- Leak-check: PASS (no credential/token substrings in READY/meta/json text outputs).
