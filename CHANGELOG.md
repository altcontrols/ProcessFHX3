# Changelog

Versions are **major.minor**. Each release is tagged in git (`v1.0`, `v1.1`, …), and the version shows next to the title in the tool and in Help.

## v1.0 — 2026-10-30

First release.

- Opens DeltaV `.fhx` exports in the browser, including 700 MB full-system exports, and saves the kept items byte-for-byte with the same encoding.
- Groups items by kind: equipment module classes and control module classes, phase classes, equipment modules and control modules, composites, and the rest by type.
- Labels embedded composites (hidden `__XXXX__` definitions) with the block that uses them, and keeps or drops them with their owner. Manual mode lets you choose them yourself.
- Select all / None, group checkboxes, filtering, and an All / Selected / Removed review.
- Export check lists referenced items you've excluded.
- Save dialog shows what's being removed. Every save is re-read and verified automatically.
- Remembers the last save folder, with an optional fixed output folder (Chrome and Edge).
- Saved selections (`.prc` rules, compatible with ProcessFHX2), with examples.
- Report CSV, light and dark themes, resizable left pane.
