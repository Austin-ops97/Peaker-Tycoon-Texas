# Retained sample inventory

This file lists CSV `DeliveryDate` values found by `RetainedSettlementArchive` in verified price zips under `batch2`, `batch3`, `batch4`, and `batch5`. It is an inventory of retained samples. It is not complete coverage.

`claims_complete_source_coverage` is false. Proxy `source_point_id` and `covered_local_dates` are not filled from this list.

Dates are `sourceLocalDate` from the CSV, not archive post timestamps. An NP4 delivery date is often the civil day after the post. An NP6 file is one `DeliveryHour`:`DeliveryInterval` sample, not a full day. Hour endings `01:00`–`24:00` on an NP4 date are that DAM file’s hours, not proxy coverage.

Campaign era checked here is 2021-02-01 through 2025-12-31. Batch 1 is not scanned. The three 2026-09-24 RT zips are outside this readout.

Regenerate both artifacts from the retained zips with `PEAKER_REFRESH_RETAINED_INVENTORY=1` on the inventory test. Do not hand-edit the date rows.

## NP4-190-CD

28 price zips. Parse errors reported by the validator: 0. Those errors stay on the rows; they are not dropped from this date list when a row still parsed.

| Delivery date | In campaign era | Hour endings | Observations | Zips |
| --- | --- | --- | --- | --- |
| 2021-02-10 | yes | 01:00–24:00 (24) | 17088 | `batch3/np4-190-cd__inst1_20210209_757802224_DAMSPNP4190_csv.zip` |
| 2021-02-15 | yes | 01:00–24:00 (24) | 17112 | `batch5/np4-190-cd__inst1_20210214_758641836_DAMSPNP4190_csv.zip` |
| 2021-02-16 | yes | 01:00–24:00 (24) | 17112 | `batch3/np4-190-cd__inst2_20210215_758799242_DAMSPNP4190_csv.zip` |
| 2021-02-20 | yes | 01:00–24:00 (24) | 17112 | `batch3/np4-190-cd__inst3_20210219_759484356_DAMSPNP4190_csv.zip` |
| 2021-03-16 | yes | 01:00–24:00 (24) | 17184 | `batch5/np4-190-cd__inst2_20210315_763408356_DAMSPNP4190_csv.zip` |
| 2021-03-17 | yes | 01:00–24:00 (24) | 17184 | `batch3/np4-190-cd__inst4_20210316_763581329_DAMSPNP4190_csv.zip` |
| 2021-04-17 | yes | 01:00–24:00 (24) | 17520 | `batch5/np4-190-cd__inst3_20210416_768828508_DAMSPNP4190_csv.zip` |
| 2021-05-17 | yes | 01:00–24:00 (24) | 17616 | `batch4/np4-190-cd__inst1_20210516_773997684_DAMSPNP4190_csv.zip` |
| 2021-07-17 | yes | 01:00–24:00 (24) | 17880 | `batch5/np4-190-cd__inst4_20210716_784624476_DAMSPNP4190_csv.zip` |
| 2021-08-17 | yes | 01:00–24:00 (24) | 18024 | `batch3/np4-190-cd__inst5_20210816_790144271_DAMSPNP4190_csv.zip` |
| 2021-12-17 | yes | 01:00–24:00 (24) | 18456 | `batch4/np4-190-cd__inst2_20211216_812053445_DAMSPNP4190_csv.zip` |
| 2022-01-17 | yes | 01:00–24:00 (24) | 18432 | `batch5/np4-190-cd__inst5_20220116_817680531_DAMSPNP4190_csv.zip` |
| 2022-02-15 | yes | 01:00–24:00 (24) | 18552 | `batch4/np4-190-cd__inst3_20220214_823014576_DAMSPNP4190_csv.zip` |
| 2022-03-17 | yes | 01:00–24:00 (24) | 18600 | `batch5/np4-190-cd__inst6_20220316_828536499_DAMSPNP4190_csv.zip` |
| 2022-06-16 | yes | 01:00–24:00 (24) | 19200 | `batch3/np4-190-cd__inst6_20220615_845921117_DAMSPNP4190_csv.zip` |
| 2022-07-17 | yes | 01:00–24:00 (24) | 19152 | `batch5/np4-190-cd__inst7_20220716_852119649_DAMSPNP4190_csv.zip` |
| 2022-09-16 | yes | 01:00–24:00 (24) | 19296 | `batch4/np4-190-cd__inst4_20220915_864393539_DAMSPNP4190_csv.zip` |
| 2022-12-17 | yes | 01:00–24:00 (24) | 19704 | `batch4/np4-190-cd__inst5_20221216_883319168_DAMSPNP4190_csv.zip` |
| 2023-01-17 | yes | 01:00–24:00 (24) | 19632 | `batch4/np4-190-cd__inst6_20230116_889808030_DAMSPNP4190_csv.zip` |
| 2023-03-17 | yes | 01:00–24:00 (24) | 19800 | `batch4/np4-190-cd__inst7_20230316_902478925_DAMSPNP4190_csv.zip` |
| 2023-06-16 | yes | 01:00–24:00 (24) | 20472 | `batch3/np4-190-cd__inst7_20230615_922670819_DAMSPNP4190_csv.zip` |
| 2023-08-17 | yes | 01:00–24:00 (24) | 20448 | `batch4/np4-190-cd__inst8_20230816_936965305_DAMSPNP4190_csv.zip` |
| 2023-12-15 | yes | 01:00–24:00 (24) | 21168 | `batch4/np4-190-cd__inst9_20231214_965447681_DAMSPNP4190_csv.zip` |
| 2024-03-17 | yes | 01:00–24:00 (24) | 21504 | `batch4/np4-190-cd__inst10_20240316_988639722_DAMSPNP4190_csv.zip` |
| 2024-07-17 | yes | 01:00–24:00 (24) | 21816 | `batch4/np4-190-cd__inst11_20240716_1020166966_DAMSPNP4190_csv.zip` |
| 2024-11-16 | yes | 01:00–24:00 (24) | 22656 | `batch4/np4-190-cd__inst12_20241115_1052688105_DAMSPNP4190_csv.zip` |
| 2025-04-16 | yes | 01:00–24:00 (24) | 23712 | `batch4/np4-190-cd__inst13_20250415_1094526170_DAMSPNP4190_csv.zip` |
| 2025-09-16 | yes | 01:00–24:00 (24) | 25128 | `batch4/np4-190-cd__inst14_20250915_1140793955_DAMSPNP4190_csv.zip` |

