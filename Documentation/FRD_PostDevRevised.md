# Functional Requirements Document — Post-Dev Revised
## OCPFAPIs v3.0 — OnlyCopilotFans API Library for Business Central

**Document Version:** 2.0 (Post-Dev Revision)  
**Date:** 2026-06-09  
**Based On:** FRD v1.0 (original)  
**Author:** OnlyCopilotFans  
**Status:** Final — reflects as-built state

> **About this document:** This is a post-development revision of the original FRD (v1.0). It corrects four gaps identified during the post-build gap analysis (GAP-01, GAP-02, GAP-03, GAP-08) where the as-built implementation was correct but the FRD was stale or inaccurate. The code was not changed — only this document was updated to accurately reflect what was designed and built. Changes from v1.0 are noted inline with **[REVISED]** markers.

---

---

## 1. Purpose & Scope

This document defines the functional requirements for the **OCPFAPIs v3.0** Business Central extension. The library exposes a comprehensive set of API pages — read/write for master data, setup, and open documents; read-only for ledger entries and posted documents — covering Finance, Sales, Purchasing, Inventory, Projects, Fixed Assets, and supporting master/reference data. It is designed to serve as the data layer for AI copilot integrations, reporting tools, third-party connectors, integration workflows, and custom front-end applications built on top of Microsoft Dynamics 365 Business Central. **[REVISED — GAP-08: original described the library as "read-focused"; as built it is a full read/write library with 62 editable pages across master data, setup, and open documents.]**

### 1.1 Out of Scope

- Write-back operations to posted ledger entries or posted documents
- Localization-specific tax tables (e.g., US Sales Tax, GST/HST)
- Warehouse management operations beyond basic warehouse entry exposure
- Approval workflow execution (entries are exposed as read-only audit data)

---

## 2. Business Objectives

| # | Objective |
|---|---|
| B1 | Provide a single, versioned API surface for all major BC financial and operational data |
| B2 | Enable AI copilot features (e.g., GL Entry Copilot) to pull structured data without custom queries |
| B3 | Support external reporting, BI, and analytics tools via OData feeds |
| B4 | Serve as a reusable API foundation for all OnlyCopilotFans PTE solutions |
| B5 | Maintain W1 (worldwide baseline) compatibility — no localization dependencies |

---

## 3. Target Consumers

| Consumer Type | Use Case |
|---|---|
| AI Copilot Features | Pulling GL entries, ledger entries, posting setup for context-aware AI responses |
| Power BI / Fabric | Direct OData connections for financial dashboards |
| Third-Party Integrations | ERP-to-ERP sync, e-commerce, payroll connectors |
| Custom Portals | Customer/vendor self-service portals built on BC data |
| Automation Flows | Power Automate flows reading BC transactional data |

---

## 4. Platform Requirements

| Requirement | Value |
|---|---|
| BC Version | Release 2025 Wave 2 (v27.3+) |
| Baseline | W1 — no localization-specific dependencies |
| Runtime | AL Runtime 16.0 |
| Application Dependency | Microsoft BC Application 27.0.0.0+ |
| Deployment Target | BC SaaS (Online) |

---

## 5. API Design Requirements

### 5.1 API Identity

| Property | Value |
|---|---|
| Publisher | OnlyCopilotFans |
| API Version | v3.0 |
| Entity/EntitySet Prefix | `ocpf` |
| API Group Prefix | `ocpf_` |

Each batch of API pages is assigned its own API Group (see Section 6). This allows consumers to discover and connect to logical subsets of the library without subscribing to all 113 endpoints.

### 5.2 Key Fields

- Every API page **must** expose the `SystemId` field (sourced from the `SystemId` system field on the source table).
- Every API page **must** set `ODataKeyFields = SystemId`.
- Where a table has a natural business key (e.g., `No.` on Customer), that field must also be included as a standard field — but it is not the OData key.

### 5.3 Field Coverage

