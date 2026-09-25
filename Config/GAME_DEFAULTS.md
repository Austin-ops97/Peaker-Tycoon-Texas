# GAME defaults versioning

Build Spec v3, reading precedence: a versioned configuration implements the rules. Changing a default requires a configuration version and a migration note.

| Field | Version | Evidence | Spec |
| --- | --- | --- | --- |
| Campaign era 2021-02-01 through 2025-12-31, continuous days | 3.0.0 | GAME era selection. Prices inside a future pack are SOURCE only when that pack says so. | §2.1 |
| Bootstrap retirement at 90 completed campaign days | 3.0.0 | GAME | §2.1, §7 |
| Area basket weights 0.50 / 0.30 / 0.20 | 3.0.0 | GAME | §6.2 |
| Morning brief display anchor 08:00 CT | 3.0.0 | GAME placeholder. Not a publication time. | §8 |
| Presentation speeds pause, 1×, 8×, 32×, until next decision | 3.0.0 | GAME. Speed does not change kernel resolution. | §8 |

`Config/game-defaults.json` is the checked-in note for version 3.0.0. The kernel constants live in `GameDefaults`.
