# ERCOT batch9 READY — Option-2 densify EMPTY months (NP4/NP6)

- Timestamp (America/Chicago): 2026-09-25 05:54:18 CT
- Token HTTP status: 200
- Bearer: id_token when present (True)
- GET count: 41 (budget ≤90)
- Rate: MIN_INTERVAL=2.2s; backoff on 429
- Secrets source (path only): `/home/box/agent-data/box-secrets.json`
- Card key names used: ERCOT_SUBSCRIPTION_KEY, ERCOT_USERNAME, ERCOT_PASSWORD
- HTTP status tally 401/403/429: {'401': 0, '403': 0, '429': 0}

## DeliveryDate syntax (confirmed from batch2)
- Working: `from_to` → `deliveryDateFrom={date}&deliveryDateTo={date}`
- Note: Confirmed in batch2; bare deliveryDate=400. Reused without rediscovery.
- Bare `deliveryDate=` → 400 (do not use).

## Artifact From/To sample days (new vs batch2–8; optional EMPTY probe)
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices date=2023-06-15 page=1 status=200 rows=0 totalRecords=0 bytes=1296 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2023-06-15__page1.json` sha256=`e708916aec9faf9b4ae781ffd0728214519bf3bb0ef560a18c8140eae559ac5b` note=empty_data
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-11-15 page=1 status=200 rows=1000 totalRecords=22656 bytes=49277 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-11-15__page1.json` sha256=`dc7e4ca6e9f8398b5bf19719f5baa3900ec2e1245edaf83368fffcd37a796652` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-11-15 page=2 status=200 rows=1000 totalRecords=22656 bytes=49337 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-11-15__page2.json` sha256=`8951cbcbd0f293a9ea5faeea8571515dbd159e27f340e33ca3e66777326f9ca8` note=rows
- **OK** np4-190-cd-dam_stlmnt_pnt_prices date=2024-11-15 page=3 status=200 rows=1000 totalRecords=22656 bytes=49156 file=`np4-190-cd-dam_stlmnt_pnt_prices__deliveryDate_2024-11-15__page3.json` sha256=`c73030234f59b29bb17c8f59aa551dcab799c8e371fcf42e297536c170b6e79b` note=rows
- **EMPTY** np6-905-cd-spp_node_zone_hub date=2023-06-15 page=1 status=200 rows=0 totalRecords=0 bytes=1623 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2023-06-15__page1.json` sha256=`45f6bac6423d785a2484f65d895996517ad175e22bb9dd32e12ca5a0507b1aad` note=empty_data
- **OK** np6-905-cd-spp_node_zone_hub date=2024-11-15 page=1 status=200 rows=1000 totalRecords=91776 bytes=51311 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-11-15__page1.json` sha256=`d903d9b68caade7d42b2431ca30e8bd63076fcd69d8be155d213fb848c66b045` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-11-15 page=2 status=200 rows=1000 totalRecords=91776 bytes=51381 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-11-15__page2.json` sha256=`25bb9661861be07b5731c2da7a8c09fbaac3841bdf9a0ac0b5c4ed0758ed445f` note=rows
- **OK** np6-905-cd-spp_node_zone_hub date=2024-11-15 page=3 status=200 rows=1000 totalRecords=91776 bytes=51396 file=`np6-905-cd-spp_node_zone_hub__deliveryDate_2024-11-15__page3.json` sha256=`ccedb86f0a959bd30ef2a0f8ba7a3fa7d0af6cd57a94d52f66e380dd69ee1a5c` note=rows

