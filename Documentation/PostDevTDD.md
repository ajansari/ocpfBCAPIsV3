# Post-Development Technical Design Document
## OCPFAPIs v3.0 — OnlyCopilotFans API Library for Business Central

**Document Type:** Post-Development Record (as-built)  
**Date:** 2026-06-09  
**Status:** Complete  
**Relationship to TDD:** This document reflects what was actually built. Where the implementation deviates from the TDD, the ChangeLog.md records the reason. This document supersedes the TDD as the authoritative technical reference for the deployed library.

---

## 1. Extension Identity (as deployed)

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
| Target | BC v27.5+ SaaS, W1 baseline |

---

## 2. Library Summary

| Metric | Value |
|---|---|
| Total API pages | **106** |
| API groups | **6** |
| Editable pages | **55** |
| Read-only pages | **51** |
| Total fields exposed | **5,558** (including SystemId on each page) |
| Permission sets | **2** (OCPF - READ, OCPF - READ/WRITE) |
| Object IDs used | **90800–90938, 90950–90951** |
| Object IDs reserved for growth | **90939–90949, 90952–90999 (59 IDs)** |

---

## 3. API Identity Convention (as implemented)

| Property | Pattern | Example |
|---|---|---|
| APIPublisher | `'OnlyCopilotFans'` | `'OnlyCopilotFans'` |
| APIGroup | `'ocpf_<camelCaseName>'` | `'ocpf_coreFinancial'` |
| APIVersion | `'v3.0'` | `'v3.0'` |
| EntityName | `'ocpf<PascalCase>'` singular | `'ocpfGeneralLedgerEntry'` |
| EntitySetName | `'ocpf<PascalCase>'` plural | `'ocpfGeneralLedgerEntries'` |
| ODataKeyFields | `SystemId` on every page | — |
| Page Caption | Plain-English sentence | `'Posted sales invoices.'` |
| Field ToolTip | Source BC tooltip or generated | `'Specifies the posting date.'` |

---

## 4. Namespace and Using Directive Pattern

Every AL file opens with:

```al
namespace OnlyCopilotFans.OCPFAPIsv3;

using <Microsoft.Or.System.Namespace>;
```

Single namespace for all 106 objects. Each file declares exactly one `using` directive sourced from the BC v27.5 symbol file for its source table. Two pages source from `System.Automation` (Approval Entry, Workflow Step Instance) — not a `Microsoft.*` namespace.

---

## 5. Field Rules (as implemented)

| Rule | Implementation |
|---|---|
| All W1 fields included | Field IDs 1–9,999 and 99,000,000+ |
| Localization fields excluded | Field IDs 10,000–89,999 excluded universally |
| Obsolete fields excluded | `ObsoleteState = Pending` or `Removed` — both excluded unconditionally |
| FlowFilter fields excluded | Excluded by type check |
| Raw BLOB fields excluded | Excluded by type check |
| Media / MediaSet fields | Included (BC API framework streams these) |
| SystemId first | Field identifier `id` always first in repeater |
| Field identifier format | camelCase, `%` → `Pct`, non-alphanumeric stripped |
| Reserved keyword conflicts | Append type suffix (e.g., `area` → `areaCode`) |
| Caption | From BC source table, or field name if absent |
| ToolTip | From BC source table, or `'Specifies the <Name>.'` if absent |
| ApplicationArea | `All` on every field |

---

## 6. Editable vs Read-Only Rule

| Category | Editable | AL Property |
|---|---|---|
| Master data (Customers, Vendors, Items, etc.) | Yes | `DelayedInsert = true` |
| Setup / config tables (Posting Groups, VAT, etc.) | Yes | `DelayedInsert = true` |
| Open documents (Sales/Purchase Orders, Invoices, etc.) | Yes | `DelayedInsert = true` |
| General Journal Lines | Yes | `DelayedInsert = true` |
| Posted ledger entries | No | `Editable = false` |
| Posted documents | No | `Editable = false` |
| Audit / system tables | No | `Editable = false` |

`DelayedInsert = true` is **required** on all editable API pages. Without it, BC's OData framework cannot buffer the insert transaction correctly.

---

## 7. Document-Type Filter Pattern

Pages sourced from `Sales Header` (Table 36), `Sales Line` (Table 37), `Purchase Header` (Table 38), and `Purchase Line` (Table 39) use `SourceTableView` to filter by document type:

