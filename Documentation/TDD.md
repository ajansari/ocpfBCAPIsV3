# Technical Design Document
## OCPFAPIs v3.0 — OnlyCopilotFans API Library for Business Central

**Document Version:** 1.0  
**Date:** 2026-06-09  
**Author:** OnlyCopilotFans  
**Status:** Draft

---

## 1. Overview

This document defines the technical design for the OCPFAPIs v3.0 AL extension. It covers namespace design, object ID allocation, file structure, API page patterns, field inclusion rules, and per-batch object specifications. All decisions are driven by the Functional Requirements Document (FRD.md).

---

## 2. Extension Identity

| Property | Value |
|---|---|
| App ID | 855299b2-5650-41ce-80c1-b130b89af4b4 |
| Name | OCPFAPIsv3 |
| Publisher | OnlyCopilotFans |
| Version | 3.0.0.0 |
| Runtime | 16.0 |
| Application Minimum | 27.0.0.0 |
| Object ID Range | 90800 – 90999 |
| AL Namespace | `OnlyCopilotFans.OCPFAPIsv3` |
| NoImplicitWith | Enabled |

---

## 3. API Identity Convention

| Property | Pattern | Example |
|---|---|---|
| APIPublisher | `'OnlyCopilotFans'` | `'OnlyCopilotFans'` |
| APIGroup | `'ocpf_<camelCaseName>'` | `'ocpf_coreFinancial'` |
| APIVersion | `'v3.0'` | `'v3.0'` |
| EntityName | `'ocpf<PascalCaseName>'` (singular) | `'ocpfGeneralLedgerEntry'` |
| EntitySetName | `'ocpf<PascalCaseName>'` (plural) | `'ocpfGeneralLedgerEntries'` |

**EntityName is singular; EntitySetName is plural.** Where a natural plural is irregular, use standard English pluralization (e.g., `ocpfCurrency` / `ocpfCurrencies`).

---

## 4. Namespace Design

All objects use a single namespace:

```al
namespace OnlyCopilotFans.OCPFAPIsv3;
```

This applies to every AL file in the extension without exception. No sub-namespaces are used — the API group property on each page provides logical grouping.

---

## 5. File & Folder Structure

Files are organized into one folder per batch. Each API page lives in its own `.al` file.

```
OCPFAPIsv3/
├── app.json
├── FRD.md
├── TDD.md
├── CoreFinancial/
│   ├── API.ChartOfAccounts.al
│   ├── API.GeneralLedgerEntries.al
│   └── ... (24 files)
├── MasterData/
│   ├── API.BankAccounts.al
│   └── ... (29 files)
├── Sales/
│   ├── API.SalesQuotes.al
│   └── ... (16 files)
├── Purchasing/
│   ├── API.PurchaseOrders.al
│   └── ... (14 files)
├── ProjectsAndAssets/
│   ├── API.Projects.al
│   └── ... (14 files)
└── SystemAndSetup/
    ├── API.CompanyInformation.al
    └── ... (9 files)
```

**File naming convention:** `API.<EntitySetName without ocpf prefix>.al`  
Example: `API.ChartOfAccounts.al` for `ocpfChartOfAccounts`.

---

## 6. Object ID Allocation

Object IDs are assigned sequentially within each batch block. A buffer of unassigned IDs is left at the end of each block for future additions within that batch.

| Batch | API Group | ID Range | Count | Buffer |
|---|---|---|---|---|
| 1 | ocpf_coreFinancial | 90800 – 90829 | 24 | 90824–90829 (6) |
| 2 | ocpf_masterData | 90830 – 90869 | 29 | 90859–90869 (11) |
| 3 | ocpf_sales | 90870 – 90889 | 16 | 90886–90889 (4) |
| 4 | ocpf_purchasing | 90890 – 90909 | 14 | 90904–90909 (6) |
| 5 | ocpf_projectsAndAssets | 90910 – 90929 | 14 | 90924–90929 (6) |
| 6 | ocpf_systemAndSetup | 90930 – 90949 | 9 | 90939–90949 (11) |
| Reserved | Future use | 90950 – 90999 | — | 50 |

