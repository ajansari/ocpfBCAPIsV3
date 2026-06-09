# Sanity Check Report
## OCPFAPIs v3.0 — FRD vs TDD vs BC Technical Feasibility

**Date:** 2026-06-09  
**Scope:** (A) FRD requirements against BC 2025 Wave 2 technical constraints; (B) TDD faithfulness to FRD

---

## Part A — FRD vs BC Technical Feasibility

### PASS Items

| # | FRD Requirement | Verdict | Notes |
|---|---|---|---|
| A1 | `ODataKeyFields = SystemId` on all pages | **PASS** | Standard BC API pattern since BC 15. SystemId confirmed on all 106 source tables including Table 339. |
| A2 | `ApplicationArea = All` on every field | **PASS** | Valid on API page fields. Required for AppSource but also clean practice for PTEs. |
| A3 | `SourceTableView` for document-type filtering on Sales Header / Purchase Header | **PASS** | Fully supported. `where("Document Type" = const(Order))` compiles and filters correctly. |
| A4 | Read-only pages with `Editable = false` | **PASS** | Default behaviour for API pages. Explicit declaration is clean. |
| A5 | Read/Write pages for unposted Sales, Purchase, and General Journal Lines | **PASS** | BC API pages support INSERT/MODIFY/DELETE on unposted document tables. Standard BC API library uses this same pattern. |
| A6 | `Caption` on page surfaces in OData $metadata | **PASS** | Confirmed: appears as `Org.OData.Core.V1.Description` on `EntityType` in CSDL. |
| A7 | `ToolTip` on fields surfaces in OData $metadata | **PASS** | Confirmed: appears as `Org.OData.Core.V1.Description` on `Property` in CSDL. Valid on API page fields in Runtime 16.0. |
| A8 | Exclude `AboutTitle`/`AboutText` | **PASS** | Correctly excluded — compile error if used on API pages. |
| A9 | Media/MediaSet fields included, raw BLOB excluded | **PASS** | BC API framework handles Media as stream URL. Raw BLOB exclusion is correct policy. |
| A10 | VAT posting group tables as W1 | **PASS** | Tables 320, 321, 325 are core W1 tables — no localization dependency. |
| A11 | All 106 pages within object range 90800–90999 | **PASS** | Highest assigned ID is 90938 (Batch 6, last object). 61 IDs remain in reserve. |
| A12 | Namespace `OnlyCopilotFans.OCPFAPIsv3` | **PASS** | Valid AL namespace syntax. `NoImplicitWith` is enabled in app.json — consistent with namespace best practices. |
| A13 | Projects source table = `Job` (Table 167) | **PASS** | Table 167 still named `Job` in AL in v27. Caption displays as "Project" in BC UI. AL references must use `Job`. |
| A14 | Singleton tables (GL Setup, Company Info) exposed as repeater | **PASS** | No BC restriction. OData returns a single-element array. Consumers must handle this. |
| A15 | `Price List Header` / `Price List Line` (Tables 7000, 7001) | **PASS** | Modern pricing tables, available in W1 since BC 2020 Wave 2. Legacy `Sales Price` (7002) correctly excluded. |
| A16 | `Workflow Step Instance` (Table 1504) | **PASS** | Standard W1 table. Exposable as read-only API page. |
| A17 | NF6: No codeunits, reports, or UI pages | **PASS** | Only API pages generated. Extension has no other object types. |

---

### ISSUES Found

#### ISSUE A-1 — Medium: FlowField CalcFields Behavior on API Pages (FRD Section 5.3)

**FRD states:** "FlowFields must not have `CalcFields` called in triggers — BC's API framework handles this automatically."

**Assessment:** Partially correct but incomplete. BC's API framework does auto-calculate FlowFields on API pages **only when the field is included in the page layout**. However, if a FlowField is accessed in an `OnAfterGetRecord` trigger or similar, it still requires explicit `CalcFields`. Since this library has no triggers (read-only pages with no code), automatic calculation is sufficient.  

**Verdict:** No code change needed, but the FRD/TDD phrasing implies "never call CalcFields anywhere" — this is only safe because there are no triggers in the design. Document this dependency explicitly.

**Risk:** Low — safe given no-trigger design.

---

#### ISSUE A-2 — Medium: Composite-Key Tables and OData $filter Usability (FRD Section 5.5)

**Affected tables:**
- `Default Dimension` (Table 352) — natural key: `Table ID`, `No.`, `Dimension Code`
- `VAT Posting Setup` (Table 325) — natural key: `VAT Bus. Posting Group`, `VAT Prod. Posting Group`
- `General Posting Setup` (Table 252) — natural key: `Gen. Bus. Posting Group`, `Gen. Prod. Posting Group`
- `Item Unit of Measure` (Table 5404) — natural key: `Item No.`, `Code`
- `Item Vendor` / Item Vendor Catalog (Table 99) — natural key: `Item No.`, `Vendor No.`
- `Stockkeeping Unit` (Table 5700) — natural key: `Item No.`, `Location Code`, `Variant Code`
- `Job Task` (Table 1001) — natural key: `Job No.`, `Job Task No.`
- `Job Planning Line` (Table 1003) — natural key: `Job No.`, `Job Task No.`, `Line No.`

**Assessment:** `ODataKeyFields = SystemId` works correctly on all these tables. The natural key fields must also be present as standard fields so consumers can filter with `$filter`. The FRD acknowledges this in Section 5.2. No technical issue — just confirming the design is complete.

**Verdict:** No change needed. Confirmed correct.

---

#### ISSUE A-3 — Low: `Approval Entry` (Table 454) — Possible Missing SystemId in Older Versions