```al
// Single-word enum values — no quotes inside const()
SourceTableView = where("Document Type" = const(Order));
SourceTableView = where("Document Type" = const(Invoice));
SourceTableView = where("Document Type" = const(Quote));

// Multi-word enum values — double-quotes required inside const()
SourceTableView = where("Document Type" = const("Credit Memo"));
```

---

## 8. OData $metadata Endpoints

| API Group | $metadata URL |
|---|---|
| Core Financial | `.../api/OnlyCopilotFans/ocpf_coreFinancial/v3.0/$metadata` |
| Master Data | `.../api/OnlyCopilotFans/ocpf_masterData/v3.0/$metadata` |
| Sales | `.../api/OnlyCopilotFans/ocpf_sales/v3.0/$metadata` |
| Purchasing | `.../api/OnlyCopilotFans/ocpf_purchasing/v3.0/$metadata` |
| Projects & Assets | `.../api/OnlyCopilotFans/ocpf_projectsAndAssets/v3.0/$metadata` |
| System & Setup | `.../api/OnlyCopilotFans/ocpf_systemAndSetup/v3.0/$metadata` |

---

## 9. Permission Sets

| Object ID | Name | Assignable | Coverage |
|---|---|---|---|
| 90950 | `OCPF - READ` | Yes | `X` on all 106 pages |
| 90951 | `OCPF - READ/WRITE` | Yes | Includes `OCPF - READ`; `X` on all 55 editable pages |

**Dependency:** Both permission sets require that the user also has read (or write) permissions on the underlying BC base application tables. Assign alongside `D365 READ` for read-only consumers, or `D365 BUS FULL ACCESS` (or equivalent) for read/write consumers.

---

## 10. Per-Batch Object Inventory

### CoreFinancial — `ocpf_coreFinancial` (90800–90823)

**24 pages** | 16 editable | 51 | 0 total fields

| ID | Page / EntitySetName | EntityName | Source Table | Fields | Mode | Filter |
|---|---|---|---|---|---|---|
| 90800 | `ocpfChartOfAccounts` | `ocpfChartOfAccount` | "G/L Account" | 0 | R/W | — |
| 90801 | `ocpfGeneralLedgerEntries` | `ocpfGeneralLedgerEntry` | "G/L Entry" | 0 | R | — |
| 90802 | `ocpfGeneralLedgerSetup` | `ocpfGeneralLedgerSetup` | "General Ledger Setup" | 0 | R/W | — |
| 90803 | `ocpfAccountingPeriods` | `ocpfAccountingPeriod` | "Accounting Period" | 0 | R/W | — |
| 90804 | `ocpfGLBudgetEntries` | `ocpfGLBudgetEntry` | "G/L Budget Entry" | 0 | R/W | — |
| 90805 | `ocpfGLRegisters` | `ocpfGLRegister` | "G/L Register" | 0 | R | — |
| 90806 | `ocpfCustLedgerEntries` | `ocpfCustLedgerEntry` | "Cust. Ledger Entry" | 0 | R | — |
| 90807 | `ocpfDetailedCustLedgerEntries` | `ocpfDetailedCustLedgerEntry` | "Detailed Cust. Ledg. Entry" | 0 | R | — |
| 90808 | `ocpfVendorLedgerEntries` | `ocpfVendorLedgerEntry` | "Vendor Ledger Entry" | 0 | R | — |
| 90809 | `ocpfDtldVendorLedgEntries` | `ocpfDetailedVendorLedgerEntry` | "Detailed Vendor Ledg. Entry" | 0 | R | — |
| 90810 | `ocpfEmployeeLedgerEntries` | `ocpfEmployeeLedgerEntry` | "Employee Ledger Entry" | 0 | R | — |
| 90811 | `ocpfGenBusPostingGroups` | `ocpfGenBusPostingGroup` | "Gen. Business Posting Group" | 0 | R/W | — |
| 90812 | `ocpfGenProdPostingGroups` | `ocpfGeneralProductPostingGroup` | "Gen. Product Posting Group" | 0 | R/W | — |
| 90813 | `ocpfGeneralPostingSetup` | `ocpfGeneralPostingSetup` | "General Posting Setup" | 0 | R/W | — |
| 90814 | `ocpfCustomerPostingGroups` | `ocpfCustomerPostingGroup` | "Customer Posting Group" | 0 | R/W | — |
| 90815 | `ocpfVendorPostingGroups` | `ocpfVendorPostingGroup` | "Vendor Posting Group" | 0 | R/W | — |
| 90816 | `ocpfInventoryPostingGroups` | `ocpfInventoryPostingGroup` | "Inventory Posting Group" | 0 | R/W | — |
| 90817 | `ocpfVatBusinessPostingGroups` | `ocpfVatBusinessPostingGroup` | "VAT Business Posting Group" | 0 | R/W | — |
| 90818 | `ocpfVatProductPostingGroups` | `ocpfVatProductPostingGroup` | "VAT Product Posting Group" | 0 | R/W | — |
| 90819 | `ocpfVatPostingSetup` | `ocpfVatPostingSetup` | "VAT Posting Setup" | 0 | R/W | — |
| 90820 | `ocpfDimensions` | `ocpfDimension` | Dimension | 0 | R/W | — |
| 90821 | `ocpfDimensionValues` | `ocpfDimensionValue` | "Dimension Value" | 0 | R/W | — |
| 90822 | `ocpfDefaultDimensions` | `ocpfDefaultDimension` | "Default Dimension" | 0 | R/W | — |
| 90823 | `ocpfDimensionSetEntries` | `ocpfDimensionSetEntry` | "Dimension Set Entry" | 0 | R | — |