---

## 7. Standard API Page Template

Every API page follows this template:

```al
namespace OnlyCopilotFans.OCPFAPIsv3;

page <ObjectID> "<EntitySetName>"
{
    PageType = API;
    Caption = '<Plain-English sentence describing what this entity represents and its business purpose.>';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_<groupName>';
    APIVersion = 'v3.0';
    EntityName = '<entityName>';
    EntitySetName = '<entitySetName>';
    SourceTable = <SourceTableName>;
    ODataKeyFields = SystemId;
    Editable = false;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(systemId; Rec.SystemId)
                {
                    Caption = 'System ID';
                    ToolTip = 'Unique system-assigned identifier for this record. Used as the OData key.';
                    ApplicationArea = All;
                }
                // ... all other fields, each with Caption, ToolTip, and ApplicationArea = All
            }
        }
    }
}
```

**Caption on the page** surfaces as `Org.OData.Core.V1.Description` on the `EntityType` in the OData `$metadata` document.  
**ToolTip on each field** surfaces as `Org.OData.Core.V1.Description` on the corresponding OData `Property` in `$metadata`.  
Both are valid, compilable properties on `PageType = API` in BC 2025 Wave 2 (Runtime 16.0).

`AboutTitle`, `AboutText`, `HelpLink`, and `InstructionalText` are **not permitted** on API pages — they are UI-only and cause compilation errors.

### 7.1 Read/Write Pages

For pages marked Read/Write in the FRD, replace `Editable = false` with:

```al
Editable = true;
InsertAllowed = true;
ModifyAllowed = true;
DeleteAllowed = true;
```

When `Editable = false`, the `InsertAllowed`, `ModifyAllowed`, and `DeleteAllowed` properties are already implied false and must **not** be set explicitly — redundant declarations add noise. Only set these three properties on read/write pages where `Editable = true`.

Read/Write applies to: General Journal Lines, all unposted Sales documents and lines, all unposted Purchase documents and lines.

### 7.2 Document-Type-Filtered Pages

Sales Header and Purchase Header each serve multiple document types. Apply a `SourceTableView` to filter at the page level:

```al
SourceTable = "Sales Header";
SourceTableView = where("Document Type" = const(Order));
```

This pattern applies to:
- Sales Quotes → `const(Quote)`
- Sales Orders → `const(Order)`
- Sales Invoices → `const(Invoice)`
- Sales Credit Memos → `const("Credit Memo")`
- Purchase Orders → `const(Order)`
- Purchase Invoices → `const(Invoice)`
- Purchase Credit Memos → `const("Credit Memo")`
- And corresponding Lines pages via `Sales Line` / `Purchase Line`

### 7.3 SystemId Field

The `SystemId` field must always be the **first field** in the repeater and must use the exact casing shown:

```al
field(systemId; Rec.SystemId)
{
    Caption = 'System ID';
    ApplicationArea = All;
}
```

### 7.4 ApplicationArea

Every field declaration must include `ApplicationArea = All;`. No exceptions.

### 7.5 Field Naming Convention

Field inclusion is not limited to fields that appear on standard BC Card or List pages. All non-obsolete, non-raw-BLOB standard table fields must be included in every API page, regardless of whether they appear in the BC UI.

The AL field identifier (left side of `;`) must be in **camelCase** and match the BC field name with spaces removed and first letter lowercased:

```al
field(postingDate; Rec."Posting Date") { ... }
field(documentNo; Rec."Document No.") { ... }
field(customerNo; Rec."Customer No.") { ... }
```

Punctuation (dots, slashes, ampersands) in BC field names is dropped in the identifier:

```al
// BC field: "Gen. Bus. Posting Group"
field(genBusPostingGroup; Rec."Gen. Bus. Posting Group") { ... }
```

#### 7.5.1 Reserved AL Page Layout Identifiers

Certain identifiers are AL page-layout **structural keywords**. If the `to_camel()` conversion produces one of these, it will conflict with the surrounding page syntax and cause a compiler error. The fix is to append the field's data type to disambiguate.