## NP4 archive downloads (listings reused; new docIds; EMPTY GATE near-days + densify)
- Reused listing page=1 `np4-190-cd_archive_page1.json` → `np4-190-cd_archive_page1_reused_from_batch8.json` sha256=`7a0724aa2b2e749df759b733b3d467455a2c76c195a3589baccd7fec62f7f344` (copied from batch8; no GET)
- Reused listing page=2 `np4-190-cd_archive_page2.json` → `np4-190-cd_archive_page2_reused_from_batch8.json` sha256=`a81d78443665cea00cb2e3cb665797005df339e23ec0485aba805dcacc0b0908` (copied from batch8; no GET)
- **OK** docId=870330412 post=2022-10-14T13:01:56.000 status=200 bytes=94554 file=`np4-190-cd__inst1_20221014_870330412_DAMSPNP4190_csv.zip` sha256=`d804d241e2140ef0db7a5b962657acc5afa6ed9eed85b5205a1fa1e5cdfbae6e` src=np4-190-cd_archive_page2_reused_from_batch8.json
- **OK** docId=870524105 post=2022-10-15T12:33:58.000 status=200 bytes=92774 file=`np4-190-cd__inst2_20221015_870524105_DAMSPNP4190_csv.zip` sha256=`a0e3a3616ea58f255246c50367a7702379dd7ebb54113e708b3010e0cc6061ff` src=np4-190-cd_archive_page2_reused_from_batch8.json
- **OK** docId=1085553446 post=2025-03-14T12:32:17.000 status=200 bytes=158714 file=`np4-190-cd__inst3_20250314_1085553446_DAMSPNP4190_csv.zip` sha256=`9da98ab9a3daaefd42fe31282a131627a967f23728f9d24b62e562c03ef608db` src=np4-190-cd_archive_page1_reused_from_batch8.json
- **OK** docId=1111925321 post=2025-06-14T12:32:11.000 status=200 bytes=162683 file=`np4-190-cd__inst4_20250614_1111925321_DAMSPNP4190_csv.zip` sha256=`eef594a293aea62cfc7298c6768d2b2f7d8fa65601a2ba21b38539fced136748` src=np4-190-cd_archive_page1_reused_from_batch8.json
- **OK** docId=1120795566 post=2025-07-14T12:32:24.000 status=200 bytes=168550 file=`np4-190-cd__inst5_20250714_1120795566_DAMSPNP4190_csv.zip` sha256=`856f354e3b6bf2aaa10936753a6ae90479d48e41625f6f350c765710e726e6bc` src=np4-190-cd_archive_page1_reused_from_batch8.json
- **OK** docId=1130328246 post=2025-08-14T12:33:09.000 status=200 bytes=169789 file=`np4-190-cd__inst6_20250814_1130328246_DAMSPNP4190_csv.zip` sha256=`931e7e5c0113efea1318daceef82f0bb42dd56ffa132009e4bbfb0aaa7222bf3` src=np4-190-cd_archive_page1_reused_from_batch8.json
- **OK** docId=1150481984 post=2025-10-14T12:32:21.000 status=200 bytes=172252 file=`np4-190-cd__inst7_20251014_1150481984_DAMSPNP4190_csv.zip` sha256=`d713da5d9267d06653e653f0d70bb79c36344fad4ec06629e32b0089a0ccd46a` src=np4-190-cd_archive_page1_reused_from_batch8.json
- **OK** docId=1160606903 post=2025-11-14T12:32:16.000 status=200 bytes=173876 file=`np4-190-cd__inst8_20251114_1160606903_DAMSPNP4190_csv.zip` sha256=`8ac18351e0e554d7aed559a28c82640cb0e9511b325e54edca152566f1fbe398` src=np4-190-cd_archive_page1_reused_from_batch8.json
- **OK** docId=1171255543 post=2025-12-14T12:32:35.000 status=200 bytes=177156 file=`np4-190-cd__inst9_20251214_1171255543_DAMSPNP4190_csv.zip` sha256=`70dfe2f602b0e477d2783134fc2f3e2493611e74d9186330dda7ee22775d7bb0` src=np4-190-cd_archive_page1_reused_from_batch8.json
- **OK** docId=864191087 post=2022-09-14T12:34:14.000 status=200 bytes=91203 file=`np4-190-cd__inst10_20220914_864191087_DAMSPNP4190_csv.zip` sha256=`2dd2d70bc14cf7452990c44ddeb137ff689a92d489f0d53396424c0fc701d9a0` src=np4-190-cd_archive_page2_reused_from_batch8.json
- **OK** docId=1052416414 post=2024-11-14T12:32:13.000 status=200 bytes=151750 file=`np4-190-cd__inst11_20241114_1052416414_DAMSPNP4190_csv.zip` sha256=`5fc5605bbb7932175e749c42a3bfd4584525358b4f438bb3ff7fe91c6540ad11` src=np4-190-cd_archive_page1_reused_from_batch8.json