### MasterData — `ocpf_masterData` (90830–90858)

**29 pages** | 24 editable | 51 | 0 total fields

| ID | Page / EntitySetName | EntityName | Source Table | Fields | Mode | Filter |
|---|---|---|---|---|---|---|
| 90830 | `ocpfBankAccounts` | `ocpfBankAccount` | "Bank Account" | 0 | R/W | — |
| 90831 | `ocpfBankAccountPostingGroups` | `ocpfBankAccountPostingGroup` | "Bank Account Posting Group" | 0 | R/W | — |
| 90832 | `ocpfBankAccountLedgerEntries` | `ocpfBankAccountLedgerEntry` | "Bank Account Ledger Entry" | 0 | R | — |
| 90833 | `ocpfPaymentTerms` | `ocpfPaymentTerm` | "Payment Terms" | 0 | R/W | — |
| 90834 | `ocpfPaymentMethods` | `ocpfPaymentMethod` | "Payment Method" | 0 | R/W | — |
| 90835 | `ocpfCurrencies` | `ocpfCurrency` | Currency | 0 | R/W | — |
| 90836 | `ocpfCountriesRegions` | `ocpfCountryRegion` | "Country/Region" | 0 | R/W | — |
| 90837 | `ocpfUnitsOfMeasure` | `ocpfUnitOfMeasure` | "Unit of Measure" | 0 | R/W | — |
| 90838 | `ocpfItemUnitsOfMeasure` | `ocpfItemUnitOfMeasure` | "Item Unit of Measure" | 0 | R/W | — |
| 90839 | `ocpfLocations` | `ocpfLocation` | Location | 0 | R/W | — |
| 90840 | `ocpfItemCategories` | `ocpfItemCategory` | "Item Category" | 0 | R/W | — |
| 90841 | `ocpfShipmentMethods` | `ocpfShipmentMethod` | "Shipment Method" | 0 | R/W | — |
| 90842 | `ocpfCustomers` | `ocpfCustomer` | Customer | 0 | R/W | — |
| 90843 | `ocpfVendors` | `ocpfVendor` | Vendor | 0 | R/W | — |
| 90844 | `ocpfContacts` | `ocpfContact` | Contact | 0 | R/W | — |
| 90845 | `ocpfContactBusinessRelations` | `ocpfContactBusinessRelation` | "Contact Business Relation" | 0 | R/W | — |
| 90846 | `ocpfItems` | `ocpfItem` | Item | 0 | R/W | — |
| 90847 | `ocpfItemLedgerEntries` | `ocpfItemLedgerEntry` | "Item Ledger Entry" | 0 | R | — |
| 90848 | `ocpfValueEntries` | `ocpfValueEntry` | "Value Entry" | 0 | R | — |
| 90849 | `ocpfItemApplicationEntries` | `ocpfItemApplicationEntry` | "Item Application Entry" | 0 | R | — |
| 90850 | `ocpfItemVendorCatalogs` | `ocpfItemVendorCatalog` | "Item Vendor" | 0 | R/W | — |
| 90851 | `ocpfStockkeepingUnits` | `ocpfStockkeepingUnit` | "Stockkeeping Unit" | 0 | R/W | — |
| 90852 | `ocpfItemTrackingCodes` | `ocpfItemTrackingCode` | "Item Tracking Code" | 0 | R/W | — |
| 90853 | `ocpfItemCharges` | `ocpfItemCharge` | "Item Charge" | 0 | R/W | — |
| 90854 | `ocpfResources` | `ocpfResource` | Resource | 0 | R/W | — |
| 90855 | `ocpfResourceLedgerEntries` | `ocpfResourceLedgerEntry` | "Res. Ledger Entry" | 0 | R | — |
| 90856 | `ocpfResourceGroups` | `ocpfResourceGroup` | "Resource Group" | 0 | R/W | — |
| 90857 | `ocpfEmployees` | `ocpfEmployee` | Employee | 0 | R/W | — |
| 90858 | `ocpfSalespeople` | `ocpfSalesperson` | "Salesperson/Purchaser" | 0 | R/W | — |

