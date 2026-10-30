# ProcessFHX 3

A tool for removing unwanted content from DeltaV `.fhx` exports. Typical use: you export a few equipment module classes or modules from DeltaV. The export also pulls in library composites, function block templates, named sets and other classes. ProcessFHX 3 lets you keep only what you want to import, and tells you what the kept items still depend on.

It replaces ProcessFHX2 (2013).

## Opening the tool

1. Double-click `ProcessFHX3.html`. It opens in your web browser.
2. Drag an `.fhx` file onto the page, or click **Open FHX…**.

Nothing to install, no internet needed, and nothing is uploaded: the file is read and processed on your computer.

**Browsers:** Chrome or Edge are recommended, on Windows or Mac. They give you a proper **Save as** dialog. Safari and Firefox work too, but saved files go straight to Downloads. Internet Explorer does not work.

## Cleaning an export

1. **Open the export.** Everything starts as selected (kept).
2. **Choose what to keep:**
   - **Left pane:** each group's checkbox selects or deselects the whole group. **Select all** / **None** at the top select or deselect everything in the file.
   - **Main list:** tick or untick single items. Shift-click selects or deselects a range. The checkbox at the top of the list selects or deselects everything currently shown.
   - **Filter box:** type to narrow the list (by name, tag, category, plant area, class or user). Then use **Select shown**, **Deselect shown** or **Only shown**, which selects what's shown and deselects everything else.
   - Click a group name in the left pane to show only that group.
3. **Check the Export check tab** (right-hand panel, also the badge at the bottom). It lists everything your kept items reference but you've excluded. Those items must already exist in the target database, or the import will fail. Use **Include** to add any you need.
4. **Save clean FHX…** (or Ctrl/⌘+S). The file is saved as `<name>_clean.fhx` by default.

The original file is never changed.

### A common recipe: keep just the EM classes

1. Click **None** at the top of the left pane.
2. Tick **Equipment module classes**, or tick only the classes you want.
3. Open **Export check** to see which library items (control module classes, composites, named sets…) they need. Leave them out if the target system already has them.
4. Save.

## What you see

### Groups in the left pane

| Group | What it contains |
|---|---|
| Equipment module classes / Control module classes | `MODULE_CLASS` items, split by kind |
| Phase classes | `BATCH_EQUIPMENT_PHASE_CLASS` |
| Equipment modules / Control modules | Module instances, split by the kind of their class |
| Composites / FB definitions | Library composites (`FUNCTION_BLOCK_DEFINITION`) |
| Embedded composites & logic | Hidden `__XXXXXXXX_XXXXXXXX__` definitions (see below) |
| Function block templates, Named sets, Plant areas, … | Everything else, by type |
| Schema, Locale | Always kept. DeltaV needs them to import the file |

A class counts as an **equipment module (EM)** when DeltaV files it under `Equipment Module Classes`, or when it uses a command-driven or state-driven algorithm. Otherwise it is a **control module (CM)**. Modules take their kind from their class. Each module in the list carries a small **EM** or **CM** tag.

### Embedded composites (hidden definitions)

DeltaV exports the private logic inside a class or module (command and state logic, SFC steps, embedded composites) as separate items with meaningless names like `__6AE35725_FA2A0519__`.

ProcessFHX 3 labels each one with the block that uses it, for example **EM01-00 › COMMAND_00002**. You don't select these yourself:

- They are **kept automatically** when the class or module that uses them is kept, including nested ones.
- They are **dropped automatically** when it is dropped.

Tick **Show embedded composites** in the toolbar to list them. Typing a class name in the filter, e.g. `EM01-00`, also finds its embedded composites.

To keep every hidden definition whatever its owner (the old ProcessFHX2 behaviour), turn that on at the bottom of **Export check**.

### Details panel

Click any item to see:

- **Properties**
- **Uses:** what it references, with an **Include N missing** button.
- **Embedded composites & logic:** what it carries along.
- **Used by:** what references it.
- **FHX text:** its raw FHX.

Click any name in the panel to jump to that item.

## Saving

**Save clean FHX…** writes the kept items **exactly** as they appear in the source file: same encoding (UTF-16), same line endings, same text.

The save dialog shows **What's being removed**, listed by group with names (for example "Equipment module classes: 1 of 4 — EM_STATE_16"). Read it before you press Save: it is the easiest place to spot something dropped by accident. It also repeats the Export check warning if kept items reference things you've excluded.

Options in the save dialog:

- **Also save the removed items** to `<name>_removed.fhx`.
- **Change the `user=`** on every saved item to a name you choose.

### Automatic check after saving

After every save, ProcessFHX 3 re-reads the file it just wrote and confirms that:

- it parses cleanly
- it holds exactly the items you selected, in order
- each item is byte-for-byte identical to the source (apart from `user=` if you chose to change it)
- the encoding is unchanged, and SCHEMA and LOCALE are present

When it passes, **✓ Verified &lt;file name&gt;** appears at the bottom of the window. Hover over it for the details. If it ever fails, you get a message listing what's wrong. Don't import that file.

The check proves the file is a faithful, well-formed subset of your export. It can't prove DeltaV will accept it: that also depends on what already exists in the target database (see Export check). Importing into a test database first is still the safest route.

**Report CSV** saves a spreadsheet of every item, showing whether it is included and why, its kind, the blocks that use each embedded composite, and anything it references that isn't included.

## Saved selections (optional)

Use this when you clean the same kind of export again and again. It saves your selection as a short rule file that you can re-apply to the next export.

1. Set up your selection, then **Saved selections… → Rules from current selection**.
2. **Save as .prc…**
3. Next time: open the new export, then **Saved selections… → Load .prc… → Apply**.

You can also tick **Apply these rules automatically whenever a file is opened**.

The format is the same `.prc` format ProcessFHX2 used, so older rule files work too.

The [`Examples`](Examples) folder has ready-made rule files to load or copy:

| File | What it does |
|---|---|
| `Keep_EM_Classes.prc` | Keeps only the equipment module classes |
| `Keep_Named_Classes.prc` | Keeps classes whose name matches a pattern (edit the pattern) |
| `Keep_Unit_Modules.prc` | Keeps the modules in one unit or plant area (edit the name) |
| `Drop_Library_Items.prc` | Keeps everything except FB templates, named sets, library composites and control module classes |

### Rule syntax

One rule per line, run top to bottom. Lines starting with `#` are comments.

| Rule | Meaning |
|---|---|
| `SELECT_ALL` / `SELECT_NONE` | Select or deselect everything |
| `FIELD = <text>,<True\|False>,<Select\|Deselect>` | Exact match. The middle value is *case sensitive* |
| `FIELD Contains <text>,…` | Text contains |
| `FIELD Matches <regex>,…` | Regular expression |
| `REQD_FBS` | Also keep the function block definitions and templates that kept items use |
| `REQD_ALL` | Also keep everything kept items reference, recursively |

`FIELD` is one of `CATEGORY`, `NAME`, `TAG`, `TYPE`, `USER`, `PLANT_AREA` or `CLASS`.

Example: keep two EM classes and nothing else.

```
SELECT_NONE
NAME Matches <^EM0[13]-00$>,<True>,<Select>
```

## Other tips

- **Theme** button (top right): Auto, Light or Dark.
- **Resize the left pane** by dragging its right edge. Double-click the edge to reset it.
- Keyboard: `/` jumps to the filter, Ctrl/⌘+S saves.
- You can drop a `.prc` file onto the page as well as an `.fhx`.
- Large exports are fine: a 700 MB full-system export opens in a few seconds.
- Your theme, pane width and saved rules are remembered per browser. They don't carry over to another browser or PC.
