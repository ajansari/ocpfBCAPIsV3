# Research Findings — API Descriptions, Field Metadata & MCP Schema Discovery
## OCPFAPIs v3.0

**Date:** 2026-06-09  
**Status:** Final

---

## 1. Item Application Entry (Table 339) — SystemId Confirmed

Confirmed: Table 339 (`Item Application Entry`) has had `SystemId` since BC 15 (2019 Wave 2). The design note flagging this as uncertain is incorrect and will be removed from the TDD. `ODataKeyFields = SystemId` applies normally to this table.

---

## 2. API-Friendly Descriptions — What BC 2025 Wave 2 Supports

### 2.1 Page-Level: `Caption` Property

**Supported: Yes.**  
The `Caption` property on an API page sets the human-readable name of the entity type. It appears in the OData `$metadata` document as the `Name` attribute of the `EntityType` element. Setting a descriptive Caption (rather than just the entity set name) helps both developers and tooling (including MCP servers) understand what the entity represents.

```al
page 90800 "ocpfChartOfAccounts"
{
    Caption = 'Chart of Accounts — G/L accounts defining the financial structure of the company.';
    ...
}
```

**`AboutTitle` / `AboutText` (Teaching Tips): NOT supported on API pages.**  
These properties are UI-only and will cause a compilation error if used on a `PageType = API` page. Do not use them.

### 2.2 Field-Level: `ToolTip` Property

**Supported: Yes.**  
The `ToolTip` property on a field in an API page is valid AL and compiles cleanly on BC Runtime 16.0. More importantly, it surfaces in the OData `$metadata` document as an `Org.OData.Core.V1.Description` annotation on the corresponding property. This is the primary mechanism for exposing semantic field descriptions to any OData-aware consumer, including MCP servers.

```al
field(postingDate; Rec."Posting Date")
{
    Caption = 'Posting Date';
    ApplicationArea = All;
    ToolTip = 'The date on which the G/L entry was posted to the general ledger.';
}
```

### 2.3 What Does NOT Work on API Pages

| Property | Available on API Pages? | Notes |
|---|---|---|
| `Caption` | Yes | Sets entity type display name |
| `ToolTip` on fields | Yes | Surfaces as OData description annotation |
| `AboutTitle` / `AboutText` | **No** | UI Teaching Tips only — compile error on API pages |
| `HelpLink` | No | UI only |
| `InstructionalText` | No | UI only |
| `AdditionalSearchTerms` | No | UI only |

---

## 3. OData $metadata as Schema Discovery for MCP Servers

The OData `$metadata` endpoint is the correct and BC-supported mechanism for MCP servers (and any OData-aware tool) to programmatically discover the full schema of the API library.

### 3.1 Endpoint Pattern

```
GET https://{bchost}/api/OnlyCopilotFans/ocpf_coreFinancial/v3.0/$metadata
```

Each API group has its own `$metadata` endpoint. The response is an XML CSDL (Common Schema Definition Language) document.

### 3.2 What $metadata Exposes

| CSDL Element | Source in AL |
|---|---|
| `EntityType Name` | `EntityName` property on the page |
| `EntitySet Name` | `EntitySetName` property on the page |
| `Property Name` | Field identifier (left side of `;`) |
| `Property Type` | Derived from source table field type |
| `Nullable` attribute | Derived from field type |
| `Org.OData.Core.V1.Description` on EntityType | `Caption` on the page |
| `Org.OData.Core.V1.Description` on Property | `ToolTip` on the field |
| `Core.Computed` annotation | Applied to `SystemId` and system fields |

### 3.3 Implication for This Library

By setting a meaningful `Caption` on every API page and a meaningful `ToolTip` on every field, the full OCPFAPIs v3.0 library becomes self-describing via its `$metadata` endpoints. An MCP server can:

1. Call `GET .../ocpf_coreFinancial/v3.0/$metadata` and parse the CSDL
2. Understand every entity type, every property name, every property type, and every semantic description
3. Use this to generate accurate OData queries without hardcoded field knowledge

This is the recommended schema discovery pattern and requires no additional AL code beyond setting `Caption` and `ToolTip` on all pages and fields.

---

## 4. BLOB and Media Fields

Some BC tables contain fields of type `BLOB`, `Media`, or `MediaSet` (e.g., `Picture` on Customer/Item/Employee, `Image` on Fixed Asset). These require special consideration on API pages:

- **Media / MediaSet fields**: Can be exposed on API pages and return a stream URL. BC's API framework handles the binary-to-stream conversion. The field renders as a URL link to the media content in OData responses.
- **BLOB fields (non-media)**: Pure BLOB fields (e.g., raw binary data) are not safely exposed on API pages without special stream handling. They should be excluded unless the consuming scenario specifically requires them.

**Policy for this library:** Include `Media` and `MediaSet` fields (e.g., customer/item pictures). Exclude raw `BLOB` fields that have no clear API consumption value.

---

## 5. Obsolete Field Policy — Clarification

The correct policy for obsolete field exclusion:

| ObsoleteState | ObsoleteRemovalVersion | Action |
|---|---|---|
| `Removed` | Any | **Exclude** — field no longer exists in the table |
| `Pending` | ≤ 28.0 (next major) | **Exclude** — will generate compiler warning and is going away |
| `Pending` | > 28.0 | **Include with caution** — still present, evaluate usefulness |
| Not set | — | **Include** |

The previous FRD/TDD text said "≤ 27.0" for Pending fields, which was too narrow. Corrected to ≤ 28.0.

---

## 6. Summary of Changes Required in FRD and TDD

### FRD Changes
- Section 5.3: Add ToolTip and Caption requirements
- New Section 5.7: OData $metadata as schema discovery mechanism
- New Section 5.8: BLOB/Media field policy
- Section 9: Remove Item Application Entry SystemId concern
- Correct obsolete field policy (Pending ≤ 28.0)

### TDD Changes
- Section 7 template: Add `Caption` to page, add `ToolTip` to field template
- Section 7.6: Correct obsolete field policy
- New Section 7.8: BLOB/Media field handling
- New Section 7.9: OData $metadata annotation behavior
- Section 9.5: Remove SystemId uncertainty — confirmed since BC 15
- Clarify `Editable = false` makes InsertAllowed/ModifyAllowed/DeleteAllowed redundant (keep explicit for read/write pages only)