### Sales — `ocpf_sales` (90870–90885)

**16 pages** | 8 editable | 51 | 2,352 total fields

| ID | Page / EntitySetName | EntityName | Source Table | Fields | Mode | Filter |
|---|---|---|---|---|---|---|
| 90870 | `ocpfSalesQuotes` | `ocpfSalesQuote` | "Sales Header" | 182 | R/W | where("Document Type" = const(Quote)) |
| 90871 | `ocpfSalesQuoteLines` | `ocpfSalesQuoteLine` | "Sales Line" | 194 | R/W | where("Document Type" = const(Quote)) |
| 90872 | `ocpfSalesOrders` | `ocpfSalesOrder` | "Sales Header" | 182 | R/W | where("Document Type" = const(Order)) |
| 90873 | `ocpfSalesOrderLines` | `ocpfSalesOrderLine` | "Sales Line" | 194 | R/W | where("Document Type" = const(Order)) |
| 90874 | `ocpfSalesInvoices` | `ocpfSalesInvoice` | "Sales Header" | 182 | R/W | where("Document Type" = const(Invoice)) |
| 90875 | `ocpfSalesInvoiceLines` | `ocpfSalesInvoiceLine` | "Sales Line" | 194 | R/W | where("Document Type" = const(Invoice)) |
| 90876 | `ocpfSalesCreditMemos` | `ocpfSalesCreditMemo` | "Sales Header" | 182 | R/W | where("Document Type" = const("Credit Memo")) |
| 90877 | `ocpfSalesCreditMemoLines` | `ocpfSalesCreditMemoLine` | "Sales Line" | 194 | R/W | where("Document Type" = const("Credit Memo")) |
| 90878 | `ocpfPostedSalesInvoices` | `ocpfPostedSalesInvoice` | "Sales Invoice Header" | 136 | R | — |
| 90879 | `ocpfPostedSalesInvoiceLines` | `ocpfPostedSalesInvoiceLine` | "Sales Invoice Line" | 101 | R | — |
| 90880 | `ocpfPostedSalesCreditMemos` | `ocpfPostedSalesCreditMemo` | "Sales Cr.Memo Header" | 123 | R | — |
| 90881 | `ocpfPostedSalesCreditMemoLines` | `ocpfPostedSalesCreditMemoLine` | "Sales Cr.Memo Line" | 97 | R | — |
| 90882 | `ocpfPostedSalesShipments` | `ocpfPostedSalesShipment` | "Sales Shipment Header" | 107 | R | — |
| 90883 | `ocpfPostedSalesShipmentLines` | `ocpfPostedSalesShipmentLine` | "Sales Shipment Line" | 97 | R | — |
| 90884 | `ocpfPostedReturnReceipts` | `ocpfPostedReturnReceipt` | "Return Receipt Header" | 102 | R | — |
| 90885 | `ocpfPostedReturnReceiptLines` | `ocpfPostedReturnReceiptLine` | "Return Receipt Line" | 85 | R | — |

### Purchasing — `ocpf_purchasing` (90890–90903)

**14 pages** | 6 editable | 51 | 1,950 total fields