- All standard fields from the source BC table must be included, including fields that do not appear on any standard Card or List page in the BC UI.
- No computed or FlowField-only fields that would break OData reads are permitted unless they are safe and commonly used (e.g., `Balance` on Customer).
- `ApplicationArea = All` must be set on every field.
- Fields with `ObsoleteState = Removed` must be excluded (they no longer exist in the table). Fields with `ObsoleteState = Pending` must be excluded unconditionally — regardless of `ObsoleteRemovalVersion`, regardless of what version is being targeted. If Microsoft has marked a field for removal, the library must not expose it. **[REVISED — GAP-03: original allowed discretionary inclusion of Pending fields with removal version > 28.0. As built, all Pending fields are excluded unconditionally. This is the correct and safer policy. Also note: fields inside `#if not CLEANxx` preprocessor blocks must be checked for their true ObsoleteState in the `#else` branch — the default branch may show `Pending` while the cleanup branch shows `Removed`.]**

### 5.4 Access and Permissions

**[REVISED — GAP-01: original incorrectly stated setup tables and reference tables are read-only. As built, master data and setup tables are editable. The corrected policy is below.]**

API pages are divided into two categories:

**Read/Write** (`DelayedInsert = true`, supports POST/PATCH/DELETE):
- All master data tables: Customers, Vendors, Items, Bank Accounts, Contacts, Resources, Employees, Salespeople, and all related setup/reference tables (Payment Terms, Payment Methods, Currencies, Units of Measure, Locations, Item Categories, Posting Groups, VAT Setup, Dimensions, etc.)
- All open (unposted) sales documents: Sales Quotes, Orders, Invoices, Credit Memos, Blanket Orders (headers and lines)
- All open (unposted) purchase documents: Purchase Orders, Invoices, Credit Memos, Quotes, Blanket Orders (headers and lines)
- General Journal Lines

**Read-only** (`Editable = false`, GET only — POST/PATCH/DELETE return HTTP 405):
- All posted documents (posted invoices, credit memos, shipments, receipts, return documents)
- All ledger entries (G/L, customer, vendor, employee, bank, item, resource, project, FA)
- System and audit tables (GL Registers, Dimension Set Entries, Approval Entries, Workflow Step Instances, Warehouse Entries, Document Attachments, Company Information)
- Price List Headers and Lines, Project/FA master and planning data

### 5.5 Filtering & Sorting

- All API pages must support OData `$filter`, `$top`, `$skip`, `$orderby`, and `$select` as inherited from the BC API framework.
- No custom filter restrictions are imposed at the API page level (consumers filter via OData).

### 5.5a Page and Field Descriptions (MCP & Tooling Friendliness)

Every API page must set a descriptive `Caption` property that reads as a plain-English sentence describing what the entity represents and its business purpose. This is supported in BC 2025 Wave 2 and surfaces as `Org.OData.Core.V1.Description` on the `EntityType` in the OData `$metadata` document.

Every field on every API page must set a `ToolTip` property containing a plain-English description of what the field contains. This is supported in BC 2025 Wave 2 and surfaces as `Org.OData.Core.V1.Description` on the corresponding OData `Property` in the `$metadata` document.

**Not permitted on API pages** (compile errors or UI-only):
- `AboutTitle` / `AboutText` — Teaching Tips, UI pages only
- `HelpLink`, `InstructionalText`, `AdditionalSearchTerms` — UI only

### 5.5b OData $metadata as Schema Discovery

The OData `$metadata` endpoint for each API group is the primary mechanism for MCP servers, BI tools, and other OData consumers to discover the schema of this library without prior knowledge of BC table structures.

Each API group exposes a `$metadata` endpoint:
```
GET .../api/OnlyCopilotFans/ocpf_{groupName}/v3.0/$metadata
```

The CSDL response will contain entity type names, property names, property types, and `Org.OData.Core.V1.Description` annotations derived from `Caption` and `ToolTip` values set in AL. By setting meaningful values on every page and field, the full library becomes self-describing via metadata alone.

### 5.5c BLOB and Media Field Policy

Some BC tables contain `Media`, `MediaSet`, or raw `BLOB` type fields:

- **Media / MediaSet fields** (e.g., customer pictures, item images): Include. BC's API framework converts these to stream URL references in OData responses automatically.
- **Raw BLOB fields** (binary data with no defined API consumption value): Exclude. These cannot be meaningfully consumed via standard OData and may cause serialization issues.

### 5.6 Expandability

- API pages that have a logical parent-child relationship (e.g., Sales Order / Sales Order Lines) must be structured so the lines page can be navigated as a sub-page if expanded in future iterations. For v3.0, headers and lines are separate top-level API pages.

---

## 6. API Groups & Batch Organization

| Batch | API Group Name | Description | Page Count |
|---|---|---|---|
| 1 | `ocpf_coreFinancial` | GL, ledger entries, posting setup, VAT, dimensions | 25 |
| 2 | `ocpf_masterData` | Banking, reference data, customers, vendors, items, resources, employees | 29 |
| 3 | `ocpf_sales` | Sales documents (open + posted) | 18 |
| 4 | `ocpf_purchasing` | Purchase documents (open + posted) | 18 |
| 5 | `ocpf_projectsAndAssets` | Projects, fixed assets, journals, pricing | 14 |
| 6 | `ocpf_systemAndSetup` | Attachments, company info, warehouse, collections, workflow | 9 |

**Total: 113 API pages** — 62 editable (Read/Write), 51 read-only. **[REVISED — gap-fill additions brought the final count from 106 to 113: Inventory Posting Setup added to Batch 1; Sales Blanket Orders + Lines added to Batch 3; Purchase Quotes + Lines and Purchase Blanket Orders + Lines added to Batch 4.]**

---

## 7. Entity Requirements by Batch

### Batch 1 — ocpf_coreFinancial

| Entity Name | Source Table | R/W |
|---|---|---|
| ocpfChartOfAccounts | G/L Account (15) | **Read/Write** |
| ocpfGeneralLedgerEntries | G/L Entry (17) | Read |
| ocpfGeneralLedgerSetup | General Ledger Setup (98) | **Read/Write** |
| ocpfAccountingPeriods | Accounting Period (50) | **Read/Write** |
| ocpfGLBudgetEntries | G/L Budget Entry (96) | **Read/Write** |
| ocpfGLRegisters | G/L Register (45) | Read |
| ocpfCustLedgerEntries | Cust. Ledger Entry (21) | Read |
| ocpfDetailedCustLedgerEntries | Detailed Cust. Ledg. Entry (379) | Read |
| ocpfVendorLedgerEntries | Vendor Ledger Entry (25) | Read |
| ocpfDtldVendorLedgEntries ¹ | Detailed Vendor Ledg. Entry (380) | Read |
| ocpfEmployeeLedgerEntries | Employee Ledger Entry (5222) | Read |
| ocpfGenBusPostingGroups ¹ | Gen. Business Posting Group (250) | **Read/Write** |
| ocpfGenProdPostingGroups ¹ | Gen. Product Posting Group (251) | **Read/Write** |
| ocpfGeneralPostingSetup | General Posting Setup (252) | **Read/Write** |
| ocpfCustomerPostingGroups | Customer Posting Group (92) | **Read/Write** |
| ocpfVendorPostingGroups | Vendor Posting Group (93) | **Read/Write** |
| ocpfInventoryPostingGroups | Inventory Posting Group (94) | **Read/Write** |
| ocpfVatBusinessPostingGroups | VAT Business Posting Group (323) | **Read/Write** |
| ocpfVatProductPostingGroups | VAT Product Posting Group (324) | **Read/Write** |
| ocpfVatPostingSetup | VAT Posting Setup (325) | **Read/Write** |
| ocpfDimensions | Dimension (348) | **Read/Write** |
| ocpfDimensionValues | Dimension Value (349) | **Read/Write** |
| ocpfDefaultDimensions | Default Dimension (352) | **Read/Write** |
| ocpfDimensionSetEntries | Dimension Set Entry (480) | Read |
| ocpfInventoryPostingSetup ² | Inventory Posting Setup (5813) | **Read/Write** |