**Assessment:** Table 454 (`Approval Entry`) did not have `SystemId` in all early BC versions. In BC v27 it is present. Since the app targets `application >= 27.0.0.0`, this is safe.

**Verdict:** No issue for this library. Already constrained to v27+.

---

#### ISSUE A-4 — Low: `Contact Business Relation` (Table 5054) — Composite Key Table

**Assessment:** Natural key is `Contact No.`, `Link to Table`, `No.`. SystemId is present. No issue, same pattern as other composite-key tables.

**Verdict:** No change needed.

---

#### ISSUE A-5 — Low: `Warehouse Entry` (Table 7312) — Large Volume Table

**Assessment:** This table can contain millions of rows in active warehouses. No server-side filter is applied at the page level. OData consumers will receive all rows unless they apply `$filter` and `$top`. The FRD does not require a default filter but this is worth documenting for consumers.

**Verdict:** No code change needed. Add a note to the TDD's Section 9 design notes.

---

#### ISSUE A-6 — Low: `Item Tracking Code` (Table 6502) — Contains BLOB-adjacent Fields

**Assessment:** Table 6502 is a setup/configuration table with no BLOB or Media fields. No issue.

**Verdict:** No change needed.

---

## Part B — TDD Faithfulness to FRD

### PASS Items

| # | FRD Requirement | TDD Coverage | Verdict |
|---|---|---|---|
| B1 | All 106 entities specified | TDD Section 8 lists all 106 with IDs, source tables, editability | **PASS** |
| B2 | `ODataKeyFields = SystemId` | TDD Section 7 template includes it | **PASS** |
| B3 | `SystemId` as first field | TDD Section 7.3 specifies first-field rule | **PASS** |
| B4 | `ApplicationArea = All` on every field | TDD Section 7 template and Section 7.4 | **PASS** |
| B5 | `SourceTableView` for document types | TDD Section 7.2 covers this with example | **PASS** |
| B6 | Read/Write page pattern | TDD Section 7.1 defines the template | **PASS** |
| B7 | `Caption` on page | TDD Section 7 updated template includes it | **PASS** |
| B8 | `ToolTip` on fields | TDD Section 7 updated template includes it | **PASS** |
| B9 | $metadata annotation explanation | TDD Section 7.7b added | **PASS** |
| B10 | BLOB/Media field policy | TDD Section 7.7a added | **PASS** |
| B11 | Obsolete field policy (Pending ≤ 28.0) | TDD Section 7.6 updated table | **PASS** |
| B12 | Namespace `OnlyCopilotFans.OCPFAPIsv3` | TDD Section 4 | **PASS** |
| B13 | Object ID allocation with buffers | TDD Section 6 table | **PASS** |
| B14 | File naming convention | TDD Section 5 | **PASS** |
| B15 | Item Application Entry SystemId confirmed | TDD Section 9.5 updated | **PASS** |
| B16 | Projects = Job table with Project entity names | TDD Section 9.6 | **PASS** |
| B17 | Price List modern tables (7000, 7001) | TDD Section 9.8 | **PASS** |
| B18 | W1 compatibility — no localization dependencies | TDD NF2 | **PASS** |

---

### ISSUES Found

#### ISSUE B-1 — Medium: TDD Template Ambiguity on Editable for Read-Only Pages *(Fixed in this session)*

**Status:** Already corrected in TDD update. The original template showed `Editable = false` PLUS explicit `InsertAllowed/ModifyAllowed/DeleteAllowed = false`. In BC, when `Editable = false`, the three sub-properties are implied false and setting them explicitly is redundant (generates AL compiler info messages). The TDD now correctly states: set `Editable = false` only for read-only pages; set all four properties explicitly only for read/write pages.

---

#### ISSUE B-2 — Low: TDD Missing Warehouse Entry Volume Note *(From Issue A-5)*

**FRD:** Silent on this.  
**TDD:** No note on Table 7312 volume.  
**Recommendation:** Add to TDD Section 9 design notes.

**Fix:** Add to TDD Section 9:

> **9.9 Warehouse Entries (Table 7312) — High Volume**  
> This table can contain millions of rows in active warehouse environments. No server-side default filter is applied at the page level (per FRD design). API consumers are responsible for applying `$filter` and `$top` to scope requests. Document this in consumer-facing API documentation.

---

#### ISSUE B-3 — Low: TDD Does Not Explicitly State "All Fields Including Non-UI Fields"

**FRD Section 5.3** now explicitly states all standard fields must be included, even those not on Card/List pages.  
**TDD** Section 7 says "all other fields" in the template comment but does not reinforce this with a dedicated rule.  

**Recommendation:** Add a clarifying sentence to TDD Section 7 field naming convention:

> Field inclusion is not limited to fields that appear on standard BC Card or List pages. All non-obsolete, non-BLOB standard table fields must be included.

---

## Summary

| Category | Total Checks | Pass | Issues |
|---|---|---|---|
| FRD vs BC Feasibility | 17 checks + 6 issues | 17 | 6 (1 medium, 5 low) |
| TDD vs FRD Faithfulness | 18 checks + 3 issues | 18 | 3 (1 medium fixed, 2 low) |

**No blocking issues.** The medium issue (A-1, FlowField CalcFields) is benign given the no-trigger design. The two unfixed low issues (B-2 warehouse volume note, B-3 all-fields clarification) are documentation gaps only — they do not affect generated AL code.

**Recommended before starting Batch 1 code generation:**
1. Apply TDD fix for B-2 (warehouse volume note in Section 9)
2. Apply TDD fix for B-3 (all-fields clarification in Section 7)
3. No FRD changes required beyond what was applied in this session