| ID | Page / EntitySetName | EntityName | Source Table | Fields | Mode | Filter |
|---|---|---|---|---|---|---|
| 90890 | `ocpfPurchaseOrders` | `ocpfPurchaseOrder` | "Purchase Header" | 159 | R/W | where("Document Type" = const(Order)) |
| 90891 | `ocpfPurchaseOrderLines` | `ocpfPurchaseOrderLine` | "Purchase Line" | 211 | R/W | where("Document Type" = const(Order)) |
| 90892 | `ocpfPurchaseInvoices` | `ocpfPurchaseInvoice` | "Purchase Header" | 159 | R/W | where("Document Type" = const(Invoice)) |
| 90893 | `ocpfPurchaseInvoiceLines` | `ocpfPurchaseInvoiceLine` | "Purchase Line" | 211 | R/W | where("Document Type" = const(Invoice)) |
| 90894 | `ocpfPurchaseCreditMemos` | `ocpfPurchaseCreditMemo` | "Purchase Header" | 159 | R/W | where("Document Type" = const("Credit Memo")) |
| 90895 | `ocpfPurchaseCreditMemoLines` | `ocpfPurchaseCreditMemoLine` | "Purchase Line" | 211 | R/W | where("Document Type" = const("Credit Memo")) |
| 90896 | `ocpfPostedPurchaseInvoices` | `ocpfPostedPurchaseInvoice` | "Purch. Inv. Header" | 111 | R | — |
| 90897 | `ocpfPostedPurchaseInvoiceLines` | `ocpfPostedPurchaseInvoiceLine` | "Purch. Inv. Line" | 118 | R | — |
| 90898 | `ocpfPostedPurchaseCreditMemos` | `ocpfPostedPurchaseCreditMemo` | "Purch. Cr. Memo Hdr." | 105 | R | — |
| 90899 | `ocpfPostedPurchCrMemoLines` | `ocpfPostedPurchCrMemoLine` | "Purch. Cr. Memo Line" | 115 | R | — |
| 90900 | `ocpfPostedPurchaseReceipts` | `ocpfPostedPurchaseReceipt` | "Purch. Rcpt. Header" | 96 | R | — |
| 90901 | `ocpfPostedPurchaseReceiptLines` | `ocpfPostedPurchaseReceiptLine` | "Purch. Rcpt. Line" | 117 | R | — |
| 90902 | `ocpfPostedReturnShipments` | `ocpfPostedReturnShipment` | "Return Shipment Header" | 89 | R | — |
| 90903 | `ocpfPostedReturnShipmentLines` | `ocpfPostedReturnShipmentLine` | "Return Shipment Line" | 89 | R | — |

### ProjectsAndAssets — `ocpf_projectsAndAssets` (90910–90923)

**14 pages** | 1 editable | 51 | 930 total fields

| ID | Page / EntitySetName | EntityName | Source Table | Fields | Mode | Filter |
|---|---|---|---|---|---|---|
| 90910 | `ocpfProjects` | `ocpfProject` | Job | 106 | R | — |
| 90911 | `ocpfProjectPostingGroups` | `ocpfProjectPostingGroup` | "Job Posting Group" | 17 | R | — |
| 90912 | `ocpfProjectTasks` | `ocpfProjectTask` | "Job Task" | 75 | R | — |
| 90913 | `ocpfProjectPlanningLines` | `ocpfProjectPlanningLine` | "Job Planning Line" | 102 | R | — |
| 90914 | `ocpfProjectLedgerEntries` | `ocpfProjectLedgerEntry` | "Job Ledger Entry" | 82 | R | — |
| 90915 | `ocpfFixedAssets` | `ocpfFixedAsset` | "Fixed Asset" | 33 | R | — |
| 90916 | `ocpfFaPostingGroups` | `ocpfFaPostingGroup` | "FA Posting Group" | 45 | R | — |
| 90917 | `ocpfFaLedgerEntries` | `ocpfFaLedgerEntry` | "FA Ledger Entry" | 82 | R | — |
| 90918 | `ocpfFaDepreciationBooks` | `ocpfFaDepreciationBook` | "FA Depreciation Book" | 64 | R | — |
| 90919 | `ocpfGeneralJournalTemplates` | `ocpfGeneralJournalTemplate` | "Gen. Journal Template" | 30 | R | — |
| 90920 | `ocpfGeneralJournalBatches` | `ocpfGeneralJournalBatch` | "Gen. Journal Batch" | 20 | R | — |
| 90921 | `ocpfGeneralJournalLines` | `ocpfGeneralJournalLine` | "Gen. Journal Line" | 213 | R/W | — |
| 90922 | `ocpfPriceListHeaders` | `ocpfPriceListHeader` | "Price List Header" | 23 | R | — |
| 90923 | `ocpfPriceListLines` | `ocpfPriceListLine` | "Price List Line" | 38 | R | — |

### SystemAndSetup — `ocpf_systemAndSetup` (90930–90938)

**9 pages** | 0 editable | 51 | 326 total fields

