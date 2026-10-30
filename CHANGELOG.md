# Changelog

Versions are **major.minor**. Each release is tagged in git (`v1.0`, `v1.1`, …), and the version shows next to the title in the tool and in Help.

## v1.3 — 2026-10-30

- Highlight a block of rows (click, then Shift-click; Ctrl/⌘-click for single rows; Shift+arrows; Ctrl/⌘+A) and use the new **Select highlighted** / **Deselect highlighted** buttons, or Space, on all of them at once.

## v1.2 — 2026-10-30

- **Undo / Redo** for every selection change (Ctrl+Z / Ctrl+Y, and toolbar buttons).
- **Keyboard control** of the list: ↓ from the filter box jumps in, arrows / PgUp / PgDn / Home / End move, Space ticks or unticks, Enter opens details. Ctrl+O opens a file.
- **Recent files** on the start screen (Chrome and Edge), reopened with one click.
- **Explorer view** in the left pane: the DeltaV Explorer layout rebuilt from the export (Library categories, Control Strategies by area / cell / unit, controllers with their assigned modules, Recipes, Setup). Folders filter the list and select or deselect everything under them.
- **Compare…** two exports: only in A, only in B, changed, identical (ignoring user/time stamps). Select any group in the list, or **save a combined file** from both.

## v1.1 — 2026-10-30

- List columns can be resized by dragging the edge of a column heading. Widths are remembered; double-click a heading edge to reset them.
- Removed the **Only shown** button. Use **None** in the left pane, then **Select shown**.

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