| Generated identifier | AL keyword conflict | Rename convention | Example |
|---|---|---|---|
| `area` | `area(content)`, `area(actions)` | append type → `areaCode`, `areaOption` | `field(areaCode; Rec.Area)` |
| `group` | `group(name)` repeater header | append type | `field(groupCode; Rec.Group)` |
| `value` | option value declaration | append type | `field(valueDecimal; Rec.Value)` |
| `key` | `key(id; fields)` in keys section | append type | `field(keyCode; Rec.Key)` |
| `label` | `label` text constant | append type | `field(labelText; Rec.Label)` |
| `index` | key index | append type | `field(indexInteger; Rec.Index)` |
| `trigger` | `trigger OnXxx()` | append type | `field(triggerCode; Rec.Trigger)` |
| `field` | `field(id; source)` — the keyword itself | append type | `field(fieldCode; Rec.Field)` |

> **Note (B2-02):** Data type words such as `code`, `name`, `type`, `date`, `text`, `decimal`, `boolean` are **valid** AL field identifiers. Only the structural keywords listed above require renaming.

### 7.6 Obsolete Fields

| ObsoleteState | Action |
|---|---|
| `Removed` | Exclude — field no longer exists in the compiled table |
| `Pending` | **Exclude unconditionally** — regardless of ObsoleteTag or ObsoleteRemovalVersion |
| Not set | Include |

**Updated policy (B2-01):** Any field with `ObsoleteState = Pending` is excluded immediately, without checking `ObsoleteRemovalVersion` or `ObsoleteTag`. Rationale: a newly built API library should not expose fields the product team has already marked for removal. Pending fields may also use conditional compilation (`#if not CLEAN##`) that hides their true state from the compiler — unconditional exclusion is the safest approach.

When in doubt, exclude rather than include.

### 7.7a BLOB and Media Fields

| Field Type | Action | Notes |
|---|---|---|
| `Media` | Include | BC API framework converts to stream URL automatically |
| `MediaSet` | Include | Same as Media |
| Raw `BLOB` | Exclude | Cannot be meaningfully consumed via OData; may cause serialization issues |

Examples: `Picture` on Customer (Table 18), `Picture` on Item (Table 27), `Picture` on Employee (Table 5200) — these are `Media` type and should be included.

### 7.7b OData $metadata Annotation Behavior

The following table shows how AL properties map to OData $metadata CSDL annotations:

| AL Property | $metadata Element | CSDL Annotation |
|---|---|---|
| `page.Caption` | `EntityType` | `Org.OData.Core.V1.Description` |
| `field.ToolTip` | `Property` | `Org.OData.Core.V1.Description` |
| `field identifier` (left of `;`) | `Property Name` attribute | Literal identifier |
| Source field type | `Property Type` attribute | Mapped to OData EDM type |
| `ODataKeyFields = SystemId` | `Key` element | Identifies the entity key |

MCP servers and OData-aware tools call `GET .../v3.0/$metadata` once per API group to retrieve the full schema. Setting `Caption` and `ToolTip` consistently across all 106 pages makes the library fully self-describing via metadata alone.

### 7.7 FlowFields

FlowFields are included where they are:
1. Defined on the source table (not calculated in AL code)
2. Commonly consumed by API consumers (e.g., `Balance`, `Outstanding Amount`, `Invoiced Quantity`)
3. Not likely to cause performance issues at scale

FlowFields must **not** have `CalcFields` called in triggers — BC's API framework handles this automatically for fields exposed on API pages.

---

## 8. Per-Batch Object Specifications

### Batch 1 — ocpf_coreFinancial (90800–90823)

