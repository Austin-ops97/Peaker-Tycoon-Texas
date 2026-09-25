# Peaker Tycoon Texas — Cursor companion (Phase 0)

This checklist points at Build Spec v3 section numbers. If this file and the spec disagree, the spec wins (§31.1). Update this file rather than silently overriding the spec.

Platform note: Release 1 is an iPhone app. That is an Austin override of §1 and §28.2 (desktop browser, Web Worker, IndexedDB). The determinism rules in §24 still apply. The kernel does not import SwiftUI or UIKit.

## Phase 0 (§27.1) — not exited

The exit gate is `five_year_coverage_gate` and `campaign_chronology` passing, with the manifest published in-repo. The manifest path exists. The gates fail because coverage is not ingested. Phase 1 gameplay stays unbuilt (§31.2 build order).

| Item | Spec | Where |
| --- | --- | --- |
| Ingestion stages: fetch, retain SHA-256, normalize, validate, reconcile, publish | §5.2 | `Sources/PeakerData/Ingestion/Pipeline.swift` |
| Do not invent API paths | §5.1, §31.2 | `LiveFetch` refuses an unpinned path and does not call the network |
| Observation fields and quality rules | §5.2, §5.3 | `NormalizedObservation`, `ObservationValidator` |
| Pack manifest fields | §5.3 | `CoverageManifest`, `Schemas/phase0/coverage-manifest.schema.json` |
| Published manifest | §27.1 | `Data/packs/TX_GAME_ENERGY_V1/coverage-manifest.json` |
| Fictional sites, no resource-node IDs | §6 | `Config/proxy-sites.json` |
| Proxy formula, weights sum to 1, no mid-stream renormalize | §6.2, §6.3 | `ProxyPrice` |
| Continuous era | §2.1, §26.3 | `CampaignCalendar` |
| `campaign_chronology` | §26.3 | `Tests/PeakerGateTests` (fails until the pack lists the era) |
| `five_year_coverage_gate` | §26.3, §29.2 | `Tests/PeakerGateTests` (fails on this stub) |
| TX_TRAIN_2019_2020, retire at 90 completed days | §2.1, §7 | `Data/archives/TX_TRAIN_2019_2020`, `BootstrapPolicy` |
| Seeded sub-streams | §24.3 | `RNGRegistry.documentedSubstreams` |
| Save schema, reject v2, replay from seed + input log | §24.1, §24.4 | `SaveSchema`, `Replay` |
| GAME default version | reading precedence | `Config/GAME_DEFAULTS.md` |
| JSON schemas for Phase 0 entities | §25.3 | `Schemas/phase0` |
| No player trading loop | §27.1, §27.2 | Shell is placeholder only |

## Placeholder navigation (later binding order)

Frozen at four tabs: Desk, Fuel, Plant, Settle. No fifth tab. No role switcher (§15 and §22.2 are Phase 3b). Design inventory: `Design/Peaker-Tycoon-Texas/01-phone-first-screen-inventory-v1.md`.

## Not this phase

§9 offers, §10 settlement, §12 plant physics, §15 role firewalls, §22 Lens, Fund II, regulation screens, graphics system, ancillary-service revenue (§20, §28.2).
