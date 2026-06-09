# Functional Requirements Document
## OCPFAPIs v3.0 — OnlyCopilotFans API Library for Business Central

**Document Version:** 1.0  
**Date:** 2026-06-09  
**Author:** OnlyCopilotFans  
**Status:** Draft

---

## 1. Purpose & Scope

This document defines the functional requirements for the **OCPFAPIs v3.0** Business Central extension. The library exposes a comprehensive set of read-focused API pages covering Finance, Sales, Purchasing, Inventory, Projects, Fixed Assets, and supporting master/reference data. It is designed to serve as the data layer for AI copilot integrations, reporting tools, third-party connectors, and custom front-end applications built on top of Microsoft Dynamics 365 Business Central.

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

Each batch of API pages is assigned its own API Group (see Section 6). This allows consumers to discover and connect to logical subsets of the library without subscribing to all 106 endpoints.

### 5.2 Key Fields

- Every API page **must** expose the `SystemId` field (sourced from the `SystemId` system field on the source table).
- Every API page **must** set `ODataKeyFields = SystemId`.
- Where a table has a natural business key (e.g., `No.` on Customer), that field must also be included as a standard field — but it is not the OData key.

### 5.3 Field Coverage

- All standard fields from the source BC table must be included, including fields that do not appear on any standard Card or List page in the BC UI.
- No computed or FlowField-only fields that would break OData reads are permitted unless they are safe and commonly used (e.g., `Balance` on Customer).
- `ApplicationArea = All` must be set on every field.
- Fields with `ObsoleteState = Removed` must be excluded (they no longer exist in the table). Fields with `ObsoleteState = Pending` and `ObsoleteRemovalVersion ≤ 28.0` must also be excluded to avoid compiler warnings and ensure forward compatibility. Fields with `ObsoleteState = Pending` and removal version > 28.0 may be included at developer discretion.

### 5.4 Access and Permissions

- All API pages are **read-only** by default (`Editable = false`) except for the following, which support `INSERT`, `MODIFY`, and `DELETE` where the underlying BC table permits unposted edits:
  - General Journal Lines
  - Sales Quotes, Sales Quote Lines
  - Sales Orders, Sales Order Lines
  - Sales Invoices, Sales Invoice Lines
  - Sales Credit Memos, Sales Credit Memo Lines
  - Purchase Orders, Purchase Order Lines
  - Purchase Invoices, Purchase Invoice Lines
  - Purchase Credit Memos, Purchase Credit Memo Lines

- Posted documents, all ledger entries, setup tables, and reference tables are **read-only**.

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
| 1 | `ocpf_coreFinancial` | GL, ledger entries, posting setup, VAT, dimensions | 24 |
| 2 | `ocpf_masterData` | Banking, reference data, customers, vendors, items, resources, employees | 29 |
| 3 | `ocpf_sales` | Sales documents (open + posted) | 16 |
| 4 | `ocpf_purchasing` | Purchase documents (open + posted) | 14 |
| 5 | `ocpf_projectsAndAssets` | Projects, fixed assets, journals, pricing | 14 |
| 6 | `ocpf_systemAndSetup` | Attachments, company info, warehouse, collections, workflow | 9 |

**Total: 106 API pages**

---

## 7. Entity Requirements by Batch

### Batch 1 — ocpf_coreFinancial

