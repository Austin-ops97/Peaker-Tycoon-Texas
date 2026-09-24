# Retained sample inventory

This file lists CSV `DeliveryDate` values found by `RetainedSettlementArchive` in verified price zips under `batch2` through `batch8`. It is an inventory of retained samples. It is not complete coverage.

`claims_complete_source_coverage` is false. Proxy `source_point_id` and `covered_local_dates` are not filled from this list.

Dates are `sourceLocalDate` from the CSV, not archive post timestamps. An NP4 delivery date is often the civil day after the post. An NP6 file is one `DeliveryHour`:`DeliveryInterval` sample, not a full day. Hour endings `01:00`–`24:00` on an NP4 date are that DAM file’s hours, not proxy coverage.

Campaign era checked here is 2021-02-01 through 2025-12-31. Batch 1 is not scanned. The three 2026-09-24 RT zips are outside this readout.

Regenerate both artifacts from the retained zips with `PEAKER_REFRESH_RETAINED_INVENTORY=1` on the inventory test. Do not hand-edit the date rows.

## NP4-190-CD

66 price zips. Parse errors reported by the validator: 0. Those errors stay on the rows; they are not dropped from this date list when a row still parsed.

| Delivery date | In campaign era | Hour endings | Observations | Zips |
| --- | --- | --- | --- | --- |
| 2021-02-10 | yes | 01:00–24:00 (24) | 17088 | `batch3/np4-190-cd__inst1_20210209_757802224_DAMSPNP4190_csv.zip` |
| 2021-02-15 | yes | 01:00–24:00 (24) | 17112 | `batch5/np4-190-cd__inst1_20210214_758641836_DAMSPNP4190_csv.zip` |
| 2021-02-16 | yes | 01:00–24:00 (24) | 17112 | `batch3/np4-190-cd__inst2_20210215_758799242_DAMSPNP4190_csv.zip` |
| 2021-02-20 | yes | 01:00–24:00 (24) | 17112 | `batch3/np4-190-cd__inst3_20210219_759484356_DAMSPNP4190_csv.zip` |
| 2021-03-16 | yes | 01:00–24:00 (24) | 17184 | `batch5/np4-190-cd__inst2_20210315_763408356_DAMSPNP4190_csv.zip` |
| 2021-03-17 | yes | 01:00–24:00 (24) | 17184 | `batch3/np4-190-cd__inst4_20210316_763581329_DAMSPNP4190_csv.zip` |
| 2021-04-15 | yes | 01:00–24:00 (24) | 17520 | `batch6/np4-190-cd__inst1_20210414_768484164_DAMSPNP4190_csv.zip` |
| 2021-04-17 | yes | 01:00–24:00 (24) | 17520 | `batch5/np4-190-cd__inst3_20210416_768828508_DAMSPNP4190_csv.zip` |
| 2021-05-17 | yes | 01:00–24:00 (24) | 17616 | `batch4/np4-190-cd__inst1_20210516_773997684_DAMSPNP4190_csv.zip` |
| 2021-06-15 | yes | 01:00–24:00 (24) | 17736 | `batch6/np4-190-cd__inst5_20210614_778995380_DAMSPNP4190_csv.zip` |
| 2021-07-17 | yes | 01:00–24:00 (24) | 17880 | `batch5/np4-190-cd__inst4_20210716_784624476_DAMSPNP4190_csv.zip` |
| 2021-08-17 | yes | 01:00–24:00 (24) | 18024 | `batch3/np4-190-cd__inst5_20210816_790144271_DAMSPNP4190_csv.zip` |
| 2021-09-15 | yes | 01:00–24:00 (24) | 18096 | `batch6/np4-190-cd__inst6_20210914_795352419_DAMSPNP4190_csv.zip` |
| 2021-10-15 | yes | 01:00–24:00 (24) | 18264 | `batch7/np4-190-cd__inst1_20211014_800715157_DAMSPNP4190_csv.zip` |
| 2021-10-16 | yes | 01:00–24:00 (24) | 18264 | `batch7/np4-190-cd__inst5_20211015_800890479_DAMSPNP4190_csv.zip` |
| 2021-11-15 | yes | 01:00–24:00 (24) | 18336 | `batch6/np4-190-cd__inst7_20211114_806282994_DAMSPNP4190_csv.zip` |
| 2021-12-17 | yes | 01:00–24:00 (24) | 18456 | `batch4/np4-190-cd__inst2_20211216_812053445_DAMSPNP4190_csv.zip` |
| 2022-01-17 | yes | 01:00–24:00 (24) | 18432 | `batch5/np4-190-cd__inst5_20220116_817680531_DAMSPNP4190_csv.zip` |
| 2022-02-15 | yes | 01:00–24:00 (24) | 18552 | `batch4/np4-190-cd__inst3_20220214_823014576_DAMSPNP4190_csv.zip` |
| 2022-03-17 | yes | 01:00–24:00 (24) | 18600 | `batch5/np4-190-cd__inst6_20220316_828536499_DAMSPNP4190_csv.zip` |
| 2022-04-15 | yes | 01:00–24:00 (24) | 18816 | `batch6/np4-190-cd__inst8_20220414_833904939_DAMSPNP4190_csv.zip` |
| 2022-05-15 | yes | 01:00–24:00 (24) | 19080 | `batch7/np4-190-cd__inst2_20220514_839606758_DAMSPNP4190_csv.zip` |
| 2022-05-16 | yes | 01:00–24:00 (24) | 19080 | `batch7/np4-190-cd__inst6_20220515_839796340_DAMSPNP4190_csv.zip` |
| 2022-06-14 | yes | 01:00–24:00 (24) | 19200 | `batch8/np4-190-cd__inst3_20220613_845515713_DAMSPNP4190_csv.zip` |
| 2022-06-15 | yes | 01:00–24:00 (24) | 19200 | `batch8/np4-190-cd__inst1_20220614_845722536_DAMSPNP4190_csv.zip` |
| 2022-06-16 | yes | 01:00–24:00 (24) | 19200 | `batch3/np4-190-cd__inst6_20220615_845921117_DAMSPNP4190_csv.zip` |
| 2022-07-15 | yes | 01:00–24:00 (24) | 19152 | `batch6/np4-190-cd__inst2_20220714_851721131_DAMSPNP4190_csv.zip` |
| 2022-07-17 | yes | 01:00–24:00 (24) | 19152 | `batch5/np4-190-cd__inst7_20220716_852119649_DAMSPNP4190_csv.zip` |
| 2022-08-15 | yes | 01:00–24:00 (24) | 19200 | `batch6/np4-190-cd__inst9_20220814_857947135_DAMSPNP4190_csv.zip` |
| 2022-09-16 | yes | 01:00–24:00 (24) | 19296 | `batch4/np4-190-cd__inst4_20220915_864393539_DAMSPNP4190_csv.zip` |
| 2022-11-15 | yes | 01:00–24:00 (24) | 19536 | `batch6/np4-190-cd__inst10_20221114_876700070_DAMSPNP4190_csv.zip` |
| 2022-12-17 | yes | 01:00–24:00 (24) | 19704 | `batch4/np4-190-cd__inst5_20221216_883319168_DAMSPNP4190_csv.zip` |
| 2023-01-15 | yes | 01:00–24:00 (24) | 19632 | `batch6/np4-190-cd__inst3_20230114_889403190_DAMSPNP4190_csv.zip` |
| 2023-01-17 | yes | 01:00–24:00 (24) | 19632 | `batch4/np4-190-cd__inst6_20230116_889808030_DAMSPNP4190_csv.zip` |
| 2023-02-15 | yes | 01:00–24:00 (24) | 19776 | `batch6/np4-190-cd__inst11_20230214_896008634_DAMSPNP4190_csv.zip` |
| 2023-03-17 | yes | 01:00–24:00 (24) | 19800 | `batch4/np4-190-cd__inst7_20230316_902478925_DAMSPNP4190_csv.zip` |
| 2023-04-15 | yes | 01:00–24:00 (24) | 19944 | `batch6/np4-190-cd__inst4_20230414_908799936_DAMSPNP4190_csv.zip` |
| 2023-05-15 | yes | 01:00–24:00 (24) | 20088 | `batch6/np4-190-cd__inst12_20230514_915418450_DAMSPNP4190_csv.zip` |
| 2023-06-14 | yes | 01:00–24:00 (24) | 20472 | `batch8/np4-190-cd__inst4_20230613_922210881_DAMSPNP4190_csv.zip` |
| 2023-06-15 | yes | 01:00–24:00 (24) | 20472 | `batch8/np4-190-cd__inst2_20230614_922440865_DAMSPNP4190_csv.zip` |
| 2023-06-16 | yes | 01:00–24:00 (24) | 20472 | `batch3/np4-190-cd__inst7_20230615_922670819_DAMSPNP4190_csv.zip` |
| 2023-07-15 | yes | 01:00–24:00 (24) | 20424 | `batch6/np4-190-cd__inst13_20230714_929271813_DAMSPNP4190_csv.zip` |
| 2023-08-17 | yes | 01:00–24:00 (24) | 20448 | `batch4/np4-190-cd__inst8_20230816_936965305_DAMSPNP4190_csv.zip` |
| 2023-09-15 | yes | 01:00–24:00 (24) | 20616 | `batch7/np4-190-cd__inst3_20230914_943814264_DAMSPNP4190_csv.zip` |
| 2023-09-16 | yes | 01:00–24:00 (24) | 20616 | `batch7/np4-190-cd__inst7_20230915_944048824_DAMSPNP4190_csv.zip` |
| 2023-10-15 | yes | 01:00–24:00 (24) | 20832 | `batch7/np4-190-cd__inst4_20231014_950846495_DAMSPNP4190_csv.zip` |
| 2023-10-16 | yes | 01:00–24:00 (24) | 20832 | `batch7/np4-190-cd__inst8_20231015_951071094_DAMSPNP4190_csv.zip` |
| 2023-11-15 | yes | 01:00–24:00 (24) | 21048 | `batch7/np4-190-cd__inst9_20231114_958212331_DAMSPNP4190_csv.zip` |
| 2023-12-15 | yes | 01:00–24:00 (24) | 21168 | `batch4/np4-190-cd__inst9_20231214_965447681_DAMSPNP4190_csv.zip` |
| 2024-01-15 | yes | 01:00–24:00 (24) | 21240 | `batch6/np4-190-cd__inst14_20240114_973099207_DAMSPNP4190_csv.zip` |
| 2024-02-15 | yes | 01:00–24:00 (24) | 21312 | `batch7/np4-190-cd__inst10_20240214_980871702_DAMSPNP4190_csv.zip` |
| 2024-03-17 | yes | 01:00–24:00 (24) | 21504 | `batch4/np4-190-cd__inst10_20240316_988639722_DAMSPNP4190_csv.zip` |
| 2024-04-15 | yes | 01:00–24:00 (24) | 21600 | `batch8/np4-190-cd__inst5_20240414_995993477_DAMSPNP4190_csv.zip` |
| 2024-05-15 | yes | 01:00–24:00 (24) | 21792 | `batch8/np4-190-cd__inst10_20240514_1003768678_DAMSPNP4190_csv.zip` |
| 2024-06-15 | yes | 01:00–24:00 (24) | 21960 | `batch7/np4-190-cd__inst11_20240614_1011809802_DAMSPNP4190_csv.zip` |
| 2024-07-17 | yes | 01:00–24:00 (24) | 21816 | `batch4/np4-190-cd__inst11_20240716_1020166966_DAMSPNP4190_csv.zip` |
| 2024-08-15 | yes | 01:00–24:00 (24) | 21960 | `batch7/np4-190-cd__inst12_20240814_1027771043_DAMSPNP4190_csv.zip` |
| 2024-09-15 | yes | 01:00–24:00 (24) | 22320 | `batch8/np4-190-cd__inst6_20240914_1036020038_DAMSPNP4190_csv.zip` |
| 2024-10-15 | yes | 01:00–24:00 (24) | 22488 | `batch8/np4-190-cd__inst11_20241014_1044071870_DAMSPNP4190_csv.zip` |
| 2024-11-16 | yes | 01:00–24:00 (24) | 22656 | `batch4/np4-190-cd__inst12_20241115_1052688105_DAMSPNP4190_csv.zip` |
| 2024-12-15 | yes | 01:00–24:00 (24) | 22800 | `batch8/np4-190-cd__inst7_20241214_1060611912_DAMSPNP4190_csv.zip` |
| 2025-01-15 | yes | 01:00–24:00 (24) | 23184 | `batch8/np4-190-cd__inst12_20250114_1069109760_DAMSPNP4190_csv.zip` |
| 2025-02-15 | yes | 01:00–24:00 (24) | 23352 | `batch8/np4-190-cd__inst8_20250214_1077745007_DAMSPNP4190_csv.zip` |
| 2025-04-16 | yes | 01:00–24:00 (24) | 23712 | `batch4/np4-190-cd__inst13_20250415_1094526170_DAMSPNP4190_csv.zip` |
| 2025-05-15 | yes | 01:00–24:00 (24) | 24072 | `batch8/np4-190-cd__inst9_20250514_1102852065_DAMSPNP4190_csv.zip` |
| 2025-09-16 | yes | 01:00–24:00 (24) | 25128 | `batch4/np4-190-cd__inst14_20250915_1140793955_DAMSPNP4190_csv.zip` |