> ¹ Name abbreviated to fit AL 30-character identifier limit. ² Gap-fill addition (ID 90824).
>
> **[REVISED — GAP-01: all setup and master data entities corrected from Read to Read/Write per as-built implementation.]**

### Batch 2 — ocpf_masterData

| Entity Name | Source Table | R/W |
|---|---|---|
| ocpfBankAccounts | Bank Account (270) | **Read/Write** |
| ocpfBankAccountPostingGroups | Bank Account Posting Group (277) | **Read/Write** |
| ocpfBankAccountLedgerEntries | Bank Account Ledger Entry (271) | Read |
| ocpfPaymentTerms | Payment Terms (3) | **Read/Write** |
| ocpfPaymentMethods | Payment Method (289) | **Read/Write** |
| ocpfCurrencies | Currency (4) | **Read/Write** |
| ocpfCountriesRegions | Country/Region (9) | **Read/Write** |
| ocpfUnitsOfMeasure | Unit of Measure (204) | **Read/Write** |
| ocpfItemUnitsOfMeasure | Item Unit of Measure (5404) | **Read/Write** |
| ocpfLocations | Location (14) | **Read/Write** |
| ocpfItemCategories | Item Category (5722) | **Read/Write** |
| ocpfShipmentMethods | Shipment Method (10) | **Read/Write** |
| ocpfCustomers | Customer (18) | **Read/Write** |
| ocpfVendors | Vendor (23) | **Read/Write** |
| ocpfContacts | Contact (5050) | **Read/Write** |
| ocpfContactBusinessRelations | Contact Business Relation (5054) | **Read/Write** |
| ocpfItems | Item (27) | **Read/Write** |
| ocpfItemLedgerEntries | Item Ledger Entry (32) | Read |
| ocpfValueEntries | Value Entry (5802) | Read |
| ocpfItemApplicationEntries | Item Application Entry (339) | Read |
| ocpfItemVendorCatalogs | Item Vendor (99) | **Read/Write** |
| ocpfStockkeepingUnits | Stockkeeping Unit (5700) | **Read/Write** |
| ocpfItemTrackingCodes | Item Tracking Code (6502) | **Read/Write** |
| ocpfItemCharges | Item Charge (5800) | **Read/Write** |
| ocpfResources | Resource (156) | **Read/Write** |
| ocpfResourceLedgerEntries | Res. Ledger Entry (203) | Read |
| ocpfResourceGroups | Resource Group (152) | **Read/Write** |
| ocpfEmployees | Employee (5200) | **Read/Write** |
| ocpfSalespeople | Salesperson/Purchaser (13) | **Read/Write** |

> **[REVISED — GAP-01: all master data entities corrected from Read to Read/Write per as-built implementation.]**

### Batch 3 — ocpf_sales

| Entity Name | Source Table | R/W |
|---|---|---|
| ocpfSalesQuotes | Sales Header (36) — Quote | Read/Write |
| ocpfSalesQuoteLines | Sales Line (37) — Quote | Read/Write |
| ocpfSalesOrders | Sales Header (36) — Order | Read/Write |
| ocpfSalesOrderLines | Sales Line (37) — Order | Read/Write |
| ocpfSalesInvoices | Sales Header (36) — Invoice | Read/Write |
| ocpfSalesInvoiceLines | Sales Line (37) — Invoice | Read/Write |
| ocpfSalesCreditMemos | Sales Header (36) — Credit Memo | Read/Write |
| ocpfSalesCreditMemoLines | Sales Line (37) — Credit Memo | Read/Write |
| ocpfPostedSalesInvoices | Sales Invoice Header (112) | Read |
| ocpfPostedSalesInvoiceLines | Sales Invoice Line (113) | Read |
| ocpfPostedSalesCreditMemos | Sales Cr.Memo Header (114) | Read |
| ocpfPostedSalesCreditMemoLines | Sales Cr.Memo Line (115) | Read |
| ocpfPostedSalesShipments | Sales Shipment Header (110) | Read |
| ocpfPostedSalesShipmentLines | Sales Shipment Line (111) | Read |
| ocpfPostedReturnReceipts | Return Receipt Header (6660) | Read |
| ocpfPostedReturnReceiptLines | Return Receipt Line (6661) | Read |
| ocpfSalesBlanketOrders ¹ | Sales Header (36) — Blanket Order | Read/Write |
| ocpfSalesBlanketOrderLines ¹ | Sales Line (37) — Blanket Order | Read/Write |