## NP6 archive downloads (reused + new listings; new docIds; EMPTY GATE days)
- Reused listing `np6-905-cd_archive_page98.json` → `np6-905-cd_archive_page98_reused_for_batch9.json` sha256=`f60397aa537a284c1096e17c1f96938e78b80b561b5aae018c3f834f222ef5a9` (copied from batch7; no GET)
- Reused listing `np6-905-cd_archive_page132.json` → `np6-905-cd_archive_page132_reused_for_batch9.json` sha256=`ceb8761682fe9b0322e2096b4386d48785afe319df86a279e825ca01557f8aec` (copied from batch5; no GET)
- Reused listing `np6-905-cd_archive_page118.json` → `np6-905-cd_archive_page118_reused_for_batch9.json` sha256=`7640392a4860a744c72fabc0df1a8b6d5809262ae88946900faa4cebb57597fd` (copied from batch4; no GET)
- Reused listing `np6-905-cd_archive_page40.json` → `np6-905-cd_archive_page40_reused_for_batch9.json` sha256=`8f6c27ad5b16aeda56f482ff6fff4cbe68f56a600c460d7a947a91de34110135` (copied from batch4; no GET)
- **OK** docId=996244718 post=2024-04-15T11:47:08.000 status=200 bytes=6355 file=`np6-905-cd__inst1_20240415_996244718_SPPHLZNP6905_20240415_1145_csv.zip` sha256=`95169946f1d88aefd9c34e9e3d156acfdd7ec12adbbaf86a2ddf67fd996c92c9` src=np6-905-cd_archive_page86.json
- **OK** docId=1004024077 post=2024-05-15T11:47:01.000 status=200 bytes=6752 file=`np6-905-cd__inst2_20240515_1004024077_SPPHLZNP6905_20240515_1145_csv.zip` sha256=`c545c9cf614eeb34d58c8f59fc17af9ec96c60c7850db6bd1a5fc805c9a49fb0` src=np6-905-cd_archive_page83.json
- **OK** docId=1027648078 post=2024-08-14T02:02:01.000 status=200 bytes=6242 file=`np6-905-cd__inst3_20240814_1027648078_SPPHLZNP6905_20240814_0200_csv.zip` sha256=`819f76edca0a7165bb50b93f88d4fbfb6b1d2993b976dd932a48b8f5bb2651b7` src=np6-905-cd_archive_page75.json
- **OK** docId=1027638231 post=2024-08-14T01:02:02.000 status=200 bytes=5021 file=`np6-905-cd__inst4_20240814_1027638231_SPPHLZNP6905_20240814_0100_csv.zip` sha256=`e6d4d1479a5a33fafed667a0f980a96471c9e8724307f90c755a1e83de87404d` src=np6-905-cd_archive_page75.json
- **OK** docId=902256955 post=2023-03-15T11:47:05.154 status=200 bytes=6205 file=`np6-905-cd__inst5_20230315_902256955_SPPHLZNP6905_20230315_1145_csv.zip` sha256=`e0ce354e552c6e42e42cd0e502d8676368711f7c8bc3b9ddc0190898e202d4ae` src=np6-905-cd_archive_page124.json
- **OK** docId=823198232 post=2022-02-15T11:47:09.103 status=200 bytes=5765 file=`np6-905-cd__inst6_20220215_823198232_SPPHLZNP6905_20220215_1145_csv.zip` sha256=`2d5861fe5eb5bde0cb8d26a606375e080f025f600756d85ba19cf115c8ac3a51` src=np6-905-cd_archive_page162.json
- **OK** docId=965439880 post=2023-12-14T11:47:07.000 status=200 bytes=4838 file=`np6-905-cd__inst7_20231214_965439880_SPPHLZNP6905_20231214_1145_csv.zip` sha256=`fdf25a60650e251cf5d6c01ebc66ae080daf39b6fb2264542840ec5347e8e569` src=np6-905-cd_archive_page98_reused_for_batch9.json
- **OK** docId=884144459 post=2022-12-20T11:47:04.996 status=200 bytes=4530 file=`np6-905-cd__inst8_20221220_884144459_SPPHLZNP6905_20221220_1145_csv.zip` sha256=`cacadeb70c4102cf9f926fcdc76f9204237de29dfd19079b18c816c27562635b` src=np6-905-cd_archive_page132_reused_for_batch9.json
- **OK** docId=915637170 post=2023-05-15T11:47:05.530 status=200 bytes=5823 file=`np6-905-cd__inst9_20230515_915637170_SPPHLZNP6905_20230515_1145_csv.zip` sha256=`508424c4716347bdfc71fec37f2e56657ddaa4bd4a91b3be5d6d32aab12f2d8d` src=np6-905-cd_archive_page118_reused_for_batch9.json
- **OK** docId=1129060801 post=2025-08-10T11:47:01.000 status=200 bytes=7418 file=`np6-905-cd__inst10_20250810_1129060801_SPPHLZNP6905_20250810_1145_csv.zip` sha256=`b3d3e6b78a75b807ee637f0350400975e6bdf8088b6e60cf94022385795bc315` src=np6-905-cd_archive_page40_reused_for_batch9.json
- **OK** docId=996247209 post=2024-04-15T12:02:15.000 status=200 bytes=6291 file=`np6-905-cd__inst11_20240415_996247209_SPPHLZNP6905_20240415_1200_csv.zip` sha256=`7a12f13632bc5f4dd52ec71b76c00ad7795b0db746ef2ffc1ccde40345734af8` src=np6-905-cd_archive_page86.json
- **OK** docId=1004026609 post=2024-05-15T12:02:01.000 status=200 bytes=6665 file=`np6-905-cd__inst12_20240515_1004026609_SPPHLZNP6905_20240515_1200_csv.zip` sha256=`0f4b399cb5c198320000d4349ea33f0af112a4441d4a83c29877818f67436104` src=np6-905-cd_archive_page83.json
- **OK** docId=1027635609 post=2024-08-14T00:47:07.000 status=200 bytes=5023 file=`np6-905-cd__inst13_20240814_1027635609_SPPHLZNP6905_20240814_0045_csv.zip` sha256=`25ea78fe3edff39b028e8d6ec4d6ef346850d258b535ca6234d8188fe5b4110a` src=np6-905-cd_archive_page75.json
- **OK** docId=1034394040 post=2024-09-08T11:47:01.000 status=200 bytes=6438 file=`np6-905-cd__inst14_20240908_1034394040_SPPHLZNP6905_20240908_1145_csv.zip` sha256=`92dfc12c7dde6065e91d765ee877b9751da0d4041506b52ba348074f90615cac` src=np6-905-cd_archive_page72.json
- **OK** docId=902259659 post=2023-03-15T12:02:08.178 status=200 bytes=6202 file=`np6-905-cd__inst15_20230315_902259659_SPPHLZNP6905_20230315_1200_csv.zip` sha256=`a0e7f2fb0eea52e5689849724af843d73ddec345ae333c59bb017a834fa766d7` src=np6-905-cd_archive_page124.json
- **OK** docId=823199982 post=2022-02-15T12:02:07.556 status=200 bytes=5772 file=`np6-905-cd__inst16_20220215_823199982_SPPHLZNP6905_20220215_1200_csv.zip` sha256=`bf7f31051a0bfd5b55a388331ae230ef32173aa8136b77564b0ccdb1fe051316` src=np6-905-cd_archive_page162.json