| ID | Entity Set Name | Entity Name | Source Table | Editable |
|---|---|---|---|---|
| 90800 | ocpfChartOfAccounts | ocpfChartOfAccount | G/L Account | No |
| 90801 | ocpfGeneralLedgerEntries | ocpfGeneralLedgerEntry | G/L Entry | No |
| 90802 | ocpfGeneralLedgerSetup | ocpfGeneralLedgerSetup | General Ledger Setup | No |
| 90803 | ocpfAccountingPeriods | ocpfAccountingPeriod | Accounting Period | No |
| 90804 | ocpfGLBudgetEntries | ocpfGLBudgetEntry | G/L Budget Entry | No |
| 90805 | ocpfGLRegisters | ocpfGLRegister | G/L Register | No |
| 90806 | ocpfCustLedgerEntries | ocpfCustLedgerEntry | Cust. Ledger Entry | No |
| 90807 | ocpfDetailedCustLedgerEntries | ocpfDetailedCustLedgerEntry | Detailed Cust. Ledg. Entry | No |
| 90808 | ocpfVendorLedgerEntries | ocpfVendorLedgerEntry | Vendor Ledger Entry | No |
| 90809 | ocpfDtldVendorLedgEntries | ocpfDetailedVendorLedgerEntry | Detailed Vendor Ledg. Entry | No |
| 90810 | ocpfEmployeeLedgerEntries | ocpfEmployeeLedgerEntry | Employee Ledger Entry | No |
| 90811 | ocpfGenBusPostingGroups | ocpfGenBusPostingGroup | Gen. Business Posting Group | No |
| 90812 | ocpfGenProdPostingGroups | ocpfGeneralProductPostingGroup | Gen. Product Posting Group | No |
| 90813 | ocpfGeneralPostingSetup | ocpfGeneralPostingSetup | General Posting Setup | No |
| 90814 | ocpfCustomerPostingGroups | ocpfCustomerPostingGroup | Customer Posting Group | No |
| 90815 | ocpfVendorPostingGroups | ocpfVendorPostingGroup | Vendor Posting Group | No |
| 90816 | ocpfInventoryPostingGroups | ocpfInventoryPostingGroup | Inventory Posting Group | No |
| 90817 | ocpfVatBusinessPostingGroups | ocpfVatBusinessPostingGroup | VAT Business Posting Group | No |
| 90818 | ocpfVatProductPostingGroups | ocpfVatProductPostingGroup | VAT Product Posting Group | No |
| 90819 | ocpfVatPostingSetup | ocpfVatPostingSetup | VAT Posting Setup | No |
| 90820 | ocpfDimensions | ocpfDimension | Dimension | No |
| 90821 | ocpfDimensionValues | ocpfDimensionValue | Dimension Value | No |
| 90822 | ocpfDefaultDimensions | ocpfDefaultDimension | Default Dimension | No |
| 90823 | ocpfDimensionSetEntries | ocpfDimensionSetEntry | Dimension Set Entry | No |

### Batch 2 — ocpf_masterData (90830–90858)