| ID | Page / EntitySetName | EntityName | Source Table | Fields | Mode | Filter |
|---|---|---|---|---|---|---|
| 90930 | `ocpfDocumentAttachments` | `ocpfDocumentAttachment` | "Document Attachment" | 18 | R | — |
| 90931 | `ocpfCompanyInformation` | `ocpfCompanyInformation` | "Company Information" | 60 | R | — |
| 90932 | `ocpfWarehouseEntries` | `ocpfWarehouseEntry` | "Warehouse Entry" | 45 | R | — |
| 90933 | `ocpfReminderHeaders` | `ocpfReminderHeader` | "Reminder Header" | 51 | R | — |
| 90934 | `ocpfReminderLines` | `ocpfReminderLine` | "Reminder Line" | 31 | R | — |
| 90935 | `ocpfFinanceChargeMemoHeaders` | `ocpfFinanceChargeMemoHeader` | "Finance Charge Memo Header" | 44 | R | — |
| 90936 | `ocpfFinanceChargeMemoLines` | `ocpfFinanceChargeMemoLine` | "Finance Charge Memo Line" | 28 | R | — |
| 90937 | `ocpfApprovalEntries` | `ocpfApprovalEntry` | "Approval Entry" | 29 | R | — |
| 90938 | `ocpfWorkflowStepInstances` | `ocpfWorkflowStepInstance` | "Workflow Step Instance" | 20 | R | — |

---

## 11. Known Name Abbreviations Applied

The following entity names were shortened from the TDD specification to comply with AL's 30-character identifier limit:

| TDD Name | Implemented Name | Reason |
|---|---|---|
| `ocpfGeneralBusinessPostingGroups` (32) | `ocpfGenBusPostingGroups` (24) | >30 chars |
| `ocpfGeneralBusinessPostingGroup` (31) | `ocpfGenBusPostingGroup` (23) | >30 chars |
| `ocpfGeneralProductPostingGroups` (31) | `ocpfGenProdPostingGroups` (25) | >30 chars |
| `ocpfDetailedVendorLedgerEntries` (31) | `ocpfDtldVendorLedgEntries` (25) | >30 chars |
| `ocpfPostedPurchaseCreditMemoLines` (33) | `ocpfPostedPurchCrMemoLines` (26) | >30 chars |
| `ocpfPostedPurchaseCreditMemoLine` (32) | `ocpfPostedPurchCrMemoLine` (25) | >30 chars |

---

## 12. Deviations from TDD Summary

See `ChangeLog.md` for full detail. Summary of rule changes affecting all batches:

| ID | Issue | Fix Applied |
|---|---|---|
| B1-01 | VAT Bus. Posting Group: TDD had wrong table number (320 vs 323) | Corrected to Table 323 |
| B1-02 | VAT Prod. Posting Group: TDD had wrong table number (321 vs 324) | Corrected to Table 324 |
| B1-03 | 4 entity names >30 chars | Shortened with BC standard abbreviations |
| B1-04 | Missing `using` directives in TDD template | Added to every file |
| B1-05 | 44 localization fields (IDs 10000–89999) included | Excluded by field ID filter |
| B1-06 | IRS 1099 fields included in W1 library | Excluded (US localization) |
| B1-B3 | All pages incorrectly set to `Editable = false` | 48 pages corrected to `DelayedInsert = true` |
| B3-01 | `%` character in field identifiers | Replaced with `Pct` suffix |
| B3-02 | `const("Order")` syntax wrong for single-word enum values | Removed quotes for single-word values |
| B4-01 | `ocpfPostedPurchaseCreditMemoLines` >30 chars | Shortened to `ocpfPostedPurchCrMemoLines` |
| B5-01 | Table index matched codeunit references instead of declarations | Fixed to `^table N` declaration pattern; added unquoted name support |

---

## 13. File Structure

```
OCPFAPIsv3/
├── app.json
├── PermSet.OCPFRead.al             (90950)
├── PermSet.OCPFReadWrite.al        (90951)
├── CoreFinancial/                  (24 files, 90800–90823)
├── MasterData/                     (29 files, 90830–90858)
├── Sales/                          (16 files, 90870–90885)
├── Purchasing/                     (14 files, 90890–90903)
├── ProjectsAndAssets/              (14 files, 90910–90923)
├── SystemAndSetup/                 (9 files, 90930–90938)
├── FRD.md
├── TDD.md
├── PostDevTDD.md                   (this document)
├── ChangeLog.md
├── SanityCheck.md
├── Research_APIDescriptions.md
└── Session_AgenticBCDevelopment_Journey.md
```