## New NP6 archive listing pages (not in batch2–8; pages target EMPTY densify months)
- page=86 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2024-04-11T02:17:07.000 newest=2024-04-21T12:02:09.000 file=`np6-905-cd_archive_page86.json` sha256=`24e3c9e05071059cb002b6ed965e37f59f01f3fe94c4e8ebea1fccab7a97964b`
- page=83 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2024-05-12T08:17:01.000 newest=2024-05-22T18:02:01.000 file=`np6-905-cd_archive_page83.json` sha256=`a24ec3f727272236fcda44c6d1dfbfd064f8d71ea73db6df94547ff9cc609980`
- page=75 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2024-08-03T16:17:01.000 newest=2024-08-14T02:02:01.000 file=`np6-905-cd_archive_page75.json` sha256=`55c483c13afdbdd64f0457141890392a55933d6eb25f1e61e66eca521d77a390`
- page=72 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2024-09-03T22:17:01.000 newest=2024-09-14T08:02:01.000 file=`np6-905-cd_archive_page72.json` sha256=`6e12f7421db0ceeec19276d284e91303e078508d02eea3820b1fdfc4128f75dc`
- page=124 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2023-03-12T06:47:06.436 newest=2023-03-22T16:32:04.920 file=`np6-905-cd_archive_page124.json` sha256=`e52e9154e06e78b975bb77d5c517afb8ef64f305e124ff4258cd396d6b2e07f8`
- page=162 status=200 class=in_range_or_mixed n=1000 in_range=1000 oldest=2022-02-09T09:47:05.970 newest=2022-02-19T19:32:06.927 file=`np6-905-cd_archive_page162.json` sha256=`77c574aa8a39173596bb735941e772010dd5012d8339abe96679aa316aeeb5ab`