> ¹ Gap-fill addition (IDs 90886/90887).

### Batch 4 — ocpf_purchasing

| Entity Name | Source Table | R/W |
|---|---|---|
| ocpfPurchaseOrders | Purchase Header (38) — Order | Read/Write |
| ocpfPurchaseOrderLines | Purchase Line (39) — Order | Read/Write |
| ocpfPurchaseInvoices | Purchase Header (38) — Invoice | Read/Write |
| ocpfPurchaseInvoiceLines | Purchase Line (39) — Invoice | Read/Write |
| ocpfPurchaseCreditMemos | Purchase Header (38) — Credit Memo | Read/Write |
| ocpfPurchaseCreditMemoLines | Purchase Line (39) — Credit Memo | Read/Write |
| ocpfPostedPurchaseInvoices | Purch. Inv. Header (122) | Read |
| ocpfPostedPurchaseInvoiceLines | Purch. Inv. Line (123) | Read |
| ocpfPostedPurchaseCreditMemos | Purch. Cr. Memo Hdr. (124) | Read |
| ocpfPostedPurchCrMemoLines ¹ | Purch. Cr. Memo Line (125) | Read |
| ocpfPostedPurchaseReceipts | Purch. Rcpt. Header (120) | Read |
| ocpfPostedPurchaseReceiptLines | Purch. Rcpt. Line (121) | Read |
| ocpfPostedReturnShipments | Return Shipment Header (6650) | Read |
| ocpfPostedReturnShipmentLines | Return Shipment Line (6651) | Read |
| ocpfPurchaseQuotes ² | Purchase Header (38) — Quote | Read/Write |
| ocpfPurchaseQuoteLines ² | Purchase Line (39) — Quote | Read/Write |
| ocpfPurchaseBlanketOrders ² | Purchase Header (38) — Blanket Order | Read/Write |
| ocpfPurchaseBlanketOrderLines ² | Purchase Line (39) — Blanket Order | Read/Write |

> ¹ Abbreviated from `ocpfPostedPurchaseCreditMemoLines` (33 chars) to fit AL 30-character limit. ² Gap-fill additions (IDs 90904–90907).

### Batch 5 — ocpf_projectsAndAssets

| Entity Name | Source Table | R/W |
|---|---|---|
| ocpfProjects | Job (167) | Read |
| ocpfProjectPostingGroups | Job Posting Group (208) | Read | **[REVISED — GAP-02: original incorrectly listed Table 96. Table 96 is G/L Budget Entry. Correct table is 208.]** |
| ocpfProjectTasks | Job Task (1001) | Read |
| ocpfProjectPlanningLines | Job Planning Line (1003) | Read |
| ocpfProjectLedgerEntries | Job Ledger Entry (169) | Read |
| ocpfFixedAssets | Fixed Asset (5600) | Read |
| ocpfFaPostingGroups | FA Posting Group (5606) | Read |
| ocpfFaLedgerEntries | FA Ledger Entry (5601) | Read |
| ocpfFaDepreciationBooks | FA Depreciation Book (5612) | Read |
| ocpfGeneralJournalTemplates | Gen. Journal Template (80) | Read |
| ocpfGeneralJournalBatches | Gen. Journal Batch (232) | Read |
| ocpfGeneralJournalLines | Gen. Journal Line (81) | Read/Write |
| ocpfPriceListHeaders | Price List Header (7000) | Read |
| ocpfPriceListLines | Price List Line (7001) | Read |

### Batch 6 — ocpf_systemAndSetup