## NP6-905-CD

29 price zips. Parse errors reported by the validator: 88. Those errors stay on the rows; they are not dropped from this date list when a row still parsed.

| Delivery date | In campaign era | Hour endings | Observations | Zips |
| --- | --- | --- | --- | --- |
| 2021-02-09 | yes | 14:1, 3:2 | 1450 | `batch2/np6-905-cd__inst2_20210209_757717538_SPPHLZNP6905_20210209_0230_csv.zip`, `batch3/np6-905-cd__inst1_20210209_757800273_SPPHLZNP6905_20210209_1315_csv.zip` |
| 2021-02-11 | yes | 12:3 | 726 | `batch3/np6-905-cd__inst2_20210211_758130553_SPPHLZNP6905_20210211_1145_csv.zip` |
| 2021-02-13 | yes | 12:3 | 726 | `batch3/np6-905-cd__inst3_20210213_758461769_SPPHLZNP6905_20210213_1145_csv.zip` |
| 2021-02-15 | yes | 12:3 | 726 | `batch3/np6-905-cd__inst4_20210215_758785321_SPPHLZNP6905_20210215_1145_csv.zip` |
| 2021-02-17 | yes | 12:3 | 726 | `batch3/np6-905-cd__inst5_20210217_759129410_SPPHLZNP6905_20210217_1145_csv.zip` |
| 2021-02-19 | yes | 6:3, 6:4 | 1452 | `batch3/np6-905-cd__inst6_20210219_759417965_SPPHLZNP6905_20210219_0600_csv.zip`, `batch5/np6-905-cd__inst1_20210219_759415177_SPPHLZNP6905_20210219_0545_csv.zip` |
| 2021-04-15 | yes | 12:3 | 743 | `batch5/np6-905-cd__inst2_20210415_768651349_SPPHLZNP6905_20210415_1145_csv.zip` |
| 2021-05-19 | yes | 5:2 | 747 | `batch5/np6-905-cd__inst4_20210519_774460998_SPPHLZNP6905_20210519_0430_csv.zip` |
| 2021-06-20 | yes | 12:3 | 752 | `batch4/np6-905-cd__inst10_20210620_780039888_SPPHLZNP6905_20210620_1145_csv.zip` |
| 2021-07-20 | yes | 17:2 | 758 | `batch5/np6-905-cd__inst5_20210720_785365684_SPPHLZNP6905_20210720_1630_csv.zip` |
| 2021-09-01 | yes | 12:3 | 767 | `batch4/np6-905-cd__inst9_20210901_793006546_SPPHLZNP6905_20210901_1145_csv.zip` |
| 2021-10-11 | yes | 24:4 | 774 | `batch5/np6-905-cd__inst6_20211012_800246894_SPPHLZNP6905_20211012_0000_csv.zip` |
| 2021-12-13 | yes | 11:4 | 781 | `batch5/np6-905-cd__inst7_20211213_811491049_SPPHLZNP6905_20211213_1100_csv.zip` |
| 2022-01-15 | yes | 12:3 | 781 | `batch5/np6-905-cd__inst3_20220115_817499214_SPPHLZNP6905_20220115_1145_csv.zip` |
| 2022-06-20 | yes | 12:3 | 813 | `batch4/np6-905-cd__inst8_20220620_846902783_SPPHLZNP6905_20220620_1145_csv.zip` |
| 2022-10-01 | yes | 12:3 | 817 | `batch4/np6-905-cd__inst7_20221001_867649897_SPPHLZNP6905_20221001_1145_csv.zip` |
| 2023-02-14 | yes | 12:3 | 837 | `batch4/np6-905-cd__inst6_20230214_895996716_SPPHLZNP6905_20230214_1145_csv.zip` |
| 2023-08-20 | yes | 12:3 | 864 | `batch4/np6-905-cd__inst5_20230820_937884071_SPPHLZNP6905_20230820_1145_csv.zip` |
| 2024-03-05 | yes | 12:3 | 908 | `batch4/np6-905-cd__inst4_20240305_985866907_SPPHLZNP6905_20240305_1145_csv.zip` |
| 2024-06-15 | yes | 12:3 | 927 | `batch4/np6-905-cd__inst3_20240615_1012057209_SPPHLZNP6905_20240615_1145_csv.zip` |
| 2025-02-10 | yes | 12:3 | 985 | `batch4/np6-905-cd__inst2_20250210_1076607155_SPPHLZNP6905_20250210_1145_csv.zip` |
| 2025-02-16 | yes | 19:4 | 985 | `batch2/np6-905-cd__inst6_20250216_1078358046_SPPHLZNP6905_20250216_1900_csv.zip` |
| 2025-03-15 | yes | 12:3 | 993 | `batch4/np6-905-cd__inst1_20250315_1085818452_SPPHLZNP6905_20250315_1145_csv.zip` |
| 2025-12-15 | yes | 22:2 | 1089 | `batch2/np6-905-cd__inst1_20251215_1171744358_SPPHLZNP6905_20251215_2130_csv.zip` |
| 2025-12-31 | yes | 24:1, 24:2, 24:3 | 3267 | `batch2/np6-905-cd__inst3_20251231_1177533089_SPPHLZNP6905_20251231_2345_csv.zip`, `batch2/np6-905-cd__inst4_20251231_1177529812_SPPHLZNP6905_20251231_2330_csv.zip`, `batch2/np6-905-cd__inst5_20251231_1177524979_SPPHLZNP6905_20251231_2315_csv.zip` |

## EMPTY GATE — live From/To

These days returned `totalRecords` 0 for live `deliveryDateFrom` / `deliveryDateTo` on both NP4-190-CD and NP6-905-CD. A retained hour or interval on that date does not close the gate.

| Day | NP4-190-CD retained hours | NP6-905-CD retained hours |
| --- | --- | --- |
| 2021-04-15 | none | 12:3 |
| 2022-07-15 | none | none |
| 2023-01-15 | none | none |
| 2023-04-15 | none | none |

## ER ABSENT GATE

- NP4-180-ER is `absent_from_public_reports_catalog`. No Public API path is invented here.
- NP6-785-ER is `absent_from_public_reports_catalog`. No Public API path is invented here.