| ID | Entity Set Name | Entity Name | Source Table | Editable |
|---|---|---|---|---|
| 90830 | ocpfBankAccounts | ocpfBankAccount | Bank Account | No |
| 90831 | ocpfBankAccountPostingGroups | ocpfBankAccountPostingGroup | Bank Account Posting Group | No |
| 90832 | ocpfBankAccountLedgerEntries | ocpfBankAccountLedgerEntry | Bank Account Ledger Entry | No |
| 90833 | ocpfPaymentTerms | ocpfPaymentTerm | Payment Terms | No |
| 90834 | ocpfPaymentMethods | ocpfPaymentMethod | Payment Method | No |
| 90835 | ocpfCurrencies | ocpfCurrency | Currency | No |
| 90836 | ocpfCountriesRegions | ocpfCountryRegion | Country/Region | No |
| 90837 | ocpfUnitsOfMeasure | ocpfUnitOfMeasure | Unit of Measure | No |
| 90838 | ocpfItemUnitsOfMeasure | ocpfItemUnitOfMeasure | Item Unit of Measure | No |
| 90839 | ocpfLocations | ocpfLocation | Location | No |
| 90840 | ocpfItemCategories | ocpfItemCategory | Item Category | No |
| 90841 | ocpfShipmentMethods | ocpfShipmentMethod | Shipment Method | No |
| 90842 | ocpfCustomers | ocpfCustomer | Customer | No |
| 90843 | ocpfVendors | ocpfVendor | Vendor | No |
| 90844 | ocpfContacts | ocpfContact | Contact | No |
| 90845 | ocpfContactBusinessRelations | ocpfContactBusinessRelation | Contact Business Relation | No |
| 90846 | ocpfItems | ocpfItem | Item | No |
| 90847 | ocpfItemLedgerEntries | ocpfItemLedgerEntry | Item Ledger Entry | No |
| 90848 | ocpfValueEntries | ocpfValueEntry | Value Entry | No |
| 90849 | ocpfItemApplicationEntries | ocpfItemApplicationEntry | Item Application Entry | No |
| 90850 | ocpfItemVendorCatalogs | ocpfItemVendorCatalog | Item Vendor | No |
| 90851 | ocpfStockkeepingUnits | ocpfStockkeepingUnit | Stockkeeping Unit | No |
| 90852 | ocpfItemTrackingCodes | ocpfItemTrackingCode | Item Tracking Code | No |
| 90853 | ocpfItemCharges | ocpfItemCharge | Item Charge | No |
| 90854 | ocpfResources | ocpfResource | Resource | No |
| 90855 | ocpfResourceLedgerEntries | ocpfResourceLedgerEntry | Res. Ledger Entry | No |
| 90856 | ocpfResourceGroups | ocpfResourceGroup | Resource Group | No |
| 90857 | ocpfEmployees | ocpfEmployee | Employee | No |
| 90858 | ocpfSalespeople | ocpfSalesperson | Salesperson/Purchaser | No |

### Batch 3 — ocpf_sales (90870–90885)

| ID | Entity Set Name | Entity Name | Source Table | View Filter | Editable |
|---|---|---|---|---|---|
| 90870 | ocpfSalesQuotes | ocpfSalesQuote | Sales Header | Doc. Type = Quote | Yes |
| 90871 | ocpfSalesQuoteLines | ocpfSalesQuoteLine | Sales Line | Doc. Type = Quote | Yes |
| 90872 | ocpfSalesOrders | ocpfSalesOrder | Sales Header | Doc. Type = Order | Yes |
| 90873 | ocpfSalesOrderLines | ocpfSalesOrderLine | Sales Line | Doc. Type = Order | Yes |
| 90874 | ocpfSalesInvoices | ocpfSalesInvoice | Sales Header | Doc. Type = Invoice | Yes |
| 90875 | ocpfSalesInvoiceLines | ocpfSalesInvoiceLine | Sales Line | Doc. Type = Invoice | Yes |
| 90876 | ocpfSalesCreditMemos | ocpfSalesCreditMemo | Sales Header | Doc. Type = Credit Memo | Yes |
| 90877 | ocpfSalesCreditMemoLines | ocpfSalesCreditMemoLine | Sales Line | Doc. Type = Credit Memo | Yes |
| 90878 | ocpfPostedSalesInvoices | ocpfPostedSalesInvoice | Sales Invoice Header | — | No |
| 90879 | ocpfPostedSalesInvoiceLines | ocpfPostedSalesInvoiceLine | Sales Invoice Line | — | No |
| 90880 | ocpfPostedSalesCreditMemos | ocpfPostedSalesCreditMemo | Sales Cr.Memo Header | — | No |
| 90881 | ocpfPostedSalesCreditMemoLines | ocpfPostedSalesCreditMemoLine | Sales Cr.Memo Line | — | No |
| 90882 | ocpfPostedSalesShipments | ocpfPostedSalesShipment | Sales Shipment Header | — | No |
| 90883 | ocpfPostedSalesShipmentLines | ocpfPostedSalesShipmentLine | Sales Shipment Line | — | No |
| 90884 | ocpfPostedReturnReceipts | ocpfPostedReturnReceipt | Return Receipt Header | — | No |
| 90885 | ocpfPostedReturnReceiptLines | ocpfPostedReturnReceiptLine | Return Receipt Line | — | No |

### Batch 4 — ocpf_purchasing (90890–90903)