| Entity Name | Source Table | R/W |
|---|---|---|
| ocpfDocumentAttachments | Document Attachment (1173) | Read |
| ocpfCompanyInformation | Company Information (79) | Read |
| ocpfWarehouseEntries | Warehouse Entry (7312) | Read |
| ocpfReminderHeaders | Reminder Header (295) | Read |
| ocpfReminderLines | Reminder Line (296) | Read |
| ocpfFinanceChargeMemoHeaders | Finance Charge Memo Header (302) | Read |
| ocpfFinanceChargeMemoLines | Finance Charge Memo Line (303) | Read |
| ocpfApprovalEntries | Approval Entry (454) | Read |
| ocpfWorkflowStepInstances | Workflow Step Instance (1504) | Read |

---

## 8. Non-Functional Requirements

| # | Requirement |
|---|---|
| NF1 | All API pages must compile without warnings on BC Runtime 16.0 |
| NF2 | No dependencies on localization apps or country-specific objects |
| NF3 | All AL objects must use the `OnlyCopilotFans.OCPFAPIsv3` namespace |
| NF4 | Object IDs must fall within the 90800–90999 range |
| NF5 | Extension must be deployable as a per-tenant extension (PTE) on BC SaaS |
| NF6 | No UI pages, codeunits, or reports — API pages only in this extension |
| NF7 | The extension must not modify any base application objects |

---

## 9. Assumptions & Constraints

- Source tables are assumed to exist in the standard W1 BC application (v27.0.0.0+). No custom tables are referenced.
- Field selection targets all non-obsolete standard fields. FlowFields that are safe to read via API (e.g., `Balance`, `Outstanding Amount`) are included where they exist on the source table and are commonly consumed.
- The Sales Header and Purchase Header tables serve multiple document types (Quote, Order, Invoice, Credit Memo). Each document type is exposed as a separate API page with an appropriate filter applied via `SourceTableView`.
- The `Job` table caption in BC v27 displays as "Project" — entity names in this library use `ocpfProjects` to reflect current BC terminology, while the AL source table reference remains `Job`.
- `Item Application Entry` (Table 339) has had `SystemId` since BC 15 (2019 Wave 2). `ODataKeyFields = SystemId` applies normally.

---

## 10. Post-Dev Revision Summary

This section documents all changes made in FRD v2.0 relative to v1.0, cross-referenced to the post-build gap analysis findings.

| Gap ID | Section(s) Changed | Original Text | Corrected Text |
|---|---|---|---|
| GAP-01 | Section 1, Section 5.4, all Batch 1/2 entity tables | Library described as "read-focused"; setup/master data designated Read-only | Library correctly described as read/write; all master data and setup entities designated Read/Write |
| GAP-02 | Section 7 — Batch 5 entity table | `ocpfProjectPostingGroups` listed as Job Posting Group (Table **96**) | Corrected to Table **208**. Table 96 is G/L Budget Entry. |
| GAP-03 | Section 5.3 | Pending fields with removal version > 28.0 "may be included at developer discretion" | Pending fields excluded unconditionally — no exceptions, no version check |
| GAP-08 | Section 1 | Library described as "read-focused" | Corrected to reflect the as-built reality: 62 editable pages, full read/write library |

**Gap-fill additions (not in original FRD, added during implementation):**

| Entity | Batch | IDs | Reason Added |
|---|---|---|---|
| `ocpfInventoryPostingSetup` | 1 (CoreFinancial) | 90824 | Missing despite Inventory Posting Groups being present — logical completeness |
| `ocpfSalesBlanketOrders` / `ocpfSalesBlanketOrderLines` | 3 (Sales) | 90886/90887 | Missing document type despite all other Sales Header types being present |
| `ocpfPurchaseQuotes` / `ocpfPurchaseQuoteLines` | 4 (Purchasing) | 90904/90905 | Missing despite Sales Quotes being present — symmetry |
| `ocpfPurchaseBlanketOrders` / `ocpfPurchaseBlanketOrderLines` | 4 (Purchasing) | 90906/90907 | Missing document type despite all other Purchase Header types being present |