## NP6-905-CD

72 price zips. Parse errors reported by the validator: 169. Those errors stay on the rows; they are not dropped from this date list when a row still parsed.

| Delivery date | In campaign era | Hour endings | Observations | Zips |
| --- | --- | --- | --- | --- |
| 2021-02-09 | yes | 14:1, 3:2 | 1450 | `batch2/np6-905-cd__inst2_20210209_757717538_SPPHLZNP6905_20210209_0230_csv.zip`, `batch3/np6-905-cd__inst1_20210209_757800273_SPPHLZNP6905_20210209_1315_csv.zip` |
| 2021-02-11 | yes | 12:3 | 726 | `batch3/np6-905-cd__inst2_20210211_758130553_SPPHLZNP6905_20210211_1145_csv.zip` |
| 2021-02-13 | yes | 12:3 | 726 | `batch3/np6-905-cd__inst3_20210213_758461769_SPPHLZNP6905_20210213_1145_csv.zip` |
| 2021-02-15 | yes | 12:3 | 726 | `batch3/np6-905-cd__inst4_20210215_758785321_SPPHLZNP6905_20210215_1145_csv.zip` |
| 2021-02-17 | yes | 12:3 | 726 | `batch3/np6-905-cd__inst5_20210217_759129410_SPPHLZNP6905_20210217_1145_csv.zip` |
| 2021-02-19 | yes | 6:3, 6:4 | 1452 | `batch3/np6-905-cd__inst6_20210219_759417965_SPPHLZNP6905_20210219_0600_csv.zip`, `batch5/np6-905-cd__inst1_20210219_759415177_SPPHLZNP6905_20210219_0545_csv.zip` |
| 2021-04-15 | yes | 12:3, 12:4 | 1486 | `batch5/np6-905-cd__inst2_20210415_768651349_SPPHLZNP6905_20210415_1145_csv.zip`, `batch6/np6-905-cd__inst2_20210415_768652939_SPPHLZNP6905_20210415_1200_csv.zip` |
| 2021-05-19 | yes | 5:2 | 747 | `batch5/np6-905-cd__inst4_20210519_774460998_SPPHLZNP6905_20210519_0430_csv.zip` |
| 2021-06-20 | yes | 12:3 | 752 | `batch4/np6-905-cd__inst10_20210620_780039888_SPPHLZNP6905_20210620_1145_csv.zip` |
| 2021-07-20 | yes | 17:2 | 758 | `batch5/np6-905-cd__inst5_20210720_785365684_SPPHLZNP6905_20210720_1630_csv.zip` |
| 2021-09-01 | yes | 12:3 | 767 | `batch4/np6-905-cd__inst9_20210901_793006546_SPPHLZNP6905_20210901_1145_csv.zip` |
| 2021-10-11 | yes | 24:4 | 774 | `batch5/np6-905-cd__inst6_20211012_800246894_SPPHLZNP6905_20211012_0000_csv.zip` |
| 2021-12-13 | yes | 11:4 | 781 | `batch5/np6-905-cd__inst7_20211213_811491049_SPPHLZNP6905_20211213_1100_csv.zip` |
| 2022-01-15 | yes | 12:3 | 781 | `batch5/np6-905-cd__inst3_20220115_817499214_SPPHLZNP6905_20220115_1145_csv.zip` |
| 2022-05-08 | yes | 12:3 | 808 | `batch6/np6-905-cd__inst7_20220508_838433812_SPPHLZNP6905_20220508_1145_csv.zip` |
| 2022-06-20 | yes | 12:3 | 813 | `batch4/np6-905-cd__inst8_20220620_846902783_SPPHLZNP6905_20220620_1145_csv.zip` |
| 2022-07-15 | yes | 12:3 | 811 | `batch6/np6-905-cd__inst1_20220715_851917168_SPPHLZNP6905_20220715_1145_csv.zip` |
| 2022-08-20 | yes | 12:3 | 813 | `batch7/np6-905-cd__inst10_20220820_859152746_SPPHLZNP6905_20220820_1145_csv.zip` |
| 2022-08-28 | yes | 12:3 | 813 | `batch6/np6-905-cd__inst5_20220828_860746717_SPPHLZNP6905_20220828_1145_csv.zip` |
| 2022-10-01 | yes | 12:3 | 817 | `batch4/np6-905-cd__inst7_20221001_867649897_SPPHLZNP6905_20221001_1145_csv.zip` |
| 2022-10-11 | yes | 12:3 | 819 | `batch7/np6-905-cd__inst9_20221011_869702031_SPPHLZNP6905_20221011_1145_csv.zip` |
| 2022-10-21 | yes | 12:3 | 819 | `batch7/np6-905-cd__inst8_20221021_871747934_SPPHLZNP6905_20221021_1145_csv.zip` |
| 2022-11-03 | yes | 12:3 | 827 | `batch7/np6-905-cd__inst7_20221103_874412523_SPPHLZNP6905_20221103_1145_csv.zip` |
| 2022-11-14 | yes | 12:3 | 827 | `batch7/np6-905-cd__inst2_20221114_876693618_SPPHLZNP6905_20221114_1145_csv.zip` |
| 2022-11-15 | yes | 12:3, 12:4 | 1654 | `batch7/np6-905-cd__inst1_20221115_876906627_SPPHLZNP6905_20221115_1145_csv.zip`, `batch7/np6-905-cd__inst6_20221115_876908682_SPPHLZNP6905_20221115_1200_csv.zip` |
| 2022-11-16 | yes | 12:3 | 827 | `batch7/np6-905-cd__inst3_20221116_877116040_SPPHLZNP6905_20221116_1145_csv.zip` |
| 2022-11-17 | yes | 12:3 | 827 | `batch7/np6-905-cd__inst4_20221117_877324251_SPPHLZNP6905_20221117_1145_csv.zip` |
| 2022-11-18 | yes | 12:3 | 827 | `batch7/np6-905-cd__inst5_20221118_877531745_SPPHLZNP6905_20221118_1145_csv.zip` |
| 2022-11-21 | yes | 12:3 | 827 | `batch6/np6-905-cd__inst6_20221121_878136884_SPPHLZNP6905_20221121_1145_csv.zip` |
| 2023-01-15 | yes | 12:3 | 831 | `batch6/np6-905-cd__inst3_20230115_889599083_SPPHLZNP6905_20230115_1145_csv.zip` |
| 2023-02-14 | yes | 12:3 | 837 | `batch4/np6-905-cd__inst6_20230214_895996716_SPPHLZNP6905_20230214_1145_csv.zip` |
| 2023-02-23 | yes | 12:3 | 837 | `batch7/np6-905-cd__inst11_20230223_897926418_SPPHLZNP6905_20230223_1145_csv.zip` |
| 2023-04-11 | yes | 12:3 | 840 | `batch6/np6-905-cd__inst4_20230411_908142435_SPPHLZNP6905_20230411_1145_csv.zip` |
| 2023-04-15 | yes | 12:3 | 844 | `batch6/np6-905-cd__inst11_20230415_909008794_SPPHLZNP6905_20230415_1145_csv.zip` |
| 2023-06-07 | yes | 12:3 | 866 | `batch7/np6-905-cd__inst12_20230607_920842188_SPPHLZNP6905_20230607_1145_csv.zip` |
| 2023-07-09 | yes | 12:3 | 863 | `batch6/np6-905-cd__inst8_20230709_928108758_SPPHLZNP6905_20230709_1145_csv.zip` |
| 2023-08-20 | yes | 12:3 | 864 | `batch4/np6-905-cd__inst5_20230820_937884071_SPPHLZNP6905_20230820_1145_csv.zip` |
| 2023-09-28 | yes | 12:3 | 871 | `batch6/np6-905-cd__inst9_20230928_947107104_SPPHLZNP6905_20230928_1145_csv.zip` |
| 2023-10-04 | yes | 12:3 | 880 | `batch8/np6-905-cd__inst9_20231004_948509536_SPPHLZNP6905_20231004_1145_csv.zip` |
| 2023-10-05 | yes | 12:3 | 880 | `batch8/np6-905-cd__inst8_20231005_948745148_SPPHLZNP6905_20231005_1145_csv.zip` |
| 2023-10-14 | yes | 12:3, 12:4, 24:4 | 2640 | `batch8/np6-905-cd__inst17_20231015_950949179_SPPHLZNP6905_20231015_0000_csv.zip`, `batch8/np6-905-cd__inst19_20231014_950839049_SPPHLZNP6905_20231014_1145_csv.zip`, `batch8/np6-905-cd__inst20_20231014_950841377_SPPHLZNP6905_20231014_1200_csv.zip` |
| 2023-10-15 | yes | 12:3, 12:4, 17:3, 24:3, 7:3 | 4400 | `batch8/np6-905-cd__inst13_20231015_951063935_SPPHLZNP6905_20231015_1145_csv.zip`, `batch8/np6-905-cd__inst14_20231015_951066597_SPPHLZNP6905_20231015_1200_csv.zip`, `batch8/np6-905-cd__inst15_20231015_951013077_SPPHLZNP6905_20231015_0645_csv.zip`, `batch8/np6-905-cd__inst16_20231015_951109856_SPPHLZNP6905_20231015_1645_csv.zip`, `batch8/np6-905-cd__inst18_20231015_951171010_SPPHLZNP6905_20231015_2345_csv.zip` |
| 2023-10-16 | yes | 10:2, 12:3, 12:4, 17:2, 17:3, 17:4, 24:2, 24:3 | 7040 | `batch8/np6-905-cd__inst12_20231016_951349800_SPPHLZNP6905_20231016_1700_csv.zip`, `batch8/np6-905-cd__inst1_20231016_951298480_SPPHLZNP6905_20231016_1145_csv.zip`, `batch8/np6-905-cd__inst2_20231016_951300953_SPPHLZNP6905_20231016_1200_csv.zip`, `batch8/np6-905-cd__inst3_20231016_951347463_SPPHLZNP6905_20231016_1645_csv.zip`, `batch8/np6-905-cd__inst4_20231016_951412251_SPPHLZNP6905_20231016_2345_csv.zip`, `batch8/np6-905-cd__inst5_20231016_951410364_SPPHLZNP6905_20231016_2330_csv.zip`, `batch8/np6-905-cd__inst6_20231016_951343893_SPPHLZNP6905_20231016_1630_csv.zip`, `batch8/np6-905-cd__inst7_20231016_951271256_SPPHLZNP6905_20231016_0930_csv.zip` |
| 2023-10-29 | yes | 12:3 | 880 | `batch8/np6-905-cd__inst11_20231029_954382592_SPPHLZNP6905_20231029_1145_csv.zip` |
| 2023-11-11 | yes | 12:3 | 889 | `batch8/np6-905-cd__inst10_20231111_957482934_SPPHLZNP6905_20231111_1145_csv.zip` |
| 2024-01-12 | yes | 12:3 | 897 | `batch6/np6-905-cd__inst10_20240112_972598466_SPPHLZNP6905_20240112_1145_csv.zip` |
| 2024-03-05 | yes | 12:3 | 908 | `batch4/np6-905-cd__inst4_20240305_985866907_SPPHLZNP6905_20240305_1145_csv.zip` |
| 2024-06-15 | yes | 12:3 | 927 | `batch4/np6-905-cd__inst3_20240615_1012057209_SPPHLZNP6905_20240615_1145_csv.zip` |
| 2025-02-10 | yes | 12:3 | 985 | `batch4/np6-905-cd__inst2_20250210_1076607155_SPPHLZNP6905_20250210_1145_csv.zip` |
| 2025-02-16 | yes | 19:4 | 985 | `batch2/np6-905-cd__inst6_20250216_1078358046_SPPHLZNP6905_20250216_1900_csv.zip` |
| 2025-03-15 | yes | 12:3 | 993 | `batch4/np6-905-cd__inst1_20250315_1085818452_SPPHLZNP6905_20250315_1145_csv.zip` |
| 2025-12-15 | yes | 22:2 | 1089 | `batch2/np6-905-cd__inst1_20251215_1171744358_SPPHLZNP6905_20251215_2130_csv.zip` |
| 2025-12-31 | yes | 24:1, 24:2, 24:3 | 3267 | `batch2/np6-905-cd__inst3_20251231_1177533089_SPPHLZNP6905_20251231_2345_csv.zip`, `batch2/np6-905-cd__inst4_20251231_1177529812_SPPHLZNP6905_20251231_2330_csv.zip`, `batch2/np6-905-cd__inst5_20251231_1177524979_SPPHLZNP6905_20251231_2315_csv.zip` |

## EMPTY GATE — live From/To

The latest retain recorded no new live `deliveryDateFrom` / `deliveryDateTo` day with `totalRecords` 0. A retained archive file is not a live From/To fill.

Earlier live From/To days 2021-04-15, 2022-07-15, 2022-11-15, 2023-01-15, 2023-04-15, 2023-10-15 now have archive CSV delivery dates in the retained zips. Those files are samples. A real-time file is still one interval. They are not proxy `covered_local_dates`, and this list does not say the live endpoint started returning rows.

## ER ABSENT GATE

- NP4-180-ER is `absent_from_public_reports_catalog`. No Public API path is invented here.
- NP6-785-ER is `absent_from_public_reports_catalog`. No Public API path is invented here.