| ID | Entity Set Name | Entity Name | Source Table | View Filter | Editable |
|---|---|---|---|---|---|
| 90890 | ocpfPurchaseOrders | ocpfPurchaseOrder | Purchase Header | Doc. Type = Order | Yes |
| 90891 | ocpfPurchaseOrderLines | ocpfPurchaseOrderLine | Purchase Line | Doc. Type = Order | Yes |
| 90892 | ocpfPurchaseInvoices | ocpfPurchaseInvoice | Purchase Header | Doc. Type = Invoice | Yes |
| 90893 | ocpfPurchaseInvoiceLines | ocpfPurchaseInvoiceLine | Purchase Line | Doc. Type = Invoice | Yes |
| 90894 | ocpfPurchaseCreditMemos | ocpfPurchaseCreditMemo | Purchase Header | Doc. Type = Credit Memo | Yes |
| 90895 | ocpfPurchaseCreditMemoLines | ocpfPurchaseCreditMemoLine | Purchase Line | Doc. Type = Credit Memo | Yes |
| 90896 | ocpfPostedPurchaseInvoices | ocpfPostedPurchaseInvoice | Purch. Inv. Header | — | No |
| 90897 | ocpfPostedPurchaseInvoiceLines | ocpfPostedPurchaseInvoiceLine | Purch. Inv. Line | — | No |
| 90898 | ocpfPostedPurchaseCreditMemos | ocpfPostedPurchaseCreditMemo | Purch. Cr. Memo Hdr. | — | No |
| 90899 | ocpfPostedPurchaseCreditMemoLines | ocpfPostedPurchaseCreditMemoLine | Purch. Cr. Memo Line | — | No |
| 90900 | ocpfPostedPurchaseReceipts | ocpfPostedPurchaseReceipt | Purch. Rcpt. Header | — | No |
| 90901 | ocpfPostedPurchaseReceiptLines | ocpfPostedPurchaseReceiptLine | Purch. Rcpt. Line | — | No |
| 90902 | ocpfPostedReturnShipments | ocpfPostedReturnShipment | Return Shipment Header | — | No |
| 90903 | ocpfPostedReturnShipmentLines | ocpfPostedReturnShipmentLine | Return Shipment Line | — | No |

### Batch 5 — ocpf_projectsAndAssets (90910–90923)

| ID | Entity Set Name | Entity Name | Source Table | Editable |
|---|---|---|---|---|
| 90910 | ocpfProjects | ocpfProject | Job | No |
| 90911 | ocpfProjectPostingGroups | ocpfProjectPostingGroup | Job Posting Group | No |
| 90912 | ocpfProjectTasks | ocpfProjectTask | Job Task | No |
| 90913 | ocpfProjectPlanningLines | ocpfProjectPlanningLine | Job Planning Line | No |
| 90914 | ocpfProjectLedgerEntries | ocpfProjectLedgerEntry | Job Ledger Entry | No |
| 90915 | ocpfFixedAssets | ocpfFixedAsset | Fixed Asset | No |
| 90916 | ocpfFaPostingGroups | ocpfFaPostingGroup | FA Posting Group | No |
| 90917 | ocpfFaLedgerEntries | ocpfFaLedgerEntry | FA Ledger Entry | No |
| 90918 | ocpfFaDepreciationBooks | ocpfFaDepreciationBook | FA Depreciation Book | No |
| 90919 | ocpfGeneralJournalTemplates | ocpfGeneralJournalTemplate | Gen. Journal Template | No |
| 90920 | ocpfGeneralJournalBatches | ocpfGeneralJournalBatch | Gen. Journal Batch | No |
| 90921 | ocpfGeneralJournalLines | ocpfGeneralJournalLine | Gen. Journal Line | Yes |
| 90922 | ocpfPriceListHeaders | ocpfPriceListHeader | Price List Header | No |
| 90923 | ocpfPriceListLines | ocpfPriceListLine | Price List Line | No |

### Batch 6 — ocpf_systemAndSetup (90930–90938)