## Target civil-day archive hits (EMPTY-month densify)
- **HIT** product=np4 gate_civil_day=2022-10-14 post=2022-10-14 docId=870330412
- **HIT** product=np4 gate_civil_day=2025-03-14 post=2025-03-14 docId=1085553446
- **HIT** product=np4 gate_civil_day=2025-06-14 post=2025-06-14 docId=1111925321
- **HIT** product=np4 gate_civil_day=2025-07-14 post=2025-07-14 docId=1120795566
- **HIT** product=np6 gate_civil_day=2024-04-15 post=2024-04-15 docId=996244718
- **HIT** product=np6 gate_civil_day=2024-05-15 post=2024-05-15 docId=1004024077
- **HIT** product=np6 gate_civil_day=2023-03-15 post=2023-03-15 docId=902256955
- **HIT** product=np6 gate_civil_day=2022-02-15 post=2022-02-15 docId=823198232
- **HIT** product=np6 gate_civil_day=2023-12-14 post=2023-12-14 docId=965439880
- **HIT** product=np6 gate_civil_day=2022-12-20 post=2022-12-20 docId=884144459
- **HIT** product=np6 gate_civil_day=2023-05-15 post=2023-05-15 docId=915637170
- **HIT** product=np6 gate_civil_day=2025-08-10 post=2025-08-10 docId=1129060801
- **HIT** product=np6 gate_civil_day=2024-04-15 post=2024-04-15 docId=996247209
- **HIT** product=np6 gate_civil_day=2024-05-15 post=2024-05-15 docId=1004026609
- **HIT** product=np6 gate_civil_day=2023-03-15 post=2023-03-15 docId=902259659
- **HIT** product=np6 gate_civil_day=2022-02-15 post=2022-02-15 docId=823199982

## GATEs / empty / absent
- **ABSENT** NP4-180-ER  — No invented path; leave GATE (same as batch2–8 Option-2 scope).
- **ABSENT** NP6-785-ER  — No invented path; leave GATE (same as batch2–8 Option-2 scope).
- **EMPTY** np4-190-cd-dam_stlmnt_pnt_prices 2023-06-15 — live artifact From/To returned 0 rows; use archive
- **EMPTY** np6-905-cd-spp_node_zone_hub 2023-06-15 — live artifact From/To returned 0 rows; use archive

## Blocks / notes
- none observed
- note: NP4 gap picks: [(870330412, '2022-10-14'), (870524105, '2022-10-15'), (1085553446, '2025-03-14'), (1111925321, '2025-06-14'), (1120795566, '2025-07-14'), (1130328246, '2025-08-14'), (1150481984, '2025-10-14'), (1160606903, '2025-11-14'), (1171255543, '2025-12-14'), (864191087, '2022-09-14'), (1052416414, '2024-11-14')]
- note: NP6 EMPTY-month priority picks so far: [(996244718, '2024-04-15', 'SPPHLZNP6905_20240415_1145_csv'), (1004024077, '2024-05-15', 'SPPHLZNP6905_20240515_1145_csv'), (1027648078, '2024-08-14', 'SPPHLZNP6905_20240814_0200_csv'), (1027638231, '2024-08-14', 'SPPHLZNP6905_20240814_0100_csv'), (902256955, '2023-03-15', 'SPPHLZNP6905_20230315_1145_csv'), (823198232, '2022-02-15', 'SPPHLZNP6905_20220215_1145_csv')]
- note: NP6 gap picks: [(996244718, '2024-04-15', 'SPPHLZNP6905_20240415_1145_csv'), (1004024077, '2024-05-15', 'SPPHLZNP6905_20240515_1145_csv'), (1027648078, '2024-08-14', 'SPPHLZNP6905_20240814_0200_csv'), (1027638231, '2024-08-14', 'SPPHLZNP6905_20240814_0100_csv'), (902256955, '2023-03-15', 'SPPHLZNP6905_20230315_1145_csv'), (823198232, '2022-02-15', 'SPPHLZNP6905_20220215_1145_csv'), (965439880, '2023-12-14', 'SPPHLZNP6905_20231214_1145_csv'), (884144459, '2022-12-20', 'SPPHLZNP6905_20221220_1145_csv'), (915637170, '2023-05-15', 'SPPHLZNP6905_20230515_1145_csv'), (1129060801, '2025-08-10', 'SPPHLZNP6905_20250810_1145_csv'), (996247209, '2024-04-15', 'SPPHLZNP6905_20240415_1200_csv'), (1004026609, '2024-05-15', 'SPPHLZNP6905_20240515_1200_csv'), (1027635609, '2024-08-14', 'SPPHLZNP6905_20240814_0045_csv'), (1034394040, '2024-09-08', 'SPPHLZNP6905_20240908_1145_csv'), (902259659, '2023-03-15', 'SPPHLZNP6905_20230315_1200_csv'), (823199982, '2022-02-15', 'SPPHLZNP6905_20220215_1200_csv')]
- note: NP6 densify months in picks: ['2022-02', '2022-12', '2023-03', '2023-05', '2023-12', '2024-04', '2024-05', '2024-08', '2024-09', '2025-08']

## Leak-check
- No subscription keys, passwords, usernames, or bearer tokens intentionally written.
- Private token JSON deleted after run.
- Leak-check: PASS (no credential/token substrings in READY/meta/json text outputs).