| Entity Name | Source Table | R/W |
|---|---|---|
| ocpfChartOfAccounts | G/L Account (15) | Read |
| ocpfGeneralLedgerEntries | G/L Entry (17) | Read |
| ocpfGeneralLedgerSetup | General Ledger Setup (98) | Read |
| ocpfAccountingPeriods | Accounting Period (50) | Read |
| ocpfGLBudgetEntries | G/L Budget Entry (96) | Read |
| ocpfGLRegisters | G/L Register (45) | Read |
| ocpfCustLedgerEntries | Cust. Ledger Entry (21) | Read |
| ocpfDetailedCustLedgerEntries | Detailed Cust. Ledg. Entry (379) | Read |
| ocpfVendorLedgerEntries | Vendor Ledger Entry (25) | Read |
| ocpfDetailedVendorLedgerEntries | Detailed Vendor Ledg. Entry (380) | Read |
| ocpfEmployeeLedgerEntries | Employee Ledger Entry (5222) | Read |
| ocpfGeneralBusinessPostingGroups | Gen. Business Posting Group (250) | Read |
| ocpfGeneralProductPostingGroups | Gen. Product Posting Group (251) | Read |
| ocpfGeneralPostingSetup | General Posting Setup (252) | Read |
| ocpfCustomerPostingGroups | Customer Posting Group (92) | Read |
| ocpfVendorPostingGroups | Vendor Posting Group (93) | Read |
| ocpfInventoryPostingGroups | Inventory Posting Group (94) | Read |
| ocpfVatBusinessPostingGroups | VAT Business Posting Group (323) | Read |
| ocpfVatProductPostingGroups | VAT Product Posting Group (324) | Read |
| ocpfVatPostingSetup | VAT Posting Setup (325) | Read |
| ocpfDimensions | Dimension (348) | Read |
| ocpfDimensionValues | Dimension Value (349) | Read |
| ocpfDefaultDimensions | Default Dimension (352) | Read |
| ocpfDimensionSetEntries | Dimension Set Entry (480) | Read |

### Batch 2 — ocpf_masterData

| Entity Name | Source Table | R/W |
|---|---|---|
| ocpfBankAccounts | Bank Account (270) | Read |
| ocpfBankAccountPostingGroups | Bank Account Posting Group (277) | Read |
| ocpfBankAccountLedgerEntries | Bank Account Ledger Entry (271) | Read |
| ocpfPaymentTerms | Payment Terms (3) | Read |
| ocpfPaymentMethods | Payment Method (289) | Read |
| ocpfCurrencies | Currency (4) | Read |
| ocpfCountriesRegions | Country/Region (9) | Read |
| ocpfUnitsOfMeasure | Unit of Measure (204) | Read |
| ocpfItemUnitsOfMeasure | Item Unit of Measure (5404) | Read |
| ocpfLocations | Location (14) | Read |
| ocpfItemCategories | Item Category (5722) | Read |
| ocpfShipmentMethods | Shipment Method (10) | Read |
| ocpfCustomers | Customer (18) | Read |
| ocpfVendors | Vendor (23) | Read |
| ocpfContacts | Contact (5050) | Read |
| ocpfContactBusinessRelations | Contact Business Relation (5054) | Read |
| ocpfItems | Item (27) | Read |
| ocpfItemLedgerEntries | Item Ledger Entry (32) | Read |
| ocpfValueEntries | Value Entry (5802) | Read |
| ocpfItemApplicationEntries | Item Application Entry (339) | Read |
| ocpfItemVendorCatalogs | Item Vendor (99) | Read |
| ocpfStockkeepingUnits | Stockkeeping Unit (5700) | Read |
| ocpfItemTrackingCodes | Item Tracking Code (6502) | Read |
| ocpfItemCharges | Item Charge (5800) | Read |
| ocpfResources | Resource (156) | Read |
| ocpfResourceLedgerEntries | Res. Ledger Entry (203) | Read |
| ocpfResourceGroups | Resource Group (152) | Read |
| ocpfEmployees | Employee (5200) | Read |
| ocpfSalespeople | Salesperson/Purchaser (13) | Read |

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
| ocpfPostedPurchaseCreditMemoLines | Purch. Cr. Memo Line (125) | Read |
| ocpfPostedPurchaseReceipts | Purch. Rcpt. Header (120) | Read |
| ocpfPostedPurchaseReceiptLines | Purch. Rcpt. Line (121) | Read |
| ocpfPostedReturnShipments | Return Shipment Header (6650) | Read |
| ocpfPostedReturnShipmentLines | Return Shipment Line (6651) | Read |

### Batch 5 — ocpf_projectsAndAssets

| Entity Name | Source Table | R/W |
|---|---|---|
| ocpfProjects | Job (167) | Read |
| ocpfProjectPostingGroups | Job Posting Group (96) | Read |
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