| ID | Entity Set Name | Entity Name | Source Table | Editable |
|---|---|---|---|---|
| 90930 | ocpfDocumentAttachments | ocpfDocumentAttachment | Document Attachment | No |
| 90931 | ocpfCompanyInformation | ocpfCompanyInformation | Company Information | No |
| 90932 | ocpfWarehouseEntries | ocpfWarehouseEntry | Warehouse Entry | No |
| 90933 | ocpfReminderHeaders | ocpfReminderHeader | Reminder Header | No |
| 90934 | ocpfReminderLines | ocpfReminderLine | Reminder Line | No |
| 90935 | ocpfFinanceChargeMemoHeaders | ocpfFinanceChargeMemoHeader | Finance Charge Memo Header | No |
| 90936 | ocpfFinanceChargeMemoLines | ocpfFinanceChargeMemoLine | Finance Charge Memo Line | No |
| 90937 | ocpfApprovalEntries | ocpfApprovalEntry | Approval Entry | No |
| 90938 | ocpfWorkflowStepInstances | ocpfWorkflowStepInstance | Workflow Step Instance | No |

---

## 9. Special Design Notes

### 9.1 General Ledger Setup (Table 98) — Singleton

`General Ledger Setup` is a singleton table (always one record). The API page will expose it as a standard repeater. Consumers should expect at most one record.

### 9.2 Company Information (Table 79) — Singleton

Same pattern as General Ledger Setup. One record always.

### 9.3 Default Dimensions (Table 352) — Composite Key

`Default Dimension` has a composite natural key (`Table ID`, `No.`, `Dimension Code`). The `SystemId` is the OData key. Consumers must filter by `tableId` to scope results to a specific master record type (e.g., `tableId eq 18` for Customer dimensions).

### 9.4 Dimension Set Entries (Table 480)

Exposed to allow consumers to resolve dimension sets from ledger entries. Filter by `dimensionSetId` (mapped from the `Dimension Set ID` field on any ledger entry).

### 9.5 Item Application Entries (Table 339)

This table tracks cost application between item ledger entries. `SystemId` has been present on this table since BC 15 (2019 Wave 2) and is confirmed available in v27. `ODataKeyFields = SystemId` applies normally — no special key handling required.

### 9.6 Projects — AL Table Name vs Caption

The AL source table name is `Job` (Table 167). In all API pages in Batch 5, the `SourceTable` property references `Job` but the `EntityName`, `EntitySetName`, captions, and file names use the "Project" terminology to reflect the BC v27 UI.

### 9.7 VAT Posting Setup — Composite Key

`VAT Posting Setup` has a composite natural key (`VAT Bus. Posting Group`, `VAT Prod. Posting Group`). `SystemId` is the OData key as with all other pages.

### 9.9 Warehouse Entries (Table 7312) — High Volume

This table can contain millions of rows in active warehouse environments. No server-side default filter is applied at the page level per FRD design. API consumers are responsible for applying `$filter` and `$top` to scope requests. This limitation must be documented in any consumer-facing API documentation for this endpoint.

### 9.8 Price List Headers and Lines (Tables 7000, 7001)

These are the modern pricing tables introduced in BC 2020 Wave 2. Legacy `Sales Price` and `Sales Line Discount` tables (Table 7002, 7004) are deprecated and excluded. The modern tables support all asset types (items, resources, G/L accounts, item charges).

---

## 10. Testing Considerations

| Area | Verification |
|---|---|
| Compilation | All 106 pages compile clean on BC Runtime 16.0 |
| OData endpoint availability | Each page returns HTTP 200 on `GET /api/OnlyCopilotFans/ocpf_<group>/v3.0/companies({id})/<entitySetName>` |
| SystemId as key | `GET .../ocpfChartOfAccounts({systemId})` returns single record |
| Filter by document type | Sales Order endpoint returns only Orders, not Quotes or Invoices |
| Read-only enforcement | `POST` to a read-only endpoint returns HTTP 405 |
| W1 compatibility | Extension installs on a clean W1 sandbox with no localization apps |
| Singleton pages | GL Setup and Company Information return exactly one record |
