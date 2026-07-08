# OnlyCopilotFans Business Central API Catalog v3.1

**Publisher:** OnlyCopilotFans  
**API Version:** v3.1 (all endpoints also served at v3.0; see ChangeLog)  
**BC Version:** 2025 Wave 2 (v27.5+)  
**Object Range:** 90800–90999  
**Date:** June 9, 2026 (v3.0) — updated July 7, 2026 (v3.1)  
**Created by:** AJ Ansari ( [Email](mailto:aj@onlycopilotfans.com) | [LinkedIn](https://linkedin.com/in/ajansari) )

## Overview

**OCPF APIs** is a Business Central extension that exposes over 175 of the most commonly used standard BC tables as OData v4 API endpoints. It is designed to be a comprehensive, ready-to-use API layer for integrations, reporting tools, and external applications that need reliable, structured access to Business Central data without requiring custom development per table.

Each API page maps directly to a standard BC source table and exposes every standard field from that table, with the deliberate exception of fields that are specific to country/region localizations. This keeps the API surface globally portable — the same endpoints and field set work consistently across any BC environment regardless of the localization installed.

### What changed between v3.0 and v3.1

**v3.1 (July 2026)** is an additive, non-breaking release. All v3.0 endpoints continue to work unchanged.

- **Versioning** — every API page is now dual-versioned (`APIVersion = 'v3.0', 'v3.1';`) and is served at both `.../v3.0/...` and `.../v3.1/...` base URLs. Entities introduced in v3.1 are published at v3.1 only, so **new integrations should use the `/v3.1/` base URL**. Existing v3.0 integrations need no changes.
- **170 missing standard fields added across 22 existing entities** — the v3.0 generator had silently skipped every field whose name contains parentheses, such as `Credit Limit (LCY)` on Customer, the cost/amount fields on Value Entry (`Cost Amount (Actual)`, `Sales Amount (Actual)`, …), and the `(LCY)`/`(Qty.)` FlowFields on Customer, Vendor, Item, Item Ledger Entry, Resource, and others. These fields appear on both the v3.0 and v3.1 endpoints (additive and non-breaking for OData clients). Each affected entity's field table below marks the new rows with an *"Added in API v3.1"* note.
- **65 new entities, v3.1-only:**
  - *Master Data* (+1): Ship-to Addresses (`ocpfShipToAddresses`)
  - *Manufacturing* — new category, API group `ocpf_manufacturing` (+34): manufacturing setup, work/machine centers, shop calendars, capacity units, routings and versions, production BOMs and versions, families, production orders with lines/components/routing lines/capacity needs, capacity ledger entries, and assembly management (assembly setup, assembly BOM components, open and posted assembly orders)
  - *Service Management* — new category, API group `ocpf_serviceManagement` (+30): service setup and code tables, service items and components, service documents (headers, item lines, lines), service contracts, loaners, service/warranty ledger entries, service registers, and posted service shipments/invoices/credit memos
- **5 additional v3.1-only entities (3.1.1):**
  - *Master Data* (+1): Vendor Bank Accounts (`ocpfVendorBankAccounts`) — per-vendor bank details for electronic payments (BC table 288).
  - *Sales* (+2): Sales Line Discounts (`ocpfSalesLineDiscounts`, BC table 7004) and Customer Invoice Discounts (`ocpfCustomerInvoiceDiscounts`, BC table 19 — the "sales invoice discount" setup).
  - *Purchasing* (+2): Purchase Line Discounts (`ocpfPurchaseLineDiscounts`, BC table 7014) and Vendor Invoice Discounts (`ocpfVendorInvoiceDiscounts`, BC table 24) — the purchase-side counterparts.
  - *Pricing note:* the Sales Line Discount and Purchase Line Discount API pages remain available even though the underlying BC tables are marked for deprecation, because the V16 pricing model is still an opt-in feature in BC. We will adjust this in the future once Microsoft enables the new pricing tables by default. In the meantime, both the classic discount pages and the already-published read-only `ocpfPriceListHeaders` / `ocpfPriceListLines` (Projects & Assets group) are exposed; invoice-discount tables (19/24) are not affected by the V16 change.
- **Tooltip corrections** — several field tooltips that the v3.0 generator had shifted onto neighboring fields were repaired, and tooltips for the added fields are sourced from the BC 27.5 Base Application.
- **Permission sets** — `OCPF - READ` now covers all 183 pages; `OCPF - READ/WRITE` grants write access on 116 editable pages.
- **App version** — `app.json` 3.0.0.0 → 3.1.0.0 → 3.1.1.0. Git tags `v3.0.0.0` and `v3.1.0.0` mark the earlier releases (`git diff v3.0.0.0 v3.1.0.0` shows the full contract delta).

The complete field-by-field delta is recorded in [ChangeLog.md](ChangeLog.md).

### Key characteristics

- **Broad coverage** — 175+ standard BC tables across core financials, master data, sales, purchasing, projects, fixed assets, manufacturing, assembly, service management, and system setup
- **Full field exposure** — every non-localization field on each source table is available, including flow fields and filter fields
- **Consistent shape** — all pages follow the same API group/entity naming convention and use `SystemId` as the OData key
- **Selective editability** — pages are marked editable (POST/PATCH/DELETE) or read-only (GET only) based on whether the underlying table is safe to write through an API
- **Localization-neutral** — fields tied to specific country/region localizations are intentionally excluded so the package installs and behaves identically in any market

---

## About this document

This document lists every API page, its source table, editability, and every exposed field.

**Field-level Editable legend:** 🔑 Key (OData key, read-only) · ✅ writable stored field · 🧮 computed (FlowField — calculated on read, never writable) · 🔍 filter (FlowFilter — not stored; used only to parameterize computed fields) · — stored field on a read-only page.
On read-only pages (❌ at page level) every field is read-only regardless of its glyph.

---

## Table of Contents

**Legend:** ✏️ editable (POST/PATCH/DELETE) · 👁 read-only (GET) · 🆕 new in v3.1

| Category | API Group | Entities | ✏️ | 👁 |
|---|---|---:|---:|---:|
| [Core Financial](#core-financial) | `ocpf_coreFinancial` | 25 | 17 | 8 |
| [Master Data](#master-data) | `ocpf_masterData` | 31 | 26 | 5 |
| [Sales](#sales) | `ocpf_sales` | 20 | 12 | 8 |
| [Purchasing](#purchasing) | `ocpf_purchasing` | 20 | 12 | 8 |
| [Projects & Assets](#projects--assets) | `ocpf_projectsAndAssets` | 14 | 1 | 13 |
| [System & Setup](#system--setup) | `ocpf_systemAndSetup` | 9 | 0 | 9 |
| [Manufacturing](#manufacturing) 🆕 | `ocpf_manufacturing` | 34 | 28 | 6 |
| [Service Management](#service-management) 🆕 | `ocpf_serviceManagement` | 30 | 20 | 10 |
| **Total** | | **183** | **116** | **67** |

<details>
<summary><b>Core Financial</b> — 25 entities · <code>ocpf_coreFinancial</code></summary>

| Entity | Source Table | Page ID | Access |
|---|---|---|:---:|
| [ocpfChartOfAccounts](#ocpfchartofaccounts) | G/L Account | 90800 | ✏️ |
| [ocpfGeneralLedgerEntries](#ocpfgeneralledgerentries) | G/L Entry | 90801 | 👁 |
| [ocpfGeneralLedgerSetup](#ocpfgeneralledgersetup) | General Ledger Setup | 90802 | ✏️ |
| [ocpfAccountingPeriods](#ocpfaccountingperiods) | Accounting Period | 90803 | ✏️ |
| [ocpfGLBudgetEntries](#ocpfglbudgetentries) | G/L Budget Entry | 90804 | ✏️ |
| [ocpfGLRegisters](#ocpfglregisters) | G/L Register | 90805 | 👁 |
| [ocpfCustLedgerEntries](#ocpfcustledgerentries) | Cust. Ledger Entry | 90806 | 👁 |
| [ocpfDetailedCustLedgerEntries](#ocpfdetailedcustledgerentries) | Detailed Cust. Ledg. Entry | 90807 | 👁 |
| [ocpfVendorLedgerEntries](#ocpfvendorledgerentries) | Vendor Ledger Entry | 90808 | 👁 |
| [ocpfDtldVendorLedgEntries](#ocpfdtldvendorledgentries) | Detailed Vendor Ledg. Entry | 90809 | 👁 |
| [ocpfEmployeeLedgerEntries](#ocpfemployeeledgerentries) | Employee Ledger Entry | 90810 | 👁 |
| [ocpfGenBusPostingGroups](#ocpfgenbuspostinggroups) | Gen. Business Posting Group | 90811 | ✏️ |
| [ocpfGenProdPostingGroups](#ocpfgenprodpostinggroups) | Gen. Product Posting Group | 90812 | ✏️ |
| [ocpfGeneralPostingSetup](#ocpfgeneralpostingsetup) | General Posting Setup | 90813 | ✏️ |
| [ocpfCustomerPostingGroups](#ocpfcustomerpostinggroups) | Customer Posting Group | 90814 | ✏️ |
| [ocpfVendorPostingGroups](#ocpfvendorpostinggroups) | Vendor Posting Group | 90815 | ✏️ |
| [ocpfInventoryPostingGroups](#ocpfinventorypostinggroups) | Inventory Posting Group | 90816 | ✏️ |
| [ocpfVatBusinessPostingGroups](#ocpfvatbusinesspostinggroups) | VAT Business Posting Group | 90817 | ✏️ |
| [ocpfVatProductPostingGroups](#ocpfvatproductpostinggroups) | VAT Product Posting Group | 90818 | ✏️ |
| [ocpfVatPostingSetup](#ocpfvatpostingsetup) | VAT Posting Setup | 90819 | ✏️ |
| [ocpfDimensions](#ocpfdimensions) | Dimension | 90820 | ✏️ |
| [ocpfDimensionValues](#ocpfdimensionvalues) | Dimension Value | 90821 | ✏️ |
| [ocpfDefaultDimensions](#ocpfdefaultdimensions) | Default Dimension | 90822 | ✏️ |
| [ocpfDimensionSetEntries](#ocpfdimensionsetentries) | Dimension Set Entry | 90823 | 👁 |
| [ocpfInventoryPostingSetup](#ocpfinventorypostingsetup) | Inventory Posting Setup | 90824 | ✏️ |

</details>

<details>
<summary><b>Master Data</b> — 31 entities · <code>ocpf_masterData</code></summary>

| Entity | Source Table | Page ID | Access |
|---|---|---|:---:|
| [ocpfBankAccounts](#ocpfbankaccounts) | Bank Account | 90830 | ✏️ |
| [ocpfBankAccountPostingGroups](#ocpfbankaccountpostinggroups) | Bank Account Posting Group | 90831 | ✏️ |
| [ocpfBankAccountLedgerEntries](#ocpfbankaccountledgerentries) | Bank Account Ledger Entry | 90832 | 👁 |
| [ocpfPaymentTerms](#ocpfpaymentterms) | Payment Terms | 90833 | ✏️ |
| [ocpfPaymentMethods](#ocpfpaymentmethods) | Payment Method | 90834 | ✏️ |
| [ocpfCurrencies](#ocpfcurrencies) | Currency | 90835 | ✏️ |
| [ocpfCountriesRegions](#ocpfcountriesregions) | Country/Region | 90836 | ✏️ |
| [ocpfUnitsOfMeasure](#ocpfunitsofmeasure) | Unit of Measure | 90837 | ✏️ |
| [ocpfItemUnitsOfMeasure](#ocpfitemunitsofmeasure) | Item Unit of Measure | 90838 | ✏️ |
| [ocpfLocations](#ocpflocations) | Location | 90839 | ✏️ |
| [ocpfItemCategories](#ocpfitemcategories) | Item Category | 90840 | ✏️ |
| [ocpfShipmentMethods](#ocpfshipmentmethods) | Shipment Method | 90841 | ✏️ |
| [ocpfCustomers](#ocpfcustomers) | Customer | 90842 | ✏️ |
| [ocpfVendors](#ocpfvendors) | Vendor | 90843 | ✏️ |
| [ocpfContacts](#ocpfcontacts) | Contact | 90844 | ✏️ |
| [ocpfContactBusinessRelations](#ocpfcontactbusinessrelations) | Contact Business Relation | 90845 | ✏️ |
| [ocpfItems](#ocpfitems) | Item | 90846 | ✏️ |
| [ocpfItemLedgerEntries](#ocpfitemledgerentries) | Item Ledger Entry | 90847 | 👁 |
| [ocpfValueEntries](#ocpfvalueentries) | Value Entry | 90848 | 👁 |
| [ocpfItemApplicationEntries](#ocpfitemapplicationentries) | Item Application Entry | 90849 | 👁 |
| [ocpfItemVendorCatalogs](#ocpfitemvendorcatalogs) | Item Vendor | 90850 | ✏️ |
| [ocpfStockkeepingUnits](#ocpfstockkeepingunits) | Stockkeeping Unit | 90851 | ✏️ |
| [ocpfItemTrackingCodes](#ocpfitemtrackingcodes) | Item Tracking Code | 90852 | ✏️ |
| [ocpfItemCharges](#ocpfitemcharges) | Item Charge | 90853 | ✏️ |
| [ocpfResources](#ocpfresources) | Resource | 90854 | ✏️ |
| [ocpfResourceLedgerEntries](#ocpfresourceledgerentries) | Res. Ledger Entry | 90855 | 👁 |
| [ocpfResourceGroups](#ocpfresourcegroups) | Resource Group | 90856 | ✏️ |
| [ocpfEmployees](#ocpfemployees) | Employee | 90857 | ✏️ |
| [ocpfSalespeople](#ocpfsalespeople) | Salesperson/Purchaser | 90858 | ✏️ |
| [ocpfShipToAddresses](#ocpfshiptoaddresses) 🆕 | Ship-to Address | 90859 | ✏️ |
| [ocpfVendorBankAccounts](#ocpfvendorbankaccounts) 🆕 | Vendor Bank Account | 90860 | ✏️ |

</details>

<details>
<summary><b>Sales</b> — 20 entities · <code>ocpf_sales</code></summary>

| Entity | Source Table | Page ID | Access |
|---|---|---|:---:|
| [ocpfSalesQuotes](#ocpfsalesquotes) | Sales Header | 90870 | ✏️ |
| [ocpfSalesQuoteLines](#ocpfsalesquotelines) | Sales Line | 90871 | ✏️ |
| [ocpfSalesOrders](#ocpfsalesorders) | Sales Header | 90872 | ✏️ |
| [ocpfSalesOrderLines](#ocpfsalesorderlines) | Sales Line | 90873 | ✏️ |
| [ocpfSalesInvoices](#ocpfsalesinvoices) | Sales Header | 90874 | ✏️ |
| [ocpfSalesInvoiceLines](#ocpfsalesinvoicelines) | Sales Line | 90875 | ✏️ |
| [ocpfSalesCreditMemos](#ocpfsalescreditmemos) | Sales Header | 90876 | ✏️ |
| [ocpfSalesCreditMemoLines](#ocpfsalescreditmemolines) | Sales Line | 90877 | ✏️ |
| [ocpfPostedSalesInvoices](#ocpfpostedsalesinvoices) | Sales Invoice Header | 90878 | 👁 |
| [ocpfPostedSalesInvoiceLines](#ocpfpostedsalesinvoicelines) | Sales Invoice Line | 90879 | 👁 |
| [ocpfPostedSalesCreditMemos](#ocpfpostedsalescreditmemos) | Sales Cr.Memo Header | 90880 | 👁 |
| [ocpfPostedSalesCreditMemoLines](#ocpfpostedsalescreditmemolines) | Sales Cr.Memo Line | 90881 | 👁 |
| [ocpfPostedSalesShipments](#ocpfpostedsalesshipments) | Sales Shipment Header | 90882 | 👁 |
| [ocpfPostedSalesShipmentLines](#ocpfpostedsalesshipmentlines) | Sales Shipment Line | 90883 | 👁 |
| [ocpfPostedReturnReceipts](#ocpfpostedreturnreceipts) | Return Receipt Header | 90884 | 👁 |
| [ocpfPostedReturnReceiptLines](#ocpfpostedreturnreceiptlines) | Return Receipt Line | 90885 | 👁 |
| [ocpfSalesBlanketOrders](#ocpfsalesblanketorders) | Sales Header | 90886 | ✏️ |
| [ocpfSalesBlanketOrderLines](#ocpfsalesblanketorderlines) | Sales Line | 90887 | ✏️ |
| [ocpfSalesLineDiscounts](#ocpfsaleslinediscounts) 🆕 | Sales Line Discount | 90888 | ✏️ |
| [ocpfCustomerInvoiceDiscounts](#ocpfcustomerinvoicediscounts) 🆕 | Cust. Invoice Disc. | 90889 | ✏️ |

</details>

<details>
<summary><b>Purchasing</b> — 20 entities · <code>ocpf_purchasing</code></summary>

| Entity | Source Table | Page ID | Access |
|---|---|---|:---:|
| [ocpfPurchaseOrders](#ocpfpurchaseorders) | Purchase Header | 90890 | ✏️ |
| [ocpfPurchaseOrderLines](#ocpfpurchaseorderlines) | Purchase Line | 90891 | ✏️ |
| [ocpfPurchaseInvoices](#ocpfpurchaseinvoices) | Purchase Header | 90892 | ✏️ |
| [ocpfPurchaseInvoiceLines](#ocpfpurchaseinvoicelines) | Purchase Line | 90893 | ✏️ |
| [ocpfPurchaseCreditMemos](#ocpfpurchasecreditmemos) | Purchase Header | 90894 | ✏️ |
| [ocpfPurchaseCreditMemoLines](#ocpfpurchasecreditmemolines) | Purchase Line | 90895 | ✏️ |
| [ocpfPostedPurchaseInvoices](#ocpfpostedpurchaseinvoices) | Purch. Inv. Header | 90896 | 👁 |
| [ocpfPostedPurchaseInvoiceLines](#ocpfpostedpurchaseinvoicelines) | Purch. Inv. Line | 90897 | 👁 |
| [ocpfPostedPurchaseCreditMemos](#ocpfpostedpurchasecreditmemos) | Purch. Cr. Memo Hdr. | 90898 | 👁 |
| [ocpfPostedPurchCrMemoLines](#ocpfpostedpurchcrmemolines) | Purch. Cr. Memo Line | 90899 | 👁 |
| [ocpfPostedPurchaseReceipts](#ocpfpostedpurchasereceipts) | Purch. Rcpt. Header | 90900 | 👁 |
| [ocpfPostedPurchaseReceiptLines](#ocpfpostedpurchasereceiptlines) | Purch. Rcpt. Line | 90901 | 👁 |
| [ocpfPostedReturnShipments](#ocpfpostedreturnshipments) | Return Shipment Header | 90902 | 👁 |
| [ocpfPostedReturnShipmentLines](#ocpfpostedreturnshipmentlines) | Return Shipment Line | 90903 | 👁 |
| [ocpfPurchaseQuotes](#ocpfpurchasequotes) | Purchase Header | 90904 | ✏️ |
| [ocpfPurchaseQuoteLines](#ocpfpurchasequotelines) | Purchase Line | 90905 | ✏️ |
| [ocpfPurchaseBlanketOrders](#ocpfpurchaseblanketorders) | Purchase Header | 90906 | ✏️ |
| [ocpfPurchaseBlanketOrderLines](#ocpfpurchaseblanketorderlines) | Purchase Line | 90907 | ✏️ |
| [ocpfPurchaseLineDiscounts](#ocpfpurchaselinediscounts) 🆕 | Purchase Line Discount | 90908 | ✏️ |
| [ocpfVendorInvoiceDiscounts](#ocpfvendorinvoicediscounts) 🆕 | Vendor Invoice Disc. | 90909 | ✏️ |

</details>

<details>
<summary><b>Projects & Assets</b> — 14 entities · <code>ocpf_projectsAndAssets</code></summary>

| Entity | Source Table | Page ID | Access |
|---|---|---|:---:|
| [ocpfProjects](#ocpfprojects) | Job | 90910 | 👁 |
| [ocpfProjectPostingGroups](#ocpfprojectpostinggroups) | Job Posting Group | 90911 | 👁 |
| [ocpfProjectTasks](#ocpfprojecttasks) | Job Task | 90912 | 👁 |
| [ocpfProjectPlanningLines](#ocpfprojectplanninglines) | Job Planning Line | 90913 | 👁 |
| [ocpfProjectLedgerEntries](#ocpfprojectledgerentries) | Job Ledger Entry | 90914 | 👁 |
| [ocpfFixedAssets](#ocpffixedassets) | Fixed Asset | 90915 | 👁 |
| [ocpfFaPostingGroups](#ocpffapostinggroups) | FA Posting Group | 90916 | 👁 |
| [ocpfFaLedgerEntries](#ocpffaledgerentries) | FA Ledger Entry | 90917 | 👁 |
| [ocpfFaDepreciationBooks](#ocpffadepreciationbooks) | FA Depreciation Book | 90918 | 👁 |
| [ocpfGeneralJournalTemplates](#ocpfgeneraljournaltemplates) | Gen. Journal Template | 90919 | 👁 |
| [ocpfGeneralJournalBatches](#ocpfgeneraljournalbatches) | Gen. Journal Batch | 90920 | 👁 |
| [ocpfGeneralJournalLines](#ocpfgeneraljournallines) | Gen. Journal Line | 90921 | ✏️ |
| [ocpfPriceListHeaders](#ocpfpricelistheaders) | Price List Header | 90922 | 👁 |
| [ocpfPriceListLines](#ocpfpricelistlines) | Price List Line | 90923 | 👁 |

</details>

<details>
<summary><b>System & Setup</b> — 9 entities · <code>ocpf_systemAndSetup</code></summary>

| Entity | Source Table | Page ID | Access |
|---|---|---|:---:|
| [ocpfDocumentAttachments](#ocpfdocumentattachments) | Document Attachment | 90930 | 👁 |
| [ocpfCompanyInformation](#ocpfcompanyinformation) | Company Information | 90931 | 👁 |
| [ocpfWarehouseEntries](#ocpfwarehouseentries) | Warehouse Entry | 90932 | 👁 |
| [ocpfReminderHeaders](#ocpfreminderheaders) | Reminder Header | 90933 | 👁 |
| [ocpfReminderLines](#ocpfreminderlines) | Reminder Line | 90934 | 👁 |
| [ocpfFinanceChargeMemoHeaders](#ocpffinancechargememoheaders) | Finance Charge Memo Header | 90935 | 👁 |
| [ocpfFinanceChargeMemoLines](#ocpffinancechargememolines) | Finance Charge Memo Line | 90936 | 👁 |
| [ocpfApprovalEntries](#ocpfapprovalentries) | Approval Entry | 90937 | 👁 |
| [ocpfWorkflowStepInstances](#ocpfworkflowstepinstances) | Workflow Step Instance | 90938 | 👁 |

</details>

<details>
<summary><b>Manufacturing</b> — 34 entities · <code>ocpf_manufacturing</code> · 🆕 new in v3.1</summary>

| Entity | Source Table | Page ID | Access |
|---|---|---|:---:|
| [ocpfManufacturingSetup](#ocpfmanufacturingsetup) | Manufacturing Setup | 90939 | ✏️ |
| [ocpfWorkShifts](#ocpfworkshifts) | Work Shift | 90940 | ✏️ |
| [ocpfShopCalendars](#ocpfshopcalendars) | Shop Calendar | 90941 | ✏️ |
| [ocpfShopCalendarWorkingDays](#ocpfshopcalendarworkingdays) | Shop Calendar Working Days | 90942 | ✏️ |
| [ocpfWorkCenterGroups](#ocpfworkcentergroups) | Work Center Group | 90943 | ✏️ |
| [ocpfWorkCenters](#ocpfworkcenters) | Work Center | 90944 | ✏️ |
| [ocpfMachineCenters](#ocpfmachinecenters) | Machine Center | 90945 | ✏️ |
| [ocpfCapacityUnitsOfMeasure](#ocpfcapacityunitsofmeasure) | Capacity Unit of Measure | 90946 | ✏️ |
| [ocpfCalendarEntries](#ocpfcalendarentries) | Calendar Entry | 90947 | 👁 |
| [ocpfCalendarAbsenceEntries](#ocpfcalendarabsenceentries) | Calendar Absence Entry | 90948 | 👁 |
| [ocpfStops](#ocpfstops) | Stop | 90949 | ✏️ |
| [ocpfScraps](#ocpfscraps) | Scrap | 90950 | ✏️ |
| [ocpfRoutingLinks](#ocpfroutinglinks) | Routing Link | 90951 | ✏️ |
| [ocpfStandardTasks](#ocpfstandardtasks) | Standard Task | 90952 | ✏️ |
| [ocpfRoutingHeaders](#ocpfroutingheaders) | Routing Header | 90953 | ✏️ |
| [ocpfRoutingLines](#ocpfroutinglines) | Routing Line | 90954 | ✏️ |
| [ocpfRoutingVersions](#ocpfroutingversions) | Routing Version | 90955 | ✏️ |
| [ocpfProductionBomHeaders](#ocpfproductionbomheaders) | Production BOM Header | 90956 | ✏️ |
| [ocpfProductionBomLines](#ocpfproductionbomlines) | Production BOM Line | 90957 | ✏️ |
| [ocpfProductionBomVersions](#ocpfproductionbomversions) | Production BOM Version | 90958 | ✏️ |
| [ocpfFamilies](#ocpffamilies) | Family | 90959 | ✏️ |
| [ocpfFamilyLines](#ocpffamilylines) | Family Line | 90960 | ✏️ |
| [ocpfProductionOrders](#ocpfproductionorders) | Production Order | 90961 | ✏️ |
| [ocpfProdOrderLines](#ocpfprodorderlines) | Prod. Order Line | 90962 | ✏️ |
| [ocpfProdOrderComponents](#ocpfprodordercomponents) | Prod. Order Component | 90963 | ✏️ |
| [ocpfProdOrderRoutingLines](#ocpfprodorderroutinglines) | Prod. Order Routing Line | 90964 | ✏️ |
| [ocpfProdOrderCapacityNeeds](#ocpfprodordercapacityneeds) | Prod. Order Capacity Need | 90965 | 👁 |
| [ocpfCapacityLedgerEntries](#ocpfcapacityledgerentries) | Capacity Ledger Entry | 90966 | 👁 |
| [ocpfAssemblySetup](#ocpfassemblysetup) | Assembly Setup | 90967 | ✏️ |
| [ocpfBomComponents](#ocpfbomcomponents) | BOM Component | 90968 | ✏️ |
| [ocpfAssemblyHeaders](#ocpfassemblyheaders) | Assembly Header | 90969 | ✏️ |
| [ocpfAssemblyLines](#ocpfassemblylines) | Assembly Line | 90970 | ✏️ |
| [ocpfPostedAssemblyHeaders](#ocpfpostedassemblyheaders) | Posted Assembly Header | 90971 | 👁 |
| [ocpfPostedAssemblyLines](#ocpfpostedassemblylines) | Posted Assembly Line | 90972 | 👁 |

</details>

<details>
<summary><b>Service Management</b> — 30 entities · <code>ocpf_serviceManagement</code> · 🆕 new in v3.1</summary>

| Entity | Source Table | Page ID | Access |
|---|---|---|:---:|
| [ocpfServiceMgtSetup](#ocpfservicemgtsetup) | Service Mgt. Setup | 90924 | ✏️ |
| [ocpfServiceOrderTypes](#ocpfserviceordertypes) | Service Order Type | 90925 | ✏️ |
| [ocpfServiceCosts](#ocpfservicecosts) | Service Cost | 90926 | ✏️ |
| [ocpfServiceZones](#ocpfservicezones) | Service Zone | 90973 | ✏️ |
| [ocpfServiceItemGroups](#ocpfserviceitemgroups) | Service Item Group | 90974 | ✏️ |
| [ocpfRepairStatuses](#ocpfrepairstatuses) | Repair Status | 90975 | ✏️ |
| [ocpfFaultAreas](#ocpffaultareas) | Fault Area | 90976 | ✏️ |
| [ocpfSymptomCodes](#ocpfsymptomcodes) | Symptom Code | 90977 | ✏️ |
| [ocpfFaultCodes](#ocpffaultcodes) | Fault Code | 90978 | ✏️ |
| [ocpfFaultReasonCodes](#ocpffaultreasoncodes) | Fault Reason Code | 90979 | ✏️ |
| [ocpfResolutionCodes](#ocpfresolutioncodes) | Resolution Code | 90980 | ✏️ |
| [ocpfLoaners](#ocpfloaners) | Loaner | 90981 | ✏️ |
| [ocpfLoanerEntries](#ocpfloanerentries) | Loaner Entry | 90982 | 👁 |
| [ocpfServiceItems](#ocpfserviceitems) | Service Item | 90983 | ✏️ |
| [ocpfServiceItemComponents](#ocpfserviceitemcomponents) | Service Item Component | 90984 | ✏️ |
| [ocpfServiceHeaders](#ocpfserviceheaders) | Service Header | 90985 | ✏️ |
| [ocpfServiceItemLines](#ocpfserviceitemlines) | Service Item Line | 90986 | ✏️ |
| [ocpfServiceLines](#ocpfservicelines) | Service Line | 90987 | ✏️ |
| [ocpfServiceLedgerEntries](#ocpfserviceledgerentries) | Service Ledger Entry | 90988 | 👁 |
| [ocpfWarrantyLedgerEntries](#ocpfwarrantyledgerentries) | Warranty Ledger Entry | 90989 | 👁 |
| [ocpfServiceRegisters](#ocpfserviceregisters) | Service Register | 90990 | 👁 |
| [ocpfServiceContractHeaders](#ocpfservicecontractheaders) | Service Contract Header | 90991 | ✏️ |
| [ocpfServiceContractLines](#ocpfservicecontractlines) | Service Contract Line | 90992 | ✏️ |
| [ocpfContractGroups](#ocpfcontractgroups) | Contract Group | 90993 | ✏️ |
| [ocpfServiceShipmentHeaders](#ocpfserviceshipmentheaders) | Service Shipment Header | 90994 | 👁 |
| [ocpfServiceShipmentLines](#ocpfserviceshipmentlines) | Service Shipment Line | 90995 | 👁 |
| [ocpfServiceInvoiceHeaders](#ocpfserviceinvoiceheaders) | Service Invoice Header | 90996 | 👁 |
| [ocpfServiceInvoiceLines](#ocpfserviceinvoicelines) | Service Invoice Line | 90997 | 👁 |
| [ocpfServiceCrMemoHeaders](#ocpfservicecrmemoheaders) | Service Cr.Memo Header | 90998 | 👁 |
| [ocpfServiceCrMemoLines](#ocpfservicecrmemolines) | Service Cr.Memo Line | 90999 | 👁 |

</details>

## Core Financial

[↑ Table of Contents](#table-of-contents)

**API Group URL segment:** `ocpf_coreFinancial`  
**Pages:** 25 (17 editable, 8 read-only)  

### ocpfChartOfAccounts

**Description:** Chart of Accounts — G/L accounts that define the financial structure and reporting categories of the company.

| Property | Value |
|---|---|
| **Source Table** | G/L Account |
| Page ID | 90800 |
| Page Name | `ocpfChartOfAccounts` |
| Entity Set Name | `ocpfChartOfAccounts` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 71 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `searchName` | Search Name | Search Name | ✅ |
| 5 | `accountType` | Account Type | Account Type | ✅ |
| 6 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 7 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 8 | `accountCategory` | Account Category | Account Category | ✅ |
| 9 | `incomeBalance` | Income/Balance | Income/Balance | ✅ |
| 10 | `debitCredit` | Debit/Credit | Debit/Credit | ✅ |
| 11 | `no2` | No. 2 | No. 2 | ✅ |
| 12 | `comment` | Comment | Comment | 🧮 computed |
| 13 | `blocked` | Blocked | Blocked | ✅ |
| 14 | `directPosting` | Direct Posting | Direct Posting | ✅ |
| 15 | `reconciliationAccount` | Reconciliation Account | Reconciliation Account | ✅ |
| 16 | `newPage` | New Page | New Page | ✅ |
| 17 | `noOfBlankLines` | No. of Blank Lines | No. of Blank Lines | ✅ |
| 18 | `indentation` | Indentation | Indentation | ✅ |
| 19 | `sourceCurrencyCode` | Source Currency Code | Currency Code | ✅ |
| 20 | `sourceCurrencyPosting` | Source Currency Posting | Source Currency Posting | ✅ |
| 21 | `sourceCurrencyRevaluation` | Source Currency Revaluation | Source Currency Revaluation | ✅ |
| 22 | `unrealizedRevaluation` | Unrealized Revaluation | Unrealized Revaluation | ✅ |
| 23 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |
| 24 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 25 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 26 | `globalDimension1Filter` | Global Dimension 1 Filter | Global Dimension 1 Filter | 🔍 filter |
| 27 | `globalDimension2Filter` | Global Dimension 2 Filter | Global Dimension 2 Filter | 🔍 filter |
| 28 | `balanceAtDate` | Balance at Date | Balance at Date | 🧮 computed |
| 29 | `netChange` | Net Change | Net Change | 🧮 computed |
| 30 | `budgetedAmount` | Budgeted Amount | Budgeted Amount | 🧮 computed |
| 31 | `totaling` | Totaling | Totaling | ✅ |
| 32 | `budgetFilter` | Budget Filter | Budget Filter | 🔍 filter |
| 33 | `balance` | Balance | Balance | 🧮 computed |
| 34 | `budgetAtDate` | Budget at Date | Budget at Date | 🧮 computed |
| 35 | `consolTranslationMethod` | Consol. Translation Method | Consol. Translation Method | ✅ |
| 36 | `consolDebitAcc` | Consol. Debit Acc. | Consol. Debit Acc. | ✅ |
| 37 | `consolCreditAcc` | Consol. Credit Acc. | Consol. Credit Acc. | ✅ |
| 38 | `businessUnitFilter` | Business Unit Filter | Business Unit Filter | 🔍 filter |
| 39 | `genPostingType` | Gen. Posting Type | Gen. Posting Type | ✅ |
| 40 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 41 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 42 | `debitAmount` | Debit Amount | Debit Amount | 🧮 computed |
| 43 | `creditAmount` | Credit Amount | Credit Amount | 🧮 computed |
| 44 | `automaticExtTexts` | Automatic Ext. Texts | Automatic Ext. Texts | ✅ |
| 45 | `budgetedDebitAmount` | Budgeted Debit Amount | Budgeted Debit Amount | 🧮 computed |
| 46 | `budgetedCreditAmount` | Budgeted Credit Amount | Budgeted Credit Amount | 🧮 computed |
| 47 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 48 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 49 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 50 | `vATBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 51 | `vATProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 52 | `vATAmt` | VAT Amt. | VAT Amt. | 🧮 computed |
| 53 | `additionalCurrencyNetChange` | Additional-Currency Net Change | Additional-Currency Net Change | 🧮 computed |
| 54 | `addCurrencyBalanceAtDate` | Add.-Currency Balance at Date | Add.-Currency Balance at Date | 🧮 computed |
| 55 | `additionalCurrencyBalance` | Additional-Currency Balance | Additional-Currency Balance | 🧮 computed |
| 56 | `exchangeRateAdjustment` | Exchange Rate Adjustment | Exchange Rate Adjustment | ✅ |
| 57 | `addCurrencyDebitAmount` | Add.-Currency Debit Amount | Add.-Currency Debit Amount | 🧮 computed |
| 58 | `addCurrencyCreditAmount` | Add.-Currency Credit Amount | Add.-Currency Credit Amount | 🧮 computed |
| 59 | `defaultIcPartnerGLAccNo` | Default IC Partner G/L Acc. No | Default IC Partner G/L Acc. No | ✅ |
| 60 | `omitDefaultDescrInJnl` | Omit Default Descr. in Jnl. | Omit Default Descr. in Jnl. | ✅ |
| 61 | `sourceCurrencyNetChange` | Source Currency Net Change | Source Currency Net Change | 🧮 computed |
| 62 | `sourceCurrBalanceAtDate` | Source Curr. Balance at Date | Source Curr. Balance at Date | 🧮 computed |
| 63 | `sourceCurrencyBalance` | Source Currency Balance | Source Currency Balance | 🧮 computed |
| 64 | `accountSubcategoryEntryNo` | Account Subcategory Entry No. | Account Subcategory Entry No. | ✅ |
| 65 | `accountSubcategoryDescript` | Account Subcategory Descript. | Account Subcategory Descript. | 🧮 computed |
| 66 | `vATReportingDateFilter` | VAT Reporting Date Filter | VAT Reporting Date Filter | 🔍 filter |
| 67 | `excludeFromConsolidation` | Exclude From Consolidation | Exclude from Consolidation | ✅ |
| 68 | `dimensionSetIdFilter` | Dimension Set ID Filter | Dimension Set ID Filter | 🔍 filter |
| 69 | `costTypeNo` | Cost Type No. | Cost Type No. | ✅ |
| 70 | `defaultDeferralTemplateCode` | Default Deferral Template Code | Default Deferral Template Code | ✅ |
| 71 | `aPIAccountType` | API Account Type | API Account Type | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfGeneralLedgerEntries

**Description:** General Ledger Entries — individual posted transactions that make up the general ledger and form the basis of all financial reporting.

| Property | Value |
|---|---|
| **Source Table** | G/L Entry |
| Page ID | 90801 |
| Page Name | `ocpfGeneralLedgerEntries` |
| Entity Set Name | `ocpfGeneralLedgerEntries` |
| API Group | `ocpf_coreFinancial` |
| Editable | ❌ No (GET only) |
| Field Count | 74 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `gLAccountNo` | G/L Account No. | G/L Account No. | — |
| 4 | `postingDate` | Posting Date | Posting Date | — |
| 5 | `documentType` | Document Type | Document Type | — |
| 6 | `documentNo` | Document No. | Document No. | — |
| 7 | `description` | Description | Description | — |
| 8 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 9 | `amount` | Amount | Amount (LCY) | — |
| 10 | `sourceCurrencyAmount` | Source Currency Amount | Source Currency Amount | — |
| 11 | `sourceCurrencyVatAmount` | Source Currency VAT Amount | Source VAT Currency Amount | — |
| 12 | `sourceCurrencyCode` | Source Currency Code | Source Currency Code | — |
| 13 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 14 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 15 | `userId` | User ID | User ID | — |
| 16 | `sourceCode` | Source Code | Source Code | — |
| 17 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | — |
| 18 | `priorYearEntry` | Prior-Year Entry | Prior-Year Entry | — |
| 19 | `jobNo` | Job No. | Project No. | — |
| 20 | `quantity` | Quantity | Quantity | — |
| 21 | `vATAmount` | VAT Amount | VAT Amount | — |
| 22 | `businessUnitCode` | Business Unit Code | Business Unit Code | — |
| 23 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 24 | `reasonCode` | Reason Code | Reason Code | — |
| 25 | `genPostingType` | Gen. Posting Type | Gen. Posting Type | — |
| 26 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 27 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 28 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 29 | `transactionNo` | Transaction No. | Transaction No. | — |
| 30 | `debitAmount` | Debit Amount | Debit Amount (LCY) | — |
| 31 | `creditAmount` | Credit Amount | Credit Amount (LCY) | — |
| 32 | `documentDate` | Document Date | Document Date | — |
| 33 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 34 | `sourceType` | Source Type | Source Type | — |
| 35 | `sourceNo` | Source No. | Source No. | — |
| 36 | `noSeries` | No. Series | No. Series | — |
| 37 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 38 | `taxLiable` | Tax Liable | Tax Liable | — |
| 39 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 40 | `useTax` | Use Tax | Use Tax | — |
| 41 | `vATBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 42 | `vATProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 43 | `additionalCurrencyAmount` | Additional-Currency Amount | Additional-Currency Amount | — |
| 44 | `addCurrencyDebitAmount` | Add.-Currency Debit Amount | Add.-Currency Debit Amount | — |
| 45 | `addCurrencyCreditAmount` | Add.-Currency Credit Amount | Add.-Currency Credit Amount | — |
| 46 | `closeIncomeStatementDimId` | Close Income Statement Dim. ID | Close Income Statement Dim. ID | — |
| 47 | `iCPartnerCode` | IC Partner Code | IC Partner Code | — |
| 48 | `reversed` | Reversed | Reversed | — |
| 49 | `reversedByEntryNo` | Reversed by Entry No. | Reversed by Entry No. | — |
| 50 | `reversedEntryNo` | Reversed Entry No. | Reversed Entry No. | — |
| 51 | `gLAccountName` | G/L Account Name | G/L Account Name | 🧮 computed |
| 52 | `journalTemplName` | Journal Templ. Name | Journal Template Name | — |
| 53 | `vATReportingDate` | VAT Reporting Date | VAT Date | — |
| 54 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 55 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 56 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 57 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 58 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 59 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 60 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |
| 61 | `lastDimCorrectionEntryNo` | Last Dim. Correction Entry No. | Last Dim. Correction Entry No. | — |
| 62 | `lastDimCorrectionNode` | Last Dim. Correction Node | Last Dim. Correction Node | — |
| 63 | `dimensionChangesCount` | Dimension Changes Count | Count of Dimension Changes | — |
| 64 | `allocationAccountNo` | Allocation Account No. | Allocation Account No. | — |
| 65 | `allocJournalLineSystemid` | Alloc. Journal Line SystemId | Allocation Journal Line SystemId | — |
| 66 | `prodOrderNo` | Prod. Order No. | Prod. Order No. | — |
| 67 | `fAEntryType` | FA Entry Type | FA Entry Type | — |
| 68 | `fAEntryNo` | FA Entry No. | FA Entry No. | — |
| 69 | `comment` | Comment | Comment | — |
| 70 | `nonDeductibleVatAmount` | Non-Deductible VAT Amount | Non-Deductible VAT Amount | — |
| 71 | `nonDeductibleVatAmountAcy` | Non-Deductible VAT Amount ACY | Non-Deductible VAT Amount ACY | — |
| 72 | `srcCurrNonDedVatAmount` | Src. Curr. Non-Ded. VAT Amount | Source Currency Non-Deductible VAT Amount | — |
| 73 | `accountId` | Account Id | Account Id | 🧮 computed |
| 74 | `lastModifiedDatetime` | Last Modified DateTime | Last Modified DateTime | — |


[↑ Back to top](#table-of-contents)

---

### ocpfGeneralLedgerSetup

**Description:** General Ledger Setup — company-wide configuration for the general ledger including local currency, rounding, and posting rules. Always returns a single record.

| Property | Value |
|---|---|
| **Source Table** | General Ledger Setup |
| Page ID | 90802 |
| Page Name | `ocpfGeneralLedgerSetup` |
| Entity Set Name | `ocpfGeneralLedgerSetup` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 99 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `primaryKey` | Primary Key | Primary Key | ✅ |
| 3 | `allowPostingFrom` | Allow Posting From | Allow Posting From | ✅ |
| 4 | `allowPostingTo` | Allow Posting To | Allow Posting To | ✅ |
| 5 | `registerTime` | Register Time | Register Time | ✅ |
| 6 | `allowDeferralPostingFrom` | Allow Deferral Posting From | Allow Deferral Posting From | ✅ |
| 7 | `allowDeferralPostingTo` | Allow Deferral Posting To | Allow Deferral Posting To | ✅ |
| 8 | `vATReportingDate` | VAT Reporting Date | Default VAT Date | ✅ |
| 9 | `vATReportingDateUsage` | VAT Reporting Date Usage | VAT Date Usage | ✅ |
| 10 | `pmtDiscExclVat` | Pmt. Disc. Excl. VAT | Pmt. Disc. Excl. VAT | ✅ |
| 11 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 12 | `globalDimension1Filter` | Global Dimension 1 Filter | Global Dimension 1 Filter | 🔍 filter |
| 13 | `globalDimension2Filter` | Global Dimension 2 Filter | Global Dimension 2 Filter | 🔍 filter |
| 14 | `custBalancesDue` | Cust. Balances Due | Cust. Balances Due | 🧮 computed |
| 15 | `vendorBalancesDue` | Vendor Balances Due | Vendor Balances Due | 🧮 computed |
| 16 | `unrealizedVat` | Unrealized VAT | Unrealized VAT | ✅ |
| 17 | `adjustForPaymentDisc` | Adjust for Payment Disc. | Adjust for Payment Disc. | ✅ |
| 18 | `postWithJobQueue` | Post with Job Queue | Post with Job Queue | ✅ |
| 19 | `jobQueueCategoryCode` | Job Queue Category Code | Job Queue Category Code | ✅ |
| 20 | `jobQueuePriorityForPost` | Job Queue Priority for Post | Job Queue Priority for Post | ✅ |
| 21 | `postPrintWithJobQueue` | Post & Print with Job Queue | Post & Print with Job Queue | ✅ |
| 22 | `jobQPrioForPostPrint` | Job Q. Prio. for Post & Print | Job Q. Prio. for Post & Print | ✅ |
| 23 | `notifyOnSuccess` | Notify On Success | Notify On Success | ✅ |
| 24 | `markCrMemosAsCorrections` | Mark Cr. Memos as Corrections | Mark Cr. Memos as Corrections | ✅ |
| 25 | `localAddressFormat` | Local Address Format | Local Address Format | ✅ |
| 26 | `localContAddrFormat` | Local Cont. Addr. Format | Local Cont. Addr. Format | ✅ |
| 27 | `reportOutputType` | Report Output Type | Report Output Type | ✅ |
| 28 | `bankAccountNos` | Bank Account Nos. | Bank Account Nos. | ✅ |
| 29 | `summarizeGLEntries` | Summarize G/L Entries | Summarize G/L Entries | ✅ |
| 30 | `amountDecimalPlaces` | Amount Decimal Places | Amount Decimal Places | ✅ |
| 31 | `unitAmountDecimalPlaces` | Unit-Amount Decimal Places | Unit-Amount Decimal Places | ✅ |
| 32 | `additionalReportingCurrency` | Additional Reporting Currency | Additional Reporting Currency | ✅ |
| 33 | `vATTolerance` | VAT Tolerance % | VAT Tolerance % | ✅ |
| 34 | `eMUCurrency` | EMU Currency | EMU Currency | ✅ |
| 35 | `lCYCode` | LCY Code | LCY Code | ✅ |
| 36 | `vATExchangeRateAdjustment` | VAT Exchange Rate Adjustment | VAT Exchange Rate Adjustment | ✅ |
| 37 | `amountRoundingPrecision` | Amount Rounding Precision | Amount Rounding Precision | ✅ |
| 38 | `unitAmountRoundingPrecision` | Unit-Amount Rounding Precision | Unit-Amount Rounding Precision | ✅ |
| 39 | `applnRoundingPrecision` | Appln. Rounding Precision | Appln. Rounding Precision | ✅ |
| 40 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 41 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 42 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 43 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 44 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | ✅ |
| 45 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | ✅ |
| 46 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | ✅ |
| 47 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | ✅ |
| 48 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | ✅ |
| 49 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | ✅ |
| 50 | `maxVatDifferenceAllowed` | Max. VAT Difference Allowed | Max. VAT Difference Allowed | ✅ |
| 51 | `vATRoundingType` | VAT Rounding Type | VAT Rounding Type | ✅ |
| 52 | `pmtDiscTolerancePosting` | Pmt. Disc. Tolerance Posting | Pmt. Disc. Tolerance Posting | ✅ |
| 53 | `paymentDiscountGracePeriod` | Payment Discount Grace Period | Payment Discount Grace Period | ✅ |
| 54 | `paymentTolerance` | Payment Tolerance % | Payment Tolerance % | ✅ |
| 55 | `maxPaymentToleranceAmount` | Max. Payment Tolerance Amount | Max. Payment Tolerance Amount | ✅ |
| 56 | `allowGLAccDeletionBefore` | Allow G/L Acc. Deletion Before | Check G/L Acc. Deletion After | ✅ |
| 57 | `checkGLAccountUsage` | Check G/L Account Usage | Check G/L Account Usage | ✅ |
| 58 | `paymentTolerancePosting` | Payment Tolerance Posting | Payment Tolerance Posting | ✅ |
| 59 | `pmtDiscToleranceWarning` | Pmt. Disc. Tolerance Warning | Pmt. Disc. Tolerance Warning | ✅ |
| 60 | `paymentToleranceWarning` | Payment Tolerance Warning | Payment Tolerance Warning | ✅ |
| 61 | `lastIcTransactionNo` | Last IC Transaction No. | Last IC Transaction No. | ✅ |
| 62 | `billToSellToVatCalc` | Bill-to/Sell-to VAT Calc. | Bill-to/Sell-to VAT Calc. | ✅ |
| 63 | `blockDeletionOfGLAccounts` | Block Deletion of G/L Accounts | Block Deletion of G/L Accounts | ✅ |
| 64 | `finRepForBalanceSheet` | Fin. Rep. for Balance Sheet | Financial Report for Balance Sheet | ✅ |
| 65 | `finRepForIncomeStmt` | Fin. Rep. for Income Stmt. | Financial Report for Income Stmt. | ✅ |
| 66 | `finRepForCashFlowStmt` | Fin. Rep. for Cash Flow Stmt | Financial Report for Cash Flow Stmt | ✅ |
| 67 | `finRepForRetainedEarn` | Fin. Rep. for Retained Earn. | Financial Report for Retained Earn. | ✅ |
| 68 | `taxInvoiceRenamingThreshold` | Tax Invoice Renaming Threshold | Tax Invoice Renaming Threshold | ✅ |
| 69 | `reqCountryRegCodeInAddr` | Req.Country/Reg. Code in Addr. | Require Country/Region Code in Address | ✅ |
| 70 | `printVatSpecificationInLcy` | Print VAT specification in LCY | Print VAT specification in LCY | ✅ |
| 71 | `prepaymentUnrealizedVat` | Prepayment Unrealized VAT | Prepayment Unrealized VAT | ✅ |
| 72 | `payrollTransImportFormat` | Payroll Trans. Import Format | Payroll Trans. Import Format | ✅ |
| 73 | `localCurrencySymbol` | Local Currency Symbol | Local Currency Symbol | ✅ |
| 74 | `localCurrencyDescription` | Local Currency Description | Local Currency Description | ✅ |
| 75 | `showAmounts` | Show Amounts | Show Amounts | ✅ |
| 76 | `postingPreviewType` | Posting Preview Type | Posting Preview Type | ✅ |
| 77 | `sEPANonEuroExport` | SEPA Non-Euro Export | SEPA Non-Euro Export | ✅ |
| 78 | `sEPAExportWOBankAccData` | SEPA Export w/o Bank Acc. Data | SEPA Export w/o Bank Acc. Data | ✅ |
| 79 | `journalTemplNameMandatory` | Journal Templ. Name Mandatory | Journal Templ. Name Mandatory | ✅ |
| 80 | `hidePaymentMethodCode` | Hide Payment Method Code | Hide Payment Method Code | ✅ |
| 81 | `enableDataCheck` | Enable Data Check | Enable Data Check | ✅ |
| 82 | `documentRetentionPeriod` | Document Retention Period | Documents Retention Period | ✅ |
| 83 | `applyJnlTemplateName` | Apply Jnl. Template Name | Apply Jnl. Template Name | ✅ |
| 84 | `applyJnlBatchName` | Apply Jnl. Batch Name | Apply Jnl. Batch Name | ✅ |
| 85 | `jobWipJnlTemplateName` | Job WIP Jnl. Template Name | Project WIP Jnl. Template Name | ✅ |
| 86 | `jobWipJnlBatchName` | Job WIP Jnl. Batch Name | Project WIP Jnl. Batch Name | ✅ |
| 87 | `adjustArcJnlTemplateName` | Adjust ARC Jnl. Template Name | Adjust Add. Rep. Currency Jnl. Template Name | ✅ |
| 88 | `adjustArcJnlBatchName` | Adjust ARC Jnl. Batch Name | Adjust Add. Rep. Currency Jnl. Batch Name | ✅ |
| 89 | `bankAccReconTemplateName` | Bank Acc. Recon. Template Name | Bank Acc. Recon. Template Name | ✅ |
| 90 | `bankAccReconBatchName` | Bank Acc. Recon. Batch Name | Bank Acc. Recon. Batch Name | ✅ |
| 91 | `controlVatPeriod` | Control VAT Period | Control VAT Period | ✅ |
| 92 | `allowQueryFromConsolid` | Allow Query From Consolid. | Enable company as subsidiary | ✅ |
| 93 | `accReceivablesCategory` | Acc. Receivables Category | Account Receivables G/L Account Category | ✅ |
| 94 | `appDimensionPosting` | App. Dimension Posting | Dimension Posting | ✅ |
| 95 | `hideCompanyBankAccount` | Hide Company Bank Account | Hide Company Bank Account | ✅ |
| 96 | `checkSourceCurrConsistency` | Check Source Curr. Consistency | Check Source Curr. Consistency | ✅ |
| 97 | `accPayablesCategory` | Acc. Payables Category | Account Payables G/L Account Category | ✅ |
| 98 | `invRoundingPrecisionLcy` | Inv. Rounding Precision (LCY) | Inv. Rounding Precision (LCY) | ✅ |
| 99 | `invRoundingTypeLcy` | Inv. Rounding Type (LCY) | Inv. Rounding Type (LCY) | ✅ |

> **Added in API v3.1:** fields 98–99 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfAccountingPeriods

**Description:** Accounting Periods — fiscal periods that control which dates are open for posting and define the financial year structure.

| Property | Value |
|---|---|
| **Source Table** | Accounting Period |
| Page ID | 90803 |
| Page Name | `ocpfAccountingPeriods` |
| Entity Set Name | `ocpfAccountingPeriods` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 8 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `startingDate` | Starting Date | Starting Date | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `newFiscalYear` | New Fiscal Year | New Fiscal Year | ✅ |
| 5 | `closed` | Closed | Closed | ✅ |
| 6 | `dateLocked` | Date Locked | Date Locked | ✅ |
| 7 | `averageCostCalcType` | Average Cost Calc. Type | Average Cost Calc. Type | ✅ |
| 8 | `averageCostPeriod` | Average Cost Period | Average Cost Period | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfGLBudgetEntries

**Description:** G/L Budget Entries — budgeted amounts per G/L account, dimension, and period used for budget vs. actual analysis.

| Property | Value |
|---|---|
| **Source Table** | G/L Budget Entry |
| Page ID | 90804 |
| Page Name | `ocpfGLBudgetEntries` |
| Entity Set Name | `ocpfGLBudgetEntries` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 17 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | ✅ |
| 3 | `budgetName` | Budget Name | Budget Name | ✅ |
| 4 | `gLAccountNo` | G/L Account No. | G/L Account No. | ✅ |
| 5 | `date` | Date | Date | ✅ |
| 6 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 7 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 8 | `amount` | Amount | Amount | ✅ |
| 9 | `description` | Description | Description | ✅ |
| 10 | `businessUnitCode` | Business Unit Code | Business Unit Code | ✅ |
| 11 | `userId` | User ID | User ID | ✅ |
| 12 | `budgetDimension1Code` | Budget Dimension 1 Code | Budget Dimension 1 Code | ✅ |
| 13 | `budgetDimension2Code` | Budget Dimension 2 Code | Budget Dimension 2 Code | ✅ |
| 14 | `budgetDimension3Code` | Budget Dimension 3 Code | Budget Dimension 3 Code | ✅ |
| 15 | `budgetDimension4Code` | Budget Dimension 4 Code | Budget Dimension 4 Code | ✅ |
| 16 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 17 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfGLRegisters

**Description:** G/L Registers — audit trail records that group G/L entries posted in the same batch, enabling traceability back to the originating journal.

| Property | Value |
|---|---|
| **Source Table** | G/L Register |
| Page ID | 90805 |
| Page Name | `ocpfGLRegisters` |
| Entity Set Name | `ocpfGLRegisters` |
| API Group | `ocpf_coreFinancial` |
| Editable | ❌ No (GET only) |
| Field Count | 13 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | — |
| 3 | `fromEntryNo` | From Entry No. | From Entry No. | — |
| 4 | `toEntryNo` | To Entry No. | To Entry No. | — |
| 5 | `creationDate` | Creation Date | Creation Date | — |
| 6 | `sourceCode` | Source Code | Source Code | — |
| 7 | `userId` | User ID | User ID | — |
| 8 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 9 | `fromVatEntryNo` | From VAT Entry No. | From VAT Entry No. | — |
| 10 | `toVatEntryNo` | To VAT Entry No. | To VAT Entry No. | — |
| 11 | `reversed` | Reversed | Reversed | — |
| 12 | `creationTime` | Creation Time | Creation Time | — |
| 13 | `journalTemplName` | Journal Templ. Name | Journal Template Name | — |


[↑ Back to top](#table-of-contents)

---

### ocpfCustLedgerEntries

**Description:** Customer Ledger Entries — open and closed receivables transactions per customer including invoices, credit memos, and payments.

| Property | Value |
|---|---|
| **Source Table** | Cust. Ledger Entry |
| Page ID | 90806 |
| Page Name | `ocpfCustLedgerEntries` |
| Entity Set Name | `ocpfCustLedgerEntries` |
| API Group | `ocpf_coreFinancial` |
| Editable | ❌ No (GET only) |
| Field Count | 91 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `customerNo` | Customer No. | Customer No. | — |
| 4 | `postingDate` | Posting Date | Posting Date | — |
| 5 | `documentType` | Document Type | Document Type | — |
| 6 | `documentNo` | Document No. | Document No. | — |
| 7 | `description` | Description | Description | — |
| 8 | `customerName` | Customer Name | Customer Name | — |
| 9 | `yourReference` | Your Reference | Your Reference | — |
| 10 | `currencyCode` | Currency Code | Currency Code | — |
| 11 | `amount` | Amount | Amount | 🧮 computed |
| 12 | `remainingAmount` | Remaining Amount | Remaining Amount | 🧮 computed |
| 13 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 14 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | — |
| 15 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 16 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 17 | `salespersonCode` | Salesperson Code | Salesperson Code | — |
| 18 | `userId` | User ID | User ID | — |
| 19 | `sourceCode` | Source Code | Source Code | — |
| 20 | `onHold` | On Hold | On Hold | — |
| 21 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 22 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 23 | `open` | Open | Open | — |
| 24 | `dueDate` | Due Date | Due Date | — |
| 25 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 26 | `originalPmtDiscPossible` | Original Pmt. Disc. Possible | Original Pmt. Disc. Possible | — |
| 27 | `positive` | Positive | Positive | — |
| 28 | `closedByEntryNo` | Closed by Entry No. | Closed by Entry No. | — |
| 29 | `closedAtDate` | Closed at Date | Closed at Date | — |
| 30 | `closedByAmount` | Closed by Amount | Closed by Amount | — |
| 31 | `appliesToId` | Applies-to ID | Applies-to ID | — |
| 32 | `journalTemplName` | Journal Templ. Name | Journal Template Name | — |
| 33 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 34 | `reasonCode` | Reason Code | Reason Code | — |
| 35 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 36 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 37 | `transactionNo` | Transaction No. | Transaction No. | — |
| 38 | `debitAmount` | Debit Amount | Debit Amount | 🧮 computed |
| 39 | `creditAmount` | Credit Amount | Credit Amount | 🧮 computed |
| 40 | `documentDate` | Document Date | Document Date | — |
| 41 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 42 | `calculateInterest` | Calculate Interest | Calculate Interest | — |
| 43 | `closingInterestCalculated` | Closing Interest Calculated | Closing Interest Calculated | — |
| 44 | `noSeries` | No. Series | No. Series | — |
| 45 | `closedByCurrencyCode` | Closed by Currency Code | Closed by Currency Code | — |
| 46 | `closedByCurrencyAmount` | Closed by Currency Amount | Closed by Currency Amount | — |
| 47 | `adjustedCurrencyFactor` | Adjusted Currency Factor | Adjusted Currency Factor | — |
| 48 | `originalCurrencyFactor` | Original Currency Factor | Original Currency Factor | — |
| 49 | `originalAmount` | Original Amount | Original Amount | 🧮 computed |
| 50 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 51 | `remainingPmtDiscPossible` | Remaining Pmt. Disc. Possible | Remaining Pmt. Disc. Possible | — |
| 52 | `pmtDiscToleranceDate` | Pmt. Disc. Tolerance Date | Pmt. Disc. Tolerance Date | — |
| 53 | `maxPaymentTolerance` | Max. Payment Tolerance | Max. Payment Tolerance | — |
| 54 | `lastIssuedReminderLevel` | Last Issued Reminder Level | Last Issued Reminder Level | — |
| 55 | `acceptedPaymentTolerance` | Accepted Payment Tolerance | Accepted Payment Tolerance | — |
| 56 | `acceptedPmtDiscTolerance` | Accepted Pmt. Disc. Tolerance | Accepted Pmt. Disc. Tolerance | — |
| 57 | `amountToApply` | Amount to Apply | Amount to Apply | — |
| 58 | `iCPartnerCode` | IC Partner Code | IC Partner Code | — |
| 59 | `applyingEntry` | Applying Entry | Applying Entry | — |
| 60 | `reversed` | Reversed | Reversed | — |
| 61 | `reversedByEntryNo` | Reversed by Entry No. | Reversed by Entry No. | — |
| 62 | `reversedEntryNo` | Reversed Entry No. | Reversed Entry No. | — |
| 63 | `prepayment` | Prepayment | Prepayment | — |
| 64 | `paymentReference` | Payment Reference | Payment Reference | — |
| 65 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 66 | `appliesToExtDocNo` | Applies-to Ext. Doc. No. | Applies-to Ext. Doc. No. | — |
| 67 | `recipientBankAccount` | Recipient Bank Account | Recipient Bank Account | — |
| 68 | `messageToRecipient` | Message to Recipient | Message to Recipient | — |
| 69 | `exportedToPaymentFile` | Exported to Payment File | Exported to Payment File | — |
| 70 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 71 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 72 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 73 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 74 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 75 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 76 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |
| 77 | `directDebitMandateId` | Direct Debit Mandate ID | Direct Debit Mandate ID | — |
| 78 | `disputeStatus` | Dispute Status | Dispute Status | — |
| 79 | `promisedPayDate` | Promised Pay Date | Promised Pay Date | — |
| 80 | `originalAmtLcy` | Original Amt. (LCY) | Original Amt. (LCY) | 🧮 computed |
| 81 | `remainingAmtLcy` | Remaining Amt. (LCY) | Remaining Amt. (LCY) | 🧮 computed |
| 82 | `amountLcy` | Amount (LCY) | Amount (LCY) | 🧮 computed |
| 83 | `salesLcy` | Sales (LCY) | Sales (LCY) | — |
| 84 | `profitLcy` | Profit (LCY) | Profit (LCY) | — |
| 85 | `invDiscountLcy` | Inv. Discount (LCY) | Inv. Discount (LCY) | — |
| 86 | `pmtDiscGivenLcy` | Pmt. Disc. Given (LCY) | Pmt. Disc. Given (LCY) | — |
| 87 | `origPmtDiscPossibleLcy` | Orig. Pmt. Disc. Possible(LCY) | Orig. Pmt. Disc. Possible (LCY) | — |
| 88 | `closedByAmountLcy` | Closed by Amount (LCY) | Closed by Amount (LCY) | — |
| 89 | `debitAmountLcy` | Debit Amount (LCY) | Debit Amount (LCY) | 🧮 computed |
| 90 | `creditAmountLcy` | Credit Amount (LCY) | Credit Amount (LCY) | 🧮 computed |
| 91 | `pmtToleranceLcy` | Pmt. Tolerance (LCY) | Pmt. Tolerance (LCY) | — |

> **Added in API v3.1:** fields 80–91 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfDetailedCustLedgerEntries

**Description:** Detailed Customer Ledger Entries — granular application records showing how customer payments and credit memos are applied to invoices, used for AR aging and reconciliation.

| Property | Value |
|---|---|
| **Source Table** | Detailed Cust. Ledg. Entry |
| Page ID | 90807 |
| Page Name | `ocpfDetailedCustLedgerEntries` |
| Entity Set Name | `ocpfDetailedCustLedgerEntries` |
| API Group | `ocpf_coreFinancial` |
| Editable | ❌ No (GET only) |
| Field Count | 39 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `custLedgerEntryNo` | Cust. Ledger Entry No. | Cust. Ledger Entry No. | — |
| 4 | `entryType` | Entry Type | Entry Type | — |
| 5 | `postingDate` | Posting Date | Posting Date | — |
| 6 | `documentType` | Document Type | Document Type | — |
| 7 | `documentNo` | Document No. | Document No. | — |
| 8 | `amount` | Amount | Amount | — |
| 9 | `customerNo` | Customer No. | Customer No. | — |
| 10 | `currencyCode` | Currency Code | Currency Code | — |
| 11 | `userId` | User ID | User ID | — |
| 12 | `sourceCode` | Source Code | Source Code | — |
| 13 | `transactionNo` | Transaction No. | Transaction No. | — |
| 14 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 15 | `reasonCode` | Reason Code | Reason Code | — |
| 16 | `debitAmount` | Debit Amount | Debit Amount | — |
| 17 | `creditAmount` | Credit Amount | Credit Amount | — |
| 18 | `initialEntryDueDate` | Initial Entry Due Date | Initial Entry Due Date | — |
| 19 | `initialEntryGlobalDim1` | Initial Entry Global Dim. 1 | Initial Entry Global Dim. 1 | — |
| 20 | `initialEntryGlobalDim2` | Initial Entry Global Dim. 2 | Initial Entry Global Dim. 2 | — |
| 21 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 22 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 23 | `useTax` | Use Tax | Use Tax | — |
| 24 | `vATBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 25 | `vATProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 26 | `initialDocumentType` | Initial Document Type | Initial Document Type | — |
| 27 | `appliedCustLedgerEntryNo` | Applied Cust. Ledger Entry No. | Applied Cust. Ledger Entry No. | — |
| 28 | `unapplied` | Unapplied | Unapplied | — |
| 29 | `unappliedByEntryNo` | Unapplied by Entry No. | Unapplied by Entry No. | — |
| 30 | `remainingPmtDiscPossible` | Remaining Pmt. Disc. Possible | Remaining Pmt. Disc. Possible | — |
| 31 | `maxPaymentTolerance` | Max. Payment Tolerance | Max. Payment Tolerance | — |
| 32 | `taxJurisdictionCode` | Tax Jurisdiction Code | Tax Jurisdiction Code | — |
| 33 | `applicationNo` | Application No. | Application No. | — |
| 34 | `ledgerEntryAmount` | Ledger Entry Amount | Ledger Entry Amount | — |
| 35 | `postingGroup` | Posting Group | Customer Posting Group | — |
| 36 | `exchRateAdjmtRegNo` | Exch. Rate Adjmt. Reg. No. | Exch. Rate Adjmt. Reg. No. | — |
| 37 | `amountLcy` | Amount (LCY) | Amount (LCY) | — |
| 38 | `debitAmountLcy` | Debit Amount (LCY) | Debit Amount (LCY) | — |
| 39 | `creditAmountLcy` | Credit Amount (LCY) | Credit Amount (LCY) | — |

> **Added in API v3.1:** fields 37–39 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfVendorLedgerEntries

**Description:** Vendor Ledger Entries — open and closed payables transactions per vendor including purchase invoices, credit memos, and payments.

| Property | Value |
|---|---|
| **Source Table** | Vendor Ledger Entry |
| Page ID | 90808 |
| Page Name | `ocpfVendorLedgerEntries` |
| Entity Set Name | `ocpfVendorLedgerEntries` |
| API Group | `ocpf_coreFinancial` |
| Editable | ❌ No (GET only) |
| Field Count | 86 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `vendorNo` | Vendor No. | Vendor No. | — |
| 4 | `postingDate` | Posting Date | Posting Date | — |
| 5 | `documentType` | Document Type | Document Type | — |
| 6 | `documentNo` | Document No. | Document No. | — |
| 7 | `description` | Description | Description | — |
| 8 | `vendorName` | Vendor Name | Vendor Name | — |
| 9 | `currencyCode` | Currency Code | Currency Code | — |
| 10 | `amount` | Amount | Amount | 🧮 computed |
| 11 | `remainingAmount` | Remaining Amount | Remaining Amount | 🧮 computed |
| 12 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | — |
| 13 | `vendorPostingGroup` | Vendor Posting Group | Vendor Posting Group | — |
| 14 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 15 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 16 | `purchaserCode` | Purchaser Code | Purchaser Code | — |
| 17 | `userId` | User ID | User ID | — |
| 18 | `sourceCode` | Source Code | Source Code | — |
| 19 | `onHold` | On Hold | On Hold | — |
| 20 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 21 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 22 | `open` | Open | Open | — |
| 23 | `dueDate` | Due Date | Due Date | — |
| 24 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 25 | `originalPmtDiscPossible` | Original Pmt. Disc. Possible | Original Pmt. Disc. Possible | — |
| 26 | `positive` | Positive | Positive | — |
| 27 | `closedByEntryNo` | Closed by Entry No. | Closed by Entry No. | — |
| 28 | `closedAtDate` | Closed at Date | Closed at Date | — |
| 29 | `closedByAmount` | Closed by Amount | Closed by Amount | — |
| 30 | `appliesToId` | Applies-to ID | Applies-to ID | — |
| 31 | `journalTemplName` | Journal Templ. Name | Journal Template Name | — |
| 32 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 33 | `reasonCode` | Reason Code | Reason Code | — |
| 34 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 35 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 36 | `transactionNo` | Transaction No. | Transaction No. | — |
| 37 | `debitAmount` | Debit Amount | Debit Amount | 🧮 computed |
| 38 | `creditAmount` | Credit Amount | Credit Amount | 🧮 computed |
| 39 | `documentDate` | Document Date | Document Date | — |
| 40 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 41 | `noSeries` | No. Series | No. Series | — |
| 42 | `closedByCurrencyCode` | Closed by Currency Code | Closed by Currency Code | — |
| 43 | `closedByCurrencyAmount` | Closed by Currency Amount | Closed by Currency Amount | — |
| 44 | `adjustedCurrencyFactor` | Adjusted Currency Factor | Adjusted Currency Factor | — |
| 45 | `originalCurrencyFactor` | Original Currency Factor | Original Currency Factor | — |
| 46 | `originalAmount` | Original Amount | Original Amount | 🧮 computed |
| 47 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 48 | `remainingPmtDiscPossible` | Remaining Pmt. Disc. Possible | Remaining Pmt. Disc. Possible | — |
| 49 | `pmtDiscToleranceDate` | Pmt. Disc. Tolerance Date | Pmt. Disc. Tolerance Date | — |
| 50 | `maxPaymentTolerance` | Max. Payment Tolerance | Max. Payment Tolerance | — |
| 51 | `acceptedPaymentTolerance` | Accepted Payment Tolerance | Accepted Payment Tolerance | — |
| 52 | `acceptedPmtDiscTolerance` | Accepted Pmt. Disc. Tolerance | Accepted Pmt. Disc. Tolerance | — |
| 53 | `amountToApply` | Amount to Apply | Amount to Apply | — |
| 54 | `iCPartnerCode` | IC Partner Code | IC Partner Code | — |
| 55 | `applyingEntry` | Applying Entry | Applying Entry | — |
| 56 | `reversed` | Reversed | Reversed | — |
| 57 | `reversedByEntryNo` | Reversed by Entry No. | Reversed by Entry No. | — |
| 58 | `reversedEntryNo` | Reversed Entry No. | Reversed Entry No. | — |
| 59 | `prepayment` | Prepayment | Prepayment | — |
| 60 | `creditorNo` | Creditor No. | Creditor No. | — |
| 61 | `paymentReference` | Payment Reference | Payment Reference | — |
| 62 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 63 | `appliesToExtDocNo` | Applies-to Ext. Doc. No. | Applies-to Ext. Doc. No. | — |
| 64 | `invoiceReceivedDate` | Invoice Received Date | Invoice Received Date | — |
| 65 | `recipientBankAccount` | Recipient Bank Account | Recipient Bank Account | — |
| 66 | `messageToRecipient` | Message to Recipient | Message to Recipient | — |
| 67 | `exportedToPaymentFile` | Exported to Payment File | Exported to Payment File | — |
| 68 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 69 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 70 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 71 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 72 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 73 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 74 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |
| 75 | `remitToCode` | Remit-to Code | Remit-to Code | — |
| 76 | `originalAmtLcy` | Original Amt. (LCY) | Original Amt. (LCY) | 🧮 computed |
| 77 | `remainingAmtLcy` | Remaining Amt. (LCY) | Remaining Amt. (LCY) | 🧮 computed |
| 78 | `amountLcy` | Amount (LCY) | Amount (LCY) | 🧮 computed |
| 79 | `purchaseLcy` | Purchase (LCY) | Purchase (LCY) | — |
| 80 | `invDiscountLcy` | Inv. Discount (LCY) | Inv. Discount (LCY) | — |
| 81 | `pmtDiscRcdLcy` | Pmt. Disc. Rcd.(LCY) | Pmt. Disc. Rcd.(LCY) | — |
| 82 | `origPmtDiscPossibleLcy` | Orig. Pmt. Disc. Possible(LCY) | Org. Pmt. Disc. Possible (LCY) | — |
| 83 | `closedByAmountLcy` | Closed by Amount (LCY) | Closed by Amount (LCY) | — |
| 84 | `debitAmountLcy` | Debit Amount (LCY) | Debit Amount (LCY) | 🧮 computed |
| 85 | `creditAmountLcy` | Credit Amount (LCY) | Credit Amount (LCY) | 🧮 computed |
| 86 | `pmtToleranceLcy` | Pmt. Tolerance (LCY) | Pmt. Tolerance (LCY) | — |

> **Added in API v3.1:** fields 76–86 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfDtldVendorLedgEntries

**Description:** Detailed Vendor Ledger Entries — granular application records showing how vendor payments and credit memos are applied to invoices, used for AP aging and reconciliation.

| Property | Value |
|---|---|
| **Source Table** | Detailed Vendor Ledg. Entry |
| Page ID | 90809 |
| Page Name | `ocpfDtldVendorLedgEntries` |
| Entity Set Name | `ocpfDtldVendorLedgEntries` |
| API Group | `ocpf_coreFinancial` |
| Editable | ❌ No (GET only) |
| Field Count | 39 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `vendorLedgerEntryNo` | Vendor Ledger Entry No. | Vendor Ledger Entry No. | — |
| 4 | `entryType` | Entry Type | Entry Type | — |
| 5 | `postingDate` | Posting Date | Posting Date | — |
| 6 | `documentType` | Document Type | Document Type | — |
| 7 | `documentNo` | Document No. | Document No. | — |
| 8 | `amount` | Amount | Amount | — |
| 9 | `vendorNo` | Vendor No. | Vendor No. | — |
| 10 | `currencyCode` | Currency Code | Currency Code | — |
| 11 | `userId` | User ID | User ID | — |
| 12 | `sourceCode` | Source Code | Source Code | — |
| 13 | `transactionNo` | Transaction No. | Transaction No. | — |
| 14 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 15 | `reasonCode` | Reason Code | Reason Code | — |
| 16 | `debitAmount` | Debit Amount | Debit Amount | — |
| 17 | `creditAmount` | Credit Amount | Credit Amount | — |
| 18 | `initialEntryDueDate` | Initial Entry Due Date | Initial Entry Due Date | — |
| 19 | `initialEntryGlobalDim1` | Initial Entry Global Dim. 1 | Initial Entry Global Dim. 1 | — |
| 20 | `initialEntryGlobalDim2` | Initial Entry Global Dim. 2 | Initial Entry Global Dim. 2 | — |
| 21 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 22 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 23 | `useTax` | Use Tax | Use Tax | — |
| 24 | `vATBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 25 | `vATProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 26 | `initialDocumentType` | Initial Document Type | Initial Document Type | — |
| 27 | `appliedVendLedgerEntryNo` | Applied Vend. Ledger Entry No. | Applied Vend. Ledger Entry No. | — |
| 28 | `unapplied` | Unapplied | Unapplied | — |
| 29 | `unappliedByEntryNo` | Unapplied by Entry No. | Unapplied by Entry No. | — |
| 30 | `remainingPmtDiscPossible` | Remaining Pmt. Disc. Possible | Remaining Pmt. Disc. Possible | — |
| 31 | `maxPaymentTolerance` | Max. Payment Tolerance | Max. Payment Tolerance | — |
| 32 | `taxJurisdictionCode` | Tax Jurisdiction Code | Tax Jurisdiction Code | — |
| 33 | `applicationNo` | Application No. | Application No. | — |
| 34 | `ledgerEntryAmount` | Ledger Entry Amount | Ledger Entry Amount | — |
| 35 | `postingGroup` | Posting Group | Vendor Posting Group | — |
| 36 | `exchRateAdjmtRegNo` | Exch. Rate Adjmt. Reg. No. | Exch. Rate Adjmt. Reg. No. | — |
| 37 | `amountLcy` | Amount (LCY) | Amount (LCY) | — |
| 38 | `debitAmountLcy` | Debit Amount (LCY) | Debit Amount (LCY) | — |
| 39 | `creditAmountLcy` | Credit Amount (LCY) | Credit Amount (LCY) | — |

> **Added in API v3.1:** fields 37–39 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfEmployeeLedgerEntries

**Description:** Employee Ledger Entries — expense and reimbursement transactions per employee.

| Property | Value |
|---|---|
| **Source Table** | Employee Ledger Entry |
| Page ID | 90810 |
| Page Name | `ocpfEmployeeLedgerEntries` |
| Entity Set Name | `ocpfEmployeeLedgerEntries` |
| API Group | `ocpf_coreFinancial` |
| Editable | ❌ No (GET only) |
| Field Count | 62 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `employeeNo` | Employee No. | Employee No. | — |
| 4 | `postingDate` | Posting Date | Posting Date | — |
| 5 | `documentType` | Document Type | Document Type | — |
| 6 | `documentNo` | Document No. | Document No. | — |
| 7 | `description` | Description | Description | — |
| 8 | `currencyCode` | Currency Code | Currency Code | — |
| 9 | `amount` | Amount | Amount | 🧮 computed |
| 10 | `remainingAmount` | Remaining Amount | Remaining Amount | 🧮 computed |
| 11 | `employeePostingGroup` | Employee Posting Group | Employee Posting Group | — |
| 12 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 13 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 14 | `salespersPurchCode` | Salespers./Purch. Code | Salespers./Purch. Code | — |
| 15 | `userId` | User ID | User ID | — |
| 16 | `sourceCode` | Source Code | Source Code | — |
| 17 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 18 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 19 | `open` | Open | Open | — |
| 20 | `positive` | Positive | Positive | — |
| 21 | `closedByEntryNo` | Closed by Entry No. | Closed by Entry No. | — |
| 22 | `closedAtDate` | Closed at Date | Closed at Date | — |
| 23 | `closedByAmount` | Closed by Amount | Closed by Amount | — |
| 24 | `appliesToId` | Applies-to ID | Applies-to ID | — |
| 25 | `journalTemplName` | Journal Templ. Name | Journal Template Name | — |
| 26 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 27 | `reasonCode` | Reason Code | Reason Code | — |
| 28 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 29 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 30 | `transactionNo` | Transaction No. | Transaction No. | — |
| 31 | `debitAmount` | Debit Amount | Debit Amount | 🧮 computed |
| 32 | `creditAmount` | Credit Amount | Credit Amount | 🧮 computed |
| 33 | `noSeries` | No. Series | No. Series | — |
| 34 | `closedByCurrencyCode` | Closed by Currency Code | Closed by Currency Code | — |
| 35 | `closedByCurrencyAmount` | Closed by Currency Amount | Closed by Currency Amount | — |
| 36 | `adjustedCurrencyFactor` | Adjusted Currency Factor | Adjusted Currency Factor | — |
| 37 | `originalCurrencyFactor` | Original Currency Factor | Original Currency Factor | — |
| 38 | `originalAmount` | Original Amount | Original Amount | 🧮 computed |
| 39 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 40 | `amountToApply` | Amount to Apply | Amount to Apply | — |
| 41 | `applyingEntry` | Applying Entry | Applying Entry | — |
| 42 | `reversed` | Reversed | Reversed | — |
| 43 | `reversedByEntryNo` | Reversed by Entry No. | Reversed by Entry No. | — |
| 44 | `reversedEntryNo` | Reversed Entry No. | Reversed Entry No. | — |
| 45 | `creditorNo` | Creditor No. | Creditor No. | — |
| 46 | `paymentReference` | Payment Reference | Payment Reference | — |
| 47 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 48 | `messageToRecipient` | Message to Recipient | Message to Recipient | — |
| 49 | `exportedToPaymentFile` | Exported to Payment File | Exported to Payment File | — |
| 50 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 51 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 52 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 53 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 54 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 55 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 56 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |
| 57 | `originalAmtLcy` | Original Amt. (LCY) | Original Amt. (LCY) | 🧮 computed |
| 58 | `remainingAmtLcy` | Remaining Amt. (LCY) | Remaining Amt. (LCY) | 🧮 computed |
| 59 | `amountLcy` | Amount (LCY) | Amount (LCY) | 🧮 computed |
| 60 | `closedByAmountLcy` | Closed by Amount (LCY) | Closed by Amount (LCY) | — |
| 61 | `debitAmountLcy` | Debit Amount (LCY) | Debit Amount (LCY) | 🧮 computed |
| 62 | `creditAmountLcy` | Credit Amount (LCY) | Credit Amount (LCY) | 🧮 computed |

> **Added in API v3.1:** fields 57–62 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfGenBusPostingGroups

**Description:** General Business Posting Groups — customer and vendor classification codes that determine which general posting setup row is used for a transaction.

| Property | Value |
|---|---|
| **Source Table** | Gen. Business Posting Group |
| Page ID | 90811 |
| Page Name | `ocpfGenBusPostingGroups` |
| Entity Set Name | `ocpfGenBusPostingGroups` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 5 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `defVatBusPostingGroup` | Def. VAT Bus. Posting Group | Def. VAT Bus. Posting Group | ✅ |
| 5 | `autoInsertDefault` | Auto Insert Default | Auto Insert Default | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfGenProdPostingGroups

**Description:** General Product Posting Groups — item and resource classification codes that determine which general posting setup row is used for a transaction.

| Property | Value |
|---|---|
| **Source Table** | Gen. Product Posting Group |
| Page ID | 90812 |
| Page Name | `ocpfGenProdPostingGroups` |
| Entity Set Name | `ocpfGenProdPostingGroups` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 5 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `defVatProdPostingGroup` | Def. VAT Prod. Posting Group | Def. VAT Prod. Posting Group | ✅ |
| 5 | `autoInsertDefault` | Auto Insert Default | Auto Insert Default | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfGeneralPostingSetup

**Description:** General Posting Setup — matrix mapping Gen. Business and Gen. Product Posting Groups to the G/L accounts used when posting sales and purchase transactions.

| Property | Value |
|---|---|
| **Source Table** | General Posting Setup |
| Page ID | 90813 |
| Page Name | `ocpfGeneralPostingSetup` |
| Entity Set Name | `ocpfGeneralPostingSetup` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 33 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 3 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 4 | `salesAccount` | Sales Account | Sales Account | ✅ |
| 5 | `salesLineDiscAccount` | Sales Line Disc. Account | Sales Line Disc. Account | ✅ |
| 6 | `salesInvDiscAccount` | Sales Inv. Disc. Account | Sales Inv. Disc. Account | ✅ |
| 7 | `salesPmtDiscDebitAcc` | Sales Pmt. Disc. Debit Acc. | Sales Pmt. Disc. Debit Acc. | ✅ |
| 8 | `purchAccount` | Purch. Account | Purch. Account | ✅ |
| 9 | `purchLineDiscAccount` | Purch. Line Disc. Account | Purch. Line Disc. Account | ✅ |
| 10 | `purchInvDiscAccount` | Purch. Inv. Disc. Account | Purch. Inv. Disc. Account | ✅ |
| 11 | `purchPmtDiscCreditAcc` | Purch. Pmt. Disc. Credit Acc. | Purch. Pmt. Disc. Credit Acc. | ✅ |
| 12 | `cOGSAccount` | COGS Account | COGS Account | ✅ |
| 13 | `inventoryAdjmtAccount` | Inventory Adjmt. Account | Inventory Adjmt. Account | ✅ |
| 14 | `salesCreditMemoAccount` | Sales Credit Memo Account | Sales Credit Memo Account | ✅ |
| 15 | `purchCreditMemoAccount` | Purch. Credit Memo Account | Purch. Credit Memo Account | ✅ |
| 16 | `salesPmtDiscCreditAcc` | Sales Pmt. Disc. Credit Acc. | Sales Pmt. Disc. Credit Acc. | ✅ |
| 17 | `purchPmtDiscDebitAcc` | Purch. Pmt. Disc. Debit Acc. | Purch. Pmt. Disc. Debit Acc. | ✅ |
| 18 | `salesPmtTolDebitAcc` | Sales Pmt. Tol. Debit Acc. | Sales Pmt. Tol. Debit Acc. | ✅ |
| 19 | `salesPmtTolCreditAcc` | Sales Pmt. Tol. Credit Acc. | Sales Pmt. Tol. Credit Acc. | ✅ |
| 20 | `purchPmtTolDebitAcc` | Purch. Pmt. Tol. Debit Acc. | Purch. Pmt. Tol. Debit Acc. | ✅ |
| 21 | `purchPmtTolCreditAcc` | Purch. Pmt. Tol. Credit Acc. | Purch. Pmt. Tol. Credit Acc. | ✅ |
| 22 | `salesPrepaymentsAccount` | Sales Prepayments Account | Sales Prepayments Account | ✅ |
| 23 | `purchPrepaymentsAccount` | Purch. Prepayments Account | Purch. Prepayments Account | ✅ |
| 24 | `description` | Description | Description | ✅ |
| 25 | `viewAllAccountsOnLookup` | View All Accounts on Lookup | View All Accounts on Lookup | ✅ |
| 26 | `blocked` | Blocked | Blocked | ✅ |
| 27 | `purchFaDiscAccount` | Purch. FA Disc. Account | Purch. FA Disc. Account | ✅ |
| 28 | `directCostNonInvAppAcc` | Direct Cost Non-Inv. App. Acc. | Direct Cost Non-Inventory Applied Account | ✅ |
| 29 | `directCostAppliedAccount` | Direct Cost Applied Account | Direct Cost Applied Account | ✅ |
| 30 | `overheadAppliedAccount` | Overhead Applied Account | Overhead Applied Account | ✅ |
| 31 | `purchaseVarianceAccount` | Purchase Variance Account | Purchase Variance Account | ✅ |
| 32 | `invtAccrualAccInterim` | Invt. Accrual Acc. (Interim) | Invt. Accrual Acc. (Interim) | ✅ |
| 33 | `cogsAccountInterim` | COGS Account (Interim) | COGS Account (Interim) | ✅ |

> **Added in API v3.1:** fields 32–33 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfCustomerPostingGroups

**Description:** Customer Posting Groups — define which receivables and other G/L accounts are used when posting customer transactions.

| Property | Value |
|---|---|
| **Source Table** | Customer Posting Group |
| Page ID | 90814 |
| Page Name | `ocpfCustomerPostingGroups` |
| Entity Set Name | `ocpfCustomerPostingGroups` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 18 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `receivablesAccount` | Receivables Account | Receivables Account | ✅ |
| 4 | `serviceChargeAcc` | Service Charge Acc. | Service Charge Acc. | ✅ |
| 5 | `paymentDiscDebitAcc` | Payment Disc. Debit Acc. | Payment Disc. Debit Acc. | ✅ |
| 6 | `invoiceRoundingAccount` | Invoice Rounding Account | Invoice Rounding Account | ✅ |
| 7 | `additionalFeeAccount` | Additional Fee Account | Additional Fee Account | ✅ |
| 8 | `interestAccount` | Interest Account | Interest Account | ✅ |
| 9 | `debitCurrApplnRndgAcc` | Debit Curr. Appln. Rndg. Acc. | Debit Curr. Appln. Rndg. Acc. | ✅ |
| 10 | `creditCurrApplnRndgAcc` | Credit Curr. Appln. Rndg. Acc. | Credit Curr. Appln. Rndg. Acc. | ✅ |
| 11 | `debitRoundingAccount` | Debit Rounding Account | Debit Rounding Account | ✅ |
| 12 | `creditRoundingAccount` | Credit Rounding Account | Credit Rounding Account | ✅ |
| 13 | `paymentDiscCreditAcc` | Payment Disc. Credit Acc. | Payment Disc. Credit Acc. | ✅ |
| 14 | `paymentToleranceDebitAcc` | Payment Tolerance Debit Acc. | Payment Tolerance Debit Acc. | ✅ |
| 15 | `paymentToleranceCreditAcc` | Payment Tolerance Credit Acc. | Payment Tolerance Credit Acc. | ✅ |
| 16 | `addFeePerLineAccount` | Add. Fee per Line Account | Add. Fee per Line Account | ✅ |
| 17 | `description` | Description | Description | ✅ |
| 18 | `viewAllAccountsOnLookup` | View All Accounts on Lookup | View All Accounts on Lookup | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfVendorPostingGroups

**Description:** Vendor Posting Groups — define which payables and other G/L accounts are used when posting vendor transactions.

| Property | Value |
|---|---|
| **Source Table** | Vendor Posting Group |
| Page ID | 90815 |
| Page Name | `ocpfVendorPostingGroups` |
| Entity Set Name | `ocpfVendorPostingGroups` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 15 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `payablesAccount` | Payables Account | Payables Account | ✅ |
| 4 | `serviceChargeAcc` | Service Charge Acc. | Service Charge Acc. | ✅ |
| 5 | `paymentDiscDebitAcc` | Payment Disc. Debit Acc. | Payment Disc. Debit Acc. | ✅ |
| 6 | `invoiceRoundingAccount` | Invoice Rounding Account | Invoice Rounding Account | ✅ |
| 7 | `debitCurrApplnRndgAcc` | Debit Curr. Appln. Rndg. Acc. | Debit Curr. Appln. Rndg. Acc. | ✅ |
| 8 | `creditCurrApplnRndgAcc` | Credit Curr. Appln. Rndg. Acc. | Credit Curr. Appln. Rndg. Acc. | ✅ |
| 9 | `debitRoundingAccount` | Debit Rounding Account | Debit Rounding Account | ✅ |
| 10 | `creditRoundingAccount` | Credit Rounding Account | Credit Rounding Account | ✅ |
| 11 | `paymentDiscCreditAcc` | Payment Disc. Credit Acc. | Payment Disc. Credit Acc. | ✅ |
| 12 | `paymentToleranceDebitAcc` | Payment Tolerance Debit Acc. | Payment Tolerance Debit Acc. | ✅ |
| 13 | `paymentToleranceCreditAcc` | Payment Tolerance Credit Acc. | Payment Tolerance Credit Acc. | ✅ |
| 14 | `description` | Description | Description | ✅ |
| 15 | `viewAllAccountsOnLookup` | View All Accounts on Lookup | View All Accounts on Lookup | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfInventoryPostingGroups

**Description:** Inventory Posting Groups — classify items for inventory account determination when posting item transactions.

| Property | Value |
|---|---|
| **Source Table** | Inventory Posting Group |
| Page ID | 90816 |
| Page Name | `ocpfInventoryPostingGroups` |
| Entity Set Name | `ocpfInventoryPostingGroups` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfVatBusinessPostingGroups

**Description:** VAT Business Posting Groups — classify customers and vendors for VAT calculation, determining which VAT Posting Setup row applies to a transaction.

| Property | Value |
|---|---|
| **Source Table** | VAT Business Posting Group |
| Page ID | 90817 |
| Page Name | `ocpfVatBusinessPostingGroups` |
| Entity Set Name | `ocpfVatBusinessPostingGroups` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 4 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfVatProductPostingGroups

**Description:** VAT Product Posting Groups — classify items and G/L accounts for VAT calculation, determining which VAT Posting Setup row applies to a transaction.

| Property | Value |
|---|---|
| **Source Table** | VAT Product Posting Group |
| Page ID | 90818 |
| Page Name | `ocpfVatProductPostingGroups` |
| Entity Set Name | `ocpfVatProductPostingGroups` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 4 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `lastModifiedDatetime` | Last Modified DateTime | Last Modified DateTime | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfVatPostingSetup

**Description:** VAT Posting Setup — matrix mapping VAT Business and VAT Product Posting Groups to VAT rates, calculation types, and the G/L accounts used when posting VAT.

| Property | Value |
|---|---|
| **Source Table** | VAT Posting Setup |
| Page ID | 90819 |
| Page Name | `ocpfVatPostingSetup` |
| Entity Set Name | `ocpfVatPostingSetup` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 25 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `vATBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 3 | `vATProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 4 | `vATCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 5 | `vAT` | VAT % | VAT % | ✅ |
| 6 | `unrealizedVatType` | Unrealized VAT Type | Unrealized VAT Type | ✅ |
| 7 | `adjustForPaymentDiscount` | Adjust for Payment Discount | Adjust for Payment Discount | ✅ |
| 8 | `salesVatAccount` | Sales VAT Account | Sales VAT Account | ✅ |
| 9 | `salesVatUnrealAccount` | Sales VAT Unreal. Account | Sales VAT Unreal. Account | ✅ |
| 10 | `purchaseVatAccount` | Purchase VAT Account | Purchase VAT Account | ✅ |
| 11 | `purchVatUnrealAccount` | Purch. VAT Unreal. Account | Purch. VAT Unreal. Account | ✅ |
| 12 | `reverseChrgVatAcc` | Reverse Chrg. VAT Acc. | Reverse Chrg. VAT Acc. | ✅ |
| 13 | `reverseChrgVatUnrealAcc` | Reverse Chrg. VAT Unreal. Acc. | Reverse Chrg. VAT Unreal. Acc. | ✅ |
| 14 | `vATIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 15 | `eUService` | EU Service | EU Service | ✅ |
| 16 | `vATClauseCode` | VAT Clause Code | VAT Clause Code | ✅ |
| 17 | `certificateOfSupplyRequired` | Certificate of Supply Required | Certificate of Supply Required | ✅ |
| 18 | `taxCategory` | Tax Category | Tax Category | ✅ |
| 19 | `description` | Description | Description | ✅ |
| 20 | `blocked` | Blocked | Blocked | ✅ |
| 21 | `saleVatReportingCode` | Sale VAT Reporting Code | Sale VAT Reporting Code | ✅ |
| 22 | `purchVatReportingCode` | Purch. VAT Reporting Code | Purchase VAT Reporting Code | ✅ |
| 23 | `nonDeductibleVat` | Non-Deductible VAT % | Non-Deductible VAT % | ✅ |
| 24 | `nonDedPurchaseVatAccount` | Non-Ded. Purchase VAT Account | Non-Deductible Purchase VAT Account | ✅ |
| 25 | `allowNonDeductibleVat` | Allow Non-Deductible VAT | Allow Non-Deductible VAT | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfDimensions

**Description:** Dimensions — named analytical axes (e.g., Department, Project, Cost Center) that can be attached to transactions for multi-dimensional financial reporting.

| Property | Value |
|---|---|
| **Source Table** | Dimension |
| Page ID | 90820 |
| Page Name | `ocpfDimensions` |
| Entity Set Name | `ocpfDimensions` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 10 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `codeCaption` | Code Caption | Code Caption | ✅ |
| 5 | `filterCaption` | Filter Caption | Filter Caption | ✅ |
| 6 | `description` | Description | Description | ✅ |
| 7 | `blocked` | Blocked | Blocked | ✅ |
| 8 | `consolidationCode` | Consolidation Code | Consolidation Code | ✅ |
| 9 | `mapToIcDimensionCode` | Map-to IC Dimension Code | Map-to IC Dimension Code | ✅ |
| 10 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfDimensionValues

**Description:** Dimension Values — the individual codes within a dimension (e.g., SALES, ADMIN within Department) used to tag transactions for reporting.

| Property | Value |
|---|---|
| **Source Table** | Dimension Value |
| Page ID | 90821 |
| Page Name | `ocpfDimensionValues` |
| Entity Set Name | `ocpfDimensionValues` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 15 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `dimensionCode` | Dimension Code | Dimension Code | ✅ |
| 3 | `code` | Code | Code | ✅ |
| 4 | `name` | Name | Name | ✅ |
| 5 | `dimensionValueType` | Dimension Value Type | Dimension Value Type | ✅ |
| 6 | `totaling` | Totaling | Totaling | ✅ |
| 7 | `blocked` | Blocked | Blocked | ✅ |
| 8 | `consolidationCode` | Consolidation Code | Consolidation Code | ✅ |
| 9 | `indentation` | Indentation | Indentation | ✅ |
| 10 | `globalDimensionNo` | Global Dimension No. | Global Dimension No. | ✅ |
| 11 | `mapToIcDimensionCode` | Map-to IC Dimension Code | Map-to IC Dimension Code | ✅ |
| 12 | `mapToIcDimensionValueCode` | Map-to IC Dimension Value Code | Map-to IC Dimension Value Code | ✅ |
| 13 | `dimensionValueId` | Dimension Value ID | Dimension Value ID | ✅ |
| 14 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |
| 15 | `dimensionId` | Dimension Id | Dimension Id | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfDefaultDimensions

**Description:** Default Dimensions — rules that define which dimension values are automatically suggested or required when posting transactions for a specific master record such as a customer, vendor, or item.

| Property | Value |
|---|---|
| **Source Table** | Default Dimension |
| Page ID | 90822 |
| Page Name | `ocpfDefaultDimensions` |
| Entity Set Name | `ocpfDefaultDimensions` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 14 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `tableId` | Table ID | Table ID | ✅ |
| 3 | `no` | No. | No. | ✅ |
| 4 | `dimensionCode` | Dimension Code | Dimension Code | ✅ |
| 5 | `dimensionValueCode` | Dimension Value Code | Dimension Value Code | ✅ |
| 6 | `valuePosting` | Value Posting | Value Posting | ✅ |
| 7 | `tableCaption` | Table Caption | Table Caption | 🧮 computed |
| 8 | `multiSelectionAction` | Multi Selection Action | Multi Selection Action | ✅ |
| 9 | `parentType` | Parent Type | Parent Type | ✅ |
| 10 | `allowedValuesFilter` | Allowed Values Filter | Allowed Values Filter | ✅ |
| 11 | `dimensionValueName` | Dimension Value Name | Dimension Value Name | 🧮 computed |
| 12 | `parentId` | ParentId | ParentId | ✅ |
| 13 | `dimensionId` | DimensionId | DimensionId | ✅ |
| 14 | `dimensionValueId` | DimensionValueId | DimensionValueId | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfDimensionSetEntries

**Description:** Dimension Set Entries — the resolved dimension value combinations stored against ledger entries and documents. Filter by Dimension Set ID to retrieve the dimensions on any posted transaction.

| Property | Value |
|---|---|
| **Source Table** | Dimension Set Entry |
| Page ID | 90823 |
| Page Name | `ocpfDimensionSetEntries` |
| Entity Set Name | `ocpfDimensionSetEntries` |
| API Group | `ocpf_coreFinancial` |
| Editable | ❌ No (GET only) |
| Field Count | 8 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 3 | `dimensionCode` | Dimension Code | Dimension Code | — |
| 4 | `dimensionValueCode` | Dimension Value Code | Dimension Value Code | — |
| 5 | `dimensionValueId` | Dimension Value ID | Dimension Value ID | — |
| 6 | `dimensionName` | Dimension Name | Dimension Name | 🧮 computed |
| 7 | `dimensionValueName` | Dimension Value Name | Dimension Value Name | 🧮 computed |
| 8 | `globalDimensionNo` | Global Dimension No. | Shortcut Dimension No. | — |


[↑ Back to top](#table-of-contents)

---

### ocpfInventoryPostingSetup

**Description:** Inventory posting setup — maps inventory posting groups and locations to G/L accounts.

| Property | Value |
|---|---|
| **Source Table** | Inventory Posting Setup |
| Page ID | 90824 |
| Page Name | `ocpfInventoryPostingSetup` |
| Entity Set Name | `ocpfInventoryPostingSetup` |
| API Group | `ocpf_coreFinancial` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 14 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `locationCode` | Location Code | Location Code | ✅ |
| 3 | `invtPostingGroupCode` | Invt. Posting Group Code | Invt. Posting Group Code | ✅ |
| 4 | `inventoryAccount` | Inventory Account | Inventory Account | ✅ |
| 5 | `description` | Description | Description | ✅ |
| 6 | `viewAllAccountsOnLookup` | View All Accounts on Lookup | View All Accounts on Lookup | ✅ |
| 7 | `inventoryAccountInterim` | Inventory Account (Interim) | Inventory Account (Interim) | ✅ |
| 8 | `wipAccount` | WIP Account | WIP Account | ✅ |
| 9 | `materialVarianceAccount` | Material Variance Account | Material Variance Account | ✅ |
| 10 | `capacityVarianceAccount` | Capacity Variance Account | Capacity Variance Account | ✅ |
| 11 | `mfgOverheadVarianceAccount` | Mfg. Overhead Variance Account | Mfg. Overhead Variance Account | ✅ |
| 12 | `capOverheadVarianceAccount` | Cap. Overhead Variance Account | Cap. Overhead Variance Account | ✅ |
| 13 | `subcontractedVarianceAccount` | Subcontracted Variance Account | Subcontracted Variance Account | ✅ |
| 14 | `matNonInvVarianceAcc` | Mat. Non-Inv. Variance Acc. | Material Non-Inventory Variance Account | ✅ |


[↑ Back to top](#table-of-contents)

---

## Master Data

[↑ Table of Contents](#table-of-contents)

**API Group URL segment:** `ocpf_masterData`  
**Pages:** 31 (26 editable, 5 read-only)  

### ocpfBankAccounts

**Description:** Bank Accounts — company bank accounts used for posting payments and receipts, including balance and statement information.

| Property | Value |
|---|---|
| **Source Table** | Bank Account |
| Page ID | 90830 |
| Page Name | `ocpfBankAccounts` |
| Entity Set Name | `ocpfBankAccounts` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 81 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `searchName` | Search Name | Search Name | ✅ |
| 5 | `name2` | Name 2 | Name 2 | ✅ |
| 6 | `address` | Address | Address | ✅ |
| 7 | `address2` | Address 2 | Address 2 | ✅ |
| 8 | `city` | City | City | ✅ |
| 9 | `contact` | Contact | Contact | ✅ |
| 10 | `phoneNo` | Phone No. | Phone No. | ✅ |
| 11 | `telexNo` | Telex No. | Telex No. | ✅ |
| 12 | `bankAccountNo` | Bank Account No. | Bank Account No. | ✅ |
| 13 | `transitNo` | Transit No. | Transit No. | ✅ |
| 14 | `territoryCode` | Territory Code | Territory Code | ✅ |
| 15 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 16 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 17 | `chainName` | Chain Name | Chain Name | ✅ |
| 18 | `minBalance` | Min. Balance | Min. Balance | ✅ |
| 19 | `bankAccPostingGroup` | Bank Acc. Posting Group | Bank Acc. Posting Group | ✅ |
| 20 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 21 | `languageCode` | Language Code | Language Code | ✅ |
| 22 | `formatRegion` | Format Region | Format Region | ✅ |
| 23 | `statisticsGroup` | Statistics Group | Statistics Group | ✅ |
| 24 | `ourContactCode` | Our Contact Code | Our Contact Code | ✅ |
| 25 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 26 | `amount` | Amount | Amount | ✅ |
| 27 | `comment` | Comment | Comment | 🧮 computed |
| 28 | `blocked` | Blocked | Blocked | ✅ |
| 29 | `lastStatementNo` | Last Statement No. | Last Statement No. | ✅ |
| 30 | `lastPaymentStatementNo` | Last Payment Statement No. | Last Payment Statement No. | ✅ |
| 31 | `pmtRecNoSeries` | Pmt. Rec. No. Series | Payment Reconciliation No. Series | ✅ |
| 32 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 33 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 34 | `globalDimension1Filter` | Global Dimension 1 Filter | Global Dimension 1 Filter | 🔍 filter |
| 35 | `globalDimension2Filter` | Global Dimension 2 Filter | Global Dimension 2 Filter | 🔍 filter |
| 36 | `balance` | Balance | Balance | 🧮 computed |
| 37 | `netChange` | Net Change | Net Change | 🧮 computed |
| 38 | `totalOnChecks` | Total on Checks | Total on Checks | 🧮 computed |
| 39 | `useAsDefaultForCurrency` | Use as Default for Currency | Use as Default for Currency | ✅ |
| 40 | `faxNo` | Fax No. | Fax No. | ✅ |
| 41 | `telexAnswerBack` | Telex Answer Back | Telex Answer Back | ✅ |
| 42 | `postCode` | Post Code | Post Code | ✅ |
| 43 | `county` | County | County | ✅ |
| 44 | `lastCheckNo` | Last Check No. | Last Check No. | ✅ |
| 45 | `balanceLastStatement` | Balance Last Statement | Balance Last Statement | ✅ |
| 46 | `balanceAtDate` | Balance at Date | Balance at Date | 🧮 computed |
| 47 | `debitAmount` | Debit Amount | Debit Amount | 🧮 computed |
| 48 | `creditAmount` | Credit Amount | Credit Amount | 🧮 computed |
| 49 | `bankBranchNo` | Bank Branch No. | Bank Branch No. | ✅ |
| 50 | `eMail` | E-Mail | Email | ✅ |
| 51 | `homePage` | Home Page | Home Page | ✅ |
| 52 | `noSeries` | No. Series | No. Series | ✅ |
| 53 | `checkReportId` | Check Report ID | Check Report ID | ✅ |
| 54 | `checkReportName` | Check Report Name | Check Report Name | 🧮 computed |
| 55 | `iBAN` | IBAN | IBAN | ✅ |
| 56 | `sWIFTCode` | SWIFT Code | SWIFT Code | ✅ |
| 57 | `bankStatementImportFormat` | Bank Statement Import Format | Bank Statement Import Format | ✅ |
| 58 | `creditTransferMsgNos` | Credit Transfer Msg. Nos. | Credit Transfer Msg. Nos. | ✅ |
| 59 | `directDebitMsgNos` | Direct Debit Msg. Nos. | Direct Debit Msg. Nos. | ✅ |
| 60 | `sEPADirectDebitExpFormat` | SEPA Direct Debit Exp. Format | SEPA Direct Debit Exp. Format | ✅ |
| 61 | `bankStmtServiceRecordId` | Bank Stmt. Service Record ID | Bank Stmt. Service Record ID | ✅ |
| 62 | `transactionImportTimespan` | Transaction Import Timespan | Transaction Import Timespan | ✅ |
| 63 | `automaticStmtImportEnabled` | Automatic Stmt. Import Enabled | Automatic Stmt. Import Enabled | ✅ |
| 64 | `intercompanyEnable` | IntercompanyEnable | Enable for Intercompany transactions | ✅ |
| 65 | `image` | Image | Image | ✅ |
| 66 | `creditorNo` | Creditor No. | Creditor No. | ✅ |
| 67 | `paymentExportFormat` | Payment Export Format | Payment Export Format | ✅ |
| 68 | `bankClearingCode` | Bank Clearing Code | Bank Clearing Code | ✅ |
| 69 | `bankClearingStandard` | Bank Clearing Standard | Bank Clearing Standard | ✅ |
| 70 | `matchToleranceType` | Match Tolerance Type | Match Tolerance Type | ✅ |
| 71 | `matchToleranceValue` | Match Tolerance Value | Match Tolerance Value | ✅ |
| 72 | `disableAutomaticPmtMatching` | Disable Automatic Pmt Matching | Disable Automatic Payment Matching | ✅ |
| 73 | `disableBankRecOptimization` | Disable Bank Rec. Optimization | Disable Bank Reconciliation Optimization | ✅ |
| 74 | `positivePayExportCode` | Positive Pay Export Code | Positive Pay Export Code | ✅ |
| 75 | `checkTransmitted` | Check Transmitted | Check Transmitted | ✅ |
| 76 | `mobilePhoneNo` | Mobile Phone No. | Mobile Phone No. | ✅ |
| 77 | `balanceLcy` | Balance (LCY) | Balance (LCY) | 🧮 computed |
| 78 | `netChangeLcy` | Net Change (LCY) | Net Change (LCY) | 🧮 computed |
| 79 | `balanceAtDateLcy` | Balance at Date (LCY) | Balance at Date (LCY) | 🧮 computed |
| 80 | `debitAmountLcy` | Debit Amount (LCY) | Debit Amount (LCY) | 🧮 computed |
| 81 | `creditAmountLcy` | Credit Amount (LCY) | Credit Amount (LCY) | 🧮 computed |

> **Added in API v3.1:** fields 77–81 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfBankAccountPostingGroups

**Description:** Bank Account Posting Groups — map bank accounts to the G/L accounts used when posting bank transactions.

| Property | Value |
|---|---|
| **Source Table** | Bank Account Posting Group |
| Page ID | 90831 |
| Page Name | `ocpfBankAccountPostingGroups` |
| Entity Set Name | `ocpfBankAccountPostingGroups` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `gLAccountNo` | G/L Account No. | G/L Account No. | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfBankAccountLedgerEntries

**Description:** Bank Account Ledger Entries — posted transactions on bank accounts including payments, receipts, and reconciliation entries.

| Property | Value |
|---|---|
| **Source Table** | Bank Account Ledger Entry |
| Page ID | 90832 |
| Page Name | `ocpfBankAccountLedgerEntries` |
| Entity Set Name | `ocpfBankAccountLedgerEntries` |
| API Group | `ocpf_masterData` |
| Editable | ❌ No (GET only) |
| Field Count | 48 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `bankAccountNo` | Bank Account No. | Bank Account No. | — |
| 4 | `postingDate` | Posting Date | Posting Date | — |
| 5 | `documentType` | Document Type | Document Type | — |
| 6 | `documentNo` | Document No. | Document No. | — |
| 7 | `description` | Description | Description | — |
| 8 | `currencyCode` | Currency Code | Currency Code | — |
| 9 | `amount` | Amount | Amount | — |
| 10 | `remainingAmount` | Remaining Amount | Remaining Amount | — |
| 11 | `bankAccPostingGroup` | Bank Acc. Posting Group | Bank Acc. Posting Group | — |
| 12 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 13 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 14 | `ourContactCode` | Our Contact Code | Our Contact Code | — |
| 15 | `userId` | User ID | User ID | — |
| 16 | `sourceCode` | Source Code | Source Code | — |
| 17 | `open` | Open | Open | — |
| 18 | `positive` | Positive | Positive | — |
| 19 | `closedByEntryNo` | Closed by Entry No. | Closed by Entry No. | — |
| 20 | `closedAtDate` | Closed at Date | Closed at Date | — |
| 21 | `journalTemplName` | Journal Templ. Name | Journal Template Name | — |
| 22 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 23 | `reasonCode` | Reason Code | Reason Code | — |
| 24 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 25 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 26 | `transactionNo` | Transaction No. | Transaction No. | — |
| 27 | `statementStatus` | Statement Status | Statement Status | — |
| 28 | `statementNo` | Statement No. | Statement No. | — |
| 29 | `statementLineNo` | Statement Line No. | Statement Line No. | — |
| 30 | `debitAmount` | Debit Amount | Debit Amount | — |
| 31 | `creditAmount` | Credit Amount | Credit Amount | — |
| 32 | `documentDate` | Document Date | Document Date | — |
| 33 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 34 | `reversed` | Reversed | Reversed | — |
| 35 | `reversedByEntryNo` | Reversed by Entry No. | Reversed by Entry No. | — |
| 36 | `reversedEntryNo` | Reversed Entry No. | Reversed Entry No. | — |
| 37 | `statementDate` | Statement Date | Statement Date | 🧮 computed |
| 38 | `checkLedgerEntries` | Check Ledger Entries | Check Ledger Entries | 🧮 computed |
| 39 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 40 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 41 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 42 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 43 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 44 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 45 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |
| 46 | `amountLcy` | Amount (LCY) | Amount (LCY) | — |
| 47 | `debitAmountLcy` | Debit Amount (LCY) | Debit Amount (LCY) | — |
| 48 | `creditAmountLcy` | Credit Amount (LCY) | Credit Amount (LCY) | — |

> **Added in API v3.1:** fields 46–48 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfPaymentTerms

**Description:** Payment Terms — define due date calculation rules and early payment discount conditions applied to sales and purchase documents.

| Property | Value |
|---|---|
| **Source Table** | Payment Terms |
| Page ID | 90833 |
| Page Name | `ocpfPaymentTerms` |
| Entity Set Name | `ocpfPaymentTerms` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 8 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `dueDateCalculation` | Due Date Calculation | Due Date Calculation | ✅ |
| 4 | `discountDateCalculation` | Discount Date Calculation | Discount Date Calculation | ✅ |
| 5 | `discount` | Discount % | Discount % | ✅ |
| 6 | `description` | Description | Description | ✅ |
| 7 | `calcPmtDiscOnCrMemos` | Calc. Pmt. Disc. on Cr. Memos | Calc. Pmt. Disc. on Cr. Memos | ✅ |
| 8 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfPaymentMethods

**Description:** Payment Methods — define how invoices are paid (e.g., cash, bank transfer, cheque) and optionally link to a balancing G/L account.

| Property | Value |
|---|---|
| **Source Table** | Payment Method |
| Page ID | 90834 |
| Page Name | `ocpfPaymentMethods` |
| Entity Set Name | `ocpfPaymentMethods` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 9 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 5 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 6 | `directDebit` | Direct Debit | Direct Debit | ✅ |
| 7 | `directDebitPmtTermsCode` | Direct Debit Pmt. Terms Code | Direct Debit Pmt. Terms Code | ✅ |
| 8 | `pmtExportLineDefinition` | Pmt. Export Line Definition | Pmt. Export Line Definition | ✅ |
| 9 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfCurrencies

**Description:** Currencies — foreign currency codes with exchange rate settings used across sales, purchasing, and banking transactions.

| Property | Value |
|---|---|
| **Source Table** | Currency |
| Page ID | 90835 |
| Page Name | `ocpfCurrencies` |
| Entity Set Name | `ocpfCurrencies` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 51 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 4 | `lastDateAdjusted` | Last Date Adjusted | Last Date Adjusted | ✅ |
| 5 | `iSOCode` | ISO Code | ISO Code | ✅ |
| 6 | `iSONumericCode` | ISO Numeric Code | ISO Numeric Code | ✅ |
| 7 | `unrealizedGainsAcc` | Unrealized Gains Acc. | Unrealized Gains Acc. | ✅ |
| 8 | `realizedGainsAcc` | Realized Gains Acc. | Realized Gains Acc. | ✅ |
| 9 | `unrealizedLossesAcc` | Unrealized Losses Acc. | Unrealized Losses Acc. | ✅ |
| 10 | `realizedLossesAcc` | Realized Losses Acc. | Realized Losses Acc. | ✅ |
| 11 | `invoiceRoundingPrecision` | Invoice Rounding Precision | Invoice Rounding Precision | ✅ |
| 12 | `invoiceRoundingType` | Invoice Rounding Type | Invoice Rounding Type | ✅ |
| 13 | `amountRoundingPrecision` | Amount Rounding Precision | Amount Rounding Precision | ✅ |
| 14 | `unitAmountRoundingPrecision` | Unit-Amount Rounding Precision | Unit-Amount Rounding Precision | ✅ |
| 15 | `description` | Description | Description | ✅ |
| 16 | `amountDecimalPlaces` | Amount Decimal Places | Amount Decimal Places | ✅ |
| 17 | `unitAmountDecimalPlaces` | Unit-Amount Decimal Places | Unit-Amount Decimal Places | ✅ |
| 18 | `customerFilter` | Customer Filter | Customer Filter | 🔍 filter |
| 19 | `vendorFilter` | Vendor Filter | Vendor Filter | 🔍 filter |
| 20 | `globalDimension1Filter` | Global Dimension 1 Filter | Global Dimension 1 Filter | 🔍 filter |
| 21 | `globalDimension2Filter` | Global Dimension 2 Filter | Global Dimension 2 Filter | 🔍 filter |
| 22 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 23 | `custLedgEntriesInFilter` | Cust. Ledg. Entries in Filter | Cust. Ledg. Entries in Filter | 🧮 computed |
| 24 | `customerBalance` | Customer Balance | Customer Balance | 🧮 computed |
| 25 | `customerOutstandingOrders` | Customer Outstanding Orders | Customer Outstanding Orders | 🧮 computed |
| 26 | `customerShippedNotInvoiced` | Customer Shipped Not Invoiced | Customer Shipped Not Invoiced | 🧮 computed |
| 27 | `customerBalanceDue` | Customer Balance Due | Customer Balance Due | 🧮 computed |
| 28 | `vendorLedgEntriesInFilter` | Vendor Ledg. Entries in Filter | Vendor Ledg. Entries in Filter | 🧮 computed |
| 29 | `vendorBalance` | Vendor Balance | Vendor Balance | 🧮 computed |
| 30 | `vendorOutstandingOrders` | Vendor Outstanding Orders | Vendor Outstanding Orders | 🧮 computed |
| 31 | `vendorAmtRcdNotInvoiced` | Vendor Amt. Rcd. Not Invoiced | Vendor Amt. Rcd. Not Invoiced | 🧮 computed |
| 32 | `vendorBalanceDue` | Vendor Balance Due | Vendor Balance Due | 🧮 computed |
| 33 | `realizedGLGainsAccount` | Realized G/L Gains Account | Realized G/L Gains Account | ✅ |
| 34 | `realizedGLLossesAccount` | Realized G/L Losses Account | Realized G/L Losses Account | ✅ |
| 35 | `applnRoundingPrecision` | Appln. Rounding Precision | Appln. Rounding Precision | ✅ |
| 36 | `eMUCurrency` | EMU Currency | EMU Currency | ✅ |
| 37 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 38 | `residualGainsAccount` | Residual Gains Account | Residual Gains Account | ✅ |
| 39 | `residualLossesAccount` | Residual Losses Account | Residual Losses Account | ✅ |
| 40 | `convLcyRndgDebitAcc` | Conv. LCY Rndg. Debit Acc. | Conv. LCY Rndg. Debit Acc. | ✅ |
| 41 | `convLcyRndgCreditAcc` | Conv. LCY Rndg. Credit Acc. | Conv. LCY Rndg. Credit Acc. | ✅ |
| 42 | `maxVatDifferenceAllowed` | Max. VAT Difference Allowed | Max. VAT Difference Allowed | ✅ |
| 43 | `vATRoundingType` | VAT Rounding Type | VAT Rounding Type | ✅ |
| 44 | `paymentTolerance` | Payment Tolerance % | Payment Tolerance % | ✅ |
| 45 | `maxPaymentToleranceAmount` | Max. Payment Tolerance Amount | Max. Payment Tolerance Amount | ✅ |
| 46 | `symbol` | Symbol | Symbol | ✅ |
| 47 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |
| 48 | `currencySymbolPosition` | Currency Symbol Position | Currency Symbol Position | ✅ |
| 49 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dataverse | 🧮 computed |
| 50 | `customerBalanceLcy` | Customer Balance (LCY) | Customer Balance (LCY) | 🧮 computed |
| 51 | `vendorBalanceLcy` | Vendor Balance (LCY) | Vendor Balance (LCY) | 🧮 computed |

> **Added in API v3.1:** fields 50–51 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfCountriesRegions

**Description:** Countries and Regions — reference data for country and region codes used on addresses, customers, vendors, and contacts.

| Property | Value |
|---|---|
| **Source Table** | Country/Region |
| Page ID | 90836 |
| Page Name | `ocpfCountriesRegions` |
| Entity Set Name | `ocpfCountriesRegions` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 12 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `iSOCode` | ISO Code | ISO Code | ✅ |
| 5 | `iSONumericCode` | ISO Numeric Code | ISO Numeric Code | ✅ |
| 6 | `eUCountryRegionCode` | EU Country/Region Code | EU Country/Region Code | ✅ |
| 7 | `intrastatCode` | Intrastat Code | Intrastat Code | ✅ |
| 8 | `addressFormat` | Address Format | Address Format | ✅ |
| 9 | `contactAddressFormat` | Contact Address Format | Contact Address Format | ✅ |
| 10 | `vATScheme` | VAT Scheme | VAT Scheme | ✅ |
| 11 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |
| 12 | `countyName` | County Name | County Name | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfUnitsOfMeasure

**Description:** Units of Measure — the base unit codes (e.g., PCS, KG, HR) used to quantify items, resources, and transactions.

| Property | Value |
|---|---|
| **Source Table** | Unit of Measure |
| Page ID | 90837 |
| Page Name | `ocpfUnitsOfMeasure` |
| Entity Set Name | `ocpfUnitsOfMeasure` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 7 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `internationalStandardCode` | International Standard Code | International Standard Code | ✅ |
| 5 | `symbol` | Symbol | Symbol | ✅ |
| 6 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |
| 7 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dynamics 365 Sales | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfItemUnitsOfMeasure

**Description:** Item Units of Measure — per-item unit of measure conversions defining how many base units make up each alternate unit for a specific item.

| Property | Value |
|---|---|
| **Source Table** | Item Unit of Measure |
| Page ID | 90838 |
| Page Name | `ocpfItemUnitsOfMeasure` |
| Entity Set Name | `ocpfItemUnitsOfMeasure` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 11 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `itemNo` | Item No. | Item No. | ✅ |
| 3 | `code` | Code | Code | ✅ |
| 4 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 5 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 6 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dynamics 365 Sales | 🧮 computed |
| 7 | `length` | Length | Length | ✅ |
| 8 | `width` | Width | Width | ✅ |
| 9 | `height` | Height | Height | ✅ |
| 10 | `cubage` | Cubage | Cubage | ✅ |
| 11 | `weight` | Weight | Weight | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfLocations

**Description:** Locations — physical or logical inventory locations (warehouses, bins, stores) where items are stocked and tracked.

| Property | Value |
|---|---|
| **Source Table** | Location |
| Page ID | 90839 |
| Page Name | `ocpfLocations` |
| Entity Set Name | `ocpfLocations` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 56 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `defaultBinCode` | Default Bin Code | Default Bin Code | ✅ |
| 5 | `name2` | Name 2 | Name 2 | ✅ |
| 6 | `address` | Address | Address | ✅ |
| 7 | `address2` | Address 2 | Address 2 | ✅ |
| 8 | `city` | City | City | ✅ |
| 9 | `phoneNo` | Phone No. | Phone No. | ✅ |
| 10 | `phoneNo2` | Phone No. 2 | Phone No. 2 | ✅ |
| 11 | `telexNo` | Telex No. | Telex No. | ✅ |
| 12 | `faxNo` | Fax No. | Fax No. | ✅ |
| 13 | `contact` | Contact | Contact | ✅ |
| 14 | `postCode` | Post Code | Post Code | ✅ |
| 15 | `county` | County | County | ✅ |
| 16 | `eMail` | E-Mail | Email | ✅ |
| 17 | `homePage` | Home Page | Home Page | ✅ |
| 18 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 19 | `useAsInTransit` | Use As In-Transit | Use As In-Transit | ✅ |
| 20 | `requirePutAway` | Require Put-away | Require Put-away | ✅ |
| 21 | `requirePick` | Require Pick | Require Pick | ✅ |
| 22 | `crossDockDueDateCalc` | Cross-Dock Due Date Calc. | Cross-Dock Due Date Calc. | ✅ |
| 23 | `useCrossDocking` | Use Cross-Docking | Use Cross-Docking | ✅ |
| 24 | `requireReceive` | Require Receive | Require Receive | ✅ |
| 25 | `requireShipment` | Require Shipment | Require Shipment | ✅ |
| 26 | `binMandatory` | Bin Mandatory | Bin Mandatory | ✅ |
| 27 | `directedPutAwayAndPick` | Directed Put-away and Pick | Directed Put-away and Pick | ✅ |
| 28 | `defaultBinSelection` | Default Bin Selection | Default Bin Selection | ✅ |
| 29 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | ✅ |
| 30 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | ✅ |
| 31 | `putAwayTemplateCode` | Put-away Template Code | Put-away Template Code | ✅ |
| 32 | `usePutAwayWorksheet` | Use Put-away Worksheet | Use Put-away Worksheet | ✅ |
| 33 | `pickAccordingToFefo` | Pick According to FEFO | Pick According to FEFO | ✅ |
| 34 | `allowBreakbulk` | Allow Breakbulk | Allow Breakbulk | ✅ |
| 35 | `binCapacityPolicy` | Bin Capacity Policy | Bin Capacity Policy | ✅ |
| 36 | `pickBinPolicy` | Pick Bin Policy | Pick Bin Policy | ✅ |
| 37 | `checkWhseClass` | Check Whse. Class | Check Warehouse Class | ✅ |
| 38 | `putAwayBinPolicy` | Put-away Bin Policy | Put-away Bin Policy | ✅ |
| 39 | `openShopFloorBinCode` | Open Shop Floor Bin Code | Open Shop Floor Bin Code | ✅ |
| 40 | `toProductionBinCode` | To-Production Bin Code | To-Production Bin Code | ✅ |
| 41 | `fromProductionBinCode` | From-Production Bin Code | From-Production Bin Code | ✅ |
| 42 | `adjustmentBinCode` | Adjustment Bin Code | Adjustment Bin Code | ✅ |
| 43 | `alwaysCreatePutAwayLine` | Always Create Put-away Line | Always Create Put-away Line | ✅ |
| 44 | `alwaysCreatePickLine` | Always Create Pick Line | Always Create Pick Line | ✅ |
| 45 | `specialEquipment` | Special Equipment | Special Equipment | ✅ |
| 46 | `receiptBinCode` | Receipt Bin Code | Receipt Bin Code | ✅ |
| 47 | `shipmentBinCode` | Shipment Bin Code | Shipment Bin Code | ✅ |
| 48 | `crossDockBinCode` | Cross-Dock Bin Code | Cross-Dock Bin Code | ✅ |
| 49 | `toAssemblyBinCode` | To-Assembly Bin Code | To-Assembly Bin Code | ✅ |
| 50 | `fromAssemblyBinCode` | From-Assembly Bin Code | From-Assembly Bin Code | ✅ |
| 51 | `asmToOrderShptBinCode` | Asm.-to-Order Shpt. Bin Code | Asm.-to-Order Shpt. Bin Code | ✅ |
| 52 | `toJobBinCode` | To-Job Bin Code | To-Project Bin Code | ✅ |
| 53 | `asmConsumpWhseHandling` | Asm. Consump. Whse. Handling | Asm. Consump. Whse. Handling | ✅ |
| 54 | `jobConsumpWhseHandling` | Job Consump. Whse. Handling | Project Consump. Whse. Handling | ✅ |
| 55 | `baseCalendarCode` | Base Calendar Code | Base Calendar Code | ✅ |
| 56 | `useAdcs` | Use ADCS | Use ADCS | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfItemCategories

**Description:** Item Categories — hierarchical classification codes for grouping items, used for reporting, default attributes, and costing.

| Property | Value |
|---|---|
| **Source Table** | Item Category |
| Page ID | 90840 |
| Page Name | `ocpfItemCategories` |
| Entity Set Name | `ocpfItemCategories` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 8 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `parentCategory` | Parent Category | Parent Category | ✅ |
| 4 | `description` | Description | Description | ✅ |
| 5 | `indentation` | Indentation | Indentation | ✅ |
| 6 | `presentationOrder` | Presentation Order | Presentation Order | ✅ |
| 7 | `hasChildren` | Has Children | Has Children | ✅ |
| 8 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfShipmentMethods

**Description:** Shipment Methods — define the terms of delivery (e.g., EXW, CIF, FOB) printed on sales and purchase documents.

| Property | Value |
|---|---|
| **Source Table** | Shipment Method |
| Page ID | 90841 |
| Page Name | `ocpfShipmentMethods` |
| Entity Set Name | `ocpfShipmentMethods` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 4 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfCustomers

**Description:** Customers — master records for all entities to whom the company sells goods or services, including credit, payment, and posting settings.

| Property | Value |
|---|---|
| **Source Table** | Customer |
| Page ID | 90842 |
| Page Name | `ocpfCustomers` |
| Entity Set Name | `ocpfCustomers` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 164 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `searchName` | Search Name | Search Name | ✅ |
| 5 | `name2` | Name 2 | Name 2 | ✅ |
| 6 | `address` | Address | Address | ✅ |
| 7 | `address2` | Address 2 | Address 2 | ✅ |
| 8 | `city` | City | City | ✅ |
| 9 | `contact` | Contact | Contact | ✅ |
| 10 | `phoneNo` | Phone No. | Phone No. | ✅ |
| 11 | `telexNo` | Telex No. | Telex No. | ✅ |
| 12 | `documentSendingProfile` | Document Sending Profile | Document Sending Profile | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `ourAccountNo` | Our Account No. | Our Account No. | ✅ |
| 15 | `territoryCode` | Territory Code | Territory Code | ✅ |
| 16 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 17 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 18 | `chainName` | Chain Name | Chain Name | ✅ |
| 19 | `budgetedAmount` | Budgeted Amount | Budgeted Amount | ✅ |
| 20 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | ✅ |
| 21 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 22 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 23 | `languageCode` | Language Code | Language Code | ✅ |
| 24 | `registrationNumber` | Registration Number | Registration No. | ✅ |
| 25 | `statisticsGroup` | Statistics Group | Statistics Group | ✅ |
| 26 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 27 | `finChargeTermsCode` | Fin. Charge Terms Code | Fin. Charge Terms Code | ✅ |
| 28 | `salespersonCode` | Salesperson Code | Salesperson Code | ✅ |
| 29 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 30 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 31 | `placeOfExport` | Place of Export | Place of Export | ✅ |
| 32 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 33 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 34 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 35 | `collectionMethod` | Collection Method | Collection Method | ✅ |
| 36 | `amount` | Amount | Amount | ✅ |
| 37 | `comment` | Comment | Comment | 🧮 computed |
| 38 | `blocked` | Blocked | Blocked | ✅ |
| 39 | `lastStatementNo` | Last Statement No. | Last Statement No. | ✅ |
| 40 | `printStatements` | Print Statements | Print Statements | ✅ |
| 41 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 42 | `priority` | Priority | Priority | ✅ |
| 43 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 44 | `formatRegion` | Format Region | Format Region | ✅ |
| 45 | `firstTransactionDate` | First Transaction Date | Customer Since | 🧮 computed |
| 46 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |
| 47 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 48 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 49 | `globalDimension1Filter` | Global Dimension 1 Filter | Global Dimension 1 Filter | 🔍 filter |
| 50 | `globalDimension2Filter` | Global Dimension 2 Filter | Global Dimension 2 Filter | 🔍 filter |
| 51 | `balance` | Balance | Balance | 🧮 computed |
| 52 | `netChange` | Net Change | Net Change | 🧮 computed |
| 53 | `balanceDue` | Balance Due | Balance Due | 🧮 computed |
| 54 | `payments` | Payments | Payments | 🧮 computed |
| 55 | `invoiceAmounts` | Invoice Amounts | Invoice Amounts | 🧮 computed |
| 56 | `crMemoAmounts` | Cr. Memo Amounts | Cr. Memo Amounts | 🧮 computed |
| 57 | `financeChargeMemoAmounts` | Finance Charge Memo Amounts | Finance Charge Memo Amounts | 🧮 computed |
| 58 | `outstandingOrders` | Outstanding Orders | Outstanding Orders | 🧮 computed |
| 59 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | 🧮 computed |
| 60 | `applicationMethod` | Application Method | Application Method | ✅ |
| 61 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 62 | `locationCode` | Location Code | Location Code | ✅ |
| 63 | `faxNo` | Fax No. | Fax No. | ✅ |
| 64 | `telexAnswerBack` | Telex Answer Back | Telex Answer Back | ✅ |
| 65 | `vATRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 66 | `combineShipments` | Combine Shipments | Combine Sales Shipments | ✅ |
| 67 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 68 | `gLN` | GLN | GLN | ✅ |
| 69 | `postCode` | Post Code | Post Code | ✅ |
| 70 | `county` | County | County | ✅ |
| 71 | `eORINumber` | EORI Number | EORI Number | ✅ |
| 72 | `useGlnInElectronicDocument` | Use GLN in Electronic Document | Use GLN in Electronic Documents | ✅ |
| 73 | `debitAmount` | Debit Amount | Debit Amount | 🧮 computed |
| 74 | `creditAmount` | Credit Amount | Credit Amount | 🧮 computed |
| 75 | `eMail` | E-Mail | Email | ✅ |
| 76 | `homePage` | Home Page | Home Page | ✅ |
| 77 | `reminderTermsCode` | Reminder Terms Code | Reminder Terms Code | ✅ |
| 78 | `reminderAmounts` | Reminder Amounts | Reminder Amounts | 🧮 computed |
| 79 | `noSeries` | No. Series | No. Series | ✅ |
| 80 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 81 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 82 | `vATBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 83 | `currencyFilter` | Currency Filter | Currency Filter | 🔍 filter |
| 84 | `reserve` | Reserve | Reserve | ✅ |
| 85 | `blockPaymentTolerance` | Block Payment Tolerance | Block Payment Tolerance | ✅ |
| 86 | `iCPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 87 | `refunds` | Refunds | Refunds | 🧮 computed |
| 88 | `otherAmounts` | Other Amounts | Other Amounts | 🧮 computed |
| 89 | `prepayment` | Prepayment % | Prepayment % | ✅ |
| 90 | `outstandingInvoices` | Outstanding Invoices | Outstanding Invoices | 🧮 computed |
| 91 | `billToNoOfArchivedDoc` | Bill-to No. Of Archived Doc. | Bill-to No. Of Sales Archived Doc. | 🧮 computed |
| 92 | `sellToNoOfArchivedDoc` | Sell-to No. Of Archived Doc. | Sell-to No. Of Sales Archived Doc. | 🧮 computed |
| 93 | `partnerType` | Partner Type | Partner Type | ✅ |
| 94 | `intrastatPartnerType` | Intrastat Partner Type | Intrastat Partner Type | ✅ |
| 95 | `excludeFromPmtPractices` | Exclude from Pmt. Practices | Exclude from Payment Practices | ✅ |
| 96 | `image` | Image | Image | ✅ |
| 97 | `privacyBlocked` | Privacy Blocked | Privacy Blocked | ✅ |
| 98 | `disableSearchByName` | Disable Search by Name | Disable Search by Name | ✅ |
| 99 | `allowMultiplePostingGroups` | Allow Multiple Posting Groups | Allow Multiple Posting Groups | ✅ |
| 100 | `preferredBankAccountCode` | Preferred Bank Account Code | Preferred Bank Account Code | ✅ |
| 101 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dataverse | 🧮 computed |
| 102 | `cashFlowPaymentTermsCode` | Cash Flow Payment Terms Code | Cash Flow Payment Terms Code | ✅ |
| 103 | `primaryContactNo` | Primary Contact No. | Primary Contact No. | ✅ |
| 104 | `contactType` | Contact Type | Contact Type | ✅ |
| 105 | `mobilePhoneNo` | Mobile Phone No. | Mobile Phone No. | ✅ |
| 106 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 107 | `shippingAdvice` | Shipping Advice | Shipping Advice | ✅ |
| 108 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 109 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 110 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 111 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 112 | `noOfQuotes` | No. of Quotes | No. of Quotes | 🧮 computed |
| 113 | `noOfBlanketOrders` | No. of Blanket Orders | No. of Blanket Orders | 🧮 computed |
| 114 | `noOfOrders` | No. of Orders | No. of Orders | 🧮 computed |
| 115 | `noOfInvoices` | No. of Invoices | No. of Invoices | 🧮 computed |
| 116 | `noOfReturnOrders` | No. of Return Orders | No. of Return Orders | 🧮 computed |
| 117 | `noOfCreditMemos` | No. of Credit Memos | No. of Credit Memos | 🧮 computed |
| 118 | `noOfPstdShipments` | No. of Pstd. Shipments | No. of Pstd. Shipments | 🧮 computed |
| 119 | `noOfPstdInvoices` | No. of Pstd. Invoices | No. of Pstd. Invoices | 🧮 computed |
| 120 | `noOfPstdReturnReceipts` | No. of Pstd. Return Receipts | No. of Pstd. Return Receipts | 🧮 computed |
| 121 | `noOfPstdCreditMemos` | No. of Pstd. Credit Memos | No. of Pstd. Credit Memos | 🧮 computed |
| 122 | `noOfShipToAddresses` | No. of Ship-to Addresses | No. of Ship-to Addresses | 🧮 computed |
| 123 | `billToNoOfQuotes` | Bill-To No. of Quotes | Bill-To No. of Quotes | 🧮 computed |
| 124 | `billToNoOfBlanketOrders` | Bill-To No. of Blanket Orders | Bill-To No. of Blanket Orders | 🧮 computed |
| 125 | `billToNoOfOrders` | Bill-To No. of Orders | Bill-To No. of Orders | 🧮 computed |
| 126 | `billToNoOfInvoices` | Bill-To No. of Invoices | Bill-To No. of Invoices | 🧮 computed |
| 127 | `billToNoOfReturnOrders` | Bill-To No. of Return Orders | Bill-To No. of Return Orders | 🧮 computed |
| 128 | `billToNoOfCreditMemos` | Bill-To No. of Credit Memos | Bill-To No. of Credit Memos | 🧮 computed |
| 129 | `billToNoOfPstdShipments` | Bill-To No. of Pstd. Shipments | Bill-To No. of Pstd. Shipments | 🧮 computed |
| 130 | `billToNoOfPstdInvoices` | Bill-To No. of Pstd. Invoices | Bill-To No. of Pstd. Invoices | 🧮 computed |
| 131 | `billToNoOfPstdReturnR` | Bill-To No. of Pstd. Return R. | Bill-To No. of Pstd. Return R. | 🧮 computed |
| 132 | `billToNoOfPstdCrMemos` | Bill-To No. of Pstd. Cr. Memos | Bill-To No. of Pstd. Cr. Memos | 🧮 computed |
| 133 | `baseCalendarCode` | Base Calendar Code | Base Calendar Code | ✅ |
| 134 | `copySellToAddrToQteFrom` | Copy Sell-to Addr. to Qte From | Copy Sell-to Addr. to Qte From | ✅ |
| 135 | `validateEuVatRegNo` | Validate EU Vat Reg. No. | Validate EU VAT Reg. No. | ✅ |
| 136 | `currencyId` | Currency Id | Currency Id | ✅ |
| 137 | `paymentTermsId` | Payment Terms Id | Payment Terms Id | ✅ |
| 138 | `shipmentMethodId` | Shipment Method Id | Shipment Method Id | ✅ |
| 139 | `paymentMethodId` | Payment Method Id | Payment Method Id | ✅ |
| 140 | `taxAreaId` | Tax Area ID | Tax Area ID | ✅ |
| 141 | `contactId` | Contact ID | Contact ID | ✅ |
| 142 | `contactGraphId` | Contact Graph Id | Contact Graph Id | ✅ |
| 143 | `creditLimitLcy` | Credit Limit (LCY) | Credit Limit (LCY) | ✅ |
| 144 | `balanceLcy` | Balance (LCY) | Balance (LCY) | 🧮 computed |
| 145 | `netChangeLcy` | Net Change (LCY) | Net Change (LCY) | 🧮 computed |
| 146 | `salesLcy` | Sales (LCY) | Sales (LCY) | 🧮 computed |
| 147 | `profitLcy` | Profit (LCY) | Profit (LCY) | 🧮 computed |
| 148 | `invDiscountsLcy` | Inv. Discounts (LCY) | Inv. Discounts (LCY) | 🧮 computed |
| 149 | `pmtDiscountsLcy` | Pmt. Discounts (LCY) | Pmt. Discounts (LCY) | 🧮 computed |
| 150 | `balanceDueLcy` | Balance Due (LCY) | Overdue Balance (LCY) | 🧮 computed |
| 151 | `paymentsLcy` | Payments (LCY) | Payments (LCY) | 🧮 computed |
| 152 | `invAmountsLcy` | Inv. Amounts (LCY) | Inv. Amounts (LCY) | 🧮 computed |
| 153 | `crMemoAmountsLcy` | Cr. Memo Amounts (LCY) | Cr. Memo Amounts (LCY) | 🧮 computed |
| 154 | `finChargeMemoAmountsLcy` | Fin. Charge Memo Amounts (LCY) | Fin. Charge Memo Amounts (LCY) | 🧮 computed |
| 155 | `debitAmountLcy` | Debit Amount (LCY) | Debit Amount (LCY) | 🧮 computed |
| 156 | `creditAmountLcy` | Credit Amount (LCY) | Credit Amount (LCY) | 🧮 computed |
| 157 | `reminderAmountsLcy` | Reminder Amounts (LCY) | Reminder Amounts (LCY) | 🧮 computed |
| 158 | `outstandingOrdersLcy` | Outstanding Orders (LCY) | Outstanding Orders (LCY) | 🧮 computed |
| 159 | `shippedNotInvoicedLcy` | Shipped Not Invoiced (LCY) | Shipped Not Invoiced (LCY) | 🧮 computed |
| 160 | `pmtDiscToleranceLcy` | Pmt. Disc. Tolerance (LCY) | Pmt. Disc. Tolerance (LCY) | 🧮 computed |
| 161 | `pmtToleranceLcy` | Pmt. Tolerance (LCY) | Pmt. Tolerance (LCY) | 🧮 computed |
| 162 | `refundsLcy` | Refunds (LCY) | Refunds (LCY) | 🧮 computed |
| 163 | `otherAmountsLcy` | Other Amounts (LCY) | Other Amounts (LCY) | 🧮 computed |
| 164 | `outstandingInvoicesLcy` | Outstanding Invoices (LCY) | Outstanding Invoices (LCY) | 🧮 computed |

> **Added in API v3.1:** fields 143–164 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfVendors

**Description:** Vendors — master records for all entities from whom the company purchases goods or services, including payment and posting settings.

| Property | Value |
|---|---|
| **Source Table** | Vendor |
| Page ID | 90843 |
| Page Name | `ocpfVendors` |
| Entity Set Name | `ocpfVendors` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 144 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `searchName` | Search Name | Search Name | ✅ |
| 5 | `name2` | Name 2 | Name 2 | ✅ |
| 6 | `address` | Address | Address | ✅ |
| 7 | `address2` | Address 2 | Address 2 | ✅ |
| 8 | `city` | City | City | ✅ |
| 9 | `contact` | Contact | Contact | ✅ |
| 10 | `phoneNo` | Phone No. | Phone No. | ✅ |
| 11 | `telexNo` | Telex No. | Telex No. | ✅ |
| 12 | `ourAccountNo` | Our Account No. | Our Account No. | ✅ |
| 13 | `territoryCode` | Territory Code | Territory Code | ✅ |
| 14 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 15 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 16 | `budgetedAmount` | Budgeted Amount | Budgeted Amount | ✅ |
| 17 | `vendorPostingGroup` | Vendor Posting Group | Vendor Posting Group | ✅ |
| 18 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 19 | `languageCode` | Language Code | Language Code | ✅ |
| 20 | `registrationNumber` | Registration Number | Registration No. | ✅ |
| 21 | `statisticsGroup` | Statistics Group | Statistics Group | ✅ |
| 22 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 23 | `finChargeTermsCode` | Fin. Charge Terms Code | Fin. Charge Terms Code | ✅ |
| 24 | `purchaserCode` | Purchaser Code | Purchaser Code | ✅ |
| 25 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 26 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 27 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 28 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 29 | `comment` | Comment | Comment | 🧮 computed |
| 30 | `blocked` | Blocked | Blocked | ✅ |
| 31 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | ✅ |
| 32 | `priority` | Priority | Priority | ✅ |
| 33 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 34 | `formatRegion` | Format Region | Format Region | ✅ |
| 35 | `firstTransactionDate` | First Transaction Date | Vendor Since | 🧮 computed |
| 36 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |
| 37 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 38 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 39 | `globalDimension1Filter` | Global Dimension 1 Filter | Global Dimension 1 Filter | 🔍 filter |
| 40 | `globalDimension2Filter` | Global Dimension 2 Filter | Global Dimension 2 Filter | 🔍 filter |
| 41 | `balance` | Balance | Balance | 🧮 computed |
| 42 | `netChange` | Net Change | Net Change | 🧮 computed |
| 43 | `balanceDue` | Balance Due | Balance Due | 🧮 computed |
| 44 | `payments` | Payments | Payments | 🧮 computed |
| 45 | `invoiceAmounts` | Invoice Amounts | Invoice Amounts | 🧮 computed |
| 46 | `crMemoAmounts` | Cr. Memo Amounts | Cr. Memo Amounts | 🧮 computed |
| 47 | `financeChargeMemoAmounts` | Finance Charge Memo Amounts | Finance Charge Memo Amounts | 🧮 computed |
| 48 | `outstandingOrders` | Outstanding Orders | Outstanding Orders | 🧮 computed |
| 49 | `amtRcdNotInvoiced` | Amt. Rcd. Not Invoiced | Amt. Rcd. Not Invoiced | 🧮 computed |
| 50 | `applicationMethod` | Application Method | Application Method | ✅ |
| 51 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 52 | `faxNo` | Fax No. | Fax No. | ✅ |
| 53 | `telexAnswerBack` | Telex Answer Back | Telex Answer Back | ✅ |
| 54 | `vATRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 55 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 56 | `gLN` | GLN | GLN | ✅ |
| 57 | `postCode` | Post Code | Post Code | ✅ |
| 58 | `county` | County | County | ✅ |
| 59 | `eORINumber` | EORI Number | EORI Number | ✅ |
| 60 | `debitAmount` | Debit Amount | Debit Amount | 🧮 computed |
| 61 | `creditAmount` | Credit Amount | Credit Amount | 🧮 computed |
| 62 | `eMail` | E-Mail | Email | ✅ |
| 63 | `homePage` | Home Page | Home Page | ✅ |
| 64 | `reminderAmounts` | Reminder Amounts | Reminder Amounts | 🧮 computed |
| 65 | `noSeries` | No. Series | No. Series | ✅ |
| 66 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 67 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 68 | `vATBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 69 | `currencyFilter` | Currency Filter | Currency Filter | 🔍 filter |
| 70 | `blockPaymentTolerance` | Block Payment Tolerance | Block Payment Tolerance | ✅ |
| 71 | `iCPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 72 | `refunds` | Refunds | Refunds | 🧮 computed |
| 73 | `otherAmounts` | Other Amounts | Other Amounts | 🧮 computed |
| 74 | `prepayment` | Prepayment % | Prepayment % | ✅ |
| 75 | `outstandingInvoices` | Outstanding Invoices | Outstanding Invoices | 🧮 computed |
| 76 | `payToNoOfArchivedDoc` | Pay-to No. Of Archived Doc. | Pay-to No. Of Archived Doc. | 🧮 computed |
| 77 | `buyFromNoOfArchivedDoc` | Buy-from No. Of Archived Doc. | Buy-from No. Of Archived Doc. | 🧮 computed |
| 78 | `partnerType` | Partner Type | Partner Type | ✅ |
| 79 | `intrastatPartnerType` | Intrastat Partner Type | Intrastat Partner Type | ✅ |
| 80 | `excludeFromPmtPractices` | Exclude from Pmt. Practices | Exclude from Payment Practices | ✅ |
| 81 | `companySizeCode` | Company Size Code | Company Size Code | ✅ |
| 82 | `image` | Image | Image | ✅ |
| 83 | `privacyBlocked` | Privacy Blocked | Privacy Blocked | ✅ |
| 84 | `disableSearchByName` | Disable Search by Name | Disable Search by Name | ✅ |
| 85 | `creditorNo` | Creditor No. | Creditor No. | ✅ |
| 86 | `allowMultiplePostingGroups` | Allow Multiple Posting Groups | Allow Multiple Posting Groups | ✅ |
| 87 | `preferredBankAccountCode` | Preferred Bank Account Code | Preferred Bank Account Code | ✅ |
| 88 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dataverse | 🧮 computed |
| 89 | `cashFlowPaymentTermsCode` | Cash Flow Payment Terms Code | Cash Flow Payment Terms Code | ✅ |
| 90 | `primaryContactNo` | Primary Contact No. | Primary Contact No. | ✅ |
| 91 | `mobilePhoneNo` | Mobile Phone No. | Mobile Phone No. | ✅ |
| 92 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 93 | `locationCode` | Location Code | Location Code | ✅ |
| 94 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 95 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 96 | `noOfPstdReceipts` | No. of Pstd. Receipts | No. of Pstd. Receipts | 🧮 computed |
| 97 | `noOfPstdInvoices` | No. of Pstd. Invoices | No. of Pstd. Invoices | 🧮 computed |
| 98 | `noOfPstdReturnShipments` | No. of Pstd. Return Shipments | No. of Pstd. Return Shipments | 🧮 computed |
| 99 | `noOfPstdCreditMemos` | No. of Pstd. Credit Memos | No. of Pstd. Credit Memos | 🧮 computed |
| 100 | `payToNoOfOrders` | Pay-to No. of Orders | Pay-to No. of Orders | 🧮 computed |
| 101 | `payToNoOfInvoices` | Pay-to No. of Invoices | Pay-to No. of Invoices | 🧮 computed |
| 102 | `payToNoOfReturnOrders` | Pay-to No. of Return Orders | Pay-to No. of Return Orders | 🧮 computed |
| 103 | `payToNoOfCreditMemos` | Pay-to No. of Credit Memos | Pay-to No. of Credit Memos | 🧮 computed |
| 104 | `payToNoOfPstdReceipts` | Pay-to No. of Pstd. Receipts | Pay-to No. of Pstd. Receipts | 🧮 computed |
| 105 | `payToNoOfPstdInvoices` | Pay-to No. of Pstd. Invoices | Pay-to No. of Pstd. Invoices | 🧮 computed |
| 106 | `payToNoOfPstdReturnS` | Pay-to No. of Pstd. Return S. | Pay-to No. of Pstd. Return S. | 🧮 computed |
| 107 | `payToNoOfPstdCrMemos` | Pay-to No. of Pstd. Cr. Memos | Pay-to No. of Pstd. Cr. Memos | 🧮 computed |
| 108 | `noOfQuotes` | No. of Quotes | No. of Quotes | 🧮 computed |
| 109 | `noOfBlanketOrders` | No. of Blanket Orders | No. of Blanket Orders | 🧮 computed |
| 110 | `noOfOrders` | No. of Orders | No. of Orders | 🧮 computed |
| 111 | `noOfInvoices` | No. of Invoices | No. of Invoices | 🧮 computed |
| 112 | `noOfReturnOrders` | No. of Return Orders | No. of Return Orders | 🧮 computed |
| 113 | `noOfCreditMemos` | No. of Credit Memos | No. of Credit Memos | 🧮 computed |
| 114 | `noOfOrderAddresses` | No. of Order Addresses | No. of Order Addresses | 🧮 computed |
| 115 | `payToNoOfQuotes` | Pay-to No. of Quotes | Pay-to No. of Quotes | 🧮 computed |
| 116 | `payToNoOfBlanketOrders` | Pay-to No. of Blanket Orders | Pay-to No. of Blanket Orders | 🧮 computed |
| 117 | `noOfIncomingDocuments` | No. of Incoming Documents | No. of Incoming Documents | 🧮 computed |
| 118 | `baseCalendarCode` | Base Calendar Code | Base Calendar Code | ✅ |
| 119 | `documentSendingProfile` | Document Sending Profile | Document Sending Profile | ✅ |
| 120 | `validateEuVatRegNo` | Validate EU Vat Reg. No. | Validate EU VAT Reg. No. | ✅ |
| 121 | `currencyId` | Currency Id | Currency Id | ✅ |
| 122 | `paymentTermsId` | Payment Terms Id | Payment Terms Id | ✅ |
| 123 | `paymentMethodId` | Payment Method Id | Payment Method Id | ✅ |
| 124 | `overReceiptCode` | Over-Receipt Code | Over-Receipt Code | ✅ |
| 125 | `balanceLcy` | Balance (LCY) | Balance (LCY) | 🧮 computed |
| 126 | `netChangeLcy` | Net Change (LCY) | Net Change (LCY) | 🧮 computed |
| 127 | `purchasesLcy` | Purchases (LCY) | Purchases (LCY) | 🧮 computed |
| 128 | `invDiscountsLcy` | Inv. Discounts (LCY) | Inv. Discounts (LCY) | 🧮 computed |
| 129 | `pmtDiscountsLcy` | Pmt. Discounts (LCY) | Pmt. Discounts (LCY) | 🧮 computed |
| 130 | `balanceDueLcy` | Balance Due (LCY) | Balance Due (LCY) | 🧮 computed |
| 131 | `paymentsLcy` | Payments (LCY) | Payments (LCY) | 🧮 computed |
| 132 | `invAmountsLcy` | Inv. Amounts (LCY) | Inv. Amounts (LCY) | 🧮 computed |
| 133 | `crMemoAmountsLcy` | Cr. Memo Amounts (LCY) | Cr. Memo Amounts (LCY) | 🧮 computed |
| 134 | `finChargeMemoAmountsLcy` | Fin. Charge Memo Amounts (LCY) | Fin. Charge Memo Amounts (LCY) | 🧮 computed |
| 135 | `debitAmountLcy` | Debit Amount (LCY) | Debit Amount (LCY) | 🧮 computed |
| 136 | `creditAmountLcy` | Credit Amount (LCY) | Credit Amount (LCY) | 🧮 computed |
| 137 | `reminderAmountsLcy` | Reminder Amounts (LCY) | Reminder Amounts (LCY) | 🧮 computed |
| 138 | `outstandingOrdersLcy` | Outstanding Orders (LCY) | Outstanding Orders (LCY) | 🧮 computed |
| 139 | `amtRcdNotInvoicedLcy` | Amt. Rcd. Not Invoiced (LCY) | Amt. Rcd. Not Invoiced (LCY) | 🧮 computed |
| 140 | `pmtDiscToleranceLcy` | Pmt. Disc. Tolerance (LCY) | Pmt. Disc. Tolerance (LCY) | 🧮 computed |
| 141 | `pmtToleranceLcy` | Pmt. Tolerance (LCY) | Pmt. Tolerance (LCY) | 🧮 computed |
| 142 | `refundsLcy` | Refunds (LCY) | Refunds (LCY) | 🧮 computed |
| 143 | `otherAmountsLcy` | Other Amounts (LCY) | Other Amounts (LCY) | 🧮 computed |
| 144 | `outstandingInvoicesLcy` | Outstanding Invoices (LCY) | Outstanding Invoices (LCY) | 🧮 computed |

> **Added in API v3.1:** fields 125–144 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfContacts

**Description:** Contacts — individuals and companies in the CRM module, linked to customers, vendors, or standalone for prospecting.

| Property | Value |
|---|---|
| **Source Table** | Contact |
| Page ID | 90844 |
| Page Name | `ocpfContacts` |
| Entity Set Name | `ocpfContacts` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 86 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `searchName` | Search Name | Search Name | ✅ |
| 5 | `name2` | Name 2 | Name 2 | ✅ |
| 6 | `address` | Address | Address | ✅ |
| 7 | `address2` | Address 2 | Address 2 | ✅ |
| 8 | `city` | City | City | ✅ |
| 9 | `phoneNo` | Phone No. | Phone No. | ✅ |
| 10 | `telexNo` | Telex No. | Telex No. | ✅ |
| 11 | `territoryCode` | Territory Code | Territory Code | ✅ |
| 12 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 13 | `languageCode` | Language Code | Language Code | ✅ |
| 14 | `registrationNumber` | Registration Number | Registration No. | ✅ |
| 15 | `salespersonCode` | Salesperson Code | Salesperson Code | ✅ |
| 16 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 17 | `comment` | Comment | Comment | 🧮 computed |
| 18 | `formatRegion` | Format Region | Format Region | ✅ |
| 19 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 20 | `faxNo` | Fax No. | Fax No. | ✅ |
| 21 | `telexAnswerBack` | Telex Answer Back | Telex Answer Back | ✅ |
| 22 | `vATRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 23 | `postCode` | Post Code | Post Code | ✅ |
| 24 | `county` | County | County | ✅ |
| 25 | `eMail` | E-Mail | Email | ✅ |
| 26 | `homePage` | Home Page | Home Page | ✅ |
| 27 | `noSeries` | No. Series | No. Series | ✅ |
| 28 | `image` | Image | Image | ✅ |
| 29 | `privacyBlocked` | Privacy Blocked | Privacy Blocked | ✅ |
| 30 | `minor` | Minor | Minor | ✅ |
| 31 | `parentalConsentReceived` | Parental Consent Received | Parental Consent Received | ✅ |
| 32 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dataverse | 🧮 computed |
| 33 | `type` | Type | Type | ✅ |
| 34 | `companyNo` | Company No. | Company No. | ✅ |
| 35 | `companyName` | Company Name | Company Name | ✅ |
| 36 | `lookupContactNo` | Lookup Contact No. | Lookup Contact No. | ✅ |
| 37 | `firstName` | First Name | First Name | ✅ |
| 38 | `middleName` | Middle Name | Middle Name | ✅ |
| 39 | `surname` | Surname | Surname | ✅ |
| 40 | `jobTitle` | Job Title | Job Title | ✅ |
| 41 | `initials` | Initials | Initials | ✅ |
| 42 | `extensionNo` | Extension No. | Extension No. | ✅ |
| 43 | `mobilePhoneNo` | Mobile Phone No. | Mobile Phone No. | ✅ |
| 44 | `pager` | Pager | Pager | ✅ |
| 45 | `organizationalLevelCode` | Organizational Level Code | Organizational Level Code | ✅ |
| 46 | `excludeFromSegment` | Exclude from Segment | Exclude from Segment | ✅ |
| 47 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 48 | `nextTaskDate` | Next Task Date | Next Task Date | 🧮 computed |
| 49 | `lastDateAttempted` | Last Date Attempted | Last Date Attempted | 🧮 computed |
| 50 | `dateOfLastInteraction` | Date of Last Interaction | Date of Last Interaction | 🧮 computed |
| 51 | `noOfJobResponsibilities` | No. of Job Responsibilities | No. of Job Responsibilities | 🧮 computed |
| 52 | `noOfIndustryGroups` | No. of Industry Groups | No. of Industry Groups | 🧮 computed |
| 53 | `noOfBusinessRelations` | No. of Business Relations | No. of Business Relations | 🧮 computed |
| 54 | `noOfMailingGroups` | No. of Mailing Groups | No. of Mailing Groups | 🧮 computed |
| 55 | `externalId` | External ID | External ID | ✅ |
| 56 | `noOfInteractions` | No. of Interactions | No. of Interactions | 🧮 computed |
| 57 | `noOfOpportunities` | No. of Opportunities | No. of Opportunities | 🧮 computed |
| 58 | `opportunityEntryExists` | Opportunity Entry Exists | Opportunity Entry Exists | 🧮 computed |
| 59 | `taskEntryExists` | Task Entry Exists | Task Entry Exists | 🧮 computed |
| 60 | `salespersonFilter` | Salesperson Filter | Salesperson Filter | 🔍 filter |
| 61 | `campaignFilter` | Campaign Filter | Campaign Filter | 🔍 filter |
| 62 | `contactBusinessRelation` | Contact Business Relation | Contact Business Relation | ✅ |
| 63 | `actionTakenFilter` | Action Taken Filter | Action Taken Filter | 🔍 filter |
| 64 | `salesCycleFilter` | Sales Cycle Filter | Sales Cycle Filter | 🔍 filter |
| 65 | `salesCycleStageFilter` | Sales Cycle Stage Filter | Sales Cycle Stage Filter | 🔍 filter |
| 66 | `probabilityFilter` | Probability % Filter | Probability % Filter | 🔍 filter |
| 67 | `completedFilter` | Completed % Filter | Completed % Filter | 🔍 filter |
| 68 | `estimatedValueFilter` | Estimated Value Filter | Estimated Value Filter | 🔍 filter |
| 69 | `calcdCurrentValueFilter` | Calcd. Current Value Filter | Calcd. Current Value Filter | 🔍 filter |
| 70 | `chancesOfSuccessFilter` | Chances of Success % Filter | Chances of Success % Filter | 🔍 filter |
| 71 | `taskStatusFilter` | Task Status Filter | Task Status Filter | 🔍 filter |
| 72 | `taskClosedFilter` | Task Closed Filter | Task Closed Filter | 🔍 filter |
| 73 | `priorityFilter` | Priority Filter | Priority Filter | 🔍 filter |
| 74 | `teamFilter` | Team Filter | Team Filter | 🔍 filter |
| 75 | `closeOpportunityFilter` | Close Opportunity Filter | Close Opportunity Filter | 🔍 filter |
| 76 | `correspondenceType` | Correspondence Type | Correspondence Type | ✅ |
| 77 | `salutationCode` | Salutation Code | Salutation Code | ✅ |
| 78 | `searchEMail` | Search E-Mail | Search Email | ✅ |
| 79 | `lastTimeModified` | Last Time Modified | Last Time Modified | ✅ |
| 80 | `eMail2` | E-Mail 2 | Email 2 | ✅ |
| 81 | `jobResponsibilityFilter` | Job Responsibility Filter | Job Responsibility Filter | 🔍 filter |
| 82 | `xrmId` | Xrm Id | Xrm Id | ✅ |
| 83 | `costLcy` | Cost (LCY) | Cost (LCY) | 🧮 computed |
| 84 | `durationMin` | Duration (Min.) | Duration (Min.) | 🧮 computed |
| 85 | `estimatedValueLcy` | Estimated Value (LCY) | Estimated Value (LCY) | 🧮 computed |
| 86 | `calcdCurrentValueLcy` | Calcd. Current Value (LCY) | Calcd. Current Value (LCY) | 🧮 computed |

> **Added in API v3.1:** fields 83–86 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfContactBusinessRelations

**Description:** Contact Business Relations — links between contacts and their associated business entities such as customers, vendors, or bank accounts.

| Property | Value |
|---|---|
| **Source Table** | Contact Business Relation |
| Page ID | 90845 |
| Page Name | `ocpfContactBusinessRelations` |
| Entity Set Name | `ocpfContactBusinessRelations` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 7 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `contactNo` | Contact No. | Contact No. | ✅ |
| 3 | `businessRelationCode` | Business Relation Code | Business Relation Code | ✅ |
| 4 | `linkToTable` | Link to Table | Link to Table | ✅ |
| 5 | `no` | No. | No. | ✅ |
| 6 | `businessRelationDescription` | Business Relation Description | Business Relation Description | 🧮 computed |
| 7 | `contactName` | Contact Name | Contact Name | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfItems

**Description:** Items — master records for all inventory items, non-inventory items, and services bought or sold by the company.

| Property | Value |
|---|---|
| **Source Table** | Item |
| Page ID | 90846 |
| Page Name | `ocpfItems` |
| Entity Set Name | `ocpfItems` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 204 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `no2` | No. 2 | No. 2 | ✅ |
| 4 | `description` | Description | Description | ✅ |
| 5 | `searchDescription` | Search Description | Search Description | ✅ |
| 6 | `description2` | Description 2 | Description 2 | ✅ |
| 7 | `assemblyBom` | Assembly BOM | Assembly BOM | 🧮 computed |
| 8 | `baseUnitOfMeasure` | Base Unit of Measure | Base Unit of Measure | ✅ |
| 9 | `priceUnitConversion` | Price Unit Conversion | Price Unit Conversion | ✅ |
| 10 | `type` | Type | Type | ✅ |
| 11 | `inventoryPostingGroup` | Inventory Posting Group | Inventory Posting Group | ✅ |
| 12 | `shelfNo` | Shelf No. | Shelf No. | ✅ |
| 13 | `itemDiscGroup` | Item Disc. Group | Item Disc. Group | ✅ |
| 14 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 15 | `statisticsGroup` | Statistics Group | Statistics Group | ✅ |
| 16 | `commissionGroup` | Commission Group | Commission Group | ✅ |
| 17 | `unitPrice` | Unit Price | Unit Price | ✅ |
| 18 | `priceProfitCalculation` | Price/Profit Calculation | Price/Profit Calculation | ✅ |
| 19 | `profit` | Profit % | Profit % | ✅ |
| 20 | `costingMethod` | Costing Method | Costing Method | ✅ |
| 21 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 22 | `standardCost` | Standard Cost | Standard Cost | ✅ |
| 23 | `lastDirectCost` | Last Direct Cost | Last Direct Cost | ✅ |
| 24 | `indirectCost` | Indirect Cost % | Indirect Cost % | ✅ |
| 25 | `costIsAdjusted` | Cost is Adjusted | Cost is Adjusted | ✅ |
| 26 | `allowOnlineAdjustment` | Allow Online Adjustment | Allow Online Adjustment | ✅ |
| 27 | `vendorNo` | Vendor No. | Vendor No. | ✅ |
| 28 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | ✅ |
| 29 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 30 | `reorderPoint` | Reorder Point | Reorder Point | ✅ |
| 31 | `maximumInventory` | Maximum Inventory | Maximum Inventory | ✅ |
| 32 | `reorderQuantity` | Reorder Quantity | Reorder Quantity | ✅ |
| 33 | `alternativeItemNo` | Alternative Item No. | Alternative Item No. | ✅ |
| 34 | `unitListPrice` | Unit List Price | Unit List Price | ✅ |
| 35 | `dutyDue` | Duty Due % | Duty Due % | ✅ |
| 36 | `dutyCode` | Duty Code | Duty Code | ✅ |
| 37 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 38 | `netWeight` | Net Weight | Net Weight | ✅ |
| 39 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 40 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 41 | `durability` | Durability | Durability | ✅ |
| 42 | `freightType` | Freight Type | Freight Type | ✅ |
| 43 | `tariffNo` | Tariff No. | Tariff No. | ✅ |
| 44 | `dutyUnitConversion` | Duty Unit Conversion | Duty Unit Conversion | ✅ |
| 45 | `countryRegionPurchasedCode` | Country/Region Purchased Code | Country/Region Purchased Code | ✅ |
| 46 | `budgetQuantity` | Budget Quantity | Budget Quantity | ✅ |
| 47 | `budgetedAmount` | Budgeted Amount | Budgeted Amount | ✅ |
| 48 | `budgetProfit` | Budget Profit | Budget Profit | ✅ |
| 49 | `comment` | Comment | Comment | 🧮 computed |
| 50 | `blocked` | Blocked | Blocked | ✅ |
| 51 | `costIsPostedToGL` | Cost is Posted to G/L | Cost is Posted to G/L | 🧮 computed |
| 52 | `blockReason` | Block Reason | Block Reason | ✅ |
| 53 | `lastDatetimeModified` | Last DateTime Modified | Last DateTime Modified | ✅ |
| 54 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 55 | `lastTimeModified` | Last Time Modified | Last Time Modified | ✅ |
| 56 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 57 | `globalDimension1Filter` | Global Dimension 1 Filter | Global Dimension 1 Filter | 🔍 filter |
| 58 | `globalDimension2Filter` | Global Dimension 2 Filter | Global Dimension 2 Filter | 🔍 filter |
| 59 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 60 | `inventory` | Inventory | Inventory | 🧮 computed |
| 61 | `netInvoicedQty` | Net Invoiced Qty. | Net Invoiced Qty. | 🧮 computed |
| 62 | `netChange` | Net Change | Net Change | 🧮 computed |
| 63 | `qtyOnPurchOrder` | Qty. on Purch. Order | Qty. on Purch. Order | 🧮 computed |
| 64 | `qtyOnSalesOrder` | Qty. on Sales Order | Qty. on Sales Order | 🧮 computed |
| 65 | `priceIncludesVat` | Price Includes VAT | Price Includes VAT | ✅ |
| 66 | `dropShipmentFilter` | Drop Shipment Filter | Drop Shipment Filter | 🔍 filter |
| 67 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 68 | `picture` | Picture | Picture | ✅ |
| 69 | `countryRegionOfOriginCode` | Country/Region of Origin Code | Country/Region of Origin Code | ✅ |
| 70 | `automaticExtTexts` | Automatic Ext. Texts | Automatic Ext. Texts | ✅ |
| 71 | `noSeries` | No. Series | No. Series | ✅ |
| 72 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 73 | `vATProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 74 | `reserve` | Reserve | Reserve | ✅ |
| 75 | `reservedQtyOnInventory` | Reserved Qty. on Inventory | Reserved Qty. on Inventory | 🧮 computed |
| 76 | `reservedQtyOnPurchOrders` | Reserved Qty. on Purch. Orders | Reserved Qty. on Purch. Orders | 🧮 computed |
| 77 | `reservedQtyOnSalesOrders` | Reserved Qty. on Sales Orders | Reserved Qty. on Sales Orders | 🧮 computed |
| 78 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 79 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 80 | `resQtyOnOutboundTransfer` | Res. Qty. on Outbound Transfer | Res. Qty. on Outbound Transfer | 🧮 computed |
| 81 | `resQtyOnInboundTransfer` | Res. Qty. on Inbound Transfer | Res. Qty. on Inbound Transfer | 🧮 computed |
| 82 | `resQtyOnSalesReturns` | Res. Qty. on Sales Returns | Res. Qty. on Sales Returns | 🧮 computed |
| 83 | `resQtyOnPurchReturns` | Res. Qty. on Purch. Returns | Res. Qty. on Purch. Returns | 🧮 computed |
| 84 | `stockoutWarning` | Stockout Warning | Stockout Warning | ✅ |
| 85 | `preventNegativeInventory` | Prevent Negative Inventory | Prevent Negative Inventory | ✅ |
| 86 | `variantMandatoryIfExists` | Variant Mandatory if Exists | Variant Mandatory if Exists | ✅ |
| 87 | `applicationWkshUserId` | Application Wksh. User ID | Application Wksh. User ID | ✅ |
| 88 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dynamics 365 Sales | 🧮 computed |
| 89 | `assemblyPolicy` | Assembly Policy | Assembly Policy | ✅ |
| 90 | `qtyOnJobOrder` | Qty. on Job Order | Qty. on Project Order | 🧮 computed |
| 91 | `resQtyOnJobOrder` | Res. Qty. on Job Order | Res. Qty. on Project Order | 🧮 computed |
| 92 | `gTIN` | GTIN | GTIN | ✅ |
| 93 | `defaultDeferralTemplateCode` | Default Deferral Template Code | Default Deferral Template Code | ✅ |
| 94 | `lowLevelCode` | Low-Level Code | Low-Level Code | ✅ |
| 95 | `lotSize` | Lot Size | Lot Size | ✅ |
| 96 | `serialNos` | Serial Nos. | Serial Nos. | ✅ |
| 97 | `lastUnitCostCalcDate` | Last Unit Cost Calc. Date | Last Unit Cost Calc. Date | ✅ |
| 98 | `rolledUpMaterialCost` | Rolled-up Material Cost | Rolled-up Material Cost | ✅ |
| 99 | `rolledUpCapacityCost` | Rolled-up Capacity Cost | Rolled-up Capacity Cost | ✅ |
| 100 | `scrap` | Scrap % | Scrap % | ✅ |
| 101 | `rolledUpMatNonInvtCost` | Rolled-up Mat. Non-Invt. Cost | Rolled-up Material Non-Inventory Cost | ✅ |
| 102 | `inventoryValueZero` | Inventory Value Zero | Inventory Value Zero | ✅ |
| 103 | `discreteOrderQuantity` | Discrete Order Quantity | Discrete Order Quantity | ✅ |
| 104 | `minimumOrderQuantity` | Minimum Order Quantity | Minimum Order Quantity | ✅ |
| 105 | `maximumOrderQuantity` | Maximum Order Quantity | Maximum Order Quantity | ✅ |
| 106 | `safetyStockQuantity` | Safety Stock Quantity | Safety Stock Quantity | ✅ |
| 107 | `orderMultiple` | Order Multiple | Order Multiple | ✅ |
| 108 | `safetyLeadTime` | Safety Lead Time | Safety Lead Time | ✅ |
| 109 | `flushingMethod` | Flushing Method | Flushing Method | ✅ |
| 110 | `replenishmentSystem` | Replenishment System | Replenishment System | ✅ |
| 111 | `roundingPrecision` | Rounding Precision | Rounding Precision | ✅ |
| 112 | `binFilter` | Bin Filter | Bin Filter | 🔍 filter |
| 113 | `variantFilter` | Variant Filter | Variant Filter | 🔍 filter |
| 114 | `salesUnitOfMeasure` | Sales Unit of Measure | Sales Unit of Measure | ✅ |
| 115 | `purchUnitOfMeasure` | Purch. Unit of Measure | Purch. Unit of Measure | ✅ |
| 116 | `unitOfMeasureFilter` | Unit of Measure Filter | Unit of Measure Filter | 🔍 filter |
| 117 | `timeBucket` | Time Bucket | Time Bucket | ✅ |
| 118 | `resQtyOnReqLine` | Res. Qty. on Req. Line | Res. Qty. on Req. Line | 🧮 computed |
| 119 | `reorderingPolicy` | Reordering Policy | Reordering Policy | ✅ |
| 120 | `includeInventory` | Include Inventory | Include Inventory | ✅ |
| 121 | `manufacturingPolicy` | Manufacturing Policy | Manufacturing Policy | ✅ |
| 122 | `reschedulingPeriod` | Rescheduling Period | Rescheduling Period | ✅ |
| 123 | `lotAccumulationPeriod` | Lot Accumulation Period | Lot Accumulation Period | ✅ |
| 124 | `dampenerPeriod` | Dampener Period | Dampener Period | ✅ |
| 125 | `dampenerQuantity` | Dampener Quantity | Dampener Quantity | ✅ |
| 126 | `overflowLevel` | Overflow Level | Overflow Level | ✅ |
| 127 | `stockkeepingUnitExists` | Stockkeeping Unit Exists | Stockkeeping Unit Exists | 🧮 computed |
| 128 | `manufacturerCode` | Manufacturer Code | Manufacturer Code | ✅ |
| 129 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 130 | `createdFromNonstockItem` | Created From Nonstock Item | Created From Catalog Item | ✅ |
| 131 | `substitutesExist` | Substitutes Exist | Substitutes Exist | 🧮 computed |
| 132 | `qtyInTransit` | Qty. in Transit | Qty. in Transit | 🧮 computed |
| 133 | `purchasingCode` | Purchasing Code | Purchasing Code | ✅ |
| 134 | `qtyAssignedToShip` | Qty. Assigned to ship | Qty. Assigned to ship | 🧮 computed |
| 135 | `qtyPicked` | Qty. Picked | Qty. Picked | 🧮 computed |
| 136 | `excludedFromCostAdjustment` | Excluded from Cost Adjustment | Excluded from Cost Adjustment | ✅ |
| 137 | `itemTrackingCode` | Item Tracking Code | Item Tracking Code | ✅ |
| 138 | `lotNos` | Lot Nos. | Lot Nos. | ✅ |
| 139 | `expirationCalculation` | Expiration Calculation | Expiration Calculation | ✅ |
| 140 | `lotNoFilter` | Lot No. Filter | Lot No. Filter | 🔍 filter |
| 141 | `serialNoFilter` | Serial No. Filter | Serial No. Filter | 🔍 filter |
| 142 | `packageNoFilter` | Package No. Filter | Package No. Filter | 🔍 filter |
| 143 | `qtyOnPurchReturn` | Qty. on Purch. Return | Qty. on Purch. Return | 🧮 computed |
| 144 | `qtyOnSalesReturn` | Qty. on Sales Return | Qty. on Sales Return | 🧮 computed |
| 145 | `noOfSubstitutes` | No. of Substitutes | No. of Substitutes | 🧮 computed |
| 146 | `warehouseClassCode` | Warehouse Class Code | Warehouse Class Code | ✅ |
| 147 | `specialEquipmentCode` | Special Equipment Code | Special Equipment Code | ✅ |
| 148 | `putAwayTemplateCode` | Put-away Template Code | Put-away Template Code | ✅ |
| 149 | `putAwayUnitOfMeasureCode` | Put-away Unit of Measure Code | Put-away Unit of Measure Code | ✅ |
| 150 | `physInvtCountingPeriodCode` | Phys Invt Counting Period Code | Phys Invt Counting Period Code | ✅ |
| 151 | `lastCountingPeriodUpdate` | Last Counting Period Update | Last Counting Period Update | ✅ |
| 152 | `lastPhysInvtDate` | Last Phys. Invt. Date | Last Phys. Invt. Date | 🧮 computed |
| 153 | `useCrossDocking` | Use Cross-Docking | Use Cross-Docking | ✅ |
| 154 | `nextCountingStartDate` | Next Counting Start Date | Next Counting Start Date | ✅ |
| 155 | `nextCountingEndDate` | Next Counting End Date | Next Counting End Date | ✅ |
| 156 | `unitGroupExists` | Unit Group Exists | Unit Group Exists | 🧮 computed |
| 157 | `identifierCode` | Identifier Code | Identifier Code | 🧮 computed |
| 158 | `unitOfMeasureId` | Unit of Measure Id | Unit of Measure Id | ✅ |
| 159 | `taxGroupId` | Tax Group Id | Tax Group Id | ✅ |
| 160 | `salesBlocked` | Sales Blocked | Sales Blocked | ✅ |
| 161 | `purchasingBlocked` | Purchasing Blocked | Purchasing Blocked | ✅ |
| 162 | `itemCategoryId` | Item Category Id | Item Category Id | ✅ |
| 163 | `inventoryPostingGroupId` | Inventory Posting Group Id | Inventory Posting Group Id | ✅ |
| 164 | `genProdPostingGroupId` | Gen. Prod. Posting Group Id | Gen. Prod. Posting Group Id | ✅ |
| 165 | `serviceBlocked` | Service Blocked | Service Blocked | ✅ |
| 166 | `overReceiptCode` | Over-Receipt Code | Over-Receipt Code | ✅ |
| 167 | `singleLevelMaterialCost` | Single-Level Material Cost | Single-Level Material Cost | ✅ |
| 168 | `singleLevelCapacityCost` | Single-Level Capacity Cost | Single-Level Capacity Cost | ✅ |
| 169 | `singleLevelSubcontrdCost` | Single-Level Subcontrd. Cost | Single-Level Subcontrd. Cost | ✅ |
| 170 | `singleLevelCapOvhdCost` | Single-Level Cap. Ovhd Cost | Single-Level Cap. Ovhd Cost | ✅ |
| 171 | `singleLevelMfgOvhdCost` | Single-Level Mfg. Ovhd Cost | Single-Level Mfg. Ovhd Cost | ✅ |
| 172 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |
| 173 | `rolledUpSubcontractedCost` | Rolled-up Subcontracted Cost | Rolled-up Subcontracted Cost | ✅ |
| 174 | `rolledUpMfgOvhdCost` | Rolled-up Mfg. Ovhd Cost | Rolled-up Mfg. Ovhd Cost | ✅ |
| 175 | `rolledUpCapOverheadCost` | Rolled-up Cap. Overhead Cost | Rolled-up Cap. Overhead Cost | ✅ |
| 176 | `orderTrackingPolicy` | Order Tracking Policy | Order Tracking Policy | ✅ |
| 177 | `productionForecastName` | Production Forecast Name | Production Forecast Name | 🔍 filter |
| 178 | `componentForecast` | Component Forecast | Component Forecast | 🔍 filter |
| 179 | `critical` | Critical | Critical | ✅ |
| 180 | `singleLvlMatNonInvtCost` | Single-Lvl Mat. Non-Invt. Cost | Single-Level Material Non-Inventory Cost | ✅ |
| 181 | `allowWhseOverpick` | Allow Whse. Overpick | Allow Whse. Overpick | ✅ |
| 182 | `commonItemNo` | Common Item No. | Common Item No. | ✅ |
| 183 | `purchasesQty` | Purchases (Qty.) | Purchases (Qty.) | 🧮 computed |
| 184 | `salesQty` | Sales (Qty.) | Sales (Qty.) | 🧮 computed |
| 185 | `positiveAdjmtQty` | Positive Adjmt. (Qty.) | Positive Adjmt. (Qty.) | 🧮 computed |
| 186 | `negativeAdjmtQty` | Negative Adjmt. (Qty.) | Negative Adjmt. (Qty.) | 🧮 computed |
| 187 | `purchasesLcy` | Purchases (LCY) | Purchases (LCY) | 🧮 computed |
| 188 | `salesLcy` | Sales (LCY) | Sales (LCY) | 🧮 computed |
| 189 | `positiveAdjmtLcy` | Positive Adjmt. (LCY) | Positive Adjmt. (LCY) | 🧮 computed |
| 190 | `negativeAdjmtLcy` | Negative Adjmt. (LCY) | Negative Adjmt. (LCY) | 🧮 computed |
| 191 | `cogsLcy` | COGS (LCY) | COGS (LCY) | 🧮 computed |
| 192 | `vatBusPostingGrPrice` | VAT Bus. Posting Gr. (Price) | VAT Bus. Posting Gr. (Price) | ✅ |
| 193 | `transferredQty` | Transferred (Qty.) | Transferred (Qty.) | 🧮 computed |
| 194 | `transferredLcy` | Transferred (LCY) | Transferred (LCY) | 🧮 computed |
| 195 | `planningTransferShipQty` | Planning Transfer Ship. (Qty). | Planning Transfer Ship. (Qty). | 🧮 computed |
| 196 | `planningWorksheetQty` | Planning Worksheet (Qty.) | Planning Worksheet (Qty.) | 🧮 computed |
| 197 | `transOrdReceiptQty` | Trans. Ord. Receipt (Qty.) | Trans. Ord. Receipt (Qty.) | 🧮 computed |
| 198 | `transOrdShipmentQty` | Trans. Ord. Shipment (Qty.) | Trans. Ord. Shipment (Qty.) | 🧮 computed |
| 199 | `planningIssuesQty` | Planning Issues (Qty.) | Planning Issues (Qty.) | 🧮 computed |
| 200 | `planningReceiptQty` | Planning Receipt (Qty.) | Planning Receipt (Qty.) | 🧮 computed |
| 201 | `planningReleaseQty` | Planning Release (Qty.) | Planning Release (Qty.) | 🧮 computed |
| 202 | `purchReqReceiptQty` | Purch. Req. Receipt (Qty.) | Purch. Req. Receipt (Qty.) | 🧮 computed |
| 203 | `purchReqReleaseQty` | Purch. Req. Release (Qty.) | Purch. Req. Release (Qty.) | 🧮 computed |
| 204 | `prodForecastQuantityBase` | Prod. Forecast Quantity (Base) | Prod. Forecast Quantity (Base) | 🧮 computed |

> **Added in API v3.1:** fields 183–204 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfItemLedgerEntries

**Description:** Item Ledger Entries — posted inventory transactions recording every inbound and outbound movement of items across all locations.

| Property | Value |
|---|---|
| **Source Table** | Item Ledger Entry |
| Page ID | 90847 |
| Page Name | `ocpfItemLedgerEntries` |
| Entity Set Name | `ocpfItemLedgerEntries` |
| API Group | `ocpf_masterData` |
| Editable | ❌ No (GET only) |
| Field Count | 86 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `itemNo` | Item No. | Item No. | — |
| 4 | `postingDate` | Posting Date | Posting Date | — |
| 5 | `entryType` | Entry Type | Entry Type | — |
| 6 | `sourceNo` | Source No. | Source No. | — |
| 7 | `documentNo` | Document No. | Document No. | — |
| 8 | `description` | Description | Description | — |
| 9 | `locationCode` | Location Code | Location Code | — |
| 10 | `quantity` | Quantity | Quantity | — |
| 11 | `remainingQuantity` | Remaining Quantity | Remaining Quantity | — |
| 12 | `invoicedQuantity` | Invoiced Quantity | Invoiced Quantity | — |
| 13 | `itemRegisterNo` | Item Register No. | Item Register No. | — |
| 14 | `sIFTBucketNo` | SIFT Bucket No. | SIFT Bucket No. | — |
| 15 | `appliesToEntry` | Applies-to Entry | Applies-to Entry | — |
| 16 | `open` | Open | Open | — |
| 17 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 18 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 19 | `positive` | Positive | Positive | — |
| 20 | `shptMethodCode` | Shpt. Method Code | Shpt. Method Code | — |
| 21 | `sourceType` | Source Type | Source Type | — |
| 22 | `dropShipment` | Drop Shipment | Drop Shipment | — |
| 23 | `transactionType` | Transaction Type | Transaction Type | — |
| 24 | `transportMethod` | Transport Method | Transport Method | — |
| 25 | `countryRegionCode` | Country/Region Code | Country/Region Code | — |
| 26 | `entryExitPoint` | Entry/Exit Point | Entry/Exit Point | — |
| 27 | `documentDate` | Document Date | Document Date | — |
| 28 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 29 | `areaCode` | Area | Area | — |
| 30 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 31 | `noSeries` | No. Series | No. Series | — |
| 32 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 33 | `documentType` | Document Type | Document Type | — |
| 34 | `documentLineNo` | Document Line No. | Document Line No. | — |
| 35 | `orderType` | Order Type | Order Type | — |
| 36 | `orderNo` | Order No. | Order No. | — |
| 37 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 38 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 39 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 40 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 41 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 42 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 43 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 44 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |
| 45 | `assembleToOrder` | Assemble to Order | Assemble to Order | — |
| 46 | `jobNo` | Job No. | Project No. | — |
| 47 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 48 | `jobPurchase` | Job Purchase | Project Purchase | — |
| 49 | `variantCode` | Variant Code | Variant Code | — |
| 50 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 51 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 52 | `derivedFromBlanketOrder` | Derived from Blanket Order | Derived from Blanket Order | — |
| 53 | `originallyOrderedNo` | Originally Ordered No. | Originally Ordered No. | — |
| 54 | `originallyOrderedVarCode` | Originally Ordered Var. Code | Originally Ordered Var. Code | — |
| 55 | `outOfStockSubstitution` | Out-of-Stock Substitution | Out-of-Stock Substitution | — |
| 56 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 57 | `nonstock` | Nonstock | Catalog | — |
| 58 | `purchasingCode` | Purchasing Code | Purchasing Code | — |
| 59 | `itemReferenceNo` | Item Reference No. | Item Reference No. | — |
| 60 | `completelyInvoiced` | Completely Invoiced | Completely Invoiced | — |
| 61 | `lastInvoiceDate` | Last Invoice Date | Last Invoice Date | — |
| 62 | `appliedEntryToAdjust` | Applied Entry to Adjust | Applied Entry to Adjust | — |
| 63 | `correction` | Correction | Correction | — |
| 64 | `shippedQtyNotReturned` | Shipped Qty. Not Returned | Shipped Qty. Not Returned | — |
| 65 | `itemLedgerEntryQuantity` | Item Ledger Entry Quantity | Item Ledger Entry Quantity on Value Entry | 🧮 computed |
| 66 | `remainingQtyByDate` | Remaining Qty. by Date | Remaining Quantity by Date | 🧮 computed |
| 67 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 68 | `prodOrderCompLineNo` | Prod. Order Comp. Line No. | Prod. Order Comp. Line No. | — |
| 69 | `serialNo` | Serial No. | Serial No. | — |
| 70 | `lotNo` | Lot No. | Lot No. | — |
| 71 | `warrantyDate` | Warranty Date | Warranty Date | — |
| 72 | `expirationDate` | Expiration Date | Expiration Date | — |
| 73 | `itemTracking` | Item Tracking | Item Tracking | — |
| 74 | `packageNo` | Package No. | Package No. | — |
| 75 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 76 | `itemDescription` | Item Description | Item Description | 🧮 computed |
| 77 | `costAmountExpected` | Cost Amount (Expected) | Cost Amount (Expected) | 🧮 computed |
| 78 | `costAmountActual` | Cost Amount (Actual) | Cost Amount (Actual) | 🧮 computed |
| 79 | `costAmountNonInvtbl` | Cost Amount (Non-Invtbl.) | Cost Amount (Non-Invtbl.) | 🧮 computed |
| 80 | `costAmountExpectedAcy` | Cost Amount (Expected) (ACY) | Cost Amount (Expected) (ACY) | 🧮 computed |
| 81 | `costAmountActualAcy` | Cost Amount (Actual) (ACY) | Cost Amount (Actual) (ACY) | 🧮 computed |
| 82 | `costAmountNonInvtblAcy` | Cost Amount (Non-Invtbl.)(ACY) | Cost Amount (Non-Invtbl.)(ACY) | 🧮 computed |
| 83 | `purchaseAmountExpected` | Purchase Amount (Expected) | Purchase Amount (Expected) | 🧮 computed |
| 84 | `purchaseAmountActual` | Purchase Amount (Actual) | Purchase Amount (Actual) | 🧮 computed |
| 85 | `salesAmountExpected` | Sales Amount (Expected) | Sales Amount (Expected) | 🧮 computed |
| 86 | `salesAmountActual` | Sales Amount (Actual) | Sales Amount (Actual) | 🧮 computed |

> **Added in API v3.1:** fields 77–86 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfValueEntries

**Description:** Value Entries — the cost layer behind every item ledger entry, recording the monetary value of inventory movements for costing and valuation.

| Property | Value |
|---|---|
| **Source Table** | Value Entry |
| Page ID | 90848 |
| Page Name | `ocpfValueEntries` |
| Entity Set Name | `ocpfValueEntries` |
| API Group | `ocpf_masterData` |
| Editable | ❌ No (GET only) |
| Field Count | 80 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `itemNo` | Item No. | Item No. | — |
| 4 | `postingDate` | Posting Date | Posting Date | — |
| 5 | `itemLedgerEntryType` | Item Ledger Entry Type | Item Ledger Entry Type | — |
| 6 | `sourceNo` | Source No. | Source No. | — |
| 7 | `documentNo` | Document No. | Document No. | — |
| 8 | `description` | Description | Description | — |
| 9 | `locationCode` | Location Code | Location Code | — |
| 10 | `inventoryPostingGroup` | Inventory Posting Group | Inventory Posting Group | — |
| 11 | `sourcePostingGroup` | Source Posting Group | Source Posting Group | — |
| 12 | `itemLedgerEntryNo` | Item Ledger Entry No. | Item Ledger Entry No. | — |
| 13 | `valuedQuantity` | Valued Quantity | Valued Quantity | — |
| 14 | `itemLedgerEntryQuantity` | Item Ledger Entry Quantity | Item Ledger Entry Quantity | — |
| 15 | `invoicedQuantity` | Invoiced Quantity | Invoiced Quantity | — |
| 16 | `costPerUnit` | Cost per Unit | Cost per Unit | — |
| 17 | `itemRegisterNo` | Item Register No. | Item Register No. | — |
| 18 | `sIFTBucketNo` | SIFT Bucket No. | SIFT Bucket No. | — |
| 19 | `salespersPurchCode` | Salespers./Purch. Code | Salespers./Purch. Code | — |
| 20 | `discountAmount` | Discount Amount | Discount Amount | — |
| 21 | `userId` | User ID | User ID | — |
| 22 | `sourceCode` | Source Code | Source Code | — |
| 23 | `appliesToEntry` | Applies-to Entry | Applies-to Entry | — |
| 24 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 25 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 26 | `sourceType` | Source Type | Source Type | — |
| 27 | `costPostedToGL` | Cost Posted to G/L | Cost Posted to G/L | — |
| 28 | `reasonCode` | Reason Code | Reason Code | — |
| 29 | `dropShipment` | Drop Shipment | Drop Shipment | — |
| 30 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 31 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 32 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 33 | `documentDate` | Document Date | Document Date | — |
| 34 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 35 | `documentType` | Document Type | Document Type | — |
| 36 | `documentLineNo` | Document Line No. | Document Line No. | — |
| 37 | `vATReportingDate` | VAT Reporting Date | VAT Date | — |
| 38 | `orderType` | Order Type | Order Type | — |
| 39 | `orderNo` | Order No. | Order No. | — |
| 40 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 41 | `expectedCost` | Expected Cost | Expected Cost | — |
| 42 | `itemChargeNo` | Item Charge No. | Item Charge No. | — |
| 43 | `valuedByAverageCost` | Valued By Average Cost | Valued By Average Cost | — |
| 44 | `partialRevaluation` | Partial Revaluation | Partial Revaluation | — |
| 45 | `inventoriable` | Inventoriable | Inventoriable | — |
| 46 | `valuationDate` | Valuation Date | Valuation Date | — |
| 47 | `entryType` | Entry Type | Entry Type | — |
| 48 | `varianceType` | Variance Type | Variance Type | — |
| 49 | `expectedCostPostedToGL` | Expected Cost Posted to G/L | Expected Cost Posted to G/L | — |
| 50 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 51 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 52 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 53 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 54 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 55 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 56 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |
| 57 | `jobNo` | Job No. | Project No. | — |
| 58 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 59 | `jobLedgerEntryNo` | Job Ledger Entry No. | Project Ledger Entry No. | — |
| 60 | `variantCode` | Variant Code | Variant Code | — |
| 61 | `adjustment` | Adjustment | Adjustment | — |
| 62 | `averageCostException` | Average Cost Exception | Average Cost Exception | — |
| 63 | `capacityLedgerEntryNo` | Capacity Ledger Entry No. | Capacity Ledger Entry No. | — |
| 64 | `type` | Type | Type | — |
| 65 | `no` | No. | No. | — |
| 66 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 67 | `itemDescription` | Item Description | Item Description | 🧮 computed |
| 68 | `salesAmountActual` | Sales Amount (Actual) | Sales Amount (Actual) | — |
| 69 | `costAmountActual` | Cost Amount (Actual) | Cost Amount (Actual) | — |
| 70 | `costAmountActualAcy` | Cost Amount (Actual) (ACY) | Cost Amount (Actual) (ACY) | — |
| 71 | `costPostedToGLAcy` | Cost Posted to G/L (ACY) | Cost Posted to G/L (ACY) | — |
| 72 | `costPerUnitAcy` | Cost per Unit (ACY) | Cost per Unit (ACY) | — |
| 73 | `purchaseAmountActual` | Purchase Amount (Actual) | Purchase Amount (Actual) | — |
| 74 | `purchaseAmountExpected` | Purchase Amount (Expected) | Purchase Amount (Expected) | — |
| 75 | `salesAmountExpected` | Sales Amount (Expected) | Sales Amount (Expected) | — |
| 76 | `costAmountExpected` | Cost Amount (Expected) | Cost Amount (Expected) | — |
| 77 | `costAmountNonInvtbl` | Cost Amount (Non-Invtbl.) | Cost Amount (Non-Invtbl.) | — |
| 78 | `costAmountExpectedAcy` | Cost Amount (Expected) (ACY) | Cost Amount (Expected) (ACY) | — |
| 79 | `costAmountNonInvtblAcy` | Cost Amount (Non-Invtbl.)(ACY) | Cost Amount (Non-Invtbl.)(ACY) | — |
| 80 | `expCostPostedToGLAcy` | Exp. Cost Posted to G/L (ACY) | Exp. Cost Posted to G/L (ACY) | — |

> **Added in API v3.1:** fields 68–80 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfItemApplicationEntries

**Description:** Item Application Entries — records showing how item ledger entries are applied to each other for cost forwarding and inventory valuation.

| Property | Value |
|---|---|
| **Source Table** | Item Application Entry |
| Page ID | 90849 |
| Page Name | `ocpfItemApplicationEntries` |
| Entity Set Name | `ocpfItemApplicationEntries` |
| API Group | `ocpf_masterData` |
| Editable | ❌ No (GET only) |
| Field Count | 20 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `itemLedgerEntryNo` | Item Ledger Entry No. | Item Ledger Entry No. | — |
| 4 | `inboundItemEntryNo` | Inbound Item Entry No. | Inbound Item Entry No. | — |
| 5 | `outboundItemEntryNo` | Outbound Item Entry No. | Outbound Item Entry No. | — |
| 6 | `quantity` | Quantity | Quantity | — |
| 7 | `itemRegisterNo` | Item Register No. | Item Register No. | — |
| 8 | `postingDate` | Posting Date | Posting Date | — |
| 9 | `transferredFromEntryNo` | Transferred-from Entry No. | Transferred-from Entry No. | — |
| 10 | `creationDate` | Creation Date | Creation Date | — |
| 11 | `createdByUser` | Created By User | Created By User | — |
| 12 | `lastModifiedDate` | Last Modified Date | Last Modified Date | — |
| 13 | `lastModifiedByUser` | Last Modified By User | Last Modified By User | — |
| 14 | `itemNo` | Item No. | Item No. | 🧮 computed |
| 15 | `locationCode` | Location Code | Location Code | 🧮 computed |
| 16 | `variantCode` | Variant Code | Variant Code | 🧮 computed |
| 17 | `latestValuationDate` | Latest Valuation Date | Latest Valuation Date | 🧮 computed |
| 18 | `costApplication` | Cost Application | Cost Application | — |
| 19 | `outputCompletelyInvdDate` | Output Completely Invd. Date | Output Completely Invd. Date | — |
| 20 | `outboundEntryIsUpdated` | Outbound Entry is Updated | Outbound Entry is Updated | — |


[↑ Back to top](#table-of-contents)

---

### ocpfItemVendorCatalogs

**Description:** Item Vendor Catalog — per-vendor item data including the vendor

| Property | Value |
|---|---|
| **Source Table** | Item Vendor |
| Page ID | 90850 |
| Page Name | `ocpfItemVendorCatalogs` |
| Entity Set Name | `ocpfItemVendorCatalogs` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 6 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `itemNo` | Item No. | Item No. | ✅ |
| 3 | `vendorNo` | Vendor No. | Vendor No. | ✅ |
| 4 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 5 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | ✅ |
| 6 | `variantCode` | Variant Code | Variant Code | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfStockkeepingUnits

**Description:** Stockkeeping Units — location-specific item settings that override the item card defaults for replenishment, costing, and ordering at a given location.

| Property | Value |
|---|---|
| **Source Table** | Stockkeeping Unit |
| Page ID | 90851 |
| Page Name | `ocpfStockkeepingUnits` |
| Entity Set Name | `ocpfStockkeepingUnits` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 80 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `itemNo` | Item No. | Item No. | ✅ |
| 3 | `variantCode` | Variant Code | Variant Code | ✅ |
| 4 | `locationCode` | Location Code | Location Code | ✅ |
| 5 | `description` | Description | Description | 🧮 computed |
| 6 | `description2` | Description 2 | Description 2 | 🧮 computed |
| 7 | `assemblyBom` | Assembly BOM | Assembly BOM | 🧮 computed |
| 8 | `shelfNo` | Shelf No. | Shelf No. | ✅ |
| 9 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 10 | `standardCost` | Standard Cost | Standard Cost | ✅ |
| 11 | `lastDirectCost` | Last Direct Cost | Last Direct Cost | ✅ |
| 12 | `vendorNo` | Vendor No. | Vendor No. | ✅ |
| 13 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | ✅ |
| 14 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 15 | `reorderPoint` | Reorder Point | Reorder Point | ✅ |
| 16 | `maximumInventory` | Maximum Inventory | Maximum Inventory | ✅ |
| 17 | `reorderQuantity` | Reorder Quantity | Reorder Quantity | ✅ |
| 18 | `comment` | Comment | Comment | 🧮 computed |
| 19 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 20 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 21 | `globalDimension1Filter` | Global Dimension 1 Filter | Global Dimension 1 Filter | 🔍 filter |
| 22 | `globalDimension2Filter` | Global Dimension 2 Filter | Global Dimension 2 Filter | 🔍 filter |
| 23 | `inventory` | Inventory | Inventory | 🧮 computed |
| 24 | `qtyOnPurchOrder` | Qty. on Purch. Order | Qty. on Purch. Order | 🧮 computed |
| 25 | `qtyOnSalesOrder` | Qty. on Sales Order | Qty. on Sales Order | 🧮 computed |
| 26 | `dropShipmentFilter` | Drop Shipment Filter | Drop Shipment Filter | 🔍 filter |
| 27 | `assemblyPolicy` | Assembly Policy | Assembly Policy | ✅ |
| 28 | `qtyOnAssemblyOrder` | Qty. on Assembly Order | Qty. on Assembly Order | 🧮 computed |
| 29 | `qtyOnAsmComponent` | Qty. on Asm. Component | Qty. on Asm. Component | 🧮 computed |
| 30 | `qtyOnJobOrder` | Qty. on Job Order | Qty. on Project Order | 🧮 computed |
| 31 | `transferLevelCode` | Transfer-Level Code | Transfer-Level Code | ✅ |
| 32 | `lotSize` | Lot Size | Lot Size | ✅ |
| 33 | `discreteOrderQuantity` | Discrete Order Quantity | Discrete Order Quantity | ✅ |
| 34 | `minimumOrderQuantity` | Minimum Order Quantity | Minimum Order Quantity | ✅ |
| 35 | `maximumOrderQuantity` | Maximum Order Quantity | Maximum Order Quantity | ✅ |
| 36 | `safetyStockQuantity` | Safety Stock Quantity | Safety Stock Quantity | ✅ |
| 37 | `orderMultiple` | Order Multiple | Order Multiple | ✅ |
| 38 | `safetyLeadTime` | Safety Lead Time | Safety Lead Time | ✅ |
| 39 | `componentsAtLocation` | Components at Location | Components at Location | ✅ |
| 40 | `flushingMethod` | Flushing Method | Flushing Method | ✅ |
| 41 | `replenishmentSystem` | Replenishment System | Replenishment System | ✅ |
| 42 | `binFilter` | Bin Filter | Bin Filter | 🔍 filter |
| 43 | `timeBucket` | Time Bucket | Time Bucket | ✅ |
| 44 | `reorderingPolicy` | Reordering Policy | Reordering Policy | ✅ |
| 45 | `includeInventory` | Include Inventory | Include Inventory | ✅ |
| 46 | `manufacturingPolicy` | Manufacturing Policy | Manufacturing Policy | ✅ |
| 47 | `reschedulingPeriod` | Rescheduling Period | Rescheduling Period | ✅ |
| 48 | `lotAccumulationPeriod` | Lot Accumulation Period | Lot Accumulation Period | ✅ |
| 49 | `dampenerPeriod` | Dampener Period | Dampener Period | ✅ |
| 50 | `dampenerQuantity` | Dampener Quantity | Dampener Quantity | ✅ |
| 51 | `overflowLevel` | Overflow Level | Overflow Level | ✅ |
| 52 | `planMinimalSupply` | Plan Minimal Supply | Plan Minimal Supply | ✅ |
| 53 | `transferFromCode` | Transfer-from Code | Transfer-from Code | ✅ |
| 54 | `qtyInTransit` | Qty. in Transit | Qty. in Transit | 🧮 computed |
| 55 | `specialEquipmentCode` | Special Equipment Code | Special Equipment Code | ✅ |
| 56 | `putAwayTemplateCode` | Put-away Template Code | Put-away Template Code | ✅ |
| 57 | `putAwayUnitOfMeasureCode` | Put-away Unit of Measure Code | Put-away Unit of Measure Code | ✅ |
| 58 | `physInvtCountingPeriodCode` | Phys Invt Counting Period Code | Phys Invt Counting Period Code | ✅ |
| 59 | `lastCountingPeriodUpdate` | Last Counting Period Update | Last Counting Period Update | ✅ |
| 60 | `lastPhysInvtDate` | Last Phys. Invt. Date | Last Phys. Invt. Date | 🧮 computed |
| 61 | `useCrossDocking` | Use Cross-Docking | Use Cross-Docking | ✅ |
| 62 | `nextCountingStartDate` | Next Counting Start Date | Next Counting Start Date | ✅ |
| 63 | `nextCountingEndDate` | Next Counting End Date | Next Counting End Date | ✅ |
| 64 | `rolledUpMaterialCost` | Rolled-up Material Cost | Rolled-up Material Cost | ✅ |
| 65 | `rolledUpCapacityCost` | Rolled-up Capacity Cost | Rolled-up Capacity Cost | ✅ |
| 66 | `scrap` | Scrap % | Scrap % | ✅ |
| 67 | `rolledUpMatNonInvtCost` | Rolled-up Mat. Non-Invt. Cost | Rolled-up Material Non-Inventory Cost | ✅ |
| 68 | `singleLevelMaterialCost` | Single-Level Material Cost | Single-Level Material Cost | ✅ |
| 69 | `singleLevelCapacityCost` | Single-Level Capacity Cost | Single-Level Capacity Cost | ✅ |
| 70 | `singleLevelSubcontrdCost` | Single-Level Subcontrd. Cost | Single-Level Subcontrd. Cost | ✅ |
| 71 | `singleLevelCapOvhdCost` | Single-Level Cap. Ovhd Cost | Single-Level Cap. Ovhd Cost | ✅ |
| 72 | `singleLevelMfgOvhdCost` | Single-Level Mfg. Ovhd Cost | Single-Level Mfg. Ovhd Cost | ✅ |
| 73 | `rolledUpSubcontractedCost` | Rolled-up Subcontracted Cost | Rolled-up Subcontracted Cost | ✅ |
| 74 | `rolledUpMfgOvhdCost` | Rolled-up Mfg. Ovhd Cost | Rolled-up Mfg. Ovhd Cost | ✅ |
| 75 | `rolledUpCapOverheadCost` | Rolled-up Cap. Overhead Cost | Rolled-up Cap. Overhead Cost | ✅ |
| 76 | `singleLvlMatNonInvtCost` | Single-Lvl Mat. Non-Invt. Cost | Single-Level Material Non-Inventory Cost | ✅ |
| 77 | `transOrdReceiptQty` | Trans. Ord. Receipt (Qty.) | Trans. Ord. Receipt (Qty.) | 🧮 computed |
| 78 | `transOrdShipmentQty` | Trans. Ord. Shipment (Qty.) | Trans. Ord. Shipment (Qty.) | 🧮 computed |
| 79 | `purchReqReceiptQty` | Purch. Req. Receipt (Qty.) | Purch. Req. Receipt (Qty.) | 🧮 computed |
| 80 | `purchReqReleaseQty` | Purch. Req. Release (Qty.) | Purch. Req. Release (Qty.) | 🧮 computed |

> **Added in API v3.1:** fields 77–80 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfItemTrackingCodes

**Description:** Item Tracking Codes — configuration records defining whether and how an item is tracked by serial number or lot number through the supply chain.

| Property | Value |
|---|---|
| **Source Table** | Item Tracking Code |
| Page ID | 90852 |
| Page Name | `ocpfItemTrackingCodes` |
| Entity Set Name | `ocpfItemTrackingCodes` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 49 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `warrantyDateFormula` | Warranty Date Formula | Warranty Date Formula | ✅ |
| 5 | `manWarrantyDateEntryReqd` | Man. Warranty Date Entry Reqd. | Man. Warranty Date Entry Reqd. | ✅ |
| 6 | `manExpirDateEntryReqd` | Man. Expir. Date Entry Reqd. | Man. Expir. Date Entry Reqd. | ✅ |
| 7 | `strictExpirationPosting` | Strict Expiration Posting | Strict Expiration Posting | ✅ |
| 8 | `useExpirationDates` | Use Expiration Dates | Use Expiration Dates | ✅ |
| 9 | `sNSpecificTracking` | SN Specific Tracking | SN Specific Tracking | ✅ |
| 10 | `sNInfoInboundMustExist` | SN Info. Inbound Must Exist | SN Info. Inbound Must Exist | ✅ |
| 11 | `sNInfoOutboundMustExist` | SN Info. Outbound Must Exist | SN Info. Outbound Must Exist | ✅ |
| 12 | `sNWarehouseTracking` | SN Warehouse Tracking | SN Warehouse Tracking | ✅ |
| 13 | `sNPurchaseInboundTracking` | SN Purchase Inbound Tracking | SN Purchase Inbound Tracking | ✅ |
| 14 | `sNPurchaseOutboundTracking` | SN Purchase Outbound Tracking | SN Purchase Outbound Tracking | ✅ |
| 15 | `sNSalesInboundTracking` | SN Sales Inbound Tracking | SN Sales Inbound Tracking | ✅ |
| 16 | `sNSalesOutboundTracking` | SN Sales Outbound Tracking | SN Sales Outbound Tracking | ✅ |
| 17 | `sNPosAdjmtInbTracking` | SN Pos. Adjmt. Inb. Tracking | SN Pos. Adjmt. Inb. Tracking | ✅ |
| 18 | `sNPosAdjmtOutbTracking` | SN Pos. Adjmt. Outb. Tracking | SN Pos. Adjmt. Outb. Tracking | ✅ |
| 19 | `sNNegAdjmtInbTracking` | SN Neg. Adjmt. Inb. Tracking | SN Neg. Adjmt. Inb. Tracking | ✅ |
| 20 | `sNNegAdjmtOutbTracking` | SN Neg. Adjmt. Outb. Tracking | SN Neg. Adjmt. Outb. Tracking | ✅ |
| 21 | `sNTransferTracking` | SN Transfer Tracking | SN Transfer Tracking | ✅ |
| 22 | `createSnInfoOnPosting` | Create SN Info on Posting | Create SN Info. on posting | ✅ |
| 23 | `lotSpecificTracking` | Lot Specific Tracking | Lot Specific Tracking | ✅ |
| 24 | `lotInfoInboundMustExist` | Lot Info. Inbound Must Exist | Lot Info. Inbound Must Exist | ✅ |
| 25 | `lotInfoOutboundMustExist` | Lot Info. Outbound Must Exist | Lot Info. Outbound Must Exist | ✅ |
| 26 | `lotWarehouseTracking` | Lot Warehouse Tracking | Lot Warehouse Tracking | ✅ |
| 27 | `lotPurchaseInboundTracking` | Lot Purchase Inbound Tracking | Lot Purchase Inbound Tracking | ✅ |
| 28 | `lotPurchaseOutboundTracking` | Lot Purchase Outbound Tracking | Lot Purchase Outbound Tracking | ✅ |
| 29 | `lotSalesInboundTracking` | Lot Sales Inbound Tracking | Lot Sales Inbound Tracking | ✅ |
| 30 | `lotSalesOutboundTracking` | Lot Sales Outbound Tracking | Lot Sales Outbound Tracking | ✅ |
| 31 | `lotPosAdjmtInbTracking` | Lot Pos. Adjmt. Inb. Tracking | Lot Pos. Adjmt. Inb. Tracking | ✅ |
| 32 | `lotPosAdjmtOutbTracking` | Lot Pos. Adjmt. Outb. Tracking | Lot Pos. Adjmt. Outb. Tracking | ✅ |
| 33 | `lotNegAdjmtInbTracking` | Lot Neg. Adjmt. Inb. Tracking | Lot Neg. Adjmt. Inb. Tracking | ✅ |
| 34 | `lotNegAdjmtOutbTracking` | Lot Neg. Adjmt. Outb. Tracking | Lot Neg. Adjmt. Outb. Tracking | ✅ |
| 35 | `lotTransferTracking` | Lot Transfer Tracking | Lot Transfer Tracking | ✅ |
| 36 | `createLotNoInfoOnPosting` | Create Lot No. Info on posting | Create Lot No. Info. on posting | ✅ |
| 37 | `packageSpecificTracking` | Package Specific Tracking | Package Specific Tracking | ✅ |
| 38 | `packageWarehouseTracking` | Package Warehouse Tracking | Package Warehouse Tracking | ✅ |
| 39 | `packageInfoInbMustExist` | Package Info. Inb. Must Exist | Package Info. Inb. Must Exist | ✅ |
| 40 | `packageInfoOutbMustExist` | Package Info. Outb. Must Exist | Lot Info. Outb. Must Exist | ✅ |
| 41 | `packagePurchaseInbTracking` | Package Purchase Inb. Tracking | Package Purchase Inb. Tracking | ✅ |
| 42 | `packagePurchOutbTracking` | Package Purch. Outb. Tracking | Package Purch. Outb. Tracking | ✅ |
| 43 | `packageSalesInboundTracking` | Package Sales Inbound Tracking | Package Sales Inbound Tracking | ✅ |
| 44 | `packageSalesOutbTracking` | Package Sales Outb. Tracking | Package Sales Outb. Tracking | ✅ |
| 45 | `packagePosInbTracking` | Package Pos. Inb. Tracking | Package Pos. Inb. Tracking | ✅ |
| 46 | `packagePosOutbTracking` | Package Pos. Outb. Tracking | Package Pos. Outb. Tracking | ✅ |
| 47 | `packageNegInbTracking` | Package Neg. Inb. Tracking | Package Neg. Inb. Tracking | ✅ |
| 48 | `packageNegOutbTracking` | Package Neg. Outb. Tracking | Package Neg. Outb. Tracking | ✅ |
| 49 | `packageTransferTracking` | Package Transfer Tracking | Package Transfer Tracking | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfItemCharges

**Description:** Item Charges — additional cost codes (e.g., freight, handling, customs) that can be assigned to purchase or sales lines and posted to inventory value.

| Property | Value |
|---|---|
| **Source Table** | Item Charge |
| Page ID | 90853 |
| Page Name | `ocpfItemCharges` |
| Entity Set Name | `ocpfItemCharges` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 9 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 5 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 6 | `vATProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 7 | `searchDescription` | Search Description | Search Description | ✅ |
| 8 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 9 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfResources

**Description:** Resources — people or machines whose time and costs can be sold or allocated to projects, with pricing and unit of measure settings.

| Property | Value |
|---|---|
| **Source Table** | Resource |
| Page ID | 90854 |
| Page Name | `ocpfResources` |
| Entity Set Name | `ocpfResources` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 58 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `type` | Type | Type | ✅ |
| 4 | `name` | Name | Name | ✅ |
| 5 | `searchName` | Search Name | Search Name | ✅ |
| 6 | `name2` | Name 2 | Name 2 | ✅ |
| 7 | `address` | Address | Address | ✅ |
| 8 | `address2` | Address 2 | Address 2 | ✅ |
| 9 | `city` | City | City | ✅ |
| 10 | `socialSecurityNo` | Social Security No. | Social Security No. | ✅ |
| 11 | `jobTitle` | Job Title | Job Title | ✅ |
| 12 | `education` | Education | Education | ✅ |
| 13 | `contractClass` | Contract Class | Contract Class | ✅ |
| 14 | `employmentDate` | Employment Date | Employment Date | ✅ |
| 15 | `resourceGroupNo` | Resource Group No. | Resource Group No. | ✅ |
| 16 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 17 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 18 | `baseUnitOfMeasure` | Base Unit of Measure | Base Unit of Measure | ✅ |
| 19 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | ✅ |
| 20 | `indirectCost` | Indirect Cost % | Indirect Cost % | ✅ |
| 21 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 22 | `profit` | Profit % | Profit % | ✅ |
| 23 | `priceProfitCalculation` | Price/Profit Calculation | Price/Profit Calculation | ✅ |
| 24 | `unitPrice` | Unit Price | Unit Price | ✅ |
| 25 | `vendorNo` | Vendor No. | Vendor No. | ✅ |
| 26 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 27 | `comment` | Comment | Comment | 🧮 computed |
| 28 | `blocked` | Blocked | Blocked | ✅ |
| 29 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 30 | `unitOfMeasureFilter` | Unit of Measure Filter | Unit of Measure Filter | 🔍 filter |
| 31 | `capacity` | Capacity | Capacity | 🧮 computed |
| 32 | `chargeableFilter` | Chargeable Filter | Chargeable Filter | 🔍 filter |
| 33 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 34 | `postCode` | Post Code | Post Code | ✅ |
| 35 | `county` | County | County | ✅ |
| 36 | `automaticExtTexts` | Automatic Ext. Texts | Automatic Ext. Texts | ✅ |
| 37 | `noSeries` | No. Series | No. Series | ✅ |
| 38 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 39 | `vATProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 40 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 41 | `iCPartnerPurchGLAccNo` | IC Partner Purch. G/L Acc. No. | IC Partner Purch. G/L Acc. No. | ✅ |
| 42 | `unitGroupExists` | Unit Group Exists | Unit Group Exists | 🧮 computed |
| 43 | `image` | Image | Image | ✅ |
| 44 | `privacyBlocked` | Privacy Blocked | Privacy Blocked | ✅ |
| 45 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dynamics 365 Sales | 🧮 computed |
| 46 | `qtyOnAssemblyOrder` | Qty. on Assembly Order | Qty. on Assembly Order | 🧮 computed |
| 47 | `useTimeSheet` | Use Time Sheet | Use Time Sheet | ✅ |
| 48 | `timeSheetOwnerUserId` | Time Sheet Owner User ID | Time Sheet Owner User ID | ✅ |
| 49 | `timeSheetApproverUserId` | Time Sheet Approver User ID | Time Sheet Approver User ID | ✅ |
| 50 | `defaultDeferralTemplateCode` | Default Deferral Template Code | Default Deferral Template Code | ✅ |
| 51 | `qtyOnOrderJob` | Qty. on Order (Job) | Qty. on Order (Project) | 🧮 computed |
| 52 | `qtyQuotedJob` | Qty. Quoted (Job) | Qty. Quoted (Project) | 🧮 computed |
| 53 | `usageQty` | Usage (Qty.) | Usage (Qty.) | 🧮 computed |
| 54 | `usageCost` | Usage (Cost) | Usage (Cost) | 🧮 computed |
| 55 | `usagePrice` | Usage (Price) | Usage (Price) | 🧮 computed |
| 56 | `salesQty` | Sales (Qty.) | Sales (Qty.) | 🧮 computed |
| 57 | `salesCost` | Sales (Cost) | Sales (Cost) | 🧮 computed |
| 58 | `salesPrice` | Sales (Price) | Sales (Price) | 🧮 computed |

> **Added in API v3.1:** fields 51–58 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfResourceLedgerEntries

**Description:** Resource Ledger Entries — posted usage and cost entries for resources, recording time spent on projects and service orders.

| Property | Value |
|---|---|
| **Source Table** | Res. Ledger Entry |
| Page ID | 90855 |
| Page Name | `ocpfResourceLedgerEntries` |
| Entity Set Name | `ocpfResourceLedgerEntries` |
| API Group | `ocpf_masterData` |
| Editable | ❌ No (GET only) |
| Field Count | 44 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `entryType` | Entry Type | Entry Type | — |
| 4 | `documentNo` | Document No. | Document No. | — |
| 5 | `postingDate` | Posting Date | Posting Date | — |
| 6 | `resourceNo` | Resource No. | Resource No. | — |
| 7 | `resourceGroupNo` | Resource Group No. | Resource Group No. | — |
| 8 | `description` | Description | Description | — |
| 9 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 10 | `jobNo` | Job No. | Project No. | — |
| 11 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 12 | `quantity` | Quantity | Quantity | — |
| 13 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | — |
| 14 | `unitCost` | Unit Cost | Unit Cost | — |
| 15 | `totalCost` | Total Cost | Total Cost | — |
| 16 | `unitPrice` | Unit Price | Unit Price | — |
| 17 | `totalPrice` | Total Price | Total Price | — |
| 18 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 19 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 20 | `userId` | User ID | User ID | — |
| 21 | `sourceCode` | Source Code | Source Code | — |
| 22 | `chargeable` | Chargeable | Chargeable | — |
| 23 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 24 | `reasonCode` | Reason Code | Reason Code | — |
| 25 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 26 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 27 | `documentDate` | Document Date | Document Date | — |
| 28 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 29 | `noSeries` | No. Series | No. Series | — |
| 30 | `sourceType` | Source Type | Source Type | — |
| 31 | `sourceNo` | Source No. | Source No. | — |
| 32 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 33 | `resourceRegisterNo` | Resource Register No. | Resource Register No. | — |
| 34 | `orderType` | Order Type | Order Type | — |
| 35 | `orderNo` | Order No. | Order No. | — |
| 36 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 37 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 38 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 39 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 40 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 41 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 42 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 43 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |
| 44 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |

> **Added in API v3.1:** fields 44–44 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfResourceGroups

**Description:** Resource Groups — groupings of resources used for capacity planning, project budgeting, and reporting.

| Property | Value |
|---|---|
| **Source Table** | Resource Group |
| Page ID | 90856 |
| Page Name | `ocpfResourceGroups` |
| Entity Set Name | `ocpfResourceGroups` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 18 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 5 | `capacity` | Capacity | Capacity | 🧮 computed |
| 6 | `unitOfMeasureFilter` | Unit of Measure Filter | Unit of Measure Filter | 🔍 filter |
| 7 | `chargeableFilter` | Chargeable Filter | Chargeable Filter | 🔍 filter |
| 8 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 9 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 10 | `noOfResourcesAssigned` | No. of Resources Assigned | No. of Resources Assigned | 🧮 computed |
| 11 | `qtyOnOrderJob` | Qty. on Order (Job) | Qty. on Order (Project) | 🧮 computed |
| 12 | `qtyQuotedJob` | Qty. Quoted (Job) | Qty. Quoted (Project) | 🧮 computed |
| 13 | `usageQty` | Usage (Qty.) | Usage (Qty.) | 🧮 computed |
| 14 | `usageCost` | Usage (Cost) | Usage (Cost) | 🧮 computed |
| 15 | `usagePrice` | Usage (Price) | Usage (Price) | 🧮 computed |
| 16 | `salesQty` | Sales (Qty.) | Sales (Qty.) | 🧮 computed |
| 17 | `salesCost` | Sales (Cost) | Sales (Cost) | 🧮 computed |
| 18 | `salesPrice` | Sales (Price) | Sales (Price) | 🧮 computed |

> **Added in API v3.1:** fields 11–18 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfEmployees

**Description:** Employees — human resources records for company staff, including personal details, employment terms, and payroll-related settings.

| Property | Value |
|---|---|
| **Source Table** | Employee |
| Page ID | 90857 |
| Page Name | `ocpfEmployees` |
| Entity Set Name | `ocpfEmployees` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 79 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `firstName` | First Name | First Name | ✅ |
| 4 | `middleName` | Middle Name | Middle Name | ✅ |
| 5 | `lastName` | Last Name | Last Name | ✅ |
| 6 | `initials` | Initials | Initials | ✅ |
| 7 | `jobTitle` | Job Title | Job Title | ✅ |
| 8 | `searchName` | Search Name | Search Name | ✅ |
| 9 | `address` | Address | Address | ✅ |
| 10 | `address2` | Address 2 | Address 2 | ✅ |
| 11 | `city` | City | City | ✅ |
| 12 | `postCode` | Post Code | Post Code | ✅ |
| 13 | `county` | County | County | ✅ |
| 14 | `phoneNo` | Phone No. | Phone No. | ✅ |
| 15 | `mobilePhoneNo` | Mobile Phone No. | Mobile Phone No. | ✅ |
| 16 | `eMail` | E-Mail | Email | ✅ |
| 17 | `altAddressCode` | Alt. Address Code | Alt. Address Code | ✅ |
| 18 | `altAddressStartDate` | Alt. Address Start Date | Alt. Address Start Date | ✅ |
| 19 | `altAddressEndDate` | Alt. Address End Date | Alt. Address End Date | ✅ |
| 20 | `birthDate` | Birth Date | Birth Date | ✅ |
| 21 | `socialSecurityNo` | Social Security No. | Social Security No. | ✅ |
| 22 | `unionCode` | Union Code | Union Code | ✅ |
| 23 | `unionMembershipNo` | Union Membership No. | Union Membership No. | ✅ |
| 24 | `gender` | Gender | Gender | ✅ |
| 25 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 26 | `managerNo` | Manager No. | Manager No. | ✅ |
| 27 | `emplymtContractCode` | Emplymt. Contract Code | Emplymt. Contract Code | ✅ |
| 28 | `statisticsGroupCode` | Statistics Group Code | Statistics Group Code | ✅ |
| 29 | `employmentDate` | Employment Date | Employment Date | ✅ |
| 30 | `status` | Status | Status | ✅ |
| 31 | `inactiveDate` | Inactive Date | Inactive Date | ✅ |
| 32 | `causeOfInactivityCode` | Cause of Inactivity Code | Cause of Inactivity Code | ✅ |
| 33 | `terminationDate` | Termination Date | Termination Date | ✅ |
| 34 | `groundsForTermCode` | Grounds for Term. Code | Grounds for Term. Code | ✅ |
| 35 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 36 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 37 | `resourceNo` | Resource No. | Resource No. | ✅ |
| 38 | `comment` | Comment | Comment | 🧮 computed |
| 39 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 40 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 41 | `globalDimension1Filter` | Global Dimension 1 Filter | Global Dimension 1 Filter | 🔍 filter |
| 42 | `globalDimension2Filter` | Global Dimension 2 Filter | Global Dimension 2 Filter | 🔍 filter |
| 43 | `causeOfAbsenceFilter` | Cause of Absence Filter | Cause of Absence Filter | 🔍 filter |
| 44 | `extension` | Extension | Extension | ✅ |
| 45 | `employeeNoFilter` | Employee No. Filter | Employee No. Filter | 🔍 filter |
| 46 | `pager` | Pager | Pager | ✅ |
| 47 | `faxNo` | Fax No. | Fax No. | ✅ |
| 48 | `companyEMail` | Company E-Mail | Company Email | ✅ |
| 49 | `title` | Title | Title | ✅ |
| 50 | `salespersPurchCode` | Salespers./Purch. Code | Salespers./Purch. Code | ✅ |
| 51 | `noSeries` | No. Series | No. Series | ✅ |
| 52 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | ✅ |
| 53 | `employeePostingGroup` | Employee Posting Group | Employee Posting Group | ✅ |
| 54 | `bankBranchNo` | Bank Branch No. | Bank Branch No. | ✅ |
| 55 | `bankAccountNo` | Bank Account No. | Bank Account No. | ✅ |
| 56 | `iBAN` | IBAN | IBAN | ✅ |
| 57 | `balance` | Balance | Balance | 🧮 computed |
| 58 | `sWIFTCode` | SWIFT Code | SWIFT Code | ✅ |
| 59 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 60 | `applicationMethod` | Application Method | Application Method | ✅ |
| 61 | `currencyFilter` | Currency Filter | Currency Filter | 🔍 filter |
| 62 | `engagementType` | Engagement Type | Engagement Type | ✅ |
| 63 | `collectiveBargainAgmtInfo` | Collective Bargain. Agmt. Info | Collective Bargaining Agreement Info | ✅ |
| 64 | `boardMember` | Board Member | Board Member | ✅ |
| 65 | `managerRole` | Manager Role | Manager Role | ✅ |
| 66 | `payroll` | Payroll | Payroll | ✅ |
| 67 | `payrollCurrencyCode` | Payroll Currency Code | Payroll Currency Code | ✅ |
| 68 | `payrollCurrencyFactor` | Payroll Currency Factor | Payroll Currency Factor | ✅ |
| 69 | `nationality` | Nationality | Nationality | ✅ |
| 70 | `workingType` | Working Type | Working Type | ✅ |
| 71 | `workingHours` | Working Hours | Working Hours | ✅ |
| 72 | `image` | Image | Image | ✅ |
| 73 | `privacyBlocked` | Privacy Blocked | Privacy Blocked | ✅ |
| 74 | `allowMultiplePostingGroups` | Allow Multiple Posting Groups | Allow Multiple Posting Groups | ✅ |
| 75 | `costCenterCode` | Cost Center Code | Cost Center Code | ✅ |
| 76 | `costObjectCode` | Cost Object Code | Cost Object Code | ✅ |
| 77 | `totalAbsenceBase` | Total Absence (Base) | Total Absence (Base) | 🧮 computed |
| 78 | `balanceLcy` | Balance (LCY) | Balance (LCY) | 🧮 computed |
| 79 | `payrollLcy` | Payroll (LCY) | Payroll (LCY) | ✅ |

> **Added in API v3.1:** fields 77–79 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfSalespeople

**Description:** Salespeople and Purchasers — codes assigned to sales and purchase documents to track responsibility and commission.

| Property | Value |
|---|---|
| **Source Table** | Salesperson/Purchaser |
| Page ID | 90858 |
| Page Name | `ocpfSalespeople` |
| Entity Set Name | `ocpfSalespeople` |
| API Group | `ocpf_masterData` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 43 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `commission` | Commission % | Commission % | ✅ |
| 5 | `image` | Image | Image | ✅ |
| 6 | `privacyBlocked` | Privacy Blocked | Privacy Blocked | ✅ |
| 7 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dataverse | 🧮 computed |
| 8 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 9 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 10 | `eMail` | E-Mail | Email | ✅ |
| 11 | `phoneNo` | Phone No. | Phone No. | ✅ |
| 12 | `nextTaskDate` | Next Task Date | Next Task Date | 🧮 computed |
| 13 | `noOfOpportunities` | No. of Opportunities | No. of Opportunities | 🧮 computed |
| 14 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 15 | `noOfInteractions` | No. of Interactions | No. of Interactions | 🧮 computed |
| 16 | `jobTitle` | Job Title | Job Title | ✅ |
| 17 | `actionTakenFilter` | Action Taken Filter | Action Taken Filter | 🔍 filter |
| 18 | `salesCycleFilter` | Sales Cycle Filter | Sales Cycle Filter | 🔍 filter |
| 19 | `salesCycleStageFilter` | Sales Cycle Stage Filter | Sales Cycle Stage Filter | 🔍 filter |
| 20 | `probabilityFilter` | Probability % Filter | Probability % Filter | 🔍 filter |
| 21 | `completedFilter` | Completed % Filter | Completed % Filter | 🔍 filter |
| 22 | `contactFilter` | Contact Filter | Contact Filter | 🔍 filter |
| 23 | `contactCompanyFilter` | Contact Company Filter | Contact Company Filter | 🔍 filter |
| 24 | `campaignFilter` | Campaign Filter | Campaign Filter | 🔍 filter |
| 25 | `estimatedValueFilter` | Estimated Value Filter | Estimated Value Filter | 🔍 filter |
| 26 | `calcdCurrentValueFilter` | Calcd. Current Value Filter | Calcd. Current Value Filter | 🔍 filter |
| 27 | `chancesOfSuccessFilter` | Chances of Success % Filter | Chances of Success % Filter | 🔍 filter |
| 28 | `taskStatusFilter` | Task Status Filter | Task Status Filter | 🔍 filter |
| 29 | `closedTaskFilter` | Closed Task Filter | Closed Task Filter | 🔍 filter |
| 30 | `priorityFilter` | Priority Filter | Priority Filter | 🔍 filter |
| 31 | `teamFilter` | Team Filter | Team Filter | 🔍 filter |
| 32 | `opportunityEntryExists` | Opportunity Entry Exists | Opportunity Entry Exists | 🧮 computed |
| 33 | `taskEntryExists` | Task Entry Exists | Task Entry Exists | 🧮 computed |
| 34 | `closeOpportunityFilter` | Close Opportunity Filter | Close Opportunity Filter | 🔍 filter |
| 35 | `searchEMail` | Search E-Mail | Search Email | ✅ |
| 36 | `eMail2` | E-Mail 2 | Email 2 | ✅ |
| 37 | `blocked` | Blocked | Blocked | ✅ |
| 38 | `estimatedValueLcy` | Estimated Value (LCY) | Estimated Value (LCY) | 🧮 computed |
| 39 | `calcdCurrentValueLcy` | Calcd. Current Value (LCY) | Calcd. Current Value (LCY) | 🧮 computed |
| 40 | `costLcy` | Cost (LCY) | Cost (LCY) | 🧮 computed |
| 41 | `durationMin` | Duration (Min.) | Duration (Min.) | 🧮 computed |
| 42 | `avgEstimatedValueLcy` | Avg. Estimated Value (LCY) | Avg. Estimated Value (LCY) | 🧮 computed |
| 43 | `avgCalcdCurrentValueLcy` | Avg.Calcd. Current Value (LCY) | Avg.Calcd. Current Value (LCY) | 🧮 computed |

> **Added in API v3.1:** fields 38–43 above (previously omitted parenthesized-name standard fields).


[↑ Back to top](#table-of-contents)

---

### ocpfShipToAddresses

**Description:** Ship-to Addresses — alternate delivery addresses defined per customer for use on sales and service documents.

| Property | Value |
|---|---|
| **Source Table** | Ship-to Address |
| Page ID | 90859 |
| Page Name | `ocpfShipToAddresses` |
| Entity Set Name | `ocpfShipToAddresses` |
| API Group | `ocpf_masterData` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 28 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `customerNo` | Customer No. | Customer No. | ✅ |
| 3 | `code` | Code | Code | ✅ |
| 4 | `name` | Name | Name | ✅ |
| 5 | `name2` | Name 2 | Name 2 | ✅ |
| 6 | `address` | Address | Address | ✅ |
| 7 | `address2` | Address 2 | Address 2 | ✅ |
| 8 | `city` | City | City | ✅ |
| 9 | `contact` | Contact | Contact | ✅ |
| 10 | `phoneNo` | Phone No. | Phone No. | ✅ |
| 11 | `telexNo` | Telex No. | Telex No. | ✅ |
| 12 | `salespersonCode` | Salesperson Code | Salesperson Code | ✅ |
| 13 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 14 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 15 | `placeOfExport` | Place of Export | Place of Export | ✅ |
| 16 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 17 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 18 | `locationCode` | Location Code | Location Code | ✅ |
| 19 | `faxNo` | Fax No. | Fax No. | ✅ |
| 20 | `telexAnswerBack` | Telex Answer Back | Telex Answer Back | ✅ |
| 21 | `gln` | GLN | GLN | ✅ |
| 22 | `postCode` | Post Code | Post Code | ✅ |
| 23 | `county` | County | County | ✅ |
| 24 | `eMail` | E-Mail | Email | ✅ |
| 25 | `homePage` | Home Page | Home Page | ✅ |
| 26 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 27 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 28 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfVendorBankAccounts

**Description:** Vendor Bank Accounts — bank account details defined per vendor, used for electronic payments and remittance.

| Property | Value |
|---|---|
| **Source Table** | Vendor Bank Account |
| Page ID | 90860 |
| Page Name | `ocpfVendorBankAccounts` |
| Entity Set Name | `ocpfVendorBankAccounts` |
| API Group | `ocpf_masterData` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 27 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `vendorNo` | Vendor No. | Vendor No. | ✅ |
| 3 | `code` | Code | Code | ✅ |
| 4 | `name` | Name | Name | ✅ |
| 5 | `name2` | Name 2 | Name 2 | ✅ |
| 6 | `address` | Address | Address | ✅ |
| 7 | `address2` | Address 2 | Address 2 | ✅ |
| 8 | `city` | City | City | ✅ |
| 9 | `postCode` | Post Code | Post Code | ✅ |
| 10 | `contact` | Contact | Contact | ✅ |
| 11 | `phoneNo` | Phone No. | Phone No. | ✅ |
| 12 | `telexNo` | Telex No. | Telex No. | ✅ |
| 13 | `bankBranchNo` | Bank Branch No. | Bank Branch No. | ✅ |
| 14 | `bankAccountNo` | Bank Account No. | Bank Account No. | ✅ |
| 15 | `transitNo` | Transit No. | Transit No. | ✅ |
| 16 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 17 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 18 | `county` | County | County | ✅ |
| 19 | `faxNo` | Fax No. | Fax No. | ✅ |
| 20 | `telexAnswerBack` | Telex Answer Back | Telex Answer Back | ✅ |
| 21 | `languageCode` | Language Code | Language Code | ✅ |
| 22 | `eMail` | E-Mail | E-Mail | ✅ |
| 23 | `homePage` | Home Page | Home Page | ✅ |
| 24 | `iban` | IBAN | IBAN | ✅ |
| 25 | `swiftCode` | SWIFT Code | SWIFT Code | ✅ |
| 26 | `bankClearingCode` | Bank Clearing Code | Bank Clearing Code | ✅ |
| 27 | `bankClearingStandard` | Bank Clearing Standard | Bank Clearing Standard | ✅ |


[↑ Back to top](#table-of-contents)

---

## Sales

[↑ Table of Contents](#table-of-contents)

**API Group URL segment:** `ocpf_sales`  
**Pages:** 20 (12 editable, 8 read-only)  

### ocpfSalesQuotes

**Description:** Sales quotes (open documents awaiting customer acceptance).

| Property | Value |
|---|---|
| **Source Table** | Sales Header |
| Page ID | 90870 |
| Page Name | `ocpfSalesQuotes` |
| Entity Set Name | `ocpfSalesQuotes` |
| API Group | `ocpf_sales` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Quote)` |
| Field Count | 182 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 4 | `no` | No. | No. | ✅ |
| 5 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 6 | `billToName` | Bill-to Name | Bill-to Name | ✅ |
| 7 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | ✅ |
| 8 | `billToAddress` | Bill-to Address | Bill-to Address | ✅ |
| 9 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | ✅ |
| 10 | `billToCity` | Bill-to City | Bill-to City | ✅ |
| 11 | `billToContact` | Bill-to Contact | Bill-to Contact | ✅ |
| 12 | `yourReference` | Your Reference | Your Reference | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `shipToName` | Ship-to Name | Ship-to Name | ✅ |
| 15 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | ✅ |
| 16 | `shipToAddress` | Ship-to Address | Ship-to Address | ✅ |
| 17 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | ✅ |
| 18 | `shipToCity` | Ship-to City | Ship-to City | ✅ |
| 19 | `shipToContact` | Ship-to Contact | Ship-to Contact | ✅ |
| 20 | `orderDate` | Order Date | Order Date | ✅ |
| 21 | `postingDate` | Posting Date | Posting Date | ✅ |
| 22 | `shipmentDate` | Shipment Date | Shipment Date | ✅ |
| 23 | `postingDescription` | Posting Description | Posting Description | ✅ |
| 24 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 25 | `dueDate` | Due Date | Due Date | ✅ |
| 26 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 27 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 28 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 29 | `locationCode` | Location Code | Location Code | ✅ |
| 30 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 31 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 32 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | ✅ |
| 33 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 34 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 35 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 36 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 37 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 38 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 39 | `languageCode` | Language Code | Language Code | ✅ |
| 40 | `formatRegion` | Format Region | Format Region | ✅ |
| 41 | `salespersonCode` | Salesperson Code | Salesperson Code | ✅ |
| 42 | `orderClass` | Order Class | Order Class | ✅ |
| 43 | `comment` | Comment | Comment | 🧮 computed |
| 44 | `noPrinted` | No. Printed | No. Printed | ✅ |
| 45 | `onHold` | On Hold | On Hold | ✅ |
| 46 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 47 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 48 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 49 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | 🧮 computed |
| 50 | `ship` | Ship | Ship | ✅ |
| 51 | `invoice` | Invoice | Invoice | ✅ |
| 52 | `printPostedDocuments` | Print Posted Documents | Print Posted Documents | ✅ |
| 53 | `amount` | Amount | Amount | 🧮 computed |
| 54 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 55 | `shippingNo` | Shipping No. | Shipping No. | ✅ |
| 56 | `postingNo` | Posting No. | Posting No. | ✅ |
| 57 | `lastShippingNo` | Last Shipping No. | Last Shipping No. | ✅ |
| 58 | `lastPostingNo` | Last Posting No. | Last Posting No. | ✅ |
| 59 | `prepaymentNo` | Prepayment No. | Prepayment No. | ✅ |
| 60 | `lastPrepaymentNo` | Last Prepayment No. | Last Prepayment No. | ✅ |
| 61 | `prepmtCrMemoNo` | Prepmt. Cr. Memo No. | Prepmt. Cr. Memo No. | ✅ |
| 62 | `lastPrepmtCrMemoNo` | Last Prepmt. Cr. Memo No. | Last Prepmt. Cr. Memo No. | ✅ |
| 63 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 64 | `combineShipments` | Combine Shipments | Combine Shipments | ✅ |
| 65 | `registrationNumber` | Registration Number | Registration No. | ✅ |
| 66 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 67 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 68 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | ✅ |
| 69 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 70 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 71 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | ✅ |
| 72 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | ✅ |
| 73 | `sellToCustomerName2` | Sell-to Customer Name 2 | Sell-to Customer Name 2 | ✅ |
| 74 | `sellToAddress` | Sell-to Address | Sell-to Address | ✅ |
| 75 | `sellToAddress2` | Sell-to Address 2 | Sell-to Address 2 | ✅ |
| 76 | `sellToCity` | Sell-to City | Sell-to City | ✅ |
| 77 | `sellToContact` | Sell-to Contact | Sell-to Contact | ✅ |
| 78 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | ✅ |
| 79 | `billToCounty` | Bill-to County | Bill-to County | ✅ |
| 80 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | ✅ |
| 81 | `sellToPostCode` | Sell-to Post Code | Sell-to Post Code | ✅ |
| 82 | `sellToCounty` | Sell-to County | Sell-to County | ✅ |
| 83 | `sellToCountryRegionCode` | Sell-to Country/Region Code | Sell-to Country/Region Code | ✅ |
| 84 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | ✅ |
| 85 | `shipToCounty` | Ship-to County | Ship-to County | ✅ |
| 86 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | ✅ |
| 87 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 88 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 89 | `correction` | Correction | Correction | ✅ |
| 90 | `documentDate` | Document Date | Document Date | ✅ |
| 91 | `externalDocumentNo` | External Document No. | External Document No. | ✅ |
| 92 | `areaCode` | Area | Area | ✅ |
| 93 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 94 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 95 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 96 | `packageTrackingNo` | Package Tracking No. | Package Tracking No. | ✅ |
| 97 | `noSeries` | No. Series | No. Series | ✅ |
| 98 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 99 | `shippingNoSeries` | Shipping No. Series | Shipping No. Series | ✅ |
| 100 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 101 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 102 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 103 | `reserve` | Reserve | Reserve | ✅ |
| 104 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 105 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 106 | `status` | Status | Status | ✅ |
| 107 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | ✅ |
| 108 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | ✅ |
| 109 | `sendIcDocument` | Send IC Document | Send IC Document | ✅ |
| 110 | `icStatus` | IC Status | IC Status | ✅ |
| 111 | `sellToIcPartnerCode` | Sell-to IC Partner Code | Sell-to IC Partner Code | ✅ |
| 112 | `billToIcPartnerCode` | Bill-to IC Partner Code | Bill-to IC Partner Code | ✅ |
| 113 | `icReferenceDocumentNo` | IC Reference Document No. | IC Reference Document No. | ✅ |
| 114 | `icDirection` | IC Direction | IC Direction | ✅ |
| 115 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 116 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | ✅ |
| 117 | `compressPrepayment` | Compress Prepayment | Compress Prepayment | ✅ |
| 118 | `prepaymentDueDate` | Prepayment Due Date | Prepayment Due Date | ✅ |
| 119 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | ✅ |
| 120 | `prepmtPostingDescription` | Prepmt. Posting Description | Prepmt. Posting Description | ✅ |
| 121 | `prepmtPmtDiscountDate` | Prepmt. Pmt. Discount Date | Prepmt. Pmt. Discount Date | ✅ |
| 122 | `prepmtPaymentTermsCode` | Prepmt. Payment Terms Code | Prepmt. Payment Terms Code | ✅ |
| 123 | `prepmtPaymentDiscountPct` | Prepmt. Payment Discount % | Prepmt. Payment Discount % | ✅ |
| 124 | `quoteNo` | Quote No. | Quote No. | ✅ |
| 125 | `quoteValidUntilDate` | Quote Valid Until Date | Quote Valid To Date | ✅ |
| 126 | `quoteSentToCustomer` | Quote Sent to Customer | Quote Sent to Customer | ✅ |
| 127 | `quoteAccepted` | Quote Accepted | Quote Accepted | ✅ |
| 128 | `quoteAcceptedDate` | Quote Accepted Date | Quote Accepted Date | ✅ |
| 129 | `jobQueueStatus` | Job Queue Status | Job Queue Status | ✅ |
| 130 | `jobQueueEntryId` | Job Queue Entry ID | Job Queue Entry ID | ✅ |
| 131 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | ✅ |
| 132 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 133 | `altVatRegistrationNo` | Alt. VAT Registration No. | Alternative VAT Registration No. | ✅ |
| 134 | `altGenBusPostingGroup` | Alt. Gen. Bus Posting Group | Alternative Gen. Bus. Posting Group | ✅ |
| 135 | `altVatBusPostingGroup` | Alt. VAT Bus Posting Group | Alternative VAT Bus. Posting Group | ✅ |
| 136 | `istest` | IsTest | IsTest | ✅ |
| 137 | `sellToPhoneNo` | Sell-to Phone No. | Sell-to Phone No. | ✅ |
| 138 | `sellToEMail` | Sell-to E-Mail | Email | ✅ |
| 139 | `journalTemplName` | Journal Templ. Name | Journal Template Name | ✅ |
| 140 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 141 | `rcvdFromCountRegionCode` | Rcvd.-from Count./Region Code | Received-from Country/Region Code | ✅ |
| 142 | `lastEmailSentTime` | Last Email Sent Time | Last Email Sent Time | 🧮 computed |
| 143 | `lastEmailSentMessageId` | Last Email Sent Message Id | Last Email Sent Message Id | 🧮 computed |
| 144 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | ✅ |
| 145 | `amtShipNotInvLcy` | Amt. Ship. Not Inv. (LCY) | Amount Shipped Not Invoiced (LCY) Incl. VAT | 🧮 computed |
| 146 | `amtShipNotInvLcyBase` | Amt. Ship. Not Inv. (LCY) Base | Amount Shipped Not Invoiced (LCY) | 🧮 computed |
| 147 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 148 | `paymentServiceSetId` | Payment Service Set ID | Payment Service Set ID | ✅ |
| 149 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dynamics 365 Sales | 🧮 computed |
| 150 | `directDebitMandateId` | Direct Debit Mandate ID | Direct Debit Mandate ID | ✅ |
| 151 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 152 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 153 | `docNoOccurrence` | Doc. No. Occurrence | Doc. No. Occurrence | ✅ |
| 154 | `campaignNo` | Campaign No. | Campaign No. | ✅ |
| 155 | `sellToContactNo` | Sell-to Contact No. | Sell-to Contact No. | ✅ |
| 156 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | ✅ |
| 157 | `opportunityNo` | Opportunity No. | Opportunity No. | ✅ |
| 158 | `sellToCustomerTemplCode` | Sell-to Customer Templ. Code | Sell-to Customer Template Code | ✅ |
| 159 | `billToCustomerTemplCode` | Bill-to Customer Templ. Code | Bill-to Customer Template Code | ✅ |
| 160 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 161 | `shippingAdvice` | Shipping Advice | Shipping Advice | ✅ |
| 162 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | 🧮 computed |
| 163 | `completelyShipped` | Completely Shipped | Completely Shipped | 🧮 computed |
| 164 | `postingFromWhseRef` | Posting from Whse. Ref. | Posting from Whse. Ref. | ✅ |
| 165 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 166 | `shipped` | Shipped | Shipped | 🧮 computed |
| 167 | `lastShipmentDate` | Last Shipment Date | Last Shipment Date | 🧮 computed |
| 168 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | ✅ |
| 169 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | ✅ |
| 170 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 171 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | ✅ |
| 172 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 173 | `lateOrderShipping` | Late Order Shipping | Late Order Shipping | 🧮 computed |
| 174 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 175 | `receive` | Receive | Receive | ✅ |
| 176 | `returnReceiptNo` | Return Receipt No. | Return Receipt No. | ✅ |
| 177 | `returnReceiptNoSeries` | Return Receipt No. Series | Return Receipt No. Series | ✅ |
| 178 | `lastReturnReceiptNo` | Last Return Receipt No. | Last Return Receipt No. | ✅ |
| 179 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 180 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 181 | `getShipmentUsed` | Get Shipment Used | Get Shipment Used | ✅ |
| 182 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfSalesQuoteLines

**Description:** Lines of open sales quotes.

| Property | Value |
|---|---|
| **Source Table** | Sales Line |
| Page ID | 90871 |
| Page Name | `ocpfSalesQuoteLines` |
| Entity Set Name | `ocpfSalesQuoteLines` |
| API Group | `ocpf_sales` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Quote)` |
| Field Count | 194 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 4 | `documentNo` | Document No. | Document No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `type` | Type | Type | ✅ |
| 7 | `no` | No. | No. | ✅ |
| 8 | `locationCode` | Location Code | Location Code | ✅ |
| 9 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 10 | `shipmentDate` | Shipment Date | Shipment Date | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `description2` | Description 2 | Description 2 | ✅ |
| 13 | `unitOfMeasure` | Unit of Measure | Unit of Measure | ✅ |
| 14 | `quantity` | Quantity | Quantity | ✅ |
| 15 | `outstandingQuantity` | Outstanding Quantity | Outstanding Quantity | ✅ |
| 16 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | ✅ |
| 17 | `qtyToShip` | Qty. to Ship | Qty. to Ship | ✅ |
| 18 | `unitPrice` | Unit Price | Unit Price | ✅ |
| 19 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | ✅ |
| 20 | `vatPct` | VAT % | VAT % | ✅ |
| 21 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 22 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 23 | `amount` | Amount | Amount | ✅ |
| 24 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | ✅ |
| 25 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 26 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 27 | `netWeight` | Net Weight | Net Weight | ✅ |
| 28 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 29 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 30 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 31 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 32 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 33 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 34 | `jobNo` | Job No. | Project No. | ✅ |
| 35 | `workTypeCode` | Work Type Code | Work Type Code | ✅ |
| 36 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | ✅ |
| 37 | `outstandingAmount` | Outstanding Amount | Outstanding Amount | ✅ |
| 38 | `qtyShippedNotInvoiced` | Qty. Shipped Not Invoiced | Qty. Shipped Not Invoiced | ✅ |
| 39 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | ✅ |
| 40 | `quantityShipped` | Quantity Shipped | Quantity Shipped | ✅ |
| 41 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | ✅ |
| 42 | `shipmentNo` | Shipment No. | Shipment No. | ✅ |
| 43 | `shipmentLineNo` | Shipment Line No. | Shipment Line No. | ✅ |
| 44 | `profitPct` | Profit % | Profit % | ✅ |
| 45 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 46 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | ✅ |
| 47 | `purchaseOrderNo` | Purchase Order No. | Purchase Order No. | ✅ |
| 48 | `purchOrderLineNo` | Purch. Order Line No. | Purch. Order Line No. | ✅ |
| 49 | `dropShipment` | Drop Shipment | Drop Shipment | ✅ |
| 50 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 51 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 52 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 53 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 54 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 55 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | ✅ |
| 56 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 57 | `areaCode` | Area | Area | ✅ |
| 58 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 59 | `taxCategory` | Tax Category | Tax Category | ✅ |
| 60 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 61 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 62 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 63 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | ✅ |
| 64 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 65 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 66 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 67 | `outstandingAmountLcy` | Outstanding Amount (LCY) | Outstanding Amount (LCY) | ✅ |
| 68 | `shippedNotInvoicedLcy` | Shipped Not Invoiced (LCY) | Shipped Not Invoiced (LCY) Incl. VAT | ✅ |
| 69 | `shippedNotInvLcyNoVat` | Shipped Not Inv. (LCY) No VAT | Shipped Not Invoiced (LCY) | ✅ |
| 70 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 71 | `reserve` | Reserve | Reserve | ✅ |
| 72 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | ✅ |
| 73 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | ✅ |
| 74 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 75 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 76 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 77 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 78 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 79 | `invDiscAmountToInvoice` | Inv. Disc. Amount to Invoice | Inv. Disc. Amount to Invoice | ✅ |
| 80 | `vatIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 81 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | ✅ |
| 82 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | ✅ |
| 83 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 84 | `prepmtLineAmount` | Prepmt. Line Amount | Prepmt. Line Amount | ✅ |
| 85 | `prepmtAmtInv` | Prepmt. Amt. Inv. | Prepmt. Amt. Inv. | ✅ |
| 86 | `prepmtAmtInclVat` | Prepmt. Amt. Incl. VAT | Prepmt. Amt. Incl. VAT | ✅ |
| 87 | `prepaymentAmount` | Prepayment Amount | Prepayment Amount | ✅ |
| 88 | `prepmtVatBaseAmt` | Prepmt. VAT Base Amt. | Prepmt. VAT Base Amt. | ✅ |
| 89 | `prepaymentVatPct` | Prepayment VAT % | Prepayment VAT % | ✅ |
| 90 | `prepmtVatCalcType` | Prepmt. VAT Calc. Type | Prepmt. VAT Calc. Type | ✅ |
| 91 | `prepaymentVatIdentifier` | Prepayment VAT Identifier | Prepayment VAT Identifier | ✅ |
| 92 | `prepaymentTaxAreaCode` | Prepayment Tax Area Code | Prepayment Tax Area Code | ✅ |
| 93 | `prepaymentTaxLiable` | Prepayment Tax Liable | Prepayment Tax Liable | ✅ |
| 94 | `prepaymentTaxGroupCode` | Prepayment Tax Group Code | Prepayment Tax Group Code | ✅ |
| 95 | `prepmtAmtToDeduct` | Prepmt Amt to Deduct | Prepmt Amt to Deduct | ✅ |
| 96 | `prepmtAmtDeducted` | Prepmt Amt Deducted | Prepmt Amt Deducted | ✅ |
| 97 | `prepaymentLine` | Prepayment Line | Prepayment Line | ✅ |
| 98 | `prepmtAmountInvInclVat` | Prepmt. Amount Inv. Incl. VAT | Prepmt. Amount Inv. Incl. VAT | ✅ |
| 99 | `prepmtAmountInvLcy` | Prepmt. Amount Inv. (LCY) | Prepmt. Amount Inv. (LCY) | ✅ |
| 100 | `icPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 101 | `prepmtVatAmountInvLcy` | Prepmt. VAT Amount Inv. (LCY) | Prepmt. VAT Amount Inv. (LCY) | ✅ |
| 102 | `prepaymentVatDifference` | Prepayment VAT Difference | Prepayment VAT Difference | ✅ |
| 103 | `prepmtVatDiffToDeduct` | Prepmt VAT Diff. to Deduct | Prepmt VAT Diff. to Deduct | ✅ |
| 104 | `prepmtVatDiffDeducted` | Prepmt VAT Diff. Deducted | Prepmt VAT Diff. Deducted | ✅ |
| 105 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | ✅ |
| 106 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | ✅ |
| 107 | `prepmtPmtDiscountAmount` | Prepmt. Pmt. Discount Amount | Prepmt. Pmt. Discount Amount | ✅ |
| 108 | `lineDiscountCalculation` | Line Discount Calculation | Line Discount Calculation | ✅ |
| 109 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 110 | `qtyToAssembleToOrder` | Qty. to Assemble to Order | Qty. to Assemble to Order | ✅ |
| 111 | `qtyToAsmToOrderBase` | Qty. to Asm. to Order (Base) | Qty. to Asm. to Order (Base) | ✅ |
| 112 | `atoWhseOutstandingQty` | ATO Whse. Outstanding Qty. | ATO Whse. Outstanding Qty. | 🧮 computed |
| 113 | `atoWhseOutstdQtyBase` | ATO Whse. Outstd. Qty. (Base) | ATO Whse. Outstd. Qty. (Base) | 🧮 computed |
| 114 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 115 | `jobContractEntryNo` | Job Contract Entry No. | Project Contract Entry No. | ✅ |
| 116 | `postingDate` | Posting Date | Posting Date | 🧮 computed |
| 117 | `deferralCode` | Deferral Code | Deferral Code | ✅ |
| 118 | `returnsDeferralStartDate` | Returns Deferral Start Date | Returns Deferral Start Date | ✅ |
| 119 | `selectedAllocAccountNo` | Selected Alloc. Account No. | Allocation Account No. | ✅ |
| 120 | `allocAccModifiedByUser` | Alloc. Acc. Modified by User | Allocation Account Distributions Modified | 🧮 computed |
| 121 | `allocationAccountNo` | Allocation Account No. | Posting Allocation Account No. | ✅ |
| 122 | `allocSalesLineSystemid` | Alloc. Sales Line SystemId | Allocation Sales Line SystemId | ✅ |
| 123 | `variantCode` | Variant Code | Variant Code | ✅ |
| 124 | `binCode` | Bin Code | Bin Code | ✅ |
| 125 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 126 | `planned` | Planned | Planned | ✅ |
| 127 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 128 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 129 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 130 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 131 | `outstandingQtyBase` | Outstanding Qty. (Base) | Outstanding Qty. (Base) | ✅ |
| 132 | `qtyToInvoiceBase` | Qty. to Invoice (Base) | Qty. to Invoice (Base) | ✅ |
| 133 | `qtyToShipBase` | Qty. to Ship (Base) | Qty. to Ship (Base) | ✅ |
| 134 | `qtyShippedNotInvdBase` | Qty. Shipped Not Invd. (Base) | Qty. Shipped Not Invd. (Base) | ✅ |
| 135 | `qtyShippedBase` | Qty. Shipped (Base) | Qty. Shipped (Base) | ✅ |
| 136 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | ✅ |
| 137 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 138 | `faPostingDate` | FA Posting Date | FA Posting Date | ✅ |
| 139 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | ✅ |
| 140 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | ✅ |
| 141 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | ✅ |
| 142 | `useDuplicationList` | Use Duplication List | Use Duplication List | ✅ |
| 143 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 144 | `outOfStockSubstitution` | Out-of-Stock Substitution | Out-of-Stock Substitution | ✅ |
| 145 | `substitutionAvailable` | Substitution Available | Substitution Available | 🧮 computed |
| 146 | `originallyOrderedNo` | Originally Ordered No. | Originally Ordered No. | ✅ |
| 147 | `originallyOrderedVarCode` | Originally Ordered Var. Code | Originally Ordered Var. Code | ✅ |
| 148 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 149 | `nonstock` | Nonstock | Catalog | ✅ |
| 150 | `purchasingCode` | Purchasing Code | Purchasing Code | ✅ |
| 151 | `specialOrder` | Special Order | Special Order | ✅ |
| 152 | `specialOrderPurchaseNo` | Special Order Purchase No. | Special Order Purchase No. | ✅ |
| 153 | `specialOrderPurchLineNo` | Special Order Purch. Line No. | Special Order Purch. Line No. | ✅ |
| 154 | `itemReferenceNo` | Item Reference No. | Item Reference No. | ✅ |
| 155 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Reference Unit of Measure | ✅ |
| 156 | `itemReferenceType` | Item Reference Type | Item Reference Type | ✅ |
| 157 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | ✅ |
| 158 | `whseOutstandingQty` | Whse. Outstanding Qty. | Whse. Outstanding Qty. | 🧮 computed |
| 159 | `whseOutstandingQtyBase` | Whse. Outstanding Qty. (Base) | Whse. Outstanding Qty. (Base) | 🧮 computed |
| 160 | `completelyShipped` | Completely Shipped | Completely Shipped | ✅ |
| 161 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | ✅ |
| 162 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | ✅ |
| 163 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 164 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | ✅ |
| 165 | `plannedDeliveryDate` | Planned Delivery Date | Planned Delivery Date | ✅ |
| 166 | `plannedShipmentDate` | Planned Shipment Date | Planned Shipment Date | ✅ |
| 167 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 168 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 169 | `allowItemChargeAssignment` | Allow Item Charge Assignment | Allow Item Charge Assignment | ✅ |
| 170 | `qtyToAssign` | Qty. to Assign | Qty. to Assign | 🧮 computed |
| 171 | `qtyAssigned` | Qty. Assigned | Qty. Assigned | 🧮 computed |
| 172 | `returnQtyToReceive` | Return Qty. to Receive | Return Qty. to Receive | ✅ |
| 173 | `returnQtyToReceiveBase` | Return Qty. to Receive (Base) | Return Qty. to Receive (Base) | ✅ |
| 174 | `returnQtyRcdNotInvd` | Return Qty. Rcd. Not Invd. | Return Qty. Rcd. Not Invd. | ✅ |
| 175 | `retQtyRcdNotInvdBase` | Ret. Qty. Rcd. Not Invd.(Base) | Ret. Qty. Rcd. Not Invd.(Base) | ✅ |
| 176 | `returnRcdNotInvd` | Return Rcd. Not Invd. | Return Rcd. Not Invd. | ✅ |
| 177 | `returnRcdNotInvdLcy` | Return Rcd. Not Invd. (LCY) | Return Rcd. Not Invd. (LCY) | ✅ |
| 178 | `returnQtyReceived` | Return Qty. Received | Return Qty. Received | ✅ |
| 179 | `returnQtyReceivedBase` | Return Qty. Received (Base) | Return Qty. Received (Base) | ✅ |
| 180 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | ✅ |
| 181 | `itemChargeQtyToHandle` | Item Charge Qty. to Handle | Item Charge Qty. to Handle | 🧮 computed |
| 182 | `bomItemNo` | BOM Item No. | BOM Item No. | ✅ |
| 183 | `returnReceiptNo` | Return Receipt No. | Return Receipt No. | ✅ |
| 184 | `returnReceiptLineNo` | Return Receipt Line No. | Return Receipt Line No. | ✅ |
| 185 | `returnReasonCode` | Return Reason Code | Return Reason Code | ✅ |
| 186 | `copiedFromPostedDoc` | Copied From Posted Doc. | Copied From Posted Doc. | ✅ |
| 187 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 188 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 189 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 190 | `subtype` | Subtype | Subtype | ✅ |
| 191 | `priceDescription` | Price description | Price description | ✅ |
| 192 | `attachedDocCount` | Attached Doc Count | Attached Doc Count | 🧮 computed |
| 193 | `attachedLinesCount` | Attached Lines Count | Attached Lines Count | 🧮 computed |
| 194 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfSalesOrders

**Description:** Sales orders (confirmed customer orders in progress).

| Property | Value |
|---|---|
| **Source Table** | Sales Header |
| Page ID | 90872 |
| Page Name | `ocpfSalesOrders` |
| Entity Set Name | `ocpfSalesOrders` |
| API Group | `ocpf_sales` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Order)` |
| Field Count | 182 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 4 | `no` | No. | No. | ✅ |
| 5 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 6 | `billToName` | Bill-to Name | Bill-to Name | ✅ |
| 7 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | ✅ |
| 8 | `billToAddress` | Bill-to Address | Bill-to Address | ✅ |
| 9 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | ✅ |
| 10 | `billToCity` | Bill-to City | Bill-to City | ✅ |
| 11 | `billToContact` | Bill-to Contact | Bill-to Contact | ✅ |
| 12 | `yourReference` | Your Reference | Your Reference | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `shipToName` | Ship-to Name | Ship-to Name | ✅ |
| 15 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | ✅ |
| 16 | `shipToAddress` | Ship-to Address | Ship-to Address | ✅ |
| 17 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | ✅ |
| 18 | `shipToCity` | Ship-to City | Ship-to City | ✅ |
| 19 | `shipToContact` | Ship-to Contact | Ship-to Contact | ✅ |
| 20 | `orderDate` | Order Date | Order Date | ✅ |
| 21 | `postingDate` | Posting Date | Posting Date | ✅ |
| 22 | `shipmentDate` | Shipment Date | Shipment Date | ✅ |
| 23 | `postingDescription` | Posting Description | Posting Description | ✅ |
| 24 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 25 | `dueDate` | Due Date | Due Date | ✅ |
| 26 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 27 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 28 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 29 | `locationCode` | Location Code | Location Code | ✅ |
| 30 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 31 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 32 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | ✅ |
| 33 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 34 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 35 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 36 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 37 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 38 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 39 | `languageCode` | Language Code | Language Code | ✅ |
| 40 | `formatRegion` | Format Region | Format Region | ✅ |
| 41 | `salespersonCode` | Salesperson Code | Salesperson Code | ✅ |
| 42 | `orderClass` | Order Class | Order Class | ✅ |
| 43 | `comment` | Comment | Comment | 🧮 computed |
| 44 | `noPrinted` | No. Printed | No. Printed | ✅ |
| 45 | `onHold` | On Hold | On Hold | ✅ |
| 46 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 47 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 48 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 49 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | 🧮 computed |
| 50 | `ship` | Ship | Ship | ✅ |
| 51 | `invoice` | Invoice | Invoice | ✅ |
| 52 | `printPostedDocuments` | Print Posted Documents | Print Posted Documents | ✅ |
| 53 | `amount` | Amount | Amount | 🧮 computed |
| 54 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 55 | `shippingNo` | Shipping No. | Shipping No. | ✅ |
| 56 | `postingNo` | Posting No. | Posting No. | ✅ |
| 57 | `lastShippingNo` | Last Shipping No. | Last Shipping No. | ✅ |
| 58 | `lastPostingNo` | Last Posting No. | Last Posting No. | ✅ |
| 59 | `prepaymentNo` | Prepayment No. | Prepayment No. | ✅ |
| 60 | `lastPrepaymentNo` | Last Prepayment No. | Last Prepayment No. | ✅ |
| 61 | `prepmtCrMemoNo` | Prepmt. Cr. Memo No. | Prepmt. Cr. Memo No. | ✅ |
| 62 | `lastPrepmtCrMemoNo` | Last Prepmt. Cr. Memo No. | Last Prepmt. Cr. Memo No. | ✅ |
| 63 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 64 | `combineShipments` | Combine Shipments | Combine Shipments | ✅ |
| 65 | `registrationNumber` | Registration Number | Registration No. | ✅ |
| 66 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 67 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 68 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | ✅ |
| 69 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 70 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 71 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | ✅ |
| 72 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | ✅ |
| 73 | `sellToCustomerName2` | Sell-to Customer Name 2 | Sell-to Customer Name 2 | ✅ |
| 74 | `sellToAddress` | Sell-to Address | Sell-to Address | ✅ |
| 75 | `sellToAddress2` | Sell-to Address 2 | Sell-to Address 2 | ✅ |
| 76 | `sellToCity` | Sell-to City | Sell-to City | ✅ |
| 77 | `sellToContact` | Sell-to Contact | Sell-to Contact | ✅ |
| 78 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | ✅ |
| 79 | `billToCounty` | Bill-to County | Bill-to County | ✅ |
| 80 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | ✅ |
| 81 | `sellToPostCode` | Sell-to Post Code | Sell-to Post Code | ✅ |
| 82 | `sellToCounty` | Sell-to County | Sell-to County | ✅ |
| 83 | `sellToCountryRegionCode` | Sell-to Country/Region Code | Sell-to Country/Region Code | ✅ |
| 84 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | ✅ |
| 85 | `shipToCounty` | Ship-to County | Ship-to County | ✅ |
| 86 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | ✅ |
| 87 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 88 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 89 | `correction` | Correction | Correction | ✅ |
| 90 | `documentDate` | Document Date | Document Date | ✅ |
| 91 | `externalDocumentNo` | External Document No. | External Document No. | ✅ |
| 92 | `areaCode` | Area | Area | ✅ |
| 93 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 94 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 95 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 96 | `packageTrackingNo` | Package Tracking No. | Package Tracking No. | ✅ |
| 97 | `noSeries` | No. Series | No. Series | ✅ |
| 98 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 99 | `shippingNoSeries` | Shipping No. Series | Shipping No. Series | ✅ |
| 100 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 101 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 102 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 103 | `reserve` | Reserve | Reserve | ✅ |
| 104 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 105 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 106 | `status` | Status | Status | ✅ |
| 107 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | ✅ |
| 108 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | ✅ |
| 109 | `sendIcDocument` | Send IC Document | Send IC Document | ✅ |
| 110 | `icStatus` | IC Status | IC Status | ✅ |
| 111 | `sellToIcPartnerCode` | Sell-to IC Partner Code | Sell-to IC Partner Code | ✅ |
| 112 | `billToIcPartnerCode` | Bill-to IC Partner Code | Bill-to IC Partner Code | ✅ |
| 113 | `icReferenceDocumentNo` | IC Reference Document No. | IC Reference Document No. | ✅ |
| 114 | `icDirection` | IC Direction | IC Direction | ✅ |
| 115 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 116 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | ✅ |
| 117 | `compressPrepayment` | Compress Prepayment | Compress Prepayment | ✅ |
| 118 | `prepaymentDueDate` | Prepayment Due Date | Prepayment Due Date | ✅ |
| 119 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | ✅ |
| 120 | `prepmtPostingDescription` | Prepmt. Posting Description | Prepmt. Posting Description | ✅ |
| 121 | `prepmtPmtDiscountDate` | Prepmt. Pmt. Discount Date | Prepmt. Pmt. Discount Date | ✅ |
| 122 | `prepmtPaymentTermsCode` | Prepmt. Payment Terms Code | Prepmt. Payment Terms Code | ✅ |
| 123 | `prepmtPaymentDiscountPct` | Prepmt. Payment Discount % | Prepmt. Payment Discount % | ✅ |
| 124 | `quoteNo` | Quote No. | Quote No. | ✅ |
| 125 | `quoteValidUntilDate` | Quote Valid Until Date | Quote Valid To Date | ✅ |
| 126 | `quoteSentToCustomer` | Quote Sent to Customer | Quote Sent to Customer | ✅ |
| 127 | `quoteAccepted` | Quote Accepted | Quote Accepted | ✅ |
| 128 | `quoteAcceptedDate` | Quote Accepted Date | Quote Accepted Date | ✅ |
| 129 | `jobQueueStatus` | Job Queue Status | Job Queue Status | ✅ |
| 130 | `jobQueueEntryId` | Job Queue Entry ID | Job Queue Entry ID | ✅ |
| 131 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | ✅ |
| 132 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 133 | `altVatRegistrationNo` | Alt. VAT Registration No. | Alternative VAT Registration No. | ✅ |
| 134 | `altGenBusPostingGroup` | Alt. Gen. Bus Posting Group | Alternative Gen. Bus. Posting Group | ✅ |
| 135 | `altVatBusPostingGroup` | Alt. VAT Bus Posting Group | Alternative VAT Bus. Posting Group | ✅ |
| 136 | `istest` | IsTest | IsTest | ✅ |
| 137 | `sellToPhoneNo` | Sell-to Phone No. | Sell-to Phone No. | ✅ |
| 138 | `sellToEMail` | Sell-to E-Mail | Email | ✅ |
| 139 | `journalTemplName` | Journal Templ. Name | Journal Template Name | ✅ |
| 140 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 141 | `rcvdFromCountRegionCode` | Rcvd.-from Count./Region Code | Received-from Country/Region Code | ✅ |
| 142 | `lastEmailSentTime` | Last Email Sent Time | Last Email Sent Time | 🧮 computed |
| 143 | `lastEmailSentMessageId` | Last Email Sent Message Id | Last Email Sent Message Id | 🧮 computed |
| 144 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | ✅ |
| 145 | `amtShipNotInvLcy` | Amt. Ship. Not Inv. (LCY) | Amount Shipped Not Invoiced (LCY) Incl. VAT | 🧮 computed |
| 146 | `amtShipNotInvLcyBase` | Amt. Ship. Not Inv. (LCY) Base | Amount Shipped Not Invoiced (LCY) | 🧮 computed |
| 147 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 148 | `paymentServiceSetId` | Payment Service Set ID | Payment Service Set ID | ✅ |
| 149 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dynamics 365 Sales | 🧮 computed |
| 150 | `directDebitMandateId` | Direct Debit Mandate ID | Direct Debit Mandate ID | ✅ |
| 151 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 152 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 153 | `docNoOccurrence` | Doc. No. Occurrence | Doc. No. Occurrence | ✅ |
| 154 | `campaignNo` | Campaign No. | Campaign No. | ✅ |
| 155 | `sellToContactNo` | Sell-to Contact No. | Sell-to Contact No. | ✅ |
| 156 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | ✅ |
| 157 | `opportunityNo` | Opportunity No. | Opportunity No. | ✅ |
| 158 | `sellToCustomerTemplCode` | Sell-to Customer Templ. Code | Sell-to Customer Template Code | ✅ |
| 159 | `billToCustomerTemplCode` | Bill-to Customer Templ. Code | Bill-to Customer Template Code | ✅ |
| 160 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 161 | `shippingAdvice` | Shipping Advice | Shipping Advice | ✅ |
| 162 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | 🧮 computed |
| 163 | `completelyShipped` | Completely Shipped | Completely Shipped | 🧮 computed |
| 164 | `postingFromWhseRef` | Posting from Whse. Ref. | Posting from Whse. Ref. | ✅ |
| 165 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 166 | `shipped` | Shipped | Shipped | 🧮 computed |
| 167 | `lastShipmentDate` | Last Shipment Date | Last Shipment Date | 🧮 computed |
| 168 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | ✅ |
| 169 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | ✅ |
| 170 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 171 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | ✅ |
| 172 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 173 | `lateOrderShipping` | Late Order Shipping | Late Order Shipping | 🧮 computed |
| 174 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 175 | `receive` | Receive | Receive | ✅ |
| 176 | `returnReceiptNo` | Return Receipt No. | Return Receipt No. | ✅ |
| 177 | `returnReceiptNoSeries` | Return Receipt No. Series | Return Receipt No. Series | ✅ |
| 178 | `lastReturnReceiptNo` | Last Return Receipt No. | Last Return Receipt No. | ✅ |
| 179 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 180 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 181 | `getShipmentUsed` | Get Shipment Used | Get Shipment Used | ✅ |
| 182 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfSalesOrderLines

**Description:** Lines of open sales orders.

| Property | Value |
|---|---|
| **Source Table** | Sales Line |
| Page ID | 90873 |
| Page Name | `ocpfSalesOrderLines` |
| Entity Set Name | `ocpfSalesOrderLines` |
| API Group | `ocpf_sales` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Order)` |
| Field Count | 194 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 4 | `documentNo` | Document No. | Document No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `type` | Type | Type | ✅ |
| 7 | `no` | No. | No. | ✅ |
| 8 | `locationCode` | Location Code | Location Code | ✅ |
| 9 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 10 | `shipmentDate` | Shipment Date | Shipment Date | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `description2` | Description 2 | Description 2 | ✅ |
| 13 | `unitOfMeasure` | Unit of Measure | Unit of Measure | ✅ |
| 14 | `quantity` | Quantity | Quantity | ✅ |
| 15 | `outstandingQuantity` | Outstanding Quantity | Outstanding Quantity | ✅ |
| 16 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | ✅ |
| 17 | `qtyToShip` | Qty. to Ship | Qty. to Ship | ✅ |
| 18 | `unitPrice` | Unit Price | Unit Price | ✅ |
| 19 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | ✅ |
| 20 | `vatPct` | VAT % | VAT % | ✅ |
| 21 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 22 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 23 | `amount` | Amount | Amount | ✅ |
| 24 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | ✅ |
| 25 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 26 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 27 | `netWeight` | Net Weight | Net Weight | ✅ |
| 28 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 29 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 30 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 31 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 32 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 33 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 34 | `jobNo` | Job No. | Project No. | ✅ |
| 35 | `workTypeCode` | Work Type Code | Work Type Code | ✅ |
| 36 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | ✅ |
| 37 | `outstandingAmount` | Outstanding Amount | Outstanding Amount | ✅ |
| 38 | `qtyShippedNotInvoiced` | Qty. Shipped Not Invoiced | Qty. Shipped Not Invoiced | ✅ |
| 39 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | ✅ |
| 40 | `quantityShipped` | Quantity Shipped | Quantity Shipped | ✅ |
| 41 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | ✅ |
| 42 | `shipmentNo` | Shipment No. | Shipment No. | ✅ |
| 43 | `shipmentLineNo` | Shipment Line No. | Shipment Line No. | ✅ |
| 44 | `profitPct` | Profit % | Profit % | ✅ |
| 45 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 46 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | ✅ |
| 47 | `purchaseOrderNo` | Purchase Order No. | Purchase Order No. | ✅ |
| 48 | `purchOrderLineNo` | Purch. Order Line No. | Purch. Order Line No. | ✅ |
| 49 | `dropShipment` | Drop Shipment | Drop Shipment | ✅ |
| 50 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 51 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 52 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 53 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 54 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 55 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | ✅ |
| 56 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 57 | `areaCode` | Area | Area | ✅ |
| 58 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 59 | `taxCategory` | Tax Category | Tax Category | ✅ |
| 60 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 61 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 62 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 63 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | ✅ |
| 64 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 65 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 66 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 67 | `outstandingAmountLcy` | Outstanding Amount (LCY) | Outstanding Amount (LCY) | ✅ |
| 68 | `shippedNotInvoicedLcy` | Shipped Not Invoiced (LCY) | Shipped Not Invoiced (LCY) Incl. VAT | ✅ |
| 69 | `shippedNotInvLcyNoVat` | Shipped Not Inv. (LCY) No VAT | Shipped Not Invoiced (LCY) | ✅ |
| 70 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 71 | `reserve` | Reserve | Reserve | ✅ |
| 72 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | ✅ |
| 73 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | ✅ |
| 74 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 75 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 76 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 77 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 78 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 79 | `invDiscAmountToInvoice` | Inv. Disc. Amount to Invoice | Inv. Disc. Amount to Invoice | ✅ |
| 80 | `vatIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 81 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | ✅ |
| 82 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | ✅ |
| 83 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 84 | `prepmtLineAmount` | Prepmt. Line Amount | Prepmt. Line Amount | ✅ |
| 85 | `prepmtAmtInv` | Prepmt. Amt. Inv. | Prepmt. Amt. Inv. | ✅ |
| 86 | `prepmtAmtInclVat` | Prepmt. Amt. Incl. VAT | Prepmt. Amt. Incl. VAT | ✅ |
| 87 | `prepaymentAmount` | Prepayment Amount | Prepayment Amount | ✅ |
| 88 | `prepmtVatBaseAmt` | Prepmt. VAT Base Amt. | Prepmt. VAT Base Amt. | ✅ |
| 89 | `prepaymentVatPct` | Prepayment VAT % | Prepayment VAT % | ✅ |
| 90 | `prepmtVatCalcType` | Prepmt. VAT Calc. Type | Prepmt. VAT Calc. Type | ✅ |
| 91 | `prepaymentVatIdentifier` | Prepayment VAT Identifier | Prepayment VAT Identifier | ✅ |
| 92 | `prepaymentTaxAreaCode` | Prepayment Tax Area Code | Prepayment Tax Area Code | ✅ |
| 93 | `prepaymentTaxLiable` | Prepayment Tax Liable | Prepayment Tax Liable | ✅ |
| 94 | `prepaymentTaxGroupCode` | Prepayment Tax Group Code | Prepayment Tax Group Code | ✅ |
| 95 | `prepmtAmtToDeduct` | Prepmt Amt to Deduct | Prepmt Amt to Deduct | ✅ |
| 96 | `prepmtAmtDeducted` | Prepmt Amt Deducted | Prepmt Amt Deducted | ✅ |
| 97 | `prepaymentLine` | Prepayment Line | Prepayment Line | ✅ |
| 98 | `prepmtAmountInvInclVat` | Prepmt. Amount Inv. Incl. VAT | Prepmt. Amount Inv. Incl. VAT | ✅ |
| 99 | `prepmtAmountInvLcy` | Prepmt. Amount Inv. (LCY) | Prepmt. Amount Inv. (LCY) | ✅ |
| 100 | `icPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 101 | `prepmtVatAmountInvLcy` | Prepmt. VAT Amount Inv. (LCY) | Prepmt. VAT Amount Inv. (LCY) | ✅ |
| 102 | `prepaymentVatDifference` | Prepayment VAT Difference | Prepayment VAT Difference | ✅ |
| 103 | `prepmtVatDiffToDeduct` | Prepmt VAT Diff. to Deduct | Prepmt VAT Diff. to Deduct | ✅ |
| 104 | `prepmtVatDiffDeducted` | Prepmt VAT Diff. Deducted | Prepmt VAT Diff. Deducted | ✅ |
| 105 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | ✅ |
| 106 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | ✅ |
| 107 | `prepmtPmtDiscountAmount` | Prepmt. Pmt. Discount Amount | Prepmt. Pmt. Discount Amount | ✅ |
| 108 | `lineDiscountCalculation` | Line Discount Calculation | Line Discount Calculation | ✅ |
| 109 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 110 | `qtyToAssembleToOrder` | Qty. to Assemble to Order | Qty. to Assemble to Order | ✅ |
| 111 | `qtyToAsmToOrderBase` | Qty. to Asm. to Order (Base) | Qty. to Asm. to Order (Base) | ✅ |
| 112 | `atoWhseOutstandingQty` | ATO Whse. Outstanding Qty. | ATO Whse. Outstanding Qty. | 🧮 computed |
| 113 | `atoWhseOutstdQtyBase` | ATO Whse. Outstd. Qty. (Base) | ATO Whse. Outstd. Qty. (Base) | 🧮 computed |
| 114 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 115 | `jobContractEntryNo` | Job Contract Entry No. | Project Contract Entry No. | ✅ |
| 116 | `postingDate` | Posting Date | Posting Date | 🧮 computed |
| 117 | `deferralCode` | Deferral Code | Deferral Code | ✅ |
| 118 | `returnsDeferralStartDate` | Returns Deferral Start Date | Returns Deferral Start Date | ✅ |
| 119 | `selectedAllocAccountNo` | Selected Alloc. Account No. | Allocation Account No. | ✅ |
| 120 | `allocAccModifiedByUser` | Alloc. Acc. Modified by User | Allocation Account Distributions Modified | 🧮 computed |
| 121 | `allocationAccountNo` | Allocation Account No. | Posting Allocation Account No. | ✅ |
| 122 | `allocSalesLineSystemid` | Alloc. Sales Line SystemId | Allocation Sales Line SystemId | ✅ |
| 123 | `variantCode` | Variant Code | Variant Code | ✅ |
| 124 | `binCode` | Bin Code | Bin Code | ✅ |
| 125 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 126 | `planned` | Planned | Planned | ✅ |
| 127 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 128 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 129 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 130 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 131 | `outstandingQtyBase` | Outstanding Qty. (Base) | Outstanding Qty. (Base) | ✅ |
| 132 | `qtyToInvoiceBase` | Qty. to Invoice (Base) | Qty. to Invoice (Base) | ✅ |
| 133 | `qtyToShipBase` | Qty. to Ship (Base) | Qty. to Ship (Base) | ✅ |
| 134 | `qtyShippedNotInvdBase` | Qty. Shipped Not Invd. (Base) | Qty. Shipped Not Invd. (Base) | ✅ |
| 135 | `qtyShippedBase` | Qty. Shipped (Base) | Qty. Shipped (Base) | ✅ |
| 136 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | ✅ |
| 137 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 138 | `faPostingDate` | FA Posting Date | FA Posting Date | ✅ |
| 139 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | ✅ |
| 140 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | ✅ |
| 141 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | ✅ |
| 142 | `useDuplicationList` | Use Duplication List | Use Duplication List | ✅ |
| 143 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 144 | `outOfStockSubstitution` | Out-of-Stock Substitution | Out-of-Stock Substitution | ✅ |
| 145 | `substitutionAvailable` | Substitution Available | Substitution Available | 🧮 computed |
| 146 | `originallyOrderedNo` | Originally Ordered No. | Originally Ordered No. | ✅ |
| 147 | `originallyOrderedVarCode` | Originally Ordered Var. Code | Originally Ordered Var. Code | ✅ |
| 148 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 149 | `nonstock` | Nonstock | Catalog | ✅ |
| 150 | `purchasingCode` | Purchasing Code | Purchasing Code | ✅ |
| 151 | `specialOrder` | Special Order | Special Order | ✅ |
| 152 | `specialOrderPurchaseNo` | Special Order Purchase No. | Special Order Purchase No. | ✅ |
| 153 | `specialOrderPurchLineNo` | Special Order Purch. Line No. | Special Order Purch. Line No. | ✅ |
| 154 | `itemReferenceNo` | Item Reference No. | Item Reference No. | ✅ |
| 155 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Reference Unit of Measure | ✅ |
| 156 | `itemReferenceType` | Item Reference Type | Item Reference Type | ✅ |
| 157 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | ✅ |
| 158 | `whseOutstandingQty` | Whse. Outstanding Qty. | Whse. Outstanding Qty. | 🧮 computed |
| 159 | `whseOutstandingQtyBase` | Whse. Outstanding Qty. (Base) | Whse. Outstanding Qty. (Base) | 🧮 computed |
| 160 | `completelyShipped` | Completely Shipped | Completely Shipped | ✅ |
| 161 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | ✅ |
| 162 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | ✅ |
| 163 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 164 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | ✅ |
| 165 | `plannedDeliveryDate` | Planned Delivery Date | Planned Delivery Date | ✅ |
| 166 | `plannedShipmentDate` | Planned Shipment Date | Planned Shipment Date | ✅ |
| 167 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 168 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 169 | `allowItemChargeAssignment` | Allow Item Charge Assignment | Allow Item Charge Assignment | ✅ |
| 170 | `qtyToAssign` | Qty. to Assign | Qty. to Assign | 🧮 computed |
| 171 | `qtyAssigned` | Qty. Assigned | Qty. Assigned | 🧮 computed |
| 172 | `returnQtyToReceive` | Return Qty. to Receive | Return Qty. to Receive | ✅ |
| 173 | `returnQtyToReceiveBase` | Return Qty. to Receive (Base) | Return Qty. to Receive (Base) | ✅ |
| 174 | `returnQtyRcdNotInvd` | Return Qty. Rcd. Not Invd. | Return Qty. Rcd. Not Invd. | ✅ |
| 175 | `retQtyRcdNotInvdBase` | Ret. Qty. Rcd. Not Invd.(Base) | Ret. Qty. Rcd. Not Invd.(Base) | ✅ |
| 176 | `returnRcdNotInvd` | Return Rcd. Not Invd. | Return Rcd. Not Invd. | ✅ |
| 177 | `returnRcdNotInvdLcy` | Return Rcd. Not Invd. (LCY) | Return Rcd. Not Invd. (LCY) | ✅ |
| 178 | `returnQtyReceived` | Return Qty. Received | Return Qty. Received | ✅ |
| 179 | `returnQtyReceivedBase` | Return Qty. Received (Base) | Return Qty. Received (Base) | ✅ |
| 180 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | ✅ |
| 181 | `itemChargeQtyToHandle` | Item Charge Qty. to Handle | Item Charge Qty. to Handle | 🧮 computed |
| 182 | `bomItemNo` | BOM Item No. | BOM Item No. | ✅ |
| 183 | `returnReceiptNo` | Return Receipt No. | Return Receipt No. | ✅ |
| 184 | `returnReceiptLineNo` | Return Receipt Line No. | Return Receipt Line No. | ✅ |
| 185 | `returnReasonCode` | Return Reason Code | Return Reason Code | ✅ |
| 186 | `copiedFromPostedDoc` | Copied From Posted Doc. | Copied From Posted Doc. | ✅ |
| 187 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 188 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 189 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 190 | `subtype` | Subtype | Subtype | ✅ |
| 191 | `priceDescription` | Price description | Price description | ✅ |
| 192 | `attachedDocCount` | Attached Doc Count | Attached Doc Count | 🧮 computed |
| 193 | `attachedLinesCount` | Attached Lines Count | Attached Lines Count | 🧮 computed |
| 194 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfSalesInvoices

**Description:** Sales invoices (open, unposted).

| Property | Value |
|---|---|
| **Source Table** | Sales Header |
| Page ID | 90874 |
| Page Name | `ocpfSalesInvoices` |
| Entity Set Name | `ocpfSalesInvoices` |
| API Group | `ocpf_sales` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Invoice)` |
| Field Count | 182 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 4 | `no` | No. | No. | ✅ |
| 5 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 6 | `billToName` | Bill-to Name | Bill-to Name | ✅ |
| 7 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | ✅ |
| 8 | `billToAddress` | Bill-to Address | Bill-to Address | ✅ |
| 9 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | ✅ |
| 10 | `billToCity` | Bill-to City | Bill-to City | ✅ |
| 11 | `billToContact` | Bill-to Contact | Bill-to Contact | ✅ |
| 12 | `yourReference` | Your Reference | Your Reference | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `shipToName` | Ship-to Name | Ship-to Name | ✅ |
| 15 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | ✅ |
| 16 | `shipToAddress` | Ship-to Address | Ship-to Address | ✅ |
| 17 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | ✅ |
| 18 | `shipToCity` | Ship-to City | Ship-to City | ✅ |
| 19 | `shipToContact` | Ship-to Contact | Ship-to Contact | ✅ |
| 20 | `orderDate` | Order Date | Order Date | ✅ |
| 21 | `postingDate` | Posting Date | Posting Date | ✅ |
| 22 | `shipmentDate` | Shipment Date | Shipment Date | ✅ |
| 23 | `postingDescription` | Posting Description | Posting Description | ✅ |
| 24 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 25 | `dueDate` | Due Date | Due Date | ✅ |
| 26 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 27 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 28 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 29 | `locationCode` | Location Code | Location Code | ✅ |
| 30 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 31 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 32 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | ✅ |
| 33 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 34 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 35 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 36 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 37 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 38 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 39 | `languageCode` | Language Code | Language Code | ✅ |
| 40 | `formatRegion` | Format Region | Format Region | ✅ |
| 41 | `salespersonCode` | Salesperson Code | Salesperson Code | ✅ |
| 42 | `orderClass` | Order Class | Order Class | ✅ |
| 43 | `comment` | Comment | Comment | 🧮 computed |
| 44 | `noPrinted` | No. Printed | No. Printed | ✅ |
| 45 | `onHold` | On Hold | On Hold | ✅ |
| 46 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 47 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 48 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 49 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | 🧮 computed |
| 50 | `ship` | Ship | Ship | ✅ |
| 51 | `invoice` | Invoice | Invoice | ✅ |
| 52 | `printPostedDocuments` | Print Posted Documents | Print Posted Documents | ✅ |
| 53 | `amount` | Amount | Amount | 🧮 computed |
| 54 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 55 | `shippingNo` | Shipping No. | Shipping No. | ✅ |
| 56 | `postingNo` | Posting No. | Posting No. | ✅ |
| 57 | `lastShippingNo` | Last Shipping No. | Last Shipping No. | ✅ |
| 58 | `lastPostingNo` | Last Posting No. | Last Posting No. | ✅ |
| 59 | `prepaymentNo` | Prepayment No. | Prepayment No. | ✅ |
| 60 | `lastPrepaymentNo` | Last Prepayment No. | Last Prepayment No. | ✅ |
| 61 | `prepmtCrMemoNo` | Prepmt. Cr. Memo No. | Prepmt. Cr. Memo No. | ✅ |
| 62 | `lastPrepmtCrMemoNo` | Last Prepmt. Cr. Memo No. | Last Prepmt. Cr. Memo No. | ✅ |
| 63 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 64 | `combineShipments` | Combine Shipments | Combine Shipments | ✅ |
| 65 | `registrationNumber` | Registration Number | Registration No. | ✅ |
| 66 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 67 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 68 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | ✅ |
| 69 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 70 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 71 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | ✅ |
| 72 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | ✅ |
| 73 | `sellToCustomerName2` | Sell-to Customer Name 2 | Sell-to Customer Name 2 | ✅ |
| 74 | `sellToAddress` | Sell-to Address | Sell-to Address | ✅ |
| 75 | `sellToAddress2` | Sell-to Address 2 | Sell-to Address 2 | ✅ |
| 76 | `sellToCity` | Sell-to City | Sell-to City | ✅ |
| 77 | `sellToContact` | Sell-to Contact | Sell-to Contact | ✅ |
| 78 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | ✅ |
| 79 | `billToCounty` | Bill-to County | Bill-to County | ✅ |
| 80 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | ✅ |
| 81 | `sellToPostCode` | Sell-to Post Code | Sell-to Post Code | ✅ |
| 82 | `sellToCounty` | Sell-to County | Sell-to County | ✅ |
| 83 | `sellToCountryRegionCode` | Sell-to Country/Region Code | Sell-to Country/Region Code | ✅ |
| 84 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | ✅ |
| 85 | `shipToCounty` | Ship-to County | Ship-to County | ✅ |
| 86 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | ✅ |
| 87 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 88 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 89 | `correction` | Correction | Correction | ✅ |
| 90 | `documentDate` | Document Date | Document Date | ✅ |
| 91 | `externalDocumentNo` | External Document No. | External Document No. | ✅ |
| 92 | `areaCode` | Area | Area | ✅ |
| 93 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 94 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 95 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 96 | `packageTrackingNo` | Package Tracking No. | Package Tracking No. | ✅ |
| 97 | `noSeries` | No. Series | No. Series | ✅ |
| 98 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 99 | `shippingNoSeries` | Shipping No. Series | Shipping No. Series | ✅ |
| 100 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 101 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 102 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 103 | `reserve` | Reserve | Reserve | ✅ |
| 104 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 105 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 106 | `status` | Status | Status | ✅ |
| 107 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | ✅ |
| 108 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | ✅ |
| 109 | `sendIcDocument` | Send IC Document | Send IC Document | ✅ |
| 110 | `icStatus` | IC Status | IC Status | ✅ |
| 111 | `sellToIcPartnerCode` | Sell-to IC Partner Code | Sell-to IC Partner Code | ✅ |
| 112 | `billToIcPartnerCode` | Bill-to IC Partner Code | Bill-to IC Partner Code | ✅ |
| 113 | `icReferenceDocumentNo` | IC Reference Document No. | IC Reference Document No. | ✅ |
| 114 | `icDirection` | IC Direction | IC Direction | ✅ |
| 115 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 116 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | ✅ |
| 117 | `compressPrepayment` | Compress Prepayment | Compress Prepayment | ✅ |
| 118 | `prepaymentDueDate` | Prepayment Due Date | Prepayment Due Date | ✅ |
| 119 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | ✅ |
| 120 | `prepmtPostingDescription` | Prepmt. Posting Description | Prepmt. Posting Description | ✅ |
| 121 | `prepmtPmtDiscountDate` | Prepmt. Pmt. Discount Date | Prepmt. Pmt. Discount Date | ✅ |
| 122 | `prepmtPaymentTermsCode` | Prepmt. Payment Terms Code | Prepmt. Payment Terms Code | ✅ |
| 123 | `prepmtPaymentDiscountPct` | Prepmt. Payment Discount % | Prepmt. Payment Discount % | ✅ |
| 124 | `quoteNo` | Quote No. | Quote No. | ✅ |
| 125 | `quoteValidUntilDate` | Quote Valid Until Date | Quote Valid To Date | ✅ |
| 126 | `quoteSentToCustomer` | Quote Sent to Customer | Quote Sent to Customer | ✅ |
| 127 | `quoteAccepted` | Quote Accepted | Quote Accepted | ✅ |
| 128 | `quoteAcceptedDate` | Quote Accepted Date | Quote Accepted Date | ✅ |
| 129 | `jobQueueStatus` | Job Queue Status | Job Queue Status | ✅ |
| 130 | `jobQueueEntryId` | Job Queue Entry ID | Job Queue Entry ID | ✅ |
| 131 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | ✅ |
| 132 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 133 | `altVatRegistrationNo` | Alt. VAT Registration No. | Alternative VAT Registration No. | ✅ |
| 134 | `altGenBusPostingGroup` | Alt. Gen. Bus Posting Group | Alternative Gen. Bus. Posting Group | ✅ |
| 135 | `altVatBusPostingGroup` | Alt. VAT Bus Posting Group | Alternative VAT Bus. Posting Group | ✅ |
| 136 | `istest` | IsTest | IsTest | ✅ |
| 137 | `sellToPhoneNo` | Sell-to Phone No. | Sell-to Phone No. | ✅ |
| 138 | `sellToEMail` | Sell-to E-Mail | Email | ✅ |
| 139 | `journalTemplName` | Journal Templ. Name | Journal Template Name | ✅ |
| 140 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 141 | `rcvdFromCountRegionCode` | Rcvd.-from Count./Region Code | Received-from Country/Region Code | ✅ |
| 142 | `lastEmailSentTime` | Last Email Sent Time | Last Email Sent Time | 🧮 computed |
| 143 | `lastEmailSentMessageId` | Last Email Sent Message Id | Last Email Sent Message Id | 🧮 computed |
| 144 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | ✅ |
| 145 | `amtShipNotInvLcy` | Amt. Ship. Not Inv. (LCY) | Amount Shipped Not Invoiced (LCY) Incl. VAT | 🧮 computed |
| 146 | `amtShipNotInvLcyBase` | Amt. Ship. Not Inv. (LCY) Base | Amount Shipped Not Invoiced (LCY) | 🧮 computed |
| 147 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 148 | `paymentServiceSetId` | Payment Service Set ID | Payment Service Set ID | ✅ |
| 149 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dynamics 365 Sales | 🧮 computed |
| 150 | `directDebitMandateId` | Direct Debit Mandate ID | Direct Debit Mandate ID | ✅ |
| 151 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 152 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 153 | `docNoOccurrence` | Doc. No. Occurrence | Doc. No. Occurrence | ✅ |
| 154 | `campaignNo` | Campaign No. | Campaign No. | ✅ |
| 155 | `sellToContactNo` | Sell-to Contact No. | Sell-to Contact No. | ✅ |
| 156 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | ✅ |
| 157 | `opportunityNo` | Opportunity No. | Opportunity No. | ✅ |
| 158 | `sellToCustomerTemplCode` | Sell-to Customer Templ. Code | Sell-to Customer Template Code | ✅ |
| 159 | `billToCustomerTemplCode` | Bill-to Customer Templ. Code | Bill-to Customer Template Code | ✅ |
| 160 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 161 | `shippingAdvice` | Shipping Advice | Shipping Advice | ✅ |
| 162 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | 🧮 computed |
| 163 | `completelyShipped` | Completely Shipped | Completely Shipped | 🧮 computed |
| 164 | `postingFromWhseRef` | Posting from Whse. Ref. | Posting from Whse. Ref. | ✅ |
| 165 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 166 | `shipped` | Shipped | Shipped | 🧮 computed |
| 167 | `lastShipmentDate` | Last Shipment Date | Last Shipment Date | 🧮 computed |
| 168 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | ✅ |
| 169 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | ✅ |
| 170 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 171 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | ✅ |
| 172 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 173 | `lateOrderShipping` | Late Order Shipping | Late Order Shipping | 🧮 computed |
| 174 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 175 | `receive` | Receive | Receive | ✅ |
| 176 | `returnReceiptNo` | Return Receipt No. | Return Receipt No. | ✅ |
| 177 | `returnReceiptNoSeries` | Return Receipt No. Series | Return Receipt No. Series | ✅ |
| 178 | `lastReturnReceiptNo` | Last Return Receipt No. | Last Return Receipt No. | ✅ |
| 179 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 180 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 181 | `getShipmentUsed` | Get Shipment Used | Get Shipment Used | ✅ |
| 182 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfSalesInvoiceLines

**Description:** Lines of open sales invoices.

| Property | Value |
|---|---|
| **Source Table** | Sales Line |
| Page ID | 90875 |
| Page Name | `ocpfSalesInvoiceLines` |
| Entity Set Name | `ocpfSalesInvoiceLines` |
| API Group | `ocpf_sales` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Invoice)` |
| Field Count | 194 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 4 | `documentNo` | Document No. | Document No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `type` | Type | Type | ✅ |
| 7 | `no` | No. | No. | ✅ |
| 8 | `locationCode` | Location Code | Location Code | ✅ |
| 9 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 10 | `shipmentDate` | Shipment Date | Shipment Date | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `description2` | Description 2 | Description 2 | ✅ |
| 13 | `unitOfMeasure` | Unit of Measure | Unit of Measure | ✅ |
| 14 | `quantity` | Quantity | Quantity | ✅ |
| 15 | `outstandingQuantity` | Outstanding Quantity | Outstanding Quantity | ✅ |
| 16 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | ✅ |
| 17 | `qtyToShip` | Qty. to Ship | Qty. to Ship | ✅ |
| 18 | `unitPrice` | Unit Price | Unit Price | ✅ |
| 19 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | ✅ |
| 20 | `vatPct` | VAT % | VAT % | ✅ |
| 21 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 22 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 23 | `amount` | Amount | Amount | ✅ |
| 24 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | ✅ |
| 25 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 26 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 27 | `netWeight` | Net Weight | Net Weight | ✅ |
| 28 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 29 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 30 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 31 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 32 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 33 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 34 | `jobNo` | Job No. | Project No. | ✅ |
| 35 | `workTypeCode` | Work Type Code | Work Type Code | ✅ |
| 36 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | ✅ |
| 37 | `outstandingAmount` | Outstanding Amount | Outstanding Amount | ✅ |
| 38 | `qtyShippedNotInvoiced` | Qty. Shipped Not Invoiced | Qty. Shipped Not Invoiced | ✅ |
| 39 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | ✅ |
| 40 | `quantityShipped` | Quantity Shipped | Quantity Shipped | ✅ |
| 41 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | ✅ |
| 42 | `shipmentNo` | Shipment No. | Shipment No. | ✅ |
| 43 | `shipmentLineNo` | Shipment Line No. | Shipment Line No. | ✅ |
| 44 | `profitPct` | Profit % | Profit % | ✅ |
| 45 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 46 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | ✅ |
| 47 | `purchaseOrderNo` | Purchase Order No. | Purchase Order No. | ✅ |
| 48 | `purchOrderLineNo` | Purch. Order Line No. | Purch. Order Line No. | ✅ |
| 49 | `dropShipment` | Drop Shipment | Drop Shipment | ✅ |
| 50 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 51 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 52 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 53 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 54 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 55 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | ✅ |
| 56 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 57 | `areaCode` | Area | Area | ✅ |
| 58 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 59 | `taxCategory` | Tax Category | Tax Category | ✅ |
| 60 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 61 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 62 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 63 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | ✅ |
| 64 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 65 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 66 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 67 | `outstandingAmountLcy` | Outstanding Amount (LCY) | Outstanding Amount (LCY) | ✅ |
| 68 | `shippedNotInvoicedLcy` | Shipped Not Invoiced (LCY) | Shipped Not Invoiced (LCY) Incl. VAT | ✅ |
| 69 | `shippedNotInvLcyNoVat` | Shipped Not Inv. (LCY) No VAT | Shipped Not Invoiced (LCY) | ✅ |
| 70 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 71 | `reserve` | Reserve | Reserve | ✅ |
| 72 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | ✅ |
| 73 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | ✅ |
| 74 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 75 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 76 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 77 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 78 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 79 | `invDiscAmountToInvoice` | Inv. Disc. Amount to Invoice | Inv. Disc. Amount to Invoice | ✅ |
| 80 | `vatIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 81 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | ✅ |
| 82 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | ✅ |
| 83 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 84 | `prepmtLineAmount` | Prepmt. Line Amount | Prepmt. Line Amount | ✅ |
| 85 | `prepmtAmtInv` | Prepmt. Amt. Inv. | Prepmt. Amt. Inv. | ✅ |
| 86 | `prepmtAmtInclVat` | Prepmt. Amt. Incl. VAT | Prepmt. Amt. Incl. VAT | ✅ |
| 87 | `prepaymentAmount` | Prepayment Amount | Prepayment Amount | ✅ |
| 88 | `prepmtVatBaseAmt` | Prepmt. VAT Base Amt. | Prepmt. VAT Base Amt. | ✅ |
| 89 | `prepaymentVatPct` | Prepayment VAT % | Prepayment VAT % | ✅ |
| 90 | `prepmtVatCalcType` | Prepmt. VAT Calc. Type | Prepmt. VAT Calc. Type | ✅ |
| 91 | `prepaymentVatIdentifier` | Prepayment VAT Identifier | Prepayment VAT Identifier | ✅ |
| 92 | `prepaymentTaxAreaCode` | Prepayment Tax Area Code | Prepayment Tax Area Code | ✅ |
| 93 | `prepaymentTaxLiable` | Prepayment Tax Liable | Prepayment Tax Liable | ✅ |
| 94 | `prepaymentTaxGroupCode` | Prepayment Tax Group Code | Prepayment Tax Group Code | ✅ |
| 95 | `prepmtAmtToDeduct` | Prepmt Amt to Deduct | Prepmt Amt to Deduct | ✅ |
| 96 | `prepmtAmtDeducted` | Prepmt Amt Deducted | Prepmt Amt Deducted | ✅ |
| 97 | `prepaymentLine` | Prepayment Line | Prepayment Line | ✅ |
| 98 | `prepmtAmountInvInclVat` | Prepmt. Amount Inv. Incl. VAT | Prepmt. Amount Inv. Incl. VAT | ✅ |
| 99 | `prepmtAmountInvLcy` | Prepmt. Amount Inv. (LCY) | Prepmt. Amount Inv. (LCY) | ✅ |
| 100 | `icPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 101 | `prepmtVatAmountInvLcy` | Prepmt. VAT Amount Inv. (LCY) | Prepmt. VAT Amount Inv. (LCY) | ✅ |
| 102 | `prepaymentVatDifference` | Prepayment VAT Difference | Prepayment VAT Difference | ✅ |
| 103 | `prepmtVatDiffToDeduct` | Prepmt VAT Diff. to Deduct | Prepmt VAT Diff. to Deduct | ✅ |
| 104 | `prepmtVatDiffDeducted` | Prepmt VAT Diff. Deducted | Prepmt VAT Diff. Deducted | ✅ |
| 105 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | ✅ |
| 106 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | ✅ |
| 107 | `prepmtPmtDiscountAmount` | Prepmt. Pmt. Discount Amount | Prepmt. Pmt. Discount Amount | ✅ |
| 108 | `lineDiscountCalculation` | Line Discount Calculation | Line Discount Calculation | ✅ |
| 109 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 110 | `qtyToAssembleToOrder` | Qty. to Assemble to Order | Qty. to Assemble to Order | ✅ |
| 111 | `qtyToAsmToOrderBase` | Qty. to Asm. to Order (Base) | Qty. to Asm. to Order (Base) | ✅ |
| 112 | `atoWhseOutstandingQty` | ATO Whse. Outstanding Qty. | ATO Whse. Outstanding Qty. | 🧮 computed |
| 113 | `atoWhseOutstdQtyBase` | ATO Whse. Outstd. Qty. (Base) | ATO Whse. Outstd. Qty. (Base) | 🧮 computed |
| 114 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 115 | `jobContractEntryNo` | Job Contract Entry No. | Project Contract Entry No. | ✅ |
| 116 | `postingDate` | Posting Date | Posting Date | 🧮 computed |
| 117 | `deferralCode` | Deferral Code | Deferral Code | ✅ |
| 118 | `returnsDeferralStartDate` | Returns Deferral Start Date | Returns Deferral Start Date | ✅ |
| 119 | `selectedAllocAccountNo` | Selected Alloc. Account No. | Allocation Account No. | ✅ |
| 120 | `allocAccModifiedByUser` | Alloc. Acc. Modified by User | Allocation Account Distributions Modified | 🧮 computed |
| 121 | `allocationAccountNo` | Allocation Account No. | Posting Allocation Account No. | ✅ |
| 122 | `allocSalesLineSystemid` | Alloc. Sales Line SystemId | Allocation Sales Line SystemId | ✅ |
| 123 | `variantCode` | Variant Code | Variant Code | ✅ |
| 124 | `binCode` | Bin Code | Bin Code | ✅ |
| 125 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 126 | `planned` | Planned | Planned | ✅ |
| 127 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 128 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 129 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 130 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 131 | `outstandingQtyBase` | Outstanding Qty. (Base) | Outstanding Qty. (Base) | ✅ |
| 132 | `qtyToInvoiceBase` | Qty. to Invoice (Base) | Qty. to Invoice (Base) | ✅ |
| 133 | `qtyToShipBase` | Qty. to Ship (Base) | Qty. to Ship (Base) | ✅ |
| 134 | `qtyShippedNotInvdBase` | Qty. Shipped Not Invd. (Base) | Qty. Shipped Not Invd. (Base) | ✅ |
| 135 | `qtyShippedBase` | Qty. Shipped (Base) | Qty. Shipped (Base) | ✅ |
| 136 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | ✅ |
| 137 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 138 | `faPostingDate` | FA Posting Date | FA Posting Date | ✅ |
| 139 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | ✅ |
| 140 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | ✅ |
| 141 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | ✅ |
| 142 | `useDuplicationList` | Use Duplication List | Use Duplication List | ✅ |
| 143 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 144 | `outOfStockSubstitution` | Out-of-Stock Substitution | Out-of-Stock Substitution | ✅ |
| 145 | `substitutionAvailable` | Substitution Available | Substitution Available | 🧮 computed |
| 146 | `originallyOrderedNo` | Originally Ordered No. | Originally Ordered No. | ✅ |
| 147 | `originallyOrderedVarCode` | Originally Ordered Var. Code | Originally Ordered Var. Code | ✅ |
| 148 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 149 | `nonstock` | Nonstock | Catalog | ✅ |
| 150 | `purchasingCode` | Purchasing Code | Purchasing Code | ✅ |
| 151 | `specialOrder` | Special Order | Special Order | ✅ |
| 152 | `specialOrderPurchaseNo` | Special Order Purchase No. | Special Order Purchase No. | ✅ |
| 153 | `specialOrderPurchLineNo` | Special Order Purch. Line No. | Special Order Purch. Line No. | ✅ |
| 154 | `itemReferenceNo` | Item Reference No. | Item Reference No. | ✅ |
| 155 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Reference Unit of Measure | ✅ |
| 156 | `itemReferenceType` | Item Reference Type | Item Reference Type | ✅ |
| 157 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | ✅ |
| 158 | `whseOutstandingQty` | Whse. Outstanding Qty. | Whse. Outstanding Qty. | 🧮 computed |
| 159 | `whseOutstandingQtyBase` | Whse. Outstanding Qty. (Base) | Whse. Outstanding Qty. (Base) | 🧮 computed |
| 160 | `completelyShipped` | Completely Shipped | Completely Shipped | ✅ |
| 161 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | ✅ |
| 162 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | ✅ |
| 163 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 164 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | ✅ |
| 165 | `plannedDeliveryDate` | Planned Delivery Date | Planned Delivery Date | ✅ |
| 166 | `plannedShipmentDate` | Planned Shipment Date | Planned Shipment Date | ✅ |
| 167 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 168 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 169 | `allowItemChargeAssignment` | Allow Item Charge Assignment | Allow Item Charge Assignment | ✅ |
| 170 | `qtyToAssign` | Qty. to Assign | Qty. to Assign | 🧮 computed |
| 171 | `qtyAssigned` | Qty. Assigned | Qty. Assigned | 🧮 computed |
| 172 | `returnQtyToReceive` | Return Qty. to Receive | Return Qty. to Receive | ✅ |
| 173 | `returnQtyToReceiveBase` | Return Qty. to Receive (Base) | Return Qty. to Receive (Base) | ✅ |
| 174 | `returnQtyRcdNotInvd` | Return Qty. Rcd. Not Invd. | Return Qty. Rcd. Not Invd. | ✅ |
| 175 | `retQtyRcdNotInvdBase` | Ret. Qty. Rcd. Not Invd.(Base) | Ret. Qty. Rcd. Not Invd.(Base) | ✅ |
| 176 | `returnRcdNotInvd` | Return Rcd. Not Invd. | Return Rcd. Not Invd. | ✅ |
| 177 | `returnRcdNotInvdLcy` | Return Rcd. Not Invd. (LCY) | Return Rcd. Not Invd. (LCY) | ✅ |
| 178 | `returnQtyReceived` | Return Qty. Received | Return Qty. Received | ✅ |
| 179 | `returnQtyReceivedBase` | Return Qty. Received (Base) | Return Qty. Received (Base) | ✅ |
| 180 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | ✅ |
| 181 | `itemChargeQtyToHandle` | Item Charge Qty. to Handle | Item Charge Qty. to Handle | 🧮 computed |
| 182 | `bomItemNo` | BOM Item No. | BOM Item No. | ✅ |
| 183 | `returnReceiptNo` | Return Receipt No. | Return Receipt No. | ✅ |
| 184 | `returnReceiptLineNo` | Return Receipt Line No. | Return Receipt Line No. | ✅ |
| 185 | `returnReasonCode` | Return Reason Code | Return Reason Code | ✅ |
| 186 | `copiedFromPostedDoc` | Copied From Posted Doc. | Copied From Posted Doc. | ✅ |
| 187 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 188 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 189 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 190 | `subtype` | Subtype | Subtype | ✅ |
| 191 | `priceDescription` | Price description | Price description | ✅ |
| 192 | `attachedDocCount` | Attached Doc Count | Attached Doc Count | 🧮 computed |
| 193 | `attachedLinesCount` | Attached Lines Count | Attached Lines Count | 🧮 computed |
| 194 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfSalesCreditMemos

**Description:** Sales credit memos (open, unposted).

| Property | Value |
|---|---|
| **Source Table** | Sales Header |
| Page ID | 90876 |
| Page Name | `ocpfSalesCreditMemos` |
| Entity Set Name | `ocpfSalesCreditMemos` |
| API Group | `ocpf_sales` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const("Credit Memo")` |
| Field Count | 182 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 4 | `no` | No. | No. | ✅ |
| 5 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 6 | `billToName` | Bill-to Name | Bill-to Name | ✅ |
| 7 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | ✅ |
| 8 | `billToAddress` | Bill-to Address | Bill-to Address | ✅ |
| 9 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | ✅ |
| 10 | `billToCity` | Bill-to City | Bill-to City | ✅ |
| 11 | `billToContact` | Bill-to Contact | Bill-to Contact | ✅ |
| 12 | `yourReference` | Your Reference | Your Reference | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `shipToName` | Ship-to Name | Ship-to Name | ✅ |
| 15 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | ✅ |
| 16 | `shipToAddress` | Ship-to Address | Ship-to Address | ✅ |
| 17 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | ✅ |
| 18 | `shipToCity` | Ship-to City | Ship-to City | ✅ |
| 19 | `shipToContact` | Ship-to Contact | Ship-to Contact | ✅ |
| 20 | `orderDate` | Order Date | Order Date | ✅ |
| 21 | `postingDate` | Posting Date | Posting Date | ✅ |
| 22 | `shipmentDate` | Shipment Date | Shipment Date | ✅ |
| 23 | `postingDescription` | Posting Description | Posting Description | ✅ |
| 24 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 25 | `dueDate` | Due Date | Due Date | ✅ |
| 26 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 27 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 28 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 29 | `locationCode` | Location Code | Location Code | ✅ |
| 30 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 31 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 32 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | ✅ |
| 33 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 34 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 35 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 36 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 37 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 38 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 39 | `languageCode` | Language Code | Language Code | ✅ |
| 40 | `formatRegion` | Format Region | Format Region | ✅ |
| 41 | `salespersonCode` | Salesperson Code | Salesperson Code | ✅ |
| 42 | `orderClass` | Order Class | Order Class | ✅ |
| 43 | `comment` | Comment | Comment | 🧮 computed |
| 44 | `noPrinted` | No. Printed | No. Printed | ✅ |
| 45 | `onHold` | On Hold | On Hold | ✅ |
| 46 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 47 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 48 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 49 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | 🧮 computed |
| 50 | `ship` | Ship | Ship | ✅ |
| 51 | `invoice` | Invoice | Invoice | ✅ |
| 52 | `printPostedDocuments` | Print Posted Documents | Print Posted Documents | ✅ |
| 53 | `amount` | Amount | Amount | 🧮 computed |
| 54 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 55 | `shippingNo` | Shipping No. | Shipping No. | ✅ |
| 56 | `postingNo` | Posting No. | Posting No. | ✅ |
| 57 | `lastShippingNo` | Last Shipping No. | Last Shipping No. | ✅ |
| 58 | `lastPostingNo` | Last Posting No. | Last Posting No. | ✅ |
| 59 | `prepaymentNo` | Prepayment No. | Prepayment No. | ✅ |
| 60 | `lastPrepaymentNo` | Last Prepayment No. | Last Prepayment No. | ✅ |
| 61 | `prepmtCrMemoNo` | Prepmt. Cr. Memo No. | Prepmt. Cr. Memo No. | ✅ |
| 62 | `lastPrepmtCrMemoNo` | Last Prepmt. Cr. Memo No. | Last Prepmt. Cr. Memo No. | ✅ |
| 63 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 64 | `combineShipments` | Combine Shipments | Combine Shipments | ✅ |
| 65 | `registrationNumber` | Registration Number | Registration No. | ✅ |
| 66 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 67 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 68 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | ✅ |
| 69 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 70 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 71 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | ✅ |
| 72 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | ✅ |
| 73 | `sellToCustomerName2` | Sell-to Customer Name 2 | Sell-to Customer Name 2 | ✅ |
| 74 | `sellToAddress` | Sell-to Address | Sell-to Address | ✅ |
| 75 | `sellToAddress2` | Sell-to Address 2 | Sell-to Address 2 | ✅ |
| 76 | `sellToCity` | Sell-to City | Sell-to City | ✅ |
| 77 | `sellToContact` | Sell-to Contact | Sell-to Contact | ✅ |
| 78 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | ✅ |
| 79 | `billToCounty` | Bill-to County | Bill-to County | ✅ |
| 80 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | ✅ |
| 81 | `sellToPostCode` | Sell-to Post Code | Sell-to Post Code | ✅ |
| 82 | `sellToCounty` | Sell-to County | Sell-to County | ✅ |
| 83 | `sellToCountryRegionCode` | Sell-to Country/Region Code | Sell-to Country/Region Code | ✅ |
| 84 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | ✅ |
| 85 | `shipToCounty` | Ship-to County | Ship-to County | ✅ |
| 86 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | ✅ |
| 87 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 88 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 89 | `correction` | Correction | Correction | ✅ |
| 90 | `documentDate` | Document Date | Document Date | ✅ |
| 91 | `externalDocumentNo` | External Document No. | External Document No. | ✅ |
| 92 | `areaCode` | Area | Area | ✅ |
| 93 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 94 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 95 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 96 | `packageTrackingNo` | Package Tracking No. | Package Tracking No. | ✅ |
| 97 | `noSeries` | No. Series | No. Series | ✅ |
| 98 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 99 | `shippingNoSeries` | Shipping No. Series | Shipping No. Series | ✅ |
| 100 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 101 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 102 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 103 | `reserve` | Reserve | Reserve | ✅ |
| 104 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 105 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 106 | `status` | Status | Status | ✅ |
| 107 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | ✅ |
| 108 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | ✅ |
| 109 | `sendIcDocument` | Send IC Document | Send IC Document | ✅ |
| 110 | `icStatus` | IC Status | IC Status | ✅ |
| 111 | `sellToIcPartnerCode` | Sell-to IC Partner Code | Sell-to IC Partner Code | ✅ |
| 112 | `billToIcPartnerCode` | Bill-to IC Partner Code | Bill-to IC Partner Code | ✅ |
| 113 | `icReferenceDocumentNo` | IC Reference Document No. | IC Reference Document No. | ✅ |
| 114 | `icDirection` | IC Direction | IC Direction | ✅ |
| 115 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 116 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | ✅ |
| 117 | `compressPrepayment` | Compress Prepayment | Compress Prepayment | ✅ |
| 118 | `prepaymentDueDate` | Prepayment Due Date | Prepayment Due Date | ✅ |
| 119 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | ✅ |
| 120 | `prepmtPostingDescription` | Prepmt. Posting Description | Prepmt. Posting Description | ✅ |
| 121 | `prepmtPmtDiscountDate` | Prepmt. Pmt. Discount Date | Prepmt. Pmt. Discount Date | ✅ |
| 122 | `prepmtPaymentTermsCode` | Prepmt. Payment Terms Code | Prepmt. Payment Terms Code | ✅ |
| 123 | `prepmtPaymentDiscountPct` | Prepmt. Payment Discount % | Prepmt. Payment Discount % | ✅ |
| 124 | `quoteNo` | Quote No. | Quote No. | ✅ |
| 125 | `quoteValidUntilDate` | Quote Valid Until Date | Quote Valid To Date | ✅ |
| 126 | `quoteSentToCustomer` | Quote Sent to Customer | Quote Sent to Customer | ✅ |
| 127 | `quoteAccepted` | Quote Accepted | Quote Accepted | ✅ |
| 128 | `quoteAcceptedDate` | Quote Accepted Date | Quote Accepted Date | ✅ |
| 129 | `jobQueueStatus` | Job Queue Status | Job Queue Status | ✅ |
| 130 | `jobQueueEntryId` | Job Queue Entry ID | Job Queue Entry ID | ✅ |
| 131 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | ✅ |
| 132 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 133 | `altVatRegistrationNo` | Alt. VAT Registration No. | Alternative VAT Registration No. | ✅ |
| 134 | `altGenBusPostingGroup` | Alt. Gen. Bus Posting Group | Alternative Gen. Bus. Posting Group | ✅ |
| 135 | `altVatBusPostingGroup` | Alt. VAT Bus Posting Group | Alternative VAT Bus. Posting Group | ✅ |
| 136 | `istest` | IsTest | IsTest | ✅ |
| 137 | `sellToPhoneNo` | Sell-to Phone No. | Sell-to Phone No. | ✅ |
| 138 | `sellToEMail` | Sell-to E-Mail | Email | ✅ |
| 139 | `journalTemplName` | Journal Templ. Name | Journal Template Name | ✅ |
| 140 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 141 | `rcvdFromCountRegionCode` | Rcvd.-from Count./Region Code | Received-from Country/Region Code | ✅ |
| 142 | `lastEmailSentTime` | Last Email Sent Time | Last Email Sent Time | 🧮 computed |
| 143 | `lastEmailSentMessageId` | Last Email Sent Message Id | Last Email Sent Message Id | 🧮 computed |
| 144 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | ✅ |
| 145 | `amtShipNotInvLcy` | Amt. Ship. Not Inv. (LCY) | Amount Shipped Not Invoiced (LCY) Incl. VAT | 🧮 computed |
| 146 | `amtShipNotInvLcyBase` | Amt. Ship. Not Inv. (LCY) Base | Amount Shipped Not Invoiced (LCY) | 🧮 computed |
| 147 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 148 | `paymentServiceSetId` | Payment Service Set ID | Payment Service Set ID | ✅ |
| 149 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dynamics 365 Sales | 🧮 computed |
| 150 | `directDebitMandateId` | Direct Debit Mandate ID | Direct Debit Mandate ID | ✅ |
| 151 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 152 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 153 | `docNoOccurrence` | Doc. No. Occurrence | Doc. No. Occurrence | ✅ |
| 154 | `campaignNo` | Campaign No. | Campaign No. | ✅ |
| 155 | `sellToContactNo` | Sell-to Contact No. | Sell-to Contact No. | ✅ |
| 156 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | ✅ |
| 157 | `opportunityNo` | Opportunity No. | Opportunity No. | ✅ |
| 158 | `sellToCustomerTemplCode` | Sell-to Customer Templ. Code | Sell-to Customer Template Code | ✅ |
| 159 | `billToCustomerTemplCode` | Bill-to Customer Templ. Code | Bill-to Customer Template Code | ✅ |
| 160 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 161 | `shippingAdvice` | Shipping Advice | Shipping Advice | ✅ |
| 162 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | 🧮 computed |
| 163 | `completelyShipped` | Completely Shipped | Completely Shipped | 🧮 computed |
| 164 | `postingFromWhseRef` | Posting from Whse. Ref. | Posting from Whse. Ref. | ✅ |
| 165 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 166 | `shipped` | Shipped | Shipped | 🧮 computed |
| 167 | `lastShipmentDate` | Last Shipment Date | Last Shipment Date | 🧮 computed |
| 168 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | ✅ |
| 169 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | ✅ |
| 170 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 171 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | ✅ |
| 172 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 173 | `lateOrderShipping` | Late Order Shipping | Late Order Shipping | 🧮 computed |
| 174 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 175 | `receive` | Receive | Receive | ✅ |
| 176 | `returnReceiptNo` | Return Receipt No. | Return Receipt No. | ✅ |
| 177 | `returnReceiptNoSeries` | Return Receipt No. Series | Return Receipt No. Series | ✅ |
| 178 | `lastReturnReceiptNo` | Last Return Receipt No. | Last Return Receipt No. | ✅ |
| 179 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 180 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 181 | `getShipmentUsed` | Get Shipment Used | Get Shipment Used | ✅ |
| 182 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfSalesCreditMemoLines

**Description:** Lines of open sales credit memos.

| Property | Value |
|---|---|
| **Source Table** | Sales Line |
| Page ID | 90877 |
| Page Name | `ocpfSalesCreditMemoLines` |
| Entity Set Name | `ocpfSalesCreditMemoLines` |
| API Group | `ocpf_sales` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const("Credit Memo")` |
| Field Count | 194 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 4 | `documentNo` | Document No. | Document No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `type` | Type | Type | ✅ |
| 7 | `no` | No. | No. | ✅ |
| 8 | `locationCode` | Location Code | Location Code | ✅ |
| 9 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 10 | `shipmentDate` | Shipment Date | Shipment Date | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `description2` | Description 2 | Description 2 | ✅ |
| 13 | `unitOfMeasure` | Unit of Measure | Unit of Measure | ✅ |
| 14 | `quantity` | Quantity | Quantity | ✅ |
| 15 | `outstandingQuantity` | Outstanding Quantity | Outstanding Quantity | ✅ |
| 16 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | ✅ |
| 17 | `qtyToShip` | Qty. to Ship | Qty. to Ship | ✅ |
| 18 | `unitPrice` | Unit Price | Unit Price | ✅ |
| 19 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | ✅ |
| 20 | `vatPct` | VAT % | VAT % | ✅ |
| 21 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 22 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 23 | `amount` | Amount | Amount | ✅ |
| 24 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | ✅ |
| 25 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 26 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 27 | `netWeight` | Net Weight | Net Weight | ✅ |
| 28 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 29 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 30 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 31 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 32 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 33 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 34 | `jobNo` | Job No. | Project No. | ✅ |
| 35 | `workTypeCode` | Work Type Code | Work Type Code | ✅ |
| 36 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | ✅ |
| 37 | `outstandingAmount` | Outstanding Amount | Outstanding Amount | ✅ |
| 38 | `qtyShippedNotInvoiced` | Qty. Shipped Not Invoiced | Qty. Shipped Not Invoiced | ✅ |
| 39 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | ✅ |
| 40 | `quantityShipped` | Quantity Shipped | Quantity Shipped | ✅ |
| 41 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | ✅ |
| 42 | `shipmentNo` | Shipment No. | Shipment No. | ✅ |
| 43 | `shipmentLineNo` | Shipment Line No. | Shipment Line No. | ✅ |
| 44 | `profitPct` | Profit % | Profit % | ✅ |
| 45 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 46 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | ✅ |
| 47 | `purchaseOrderNo` | Purchase Order No. | Purchase Order No. | ✅ |
| 48 | `purchOrderLineNo` | Purch. Order Line No. | Purch. Order Line No. | ✅ |
| 49 | `dropShipment` | Drop Shipment | Drop Shipment | ✅ |
| 50 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 51 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 52 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 53 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 54 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 55 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | ✅ |
| 56 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 57 | `areaCode` | Area | Area | ✅ |
| 58 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 59 | `taxCategory` | Tax Category | Tax Category | ✅ |
| 60 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 61 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 62 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 63 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | ✅ |
| 64 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 65 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 66 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 67 | `outstandingAmountLcy` | Outstanding Amount (LCY) | Outstanding Amount (LCY) | ✅ |
| 68 | `shippedNotInvoicedLcy` | Shipped Not Invoiced (LCY) | Shipped Not Invoiced (LCY) Incl. VAT | ✅ |
| 69 | `shippedNotInvLcyNoVat` | Shipped Not Inv. (LCY) No VAT | Shipped Not Invoiced (LCY) | ✅ |
| 70 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 71 | `reserve` | Reserve | Reserve | ✅ |
| 72 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | ✅ |
| 73 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | ✅ |
| 74 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 75 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 76 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 77 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 78 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 79 | `invDiscAmountToInvoice` | Inv. Disc. Amount to Invoice | Inv. Disc. Amount to Invoice | ✅ |
| 80 | `vatIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 81 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | ✅ |
| 82 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | ✅ |
| 83 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 84 | `prepmtLineAmount` | Prepmt. Line Amount | Prepmt. Line Amount | ✅ |
| 85 | `prepmtAmtInv` | Prepmt. Amt. Inv. | Prepmt. Amt. Inv. | ✅ |
| 86 | `prepmtAmtInclVat` | Prepmt. Amt. Incl. VAT | Prepmt. Amt. Incl. VAT | ✅ |
| 87 | `prepaymentAmount` | Prepayment Amount | Prepayment Amount | ✅ |
| 88 | `prepmtVatBaseAmt` | Prepmt. VAT Base Amt. | Prepmt. VAT Base Amt. | ✅ |
| 89 | `prepaymentVatPct` | Prepayment VAT % | Prepayment VAT % | ✅ |
| 90 | `prepmtVatCalcType` | Prepmt. VAT Calc. Type | Prepmt. VAT Calc. Type | ✅ |
| 91 | `prepaymentVatIdentifier` | Prepayment VAT Identifier | Prepayment VAT Identifier | ✅ |
| 92 | `prepaymentTaxAreaCode` | Prepayment Tax Area Code | Prepayment Tax Area Code | ✅ |
| 93 | `prepaymentTaxLiable` | Prepayment Tax Liable | Prepayment Tax Liable | ✅ |
| 94 | `prepaymentTaxGroupCode` | Prepayment Tax Group Code | Prepayment Tax Group Code | ✅ |
| 95 | `prepmtAmtToDeduct` | Prepmt Amt to Deduct | Prepmt Amt to Deduct | ✅ |
| 96 | `prepmtAmtDeducted` | Prepmt Amt Deducted | Prepmt Amt Deducted | ✅ |
| 97 | `prepaymentLine` | Prepayment Line | Prepayment Line | ✅ |
| 98 | `prepmtAmountInvInclVat` | Prepmt. Amount Inv. Incl. VAT | Prepmt. Amount Inv. Incl. VAT | ✅ |
| 99 | `prepmtAmountInvLcy` | Prepmt. Amount Inv. (LCY) | Prepmt. Amount Inv. (LCY) | ✅ |
| 100 | `icPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 101 | `prepmtVatAmountInvLcy` | Prepmt. VAT Amount Inv. (LCY) | Prepmt. VAT Amount Inv. (LCY) | ✅ |
| 102 | `prepaymentVatDifference` | Prepayment VAT Difference | Prepayment VAT Difference | ✅ |
| 103 | `prepmtVatDiffToDeduct` | Prepmt VAT Diff. to Deduct | Prepmt VAT Diff. to Deduct | ✅ |
| 104 | `prepmtVatDiffDeducted` | Prepmt VAT Diff. Deducted | Prepmt VAT Diff. Deducted | ✅ |
| 105 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | ✅ |
| 106 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | ✅ |
| 107 | `prepmtPmtDiscountAmount` | Prepmt. Pmt. Discount Amount | Prepmt. Pmt. Discount Amount | ✅ |
| 108 | `lineDiscountCalculation` | Line Discount Calculation | Line Discount Calculation | ✅ |
| 109 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 110 | `qtyToAssembleToOrder` | Qty. to Assemble to Order | Qty. to Assemble to Order | ✅ |
| 111 | `qtyToAsmToOrderBase` | Qty. to Asm. to Order (Base) | Qty. to Asm. to Order (Base) | ✅ |
| 112 | `atoWhseOutstandingQty` | ATO Whse. Outstanding Qty. | ATO Whse. Outstanding Qty. | 🧮 computed |
| 113 | `atoWhseOutstdQtyBase` | ATO Whse. Outstd. Qty. (Base) | ATO Whse. Outstd. Qty. (Base) | 🧮 computed |
| 114 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 115 | `jobContractEntryNo` | Job Contract Entry No. | Project Contract Entry No. | ✅ |
| 116 | `postingDate` | Posting Date | Posting Date | 🧮 computed |
| 117 | `deferralCode` | Deferral Code | Deferral Code | ✅ |
| 118 | `returnsDeferralStartDate` | Returns Deferral Start Date | Returns Deferral Start Date | ✅ |
| 119 | `selectedAllocAccountNo` | Selected Alloc. Account No. | Allocation Account No. | ✅ |
| 120 | `allocAccModifiedByUser` | Alloc. Acc. Modified by User | Allocation Account Distributions Modified | 🧮 computed |
| 121 | `allocationAccountNo` | Allocation Account No. | Posting Allocation Account No. | ✅ |
| 122 | `allocSalesLineSystemid` | Alloc. Sales Line SystemId | Allocation Sales Line SystemId | ✅ |
| 123 | `variantCode` | Variant Code | Variant Code | ✅ |
| 124 | `binCode` | Bin Code | Bin Code | ✅ |
| 125 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 126 | `planned` | Planned | Planned | ✅ |
| 127 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 128 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 129 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 130 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 131 | `outstandingQtyBase` | Outstanding Qty. (Base) | Outstanding Qty. (Base) | ✅ |
| 132 | `qtyToInvoiceBase` | Qty. to Invoice (Base) | Qty. to Invoice (Base) | ✅ |
| 133 | `qtyToShipBase` | Qty. to Ship (Base) | Qty. to Ship (Base) | ✅ |
| 134 | `qtyShippedNotInvdBase` | Qty. Shipped Not Invd. (Base) | Qty. Shipped Not Invd. (Base) | ✅ |
| 135 | `qtyShippedBase` | Qty. Shipped (Base) | Qty. Shipped (Base) | ✅ |
| 136 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | ✅ |
| 137 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 138 | `faPostingDate` | FA Posting Date | FA Posting Date | ✅ |
| 139 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | ✅ |
| 140 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | ✅ |
| 141 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | ✅ |
| 142 | `useDuplicationList` | Use Duplication List | Use Duplication List | ✅ |
| 143 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 144 | `outOfStockSubstitution` | Out-of-Stock Substitution | Out-of-Stock Substitution | ✅ |
| 145 | `substitutionAvailable` | Substitution Available | Substitution Available | 🧮 computed |
| 146 | `originallyOrderedNo` | Originally Ordered No. | Originally Ordered No. | ✅ |
| 147 | `originallyOrderedVarCode` | Originally Ordered Var. Code | Originally Ordered Var. Code | ✅ |
| 148 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 149 | `nonstock` | Nonstock | Catalog | ✅ |
| 150 | `purchasingCode` | Purchasing Code | Purchasing Code | ✅ |
| 151 | `specialOrder` | Special Order | Special Order | ✅ |
| 152 | `specialOrderPurchaseNo` | Special Order Purchase No. | Special Order Purchase No. | ✅ |
| 153 | `specialOrderPurchLineNo` | Special Order Purch. Line No. | Special Order Purch. Line No. | ✅ |
| 154 | `itemReferenceNo` | Item Reference No. | Item Reference No. | ✅ |
| 155 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Reference Unit of Measure | ✅ |
| 156 | `itemReferenceType` | Item Reference Type | Item Reference Type | ✅ |
| 157 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | ✅ |
| 158 | `whseOutstandingQty` | Whse. Outstanding Qty. | Whse. Outstanding Qty. | 🧮 computed |
| 159 | `whseOutstandingQtyBase` | Whse. Outstanding Qty. (Base) | Whse. Outstanding Qty. (Base) | 🧮 computed |
| 160 | `completelyShipped` | Completely Shipped | Completely Shipped | ✅ |
| 161 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | ✅ |
| 162 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | ✅ |
| 163 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 164 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | ✅ |
| 165 | `plannedDeliveryDate` | Planned Delivery Date | Planned Delivery Date | ✅ |
| 166 | `plannedShipmentDate` | Planned Shipment Date | Planned Shipment Date | ✅ |
| 167 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 168 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 169 | `allowItemChargeAssignment` | Allow Item Charge Assignment | Allow Item Charge Assignment | ✅ |
| 170 | `qtyToAssign` | Qty. to Assign | Qty. to Assign | 🧮 computed |
| 171 | `qtyAssigned` | Qty. Assigned | Qty. Assigned | 🧮 computed |
| 172 | `returnQtyToReceive` | Return Qty. to Receive | Return Qty. to Receive | ✅ |
| 173 | `returnQtyToReceiveBase` | Return Qty. to Receive (Base) | Return Qty. to Receive (Base) | ✅ |
| 174 | `returnQtyRcdNotInvd` | Return Qty. Rcd. Not Invd. | Return Qty. Rcd. Not Invd. | ✅ |
| 175 | `retQtyRcdNotInvdBase` | Ret. Qty. Rcd. Not Invd.(Base) | Ret. Qty. Rcd. Not Invd.(Base) | ✅ |
| 176 | `returnRcdNotInvd` | Return Rcd. Not Invd. | Return Rcd. Not Invd. | ✅ |
| 177 | `returnRcdNotInvdLcy` | Return Rcd. Not Invd. (LCY) | Return Rcd. Not Invd. (LCY) | ✅ |
| 178 | `returnQtyReceived` | Return Qty. Received | Return Qty. Received | ✅ |
| 179 | `returnQtyReceivedBase` | Return Qty. Received (Base) | Return Qty. Received (Base) | ✅ |
| 180 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | ✅ |
| 181 | `itemChargeQtyToHandle` | Item Charge Qty. to Handle | Item Charge Qty. to Handle | 🧮 computed |
| 182 | `bomItemNo` | BOM Item No. | BOM Item No. | ✅ |
| 183 | `returnReceiptNo` | Return Receipt No. | Return Receipt No. | ✅ |
| 184 | `returnReceiptLineNo` | Return Receipt Line No. | Return Receipt Line No. | ✅ |
| 185 | `returnReasonCode` | Return Reason Code | Return Reason Code | ✅ |
| 186 | `copiedFromPostedDoc` | Copied From Posted Doc. | Copied From Posted Doc. | ✅ |
| 187 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 188 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 189 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 190 | `subtype` | Subtype | Subtype | ✅ |
| 191 | `priceDescription` | Price description | Price description | ✅ |
| 192 | `attachedDocCount` | Attached Doc Count | Attached Doc Count | 🧮 computed |
| 193 | `attachedLinesCount` | Attached Lines Count | Attached Lines Count | 🧮 computed |
| 194 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedSalesInvoices

**Description:** Posted (finalized) sales invoices.

| Property | Value |
|---|---|
| **Source Table** | Sales Invoice Header |
| Page ID | 90878 |
| Page Name | `ocpfPostedSalesInvoices` |
| Entity Set Name | `ocpfPostedSalesInvoices` |
| API Group | `ocpf_sales` |
| Editable | ❌ No (GET only) |
| Field Count | 136 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 5 | `billToName` | Bill-to Name | Bill-to Name | — |
| 6 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | — |
| 7 | `billToAddress` | Bill-to Address | Bill-to Address | — |
| 8 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | — |
| 9 | `billToCity` | Bill-to City | Bill-to City | — |
| 10 | `billToContact` | Bill-to Contact | Bill-to Contact | — |
| 11 | `yourReference` | Your Reference | Your Reference | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 14 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 15 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 16 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 17 | `shipToCity` | Ship-to City | Ship-to City | — |
| 18 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 19 | `orderDate` | Order Date | Order Date | — |
| 20 | `postingDate` | Posting Date | Posting Date | — |
| 21 | `shipmentDate` | Shipment Date | Shipment Date | — |
| 22 | `postingDescription` | Posting Description | Posting Description | — |
| 23 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 24 | `dueDate` | Due Date | Due Date | — |
| 25 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | — |
| 26 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 27 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | — |
| 28 | `locationCode` | Location Code | Location Code | — |
| 29 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 30 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 31 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | — |
| 32 | `currencyCode` | Currency Code | Currency Code | — |
| 33 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 34 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 35 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | — |
| 36 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | — |
| 37 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 38 | `languageCode` | Language Code | Language Code | — |
| 39 | `formatRegion` | Format Region | Format Region | — |
| 40 | `salespersonCode` | Salesperson Code | Salesperson Code | — |
| 41 | `orderNo` | Order No. | Order No. | — |
| 42 | `comment` | Comment | Comment | 🧮 computed |
| 43 | `noPrinted` | No. Printed | No. Printed | — |
| 44 | `onHold` | On Hold | On Hold | — |
| 45 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 46 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 47 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 48 | `amount` | Amount | Amount | 🧮 computed |
| 49 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 50 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 51 | `registrationNumber` | Registration Number | Registration No. | — |
| 52 | `reasonCode` | Reason Code | Reason Code | — |
| 53 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 54 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | — |
| 55 | `transactionType` | Transaction Type | Transaction Type | — |
| 56 | `transportMethod` | Transport Method | Transport Method | — |
| 57 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | — |
| 58 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | — |
| 59 | `sellToCustomerName2` | Sell-to Customer Name 2 | Sell-to Customer Name 2 | — |
| 60 | `sellToAddress` | Sell-to Address | Sell-to Address | — |
| 61 | `sellToAddress2` | Sell-to Address 2 | Sell-to Address 2 | — |
| 62 | `sellToCity` | Sell-to City | Sell-to City | — |
| 63 | `sellToContact` | Sell-to Contact | Sell-to Contact | — |
| 64 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | — |
| 65 | `billToCounty` | Bill-to County | Bill-to County | — |
| 66 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | — |
| 67 | `sellToPostCode` | Sell-to Post Code | Sell-to Post Code | — |
| 68 | `sellToCounty` | Sell-to County | Sell-to County | — |
| 69 | `sellToCountryRegionCode` | Sell-to Country/Region Code | Sell-to Country/Region Code | — |
| 70 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 71 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 72 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 73 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 74 | `exitPoint` | Exit Point | Exit Point | — |
| 75 | `correction` | Correction | Correction | — |
| 76 | `documentDate` | Document Date | Document Date | — |
| 77 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 78 | `areaCode` | Area | Area | — |
| 79 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 80 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 81 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | — |
| 82 | `packageTrackingNo` | Package Tracking No. | Package Tracking No. | — |
| 83 | `preAssignedNoSeries` | Pre-Assigned No. Series | Pre-Assigned No. Series | — |
| 84 | `noSeries` | No. Series | No. Series | — |
| 85 | `orderNoSeries` | Order No. Series | Order No. Series | — |
| 86 | `preAssignedNo` | Pre-Assigned No. | Pre-Assigned No. | — |
| 87 | `userId` | User ID | User ID | — |
| 88 | `sourceCode` | Source Code | Source Code | — |
| 89 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 90 | `taxLiable` | Tax Liable | Tax Liable | — |
| 91 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 92 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | — |
| 93 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | — |
| 94 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | — |
| 95 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | — |
| 96 | `prepaymentInvoice` | Prepayment Invoice | Prepayment Invoice | — |
| 97 | `prepaymentOrderNo` | Prepayment Order No. | Prepayment Order No. | — |
| 98 | `quoteNo` | Quote No. | Quote No. | — |
| 99 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | — |
| 100 | `altVatRegistrationNo` | Alt. VAT Registration No. | Alternative VAT Registration No. | — |
| 101 | `altGenBusPostingGroup` | Alt. Gen. Bus Posting Group | Alternative Gen. Bus. Posting Group | — |
| 102 | `altVatBusPostingGroup` | Alt. VAT Bus Posting Group | Alternative VAT Bus. Posting Group | — |
| 103 | `sellToPhoneNo` | Sell-to Phone No. | Sell-to Phone No. | — |
| 104 | `sellToEMail` | Sell-to E-Mail | Email | — |
| 105 | `vatReportingDate` | VAT Reporting Date | VAT Date | — |
| 106 | `paymentReference` | Payment Reference | Payment Reference | — |
| 107 | `lastEmailSentTime` | Last Email Sent Time | Last Email Sent Time | 🧮 computed |
| 108 | `lastEmailSentMessageId` | Last Email Sent Message Id | Last Email Sent Message Id | 🧮 computed |
| 109 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | — |
| 110 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 111 | `paymentServiceSetId` | Payment Service Set ID | Payment Service Set ID | — |
| 112 | `documentExchangeIdentifier` | Document Exchange Identifier | Document Exchange Identifier | — |
| 113 | `documentExchangeStatus` | Document Exchange Status | Document Exchange Status | — |
| 114 | `docExchOriginalIdentifier` | Doc. Exch. Original Identifier | Doc. Exch. Original Identifier | — |
| 115 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dynamics 365 Sales | 🧮 computed |
| 116 | `directDebitMandateId` | Direct Debit Mandate ID | Direct Debit Mandate ID | — |
| 117 | `closed` | Closed | Closed | 🧮 computed |
| 118 | `remainingAmount` | Remaining Amount | Remaining Amount | 🧮 computed |
| 119 | `custLedgerEntryNo` | Cust. Ledger Entry No. | Cust. Ledger Entry No. | — |
| 120 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 121 | `cancelled` | Cancelled | Cancelled | 🧮 computed |
| 122 | `corrective` | Corrective | Corrective | 🧮 computed |
| 123 | `reversed` | Reversed | Reversed | 🧮 computed |
| 124 | `disputeStatus` | Dispute Status | Dispute Status | — |
| 125 | `promisedPayDate` | Promised Pay Date | Promised Pay Date | — |
| 126 | `campaignNo` | Campaign No. | Campaign No. | — |
| 127 | `sellToContactNo` | Sell-to Contact No. | Sell-to Contact No. | — |
| 128 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | — |
| 129 | `opportunityNo` | Opportunity No. | Opportunity No. | — |
| 130 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 131 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | — |
| 132 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 133 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 134 | `getShipmentUsed` | Get Shipment Used | Get Shipment Used | — |
| 135 | `draftInvoiceSystemid` | Draft Invoice SystemId | Draft Invoice SystemId | — |
| 136 | `disputeStatusId` | Dispute Status Id | Dispute Status Id | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedSalesInvoiceLines

**Description:** Lines of posted sales invoices.

| Property | Value |
|---|---|
| **Source Table** | Sales Invoice Line |
| Page ID | 90879 |
| Page Name | `ocpfPostedSalesInvoiceLines` |
| Entity Set Name | `ocpfPostedSalesInvoiceLines` |
| API Group | `ocpf_sales` |
| Editable | ❌ No (GET only) |
| Field Count | 101 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `no` | No. | No. | — |
| 7 | `locationCode` | Location Code | Location Code | — |
| 8 | `postingGroup` | Posting Group | Posting Group | — |
| 9 | `shipmentDate` | Shipment Date | Shipment Date | — |
| 10 | `description` | Description | Description | — |
| 11 | `description2` | Description 2 | Description 2 | — |
| 12 | `unitOfMeasure` | Unit of Measure | Unit of Measure | — |
| 13 | `quantity` | Quantity | Quantity | — |
| 14 | `unitPrice` | Unit Price | Unit Price | — |
| 15 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 16 | `vatPct` | VAT % | VAT % | — |
| 17 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 18 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | — |
| 19 | `amount` | Amount | Amount | — |
| 20 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | — |
| 21 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 22 | `grossWeight` | Gross Weight | Gross Weight | — |
| 23 | `netWeight` | Net Weight | Net Weight | — |
| 24 | `unitsPerParcel` | Units per Parcel | Units per Parcel | — |
| 25 | `unitVolume` | Unit Volume | Unit Volume | — |
| 26 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | — |
| 27 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 28 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 29 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 30 | `jobNo` | Job No. | Project No. | — |
| 31 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 32 | `shipmentNo` | Shipment No. | Shipment No. | — |
| 33 | `shipmentLineNo` | Shipment Line No. | Shipment Line No. | — |
| 34 | `orderNo` | Order No. | Order No. | — |
| 35 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 36 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 37 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | — |
| 38 | `dropShipment` | Drop Shipment | Drop Shipment | — |
| 39 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 40 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 41 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 42 | `transactionType` | Transaction Type | Transaction Type | — |
| 43 | `transportMethod` | Transport Method | Transport Method | — |
| 44 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 45 | `exitPoint` | Exit Point | Exit Point | — |
| 46 | `areaCode` | Area | Area | — |
| 47 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 48 | `taxCategory` | Tax Category | Tax Category | — |
| 49 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 50 | `taxLiable` | Tax Liable | Tax Liable | — |
| 51 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 52 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | — |
| 53 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 54 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 55 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | — |
| 56 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | — |
| 57 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | — |
| 58 | `unitCost` | Unit Cost | Unit Cost | — |
| 59 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | — |
| 60 | `lineAmount` | Line Amount | Line Amount | — |
| 61 | `vatDifference` | VAT Difference | VAT Difference | — |
| 62 | `vatIdentifier` | VAT Identifier | VAT Identifier | — |
| 63 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | — |
| 64 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | — |
| 65 | `prepaymentLine` | Prepayment Line | Prepayment Line | — |
| 66 | `icPartnerCode` | IC Partner Code | IC Partner Code | — |
| 67 | `postingDate` | Posting Date | Posting Date | — |
| 68 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | — |
| 69 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | — |
| 70 | `lineDiscountCalculation` | Line Discount Calculation | Line Discount Calculation | — |
| 71 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 72 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 73 | `jobContractEntryNo` | Job Contract Entry No. | Project Contract Entry No. | — |
| 74 | `deferralCode` | Deferral Code | Deferral Code | — |
| 75 | `allocationAccountNo` | Allocation Account No. | Allocation Account No. | — |
| 76 | `allocSalesLineSystemid` | Alloc. Sales Line SystemId | Allocation Sales Line SystemId | — |
| 77 | `variantCode` | Variant Code | Variant Code | — |
| 78 | `binCode` | Bin Code | Bin Code | — |
| 79 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 80 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 81 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 82 | `faPostingDate` | FA Posting Date | FA Posting Date | — |
| 83 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | — |
| 84 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | — |
| 85 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | — |
| 86 | `useDuplicationList` | Use Duplication List | Use Duplication List | — |
| 87 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 88 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 89 | `nonstock` | Nonstock | Catalog | — |
| 90 | `purchasingCode` | Purchasing Code | Purchasing Code | — |
| 91 | `itemReferenceNo` | Item Reference No. | Item Reference No. | — |
| 92 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Unit of Measure (Item Ref.) | — |
| 93 | `itemReferenceType` | Item Reference Type | Item Reference Type | — |
| 94 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | — |
| 95 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | — |
| 96 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 97 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 98 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 99 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 100 | `priceDescription` | Price description | Price description | — |
| 101 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedSalesCreditMemos

**Description:** Posted sales credit memos.

| Property | Value |
|---|---|
| **Source Table** | Sales Cr.Memo Header |
| Page ID | 90880 |
| Page Name | `ocpfPostedSalesCreditMemos` |
| Entity Set Name | `ocpfPostedSalesCreditMemos` |
| API Group | `ocpf_sales` |
| Editable | ❌ No (GET only) |
| Field Count | 123 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 5 | `billToName` | Bill-to Name | Bill-to Name | — |
| 6 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | — |
| 7 | `billToAddress` | Bill-to Address | Bill-to Address | — |
| 8 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | — |
| 9 | `billToCity` | Bill-to City | Bill-to City | — |
| 10 | `billToContact` | Bill-to Contact | Bill-to Contact | — |
| 11 | `yourReference` | Your Reference | Your Reference | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 14 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 15 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 16 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 17 | `shipToCity` | Ship-to City | Ship-to City | — |
| 18 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 19 | `postingDate` | Posting Date | Posting Date | — |
| 20 | `shipmentDate` | Shipment Date | Shipment Date | — |
| 21 | `postingDescription` | Posting Description | Posting Description | — |
| 22 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 23 | `dueDate` | Due Date | Due Date | — |
| 24 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | — |
| 25 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 26 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | — |
| 27 | `locationCode` | Location Code | Location Code | — |
| 28 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 29 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 30 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | — |
| 31 | `currencyCode` | Currency Code | Currency Code | — |
| 32 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 33 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 34 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | — |
| 35 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | — |
| 36 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 37 | `languageCode` | Language Code | Language Code | — |
| 38 | `formatRegion` | Format Region | Format Region | — |
| 39 | `salespersonCode` | Salesperson Code | Salesperson Code | — |
| 40 | `comment` | Comment | Comment | 🧮 computed |
| 41 | `noPrinted` | No. Printed | No. Printed | — |
| 42 | `onHold` | On Hold | On Hold | — |
| 43 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 44 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 45 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 46 | `amount` | Amount | Amount | 🧮 computed |
| 47 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 48 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 49 | `registrationNumber` | Registration Number | Registration No. | — |
| 50 | `reasonCode` | Reason Code | Reason Code | — |
| 51 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 52 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | — |
| 53 | `transactionType` | Transaction Type | Transaction Type | — |
| 54 | `transportMethod` | Transport Method | Transport Method | — |
| 55 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | — |
| 56 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | — |
| 57 | `sellToCustomerName2` | Sell-to Customer Name 2 | Sell-to Customer Name 2 | — |
| 58 | `sellToAddress` | Sell-to Address | Sell-to Address | — |
| 59 | `sellToAddress2` | Sell-to Address 2 | Sell-to Address 2 | — |
| 60 | `sellToCity` | Sell-to City | Sell-to City | — |
| 61 | `sellToContact` | Sell-to Contact | Sell-to Contact | — |
| 62 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | — |
| 63 | `billToCounty` | Bill-to County | Bill-to County | — |
| 64 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | — |
| 65 | `sellToPostCode` | Sell-to Post Code | Sell-to Post Code | — |
| 66 | `sellToCounty` | Sell-to County | Sell-to County | — |
| 67 | `sellToCountryRegionCode` | Sell-to Country/Region Code | Sell-to Country/Region Code | — |
| 68 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 69 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 70 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 71 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 72 | `exitPoint` | Exit Point | Exit Point | — |
| 73 | `correction` | Correction | Correction | — |
| 74 | `documentDate` | Document Date | Document Date | — |
| 75 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 76 | `areaCode` | Area | Area | — |
| 77 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 78 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 79 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | — |
| 80 | `packageTrackingNo` | Package Tracking No. | Package Tracking No. | — |
| 81 | `preAssignedNoSeries` | Pre-Assigned No. Series | Pre-Assigned No. Series | — |
| 82 | `noSeries` | No. Series | No. Series | — |
| 83 | `preAssignedNo` | Pre-Assigned No. | Pre-Assigned No. | — |
| 84 | `userId` | User ID | User ID | — |
| 85 | `sourceCode` | Source Code | Source Code | — |
| 86 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 87 | `taxLiable` | Tax Liable | Tax Liable | — |
| 88 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 89 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | — |
| 90 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | — |
| 91 | `prepaymentCreditMemo` | Prepayment Credit Memo | Prepayment Credit Memo | — |
| 92 | `prepaymentOrderNo` | Prepayment Order No. | Prepayment Order No. | — |
| 93 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | — |
| 94 | `altVatRegistrationNo` | Alt. VAT Registration No. | Alternative VAT Registration No. | — |
| 95 | `altGenBusPostingGroup` | Alt. Gen. Bus Posting Group | Alternative Gen. Bus. Posting Group | — |
| 96 | `altVatBusPostingGroup` | Alt. VAT Bus Posting Group | Alternative VAT Bus. Posting Group | — |
| 97 | `sellToPhoneNo` | Sell-to Phone No. | Sell-to Phone No. | — |
| 98 | `sellToEMail` | Sell-to E-Mail | Email | — |
| 99 | `vatReportingDate` | VAT Reporting Date | VAT Date | — |
| 100 | `rcvdFromCountRegionCode` | Rcvd.-from Count./Region Code | Received-from Country/Region Code | — |
| 101 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | — |
| 102 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 103 | `documentExchangeIdentifier` | Document Exchange Identifier | Document Exchange Identifier | — |
| 104 | `documentExchangeStatus` | Document Exchange Status | Document Exchange Status | — |
| 105 | `docExchOriginalIdentifier` | Doc. Exch. Original Identifier | Doc. Exch. Original Identifier | — |
| 106 | `paid` | Paid | Paid | 🧮 computed |
| 107 | `remainingAmount` | Remaining Amount | Remaining Amount | 🧮 computed |
| 108 | `custLedgerEntryNo` | Cust. Ledger Entry No. | Cust. Ledger Entry No. | — |
| 109 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 110 | `cancelled` | Cancelled | Cancelled | 🧮 computed |
| 111 | `corrective` | Corrective | Corrective | 🧮 computed |
| 112 | `campaignNo` | Campaign No. | Campaign No. | — |
| 113 | `sellToContactNo` | Sell-to Contact No. | Sell-to Contact No. | — |
| 114 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | — |
| 115 | `opportunityNo` | Opportunity No. | Opportunity No. | — |
| 116 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 117 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | — |
| 118 | `returnOrderNo` | Return Order No. | Return Order No. | — |
| 119 | `returnOrderNoSeries` | Return Order No. Series | Return Order No. Series | — |
| 120 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 121 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 122 | `getReturnReceiptUsed` | Get Return Receipt Used | Get Return Receipt Used | — |
| 123 | `draftCrMemoSystemid` | Draft Cr. Memo SystemId | Draft Cr. Memo System Id | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedSalesCreditMemoLines

**Description:** Lines of posted sales credit memos.

| Property | Value |
|---|---|
| **Source Table** | Sales Cr.Memo Line |
| Page ID | 90881 |
| Page Name | `ocpfPostedSalesCreditMemoLines` |
| Entity Set Name | `ocpfPostedSalesCreditMemoLines` |
| API Group | `ocpf_sales` |
| Editable | ❌ No (GET only) |
| Field Count | 97 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `no` | No. | No. | — |
| 7 | `locationCode` | Location Code | Location Code | — |
| 8 | `postingGroup` | Posting Group | Posting Group | — |
| 9 | `shipmentDate` | Shipment Date | Shipment Date | — |
| 10 | `description` | Description | Description | — |
| 11 | `description2` | Description 2 | Description 2 | — |
| 12 | `unitOfMeasure` | Unit of Measure | Unit of Measure | — |
| 13 | `quantity` | Quantity | Quantity | — |
| 14 | `unitPrice` | Unit Price | Unit Price | — |
| 15 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 16 | `vatPct` | VAT % | VAT % | — |
| 17 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 18 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | — |
| 19 | `amount` | Amount | Amount | — |
| 20 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | — |
| 21 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 22 | `grossWeight` | Gross Weight | Gross Weight | — |
| 23 | `netWeight` | Net Weight | Net Weight | — |
| 24 | `unitsPerParcel` | Units per Parcel | Units per Parcel | — |
| 25 | `unitVolume` | Unit Volume | Unit Volume | — |
| 26 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | — |
| 27 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 28 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 29 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 30 | `jobNo` | Job No. | Project No. | — |
| 31 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 32 | `orderNo` | Order No. | Order No. | — |
| 33 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 34 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 35 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | — |
| 36 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 37 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 38 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 39 | `transactionType` | Transaction Type | Transaction Type | — |
| 40 | `transportMethod` | Transport Method | Transport Method | — |
| 41 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 42 | `exitPoint` | Exit Point | Exit Point | — |
| 43 | `areaCode` | Area | Area | — |
| 44 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 45 | `taxCategory` | Tax Category | Tax Category | — |
| 46 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 47 | `taxLiable` | Tax Liable | Tax Liable | — |
| 48 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 49 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | — |
| 50 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 51 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 52 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | — |
| 53 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | — |
| 54 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | — |
| 55 | `unitCost` | Unit Cost | Unit Cost | — |
| 56 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | — |
| 57 | `lineAmount` | Line Amount | Line Amount | — |
| 58 | `vatDifference` | VAT Difference | VAT Difference | — |
| 59 | `vatIdentifier` | VAT Identifier | VAT Identifier | — |
| 60 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | — |
| 61 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | — |
| 62 | `prepaymentLine` | Prepayment Line | Prepayment Line | — |
| 63 | `icPartnerCode` | IC Partner Code | IC Partner Code | — |
| 64 | `postingDate` | Posting Date | Posting Date | — |
| 65 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | — |
| 66 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | — |
| 67 | `lineDiscountCalculation` | Line Discount Calculation | Line Discount Calculation | — |
| 68 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 69 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 70 | `jobContractEntryNo` | Job Contract Entry No. | Project Contract Entry No. | — |
| 71 | `deferralCode` | Deferral Code | Deferral Code | — |
| 72 | `variantCode` | Variant Code | Variant Code | — |
| 73 | `binCode` | Bin Code | Bin Code | — |
| 74 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 75 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 76 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 77 | `faPostingDate` | FA Posting Date | FA Posting Date | — |
| 78 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | — |
| 79 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | — |
| 80 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | — |
| 81 | `useDuplicationList` | Use Duplication List | Use Duplication List | — |
| 82 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 83 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 84 | `nonstock` | Nonstock | Catalog | — |
| 85 | `purchasingCode` | Purchasing Code | Purchasing Code | — |
| 86 | `itemReferenceNo` | Item Reference No. | Item Reference No. | — |
| 87 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Unit of Measure (Item Ref.) | — |
| 88 | `itemReferenceType` | Item Reference Type | Item Reference Type | — |
| 89 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | — |
| 90 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | — |
| 91 | `returnReceiptNo` | Return Receipt No. | Return Receipt No. | — |
| 92 | `returnReceiptLineNo` | Return Receipt Line No. | Return Receipt Line No. | — |
| 93 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 94 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 95 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 96 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 97 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedSalesShipments

**Description:** Posted sales shipments.

| Property | Value |
|---|---|
| **Source Table** | Sales Shipment Header |
| Page ID | 90882 |
| Page Name | `ocpfPostedSalesShipments` |
| Entity Set Name | `ocpfPostedSalesShipments` |
| API Group | `ocpf_sales` |
| Editable | ❌ No (GET only) |
| Field Count | 107 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 5 | `billToName` | Bill-to Name | Bill-to Name | — |
| 6 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | — |
| 7 | `billToAddress` | Bill-to Address | Bill-to Address | — |
| 8 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | — |
| 9 | `billToCity` | Bill-to City | Bill-to City | — |
| 10 | `billToContact` | Bill-to Contact | Bill-to Contact | — |
| 11 | `yourReference` | Your Reference | Your Reference | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 14 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 15 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 16 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 17 | `shipToCity` | Ship-to City | Ship-to City | — |
| 18 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 19 | `orderDate` | Order Date | Order Date | — |
| 20 | `postingDate` | Posting Date | Posting Date | — |
| 21 | `shipmentDate` | Shipment Date | Shipment Date | — |
| 22 | `postingDescription` | Posting Description | Posting Description | — |
| 23 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 24 | `dueDate` | Due Date | Due Date | — |
| 25 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | — |
| 26 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 27 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | — |
| 28 | `locationCode` | Location Code | Location Code | — |
| 29 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 30 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 31 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | — |
| 32 | `currencyCode` | Currency Code | Currency Code | — |
| 33 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 34 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 35 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | — |
| 36 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | — |
| 37 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 38 | `languageCode` | Language Code | Language Code | — |
| 39 | `formatRegion` | Format Region | Format Region | — |
| 40 | `salespersonCode` | Salesperson Code | Salesperson Code | — |
| 41 | `orderNo` | Order No. | Order No. | — |
| 42 | `comment` | Comment | Comment | 🧮 computed |
| 43 | `noPrinted` | No. Printed | No. Printed | — |
| 44 | `onHold` | On Hold | On Hold | — |
| 45 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 46 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 47 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 48 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 49 | `reasonCode` | Reason Code | Reason Code | — |
| 50 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 51 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | — |
| 52 | `transactionType` | Transaction Type | Transaction Type | — |
| 53 | `transportMethod` | Transport Method | Transport Method | — |
| 54 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | — |
| 55 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | — |
| 56 | `sellToCustomerName2` | Sell-to Customer Name 2 | Sell-to Customer Name 2 | — |
| 57 | `sellToAddress` | Sell-to Address | Sell-to Address | — |
| 58 | `sellToAddress2` | Sell-to Address 2 | Sell-to Address 2 | — |
| 59 | `sellToCity` | Sell-to City | Sell-to City | — |
| 60 | `sellToContact` | Sell-to Contact | Sell-to Contact | — |
| 61 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | — |
| 62 | `billToCounty` | Bill-to County | Bill-to County | — |
| 63 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | — |
| 64 | `sellToPostCode` | Sell-to Post Code | Sell-to Post Code | — |
| 65 | `sellToCounty` | Sell-to County | Sell-to County | — |
| 66 | `sellToCountryRegionCode` | Sell-to Country/Region Code | Sell-to Country/Region Code | — |
| 67 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 68 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 69 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 70 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 71 | `exitPoint` | Exit Point | Exit Point | — |
| 72 | `correction` | Correction | Correction | — |
| 73 | `documentDate` | Document Date | Document Date | — |
| 74 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 75 | `areaCode` | Area | Area | — |
| 76 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 77 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 78 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | — |
| 79 | `packageTrackingNo` | Package Tracking No. | Package Tracking No. | — |
| 80 | `noSeries` | No. Series | No. Series | — |
| 81 | `orderNoSeries` | Order No. Series | Order No. Series | — |
| 82 | `userId` | User ID | User ID | — |
| 83 | `sourceCode` | Source Code | Source Code | — |
| 84 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 85 | `taxLiable` | Tax Liable | Tax Liable | — |
| 86 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 87 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | — |
| 88 | `quoteNo` | Quote No. | Quote No. | — |
| 89 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | — |
| 90 | `sellToPhoneNo` | Sell-to Phone No. | Sell-to Phone No. | — |
| 91 | `sellToEMail` | Sell-to E-Mail | Email | — |
| 92 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | — |
| 93 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 94 | `campaignNo` | Campaign No. | Campaign No. | — |
| 95 | `sellToContactNo` | Sell-to Contact No. | Sell-to Contact No. | — |
| 96 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | — |
| 97 | `opportunityNo` | Opportunity No. | Opportunity No. | — |
| 98 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 99 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | — |
| 100 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | — |
| 101 | `shippingTime` | Shipping Time | Shipping Time | — |
| 102 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | — |
| 103 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | — |
| 104 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 105 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 106 | `customerId` | Customer Id | Customer Id | — |
| 107 | `billToCustomerId` | Bill-to Customer Id | Bill-to Customer Id | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedSalesShipmentLines

**Description:** Lines of posted sales shipments.

| Property | Value |
|---|---|
| **Source Table** | Sales Shipment Line |
| Page ID | 90883 |
| Page Name | `ocpfPostedSalesShipmentLines` |
| Entity Set Name | `ocpfPostedSalesShipmentLines` |
| API Group | `ocpf_sales` |
| Editable | ❌ No (GET only) |
| Field Count | 97 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `no` | No. | No. | — |
| 7 | `locationCode` | Location Code | Location Code | — |
| 8 | `postingGroup` | Posting Group | Posting Group | — |
| 9 | `shipmentDate` | Shipment Date | Shipment Date | — |
| 10 | `description` | Description | Description | — |
| 11 | `description2` | Description 2 | Description 2 | — |
| 12 | `unitOfMeasure` | Unit of Measure | Unit of Measure | — |
| 13 | `quantity` | Quantity | Quantity | — |
| 14 | `unitPrice` | Unit Price | Unit Price | — |
| 15 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 16 | `vatPct` | VAT % | VAT % | — |
| 17 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 18 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 19 | `grossWeight` | Gross Weight | Gross Weight | — |
| 20 | `netWeight` | Net Weight | Net Weight | — |
| 21 | `unitsPerParcel` | Units per Parcel | Units per Parcel | — |
| 22 | `unitVolume` | Unit Volume | Unit Volume | — |
| 23 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | — |
| 24 | `itemShptEntryNo` | Item Shpt. Entry No. | Item Shpt. Entry No. | — |
| 25 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 26 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 27 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 28 | `jobNo` | Job No. | Project No. | — |
| 29 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 30 | `qtyShippedNotInvoiced` | Qty. Shipped Not Invoiced | Qty. Shipped Not Invoiced | — |
| 31 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | — |
| 32 | `orderNo` | Order No. | Order No. | — |
| 33 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 34 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 35 | `purchaseOrderNo` | Purchase Order No. | Purchase Order No. | — |
| 36 | `purchOrderLineNo` | Purch. Order Line No. | Purch. Order Line No. | — |
| 37 | `dropShipment` | Drop Shipment | Drop Shipment | — |
| 38 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 39 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 40 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 41 | `transactionType` | Transaction Type | Transaction Type | — |
| 42 | `transportMethod` | Transport Method | Transport Method | — |
| 43 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 44 | `exitPoint` | Exit Point | Exit Point | — |
| 45 | `areaCode` | Area | Area | — |
| 46 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 47 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 48 | `taxLiable` | Tax Liable | Tax Liable | — |
| 49 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 50 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 51 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 52 | `currencyCode` | Currency Code | Currency Code | 🧮 computed |
| 53 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | — |
| 54 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | — |
| 55 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | — |
| 56 | `unitCost` | Unit Cost | Unit Cost | — |
| 57 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | — |
| 58 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | — |
| 59 | `postingDate` | Posting Date | Posting Date | — |
| 60 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | — |
| 61 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 62 | `authorizedForCreditCard` | Authorized for Credit Card | Authorized for Credit Card | — |
| 63 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 64 | `jobContractEntryNo` | Job Contract Entry No. | Project Contract Entry No. | — |
| 65 | `variantCode` | Variant Code | Variant Code | — |
| 66 | `binCode` | Bin Code | Bin Code | — |
| 67 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 68 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 69 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 70 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | — |
| 71 | `faPostingDate` | FA Posting Date | FA Posting Date | — |
| 72 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | — |
| 73 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | — |
| 74 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | — |
| 75 | `useDuplicationList` | Use Duplication List | Use Duplication List | — |
| 76 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 77 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 78 | `nonstock` | Nonstock | Catalog | — |
| 79 | `purchasingCode` | Purchasing Code | Purchasing Code | — |
| 80 | `itemReferenceNo` | Item Reference No. | Item Reference No. | — |
| 81 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Unit of Measure (Item Ref.) | — |
| 82 | `itemReferenceType` | Item Reference Type | Item Reference Type | — |
| 83 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | — |
| 84 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | — |
| 85 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | — |
| 86 | `shippingTime` | Shipping Time | Shipping Time | — |
| 87 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | — |
| 88 | `plannedDeliveryDate` | Planned Delivery Date | Planned Delivery Date | — |
| 89 | `plannedShipmentDate` | Planned Shipment Date | Planned Shipment Date | — |
| 90 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | — |
| 91 | `itemChargeBaseAmount` | Item Charge Base Amount | Item Charge Base Amount | — |
| 92 | `correction` | Correction | Correction | — |
| 93 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 94 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 95 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 96 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 97 | `documentId` | Document Id | Document Id | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedReturnReceipts

**Description:** Posted return receipts (items received back from customers).

| Property | Value |
|---|---|
| **Source Table** | Return Receipt Header |
| Page ID | 90884 |
| Page Name | `ocpfPostedReturnReceipts` |
| Entity Set Name | `ocpfPostedReturnReceipts` |
| API Group | `ocpf_sales` |
| Editable | ❌ No (GET only) |
| Field Count | 102 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 5 | `billToName` | Bill-to Name | Bill-to Name | — |
| 6 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | — |
| 7 | `billToAddress` | Bill-to Address | Bill-to Address | — |
| 8 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | — |
| 9 | `billToCity` | Bill-to City | Bill-to City | — |
| 10 | `billToContact` | Bill-to Contact | Bill-to Contact | — |
| 11 | `yourReference` | Your Reference | Your Reference | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 14 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 15 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 16 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 17 | `shipToCity` | Ship-to City | Ship-to City | — |
| 18 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 19 | `orderDate` | Order Date | Order Date | — |
| 20 | `postingDate` | Posting Date | Posting Date | — |
| 21 | `shipmentDate` | Shipment Date | Shipment Date | — |
| 22 | `postingDescription` | Posting Description | Posting Description | — |
| 23 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 24 | `dueDate` | Due Date | Due Date | — |
| 25 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | — |
| 26 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 27 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | — |
| 28 | `locationCode` | Location Code | Location Code | — |
| 29 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 30 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 31 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | — |
| 32 | `currencyCode` | Currency Code | Currency Code | — |
| 33 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 34 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 35 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | — |
| 36 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | — |
| 37 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 38 | `languageCode` | Language Code | Language Code | — |
| 39 | `formatRegion` | Format Region | Format Region | — |
| 40 | `salespersonCode` | Salesperson Code | Salesperson Code | — |
| 41 | `comment` | Comment | Comment | 🧮 computed |
| 42 | `noPrinted` | No. Printed | No. Printed | — |
| 43 | `onHold` | On Hold | On Hold | — |
| 44 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 45 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 46 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 47 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 48 | `reasonCode` | Reason Code | Reason Code | — |
| 49 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 50 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | — |
| 51 | `transactionType` | Transaction Type | Transaction Type | — |
| 52 | `transportMethod` | Transport Method | Transport Method | — |
| 53 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | — |
| 54 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | — |
| 55 | `sellToCustomerName2` | Sell-to Customer Name 2 | Sell-to Customer Name 2 | — |
| 56 | `sellToAddress` | Sell-to Address | Sell-to Address | — |
| 57 | `sellToAddress2` | Sell-to Address 2 | Sell-to Address 2 | — |
| 58 | `sellToCity` | Sell-to City | Sell-to City | — |
| 59 | `sellToContact` | Sell-to Contact | Sell-to Contact | — |
| 60 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | — |
| 61 | `billToCounty` | Bill-to County | Bill-to County | — |
| 62 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | — |
| 63 | `sellToPostCode` | Sell-to Post Code | Sell-to Post Code | — |
| 64 | `sellToCounty` | Sell-to County | Sell-to County | — |
| 65 | `sellToCountryRegionCode` | Sell-to Country/Region Code | Sell-to Country/Region Code | — |
| 66 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 67 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 68 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 69 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 70 | `exitPoint` | Exit Point | Exit Point | — |
| 71 | `correction` | Correction | Correction | — |
| 72 | `documentDate` | Document Date | Document Date | — |
| 73 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 74 | `areaCode` | Area | Area | — |
| 75 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 76 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 77 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | — |
| 78 | `packageTrackingNo` | Package Tracking No. | Package Tracking No. | — |
| 79 | `noSeries` | No. Series | No. Series | — |
| 80 | `userId` | User ID | User ID | — |
| 81 | `sourceCode` | Source Code | Source Code | — |
| 82 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 83 | `taxLiable` | Tax Liable | Tax Liable | — |
| 84 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 85 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | — |
| 86 | `rcvdFromCountRegionCode` | Rcvd.-from Count./Region Code | Received-from Country/Region Code | — |
| 87 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | — |
| 88 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 89 | `campaignNo` | Campaign No. | Campaign No. | — |
| 90 | `sellToContactNo` | Sell-to Contact No. | Sell-to Contact No. | — |
| 91 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | — |
| 92 | `opportunityNo` | Opportunity No. | Opportunity No. | — |
| 93 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 94 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | — |
| 95 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | — |
| 96 | `shippingTime` | Shipping Time | Shipping Time | — |
| 97 | `warehouseHandlingTime` | Warehouse Handling Time | Warehouse Handling Time | — |
| 98 | `lateOrderShipping` | Late Order Shipping | Late Order Shipping | — |
| 99 | `returnOrderNo` | Return Order No. | Return Order No. | — |
| 100 | `returnOrderNoSeries` | Return Order No. Series | Return Order No. Series | — |
| 101 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 102 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedReturnReceiptLines

**Description:** Lines of posted return receipts.

| Property | Value |
|---|---|
| **Source Table** | Return Receipt Line |
| Page ID | 90885 |
| Page Name | `ocpfPostedReturnReceiptLines` |
| Entity Set Name | `ocpfPostedReturnReceiptLines` |
| API Group | `ocpf_sales` |
| Editable | ❌ No (GET only) |
| Field Count | 85 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `no` | No. | No. | — |
| 7 | `locationCode` | Location Code | Location Code | — |
| 8 | `postingGroup` | Posting Group | Posting Group | — |
| 9 | `shipmentDate` | Shipment Date | Shipment Date | — |
| 10 | `description` | Description | Description | — |
| 11 | `description2` | Description 2 | Description 2 | — |
| 12 | `unitOfMeasure` | Unit of Measure | Unit of Measure | — |
| 13 | `quantity` | Quantity | Quantity | — |
| 14 | `unitPrice` | Unit Price | Unit Price | — |
| 15 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 16 | `vatPct` | VAT % | VAT % | — |
| 17 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 18 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 19 | `grossWeight` | Gross Weight | Gross Weight | — |
| 20 | `netWeight` | Net Weight | Net Weight | — |
| 21 | `unitsPerParcel` | Units per Parcel | Units per Parcel | — |
| 22 | `unitVolume` | Unit Volume | Unit Volume | — |
| 23 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | — |
| 24 | `itemRcptEntryNo` | Item Rcpt. Entry No. | Item Rcpt. Entry No. | — |
| 25 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 26 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 27 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 28 | `jobNo` | Job No. | Project No. | — |
| 29 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 30 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | — |
| 31 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 32 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 33 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 34 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 35 | `transactionType` | Transaction Type | Transaction Type | — |
| 36 | `transportMethod` | Transport Method | Transport Method | — |
| 37 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 38 | `exitPoint` | Exit Point | Exit Point | — |
| 39 | `areaCode` | Area | Area | — |
| 40 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 41 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 42 | `taxLiable` | Tax Liable | Tax Liable | — |
| 43 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 44 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 45 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 46 | `currencyCode` | Currency Code | Currency Code | 🧮 computed |
| 47 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | — |
| 48 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | — |
| 49 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | — |
| 50 | `unitCost` | Unit Cost | Unit Cost | — |
| 51 | `postingDate` | Posting Date | Posting Date | — |
| 52 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | — |
| 53 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 54 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 55 | `jobContractEntryNo` | Job Contract Entry No. | Project Contract Entry No. | — |
| 56 | `variantCode` | Variant Code | Variant Code | — |
| 57 | `binCode` | Bin Code | Bin Code | — |
| 58 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 59 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 60 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 61 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | — |
| 62 | `faPostingDate` | FA Posting Date | FA Posting Date | — |
| 63 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | — |
| 64 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | — |
| 65 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | — |
| 66 | `useDuplicationList` | Use Duplication List | Use Duplication List | — |
| 67 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 68 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 69 | `nonstock` | Nonstock | Catalog | — |
| 70 | `purchasingCode` | Purchasing Code | Purchasing Code | — |
| 71 | `itemReferenceNo` | Item Reference No. | Item Reference No. | — |
| 72 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Unit of Measure (Item Ref.) | — |
| 73 | `itemReferenceType` | Item Reference Type | Item Reference Type | — |
| 74 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | — |
| 75 | `returnQtyRcdNotInvd` | Return Qty. Rcd. Not Invd. | Return Qty. Rcd. Not Invd. | — |
| 76 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | — |
| 77 | `itemChargeBaseAmount` | Item Charge Base Amount | Item Charge Base Amount | — |
| 78 | `correction` | Correction | Correction | — |
| 79 | `returnOrderNo` | Return Order No. | Return Order No. | — |
| 80 | `returnOrderLineNo` | Return Order Line No. | Return Order Line No. | — |
| 81 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 82 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 83 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 84 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 85 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfSalesBlanketOrders

**Description:** Sales blanket orders — long-term framework agreements with customers.

| Property | Value |
|---|---|
| **Source Table** | Sales Header |
| Page ID | 90886 |
| Page Name | `ocpfSalesBlanketOrders` |
| Entity Set Name | `ocpfSalesBlanketOrders` |
| API Group | `ocpf_sales` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const("Blanket Order")` |
| Field Count | 182 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 4 | `no` | No. | No. | ✅ |
| 5 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 6 | `billToName` | Bill-to Name | Bill-to Name | ✅ |
| 7 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | ✅ |
| 8 | `billToAddress` | Bill-to Address | Bill-to Address | ✅ |
| 9 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | ✅ |
| 10 | `billToCity` | Bill-to City | Bill-to City | ✅ |
| 11 | `billToContact` | Bill-to Contact | Bill-to Contact | ✅ |
| 12 | `yourReference` | Your Reference | Your Reference | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `shipToName` | Ship-to Name | Ship-to Name | ✅ |
| 15 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | ✅ |
| 16 | `shipToAddress` | Ship-to Address | Ship-to Address | ✅ |
| 17 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | ✅ |
| 18 | `shipToCity` | Ship-to City | Ship-to City | ✅ |
| 19 | `shipToContact` | Ship-to Contact | Ship-to Contact | ✅ |
| 20 | `orderDate` | Order Date | Order Date | ✅ |
| 21 | `postingDate` | Posting Date | Posting Date | ✅ |
| 22 | `shipmentDate` | Shipment Date | Shipment Date | ✅ |
| 23 | `postingDescription` | Posting Description | Posting Description | ✅ |
| 24 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 25 | `dueDate` | Due Date | Due Date | ✅ |
| 26 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 27 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 28 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 29 | `locationCode` | Location Code | Location Code | ✅ |
| 30 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 31 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 32 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | ✅ |
| 33 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 34 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 35 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 36 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 37 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 38 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 39 | `languageCode` | Language Code | Language Code | ✅ |
| 40 | `formatRegion` | Format Region | Format Region | ✅ |
| 41 | `salespersonCode` | Salesperson Code | Salesperson Code | ✅ |
| 42 | `orderClass` | Order Class | Order Class | ✅ |
| 43 | `comment` | Comment | Comment | 🧮 computed |
| 44 | `noPrinted` | No. Printed | No. Printed | ✅ |
| 45 | `onHold` | On Hold | On Hold | ✅ |
| 46 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 47 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 48 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 49 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | 🧮 computed |
| 50 | `ship` | Ship | Ship | ✅ |
| 51 | `invoice` | Invoice | Invoice | ✅ |
| 52 | `printPostedDocuments` | Print Posted Documents | Print Posted Documents | ✅ |
| 53 | `amount` | Amount | Amount | 🧮 computed |
| 54 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 55 | `shippingNo` | Shipping No. | Shipping No. | ✅ |
| 56 | `postingNo` | Posting No. | Posting No. | ✅ |
| 57 | `lastShippingNo` | Last Shipping No. | Last Shipping No. | ✅ |
| 58 | `lastPostingNo` | Last Posting No. | Last Posting No. | ✅ |
| 59 | `prepaymentNo` | Prepayment No. | Prepayment No. | ✅ |
| 60 | `lastPrepaymentNo` | Last Prepayment No. | Last Prepayment No. | ✅ |
| 61 | `prepmtCrMemoNo` | Prepmt. Cr. Memo No. | Prepmt. Cr. Memo No. | ✅ |
| 62 | `lastPrepmtCrMemoNo` | Last Prepmt. Cr. Memo No. | Last Prepmt. Cr. Memo No. | ✅ |
| 63 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 64 | `combineShipments` | Combine Shipments | Combine Shipments | ✅ |
| 65 | `registrationNumber` | Registration Number | Registration No. | ✅ |
| 66 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 67 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 68 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | ✅ |
| 69 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 70 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 71 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | ✅ |
| 72 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | ✅ |
| 73 | `sellToCustomerName2` | Sell-to Customer Name 2 | Sell-to Customer Name 2 | ✅ |
| 74 | `sellToAddress` | Sell-to Address | Sell-to Address | ✅ |
| 75 | `sellToAddress2` | Sell-to Address 2 | Sell-to Address 2 | ✅ |
| 76 | `sellToCity` | Sell-to City | Sell-to City | ✅ |
| 77 | `sellToContact` | Sell-to Contact | Sell-to Contact | ✅ |
| 78 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | ✅ |
| 79 | `billToCounty` | Bill-to County | Bill-to County | ✅ |
| 80 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | ✅ |
| 81 | `sellToPostCode` | Sell-to Post Code | Sell-to Post Code | ✅ |
| 82 | `sellToCounty` | Sell-to County | Sell-to County | ✅ |
| 83 | `sellToCountryRegionCode` | Sell-to Country/Region Code | Sell-to Country/Region Code | ✅ |
| 84 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | ✅ |
| 85 | `shipToCounty` | Ship-to County | Ship-to County | ✅ |
| 86 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | ✅ |
| 87 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 88 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 89 | `correction` | Correction | Correction | ✅ |
| 90 | `documentDate` | Document Date | Document Date | ✅ |
| 91 | `externalDocumentNo` | External Document No. | External Document No. | ✅ |
| 92 | `areaCode` | Area | Area | ✅ |
| 93 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 94 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 95 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 96 | `packageTrackingNo` | Package Tracking No. | Package Tracking No. | ✅ |
| 97 | `noSeries` | No. Series | No. Series | ✅ |
| 98 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 99 | `shippingNoSeries` | Shipping No. Series | Shipping No. Series | ✅ |
| 100 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 101 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 102 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 103 | `reserve` | Reserve | Reserve | ✅ |
| 104 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 105 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 106 | `status` | Status | Status | ✅ |
| 107 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | ✅ |
| 108 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | ✅ |
| 109 | `sendIcDocument` | Send IC Document | Send IC Document | ✅ |
| 110 | `icStatus` | IC Status | IC Status | ✅ |
| 111 | `sellToIcPartnerCode` | Sell-to IC Partner Code | Sell-to IC Partner Code | ✅ |
| 112 | `billToIcPartnerCode` | Bill-to IC Partner Code | Bill-to IC Partner Code | ✅ |
| 113 | `icReferenceDocumentNo` | IC Reference Document No. | IC Reference Document No. | ✅ |
| 114 | `icDirection` | IC Direction | IC Direction | ✅ |
| 115 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 116 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | ✅ |
| 117 | `compressPrepayment` | Compress Prepayment | Compress Prepayment | ✅ |
| 118 | `prepaymentDueDate` | Prepayment Due Date | Prepayment Due Date | ✅ |
| 119 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | ✅ |
| 120 | `prepmtPostingDescription` | Prepmt. Posting Description | Prepmt. Posting Description | ✅ |
| 121 | `prepmtPmtDiscountDate` | Prepmt. Pmt. Discount Date | Prepmt. Pmt. Discount Date | ✅ |
| 122 | `prepmtPaymentTermsCode` | Prepmt. Payment Terms Code | Prepmt. Payment Terms Code | ✅ |
| 123 | `prepmtPaymentDiscountPct` | Prepmt. Payment Discount % | Prepmt. Payment Discount % | ✅ |
| 124 | `quoteNo` | Quote No. | Quote No. | ✅ |
| 125 | `quoteValidUntilDate` | Quote Valid Until Date | Quote Valid To Date | ✅ |
| 126 | `quoteSentToCustomer` | Quote Sent to Customer | Quote Sent to Customer | ✅ |
| 127 | `quoteAccepted` | Quote Accepted | Quote Accepted | ✅ |
| 128 | `quoteAcceptedDate` | Quote Accepted Date | Quote Accepted Date | ✅ |
| 129 | `jobQueueStatus` | Job Queue Status | Job Queue Status | ✅ |
| 130 | `jobQueueEntryId` | Job Queue Entry ID | Job Queue Entry ID | ✅ |
| 131 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | ✅ |
| 132 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 133 | `altVatRegistrationNo` | Alt. VAT Registration No. | Alternative VAT Registration No. | ✅ |
| 134 | `altGenBusPostingGroup` | Alt. Gen. Bus Posting Group | Alternative Gen. Bus. Posting Group | ✅ |
| 135 | `altVatBusPostingGroup` | Alt. VAT Bus Posting Group | Alternative VAT Bus. Posting Group | ✅ |
| 136 | `istest` | IsTest | IsTest | ✅ |
| 137 | `sellToPhoneNo` | Sell-to Phone No. | Sell-to Phone No. | ✅ |
| 138 | `sellToEMail` | Sell-to E-Mail | Email | ✅ |
| 139 | `journalTemplName` | Journal Templ. Name | Journal Template Name | ✅ |
| 140 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 141 | `rcvdFromCountRegionCode` | Rcvd.-from Count./Region Code | Received-from Country/Region Code | ✅ |
| 142 | `lastEmailSentTime` | Last Email Sent Time | Last Email Sent Time | 🧮 computed |
| 143 | `lastEmailSentMessageId` | Last Email Sent Message Id | Last Email Sent Message Id | 🧮 computed |
| 144 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | ✅ |
| 145 | `amtShipNotInvLcy` | Amt. Ship. Not Inv. (LCY) | Amount Shipped Not Invoiced (LCY) Incl. VAT | 🧮 computed |
| 146 | `amtShipNotInvLcyBase` | Amt. Ship. Not Inv. (LCY) Base | Amount Shipped Not Invoiced (LCY) | 🧮 computed |
| 147 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 148 | `paymentServiceSetId` | Payment Service Set ID | Payment Service Set ID | ✅ |
| 149 | `coupledToDataverse` | Coupled to Dataverse | Coupled to Dynamics 365 Sales | 🧮 computed |
| 150 | `directDebitMandateId` | Direct Debit Mandate ID | Direct Debit Mandate ID | ✅ |
| 151 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 152 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 153 | `docNoOccurrence` | Doc. No. Occurrence | Doc. No. Occurrence | ✅ |
| 154 | `campaignNo` | Campaign No. | Campaign No. | ✅ |
| 155 | `sellToContactNo` | Sell-to Contact No. | Sell-to Contact No. | ✅ |
| 156 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | ✅ |
| 157 | `opportunityNo` | Opportunity No. | Opportunity No. | ✅ |
| 158 | `sellToCustomerTemplCode` | Sell-to Customer Templ. Code | Sell-to Customer Template Code | ✅ |
| 159 | `billToCustomerTemplCode` | Bill-to Customer Templ. Code | Bill-to Customer Template Code | ✅ |
| 160 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 161 | `shippingAdvice` | Shipping Advice | Shipping Advice | ✅ |
| 162 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | 🧮 computed |
| 163 | `completelyShipped` | Completely Shipped | Completely Shipped | 🧮 computed |
| 164 | `postingFromWhseRef` | Posting from Whse. Ref. | Posting from Whse. Ref. | ✅ |
| 165 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 166 | `shipped` | Shipped | Shipped | 🧮 computed |
| 167 | `lastShipmentDate` | Last Shipment Date | Last Shipment Date | 🧮 computed |
| 168 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | ✅ |
| 169 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | ✅ |
| 170 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 171 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | ✅ |
| 172 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 173 | `lateOrderShipping` | Late Order Shipping | Late Order Shipping | 🧮 computed |
| 174 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 175 | `receive` | Receive | Receive | ✅ |
| 176 | `returnReceiptNo` | Return Receipt No. | Return Receipt No. | ✅ |
| 177 | `returnReceiptNoSeries` | Return Receipt No. Series | Return Receipt No. Series | ✅ |
| 178 | `lastReturnReceiptNo` | Last Return Receipt No. | Last Return Receipt No. | ✅ |
| 179 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 180 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 181 | `getShipmentUsed` | Get Shipment Used | Get Shipment Used | ✅ |
| 182 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfSalesBlanketOrderLines

**Description:** Lines of open sales blanket orders.

| Property | Value |
|---|---|
| **Source Table** | Sales Line |
| Page ID | 90887 |
| Page Name | `ocpfSalesBlanketOrderLines` |
| Entity Set Name | `ocpfSalesBlanketOrderLines` |
| API Group | `ocpf_sales` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const("Blanket Order")` |
| Field Count | 194 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 4 | `documentNo` | Document No. | Document No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `type` | Type | Type | ✅ |
| 7 | `no` | No. | No. | ✅ |
| 8 | `locationCode` | Location Code | Location Code | ✅ |
| 9 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 10 | `shipmentDate` | Shipment Date | Shipment Date | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `description2` | Description 2 | Description 2 | ✅ |
| 13 | `unitOfMeasure` | Unit of Measure | Unit of Measure | ✅ |
| 14 | `quantity` | Quantity | Quantity | ✅ |
| 15 | `outstandingQuantity` | Outstanding Quantity | Outstanding Quantity | ✅ |
| 16 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | ✅ |
| 17 | `qtyToShip` | Qty. to Ship | Qty. to Ship | ✅ |
| 18 | `unitPrice` | Unit Price | Unit Price | ✅ |
| 19 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | ✅ |
| 20 | `vatPct` | VAT % | VAT % | ✅ |
| 21 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 22 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 23 | `amount` | Amount | Amount | ✅ |
| 24 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | ✅ |
| 25 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 26 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 27 | `netWeight` | Net Weight | Net Weight | ✅ |
| 28 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 29 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 30 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 31 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 32 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 33 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 34 | `jobNo` | Job No. | Project No. | ✅ |
| 35 | `workTypeCode` | Work Type Code | Work Type Code | ✅ |
| 36 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | ✅ |
| 37 | `outstandingAmount` | Outstanding Amount | Outstanding Amount | ✅ |
| 38 | `qtyShippedNotInvoiced` | Qty. Shipped Not Invoiced | Qty. Shipped Not Invoiced | ✅ |
| 39 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | ✅ |
| 40 | `quantityShipped` | Quantity Shipped | Quantity Shipped | ✅ |
| 41 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | ✅ |
| 42 | `shipmentNo` | Shipment No. | Shipment No. | ✅ |
| 43 | `shipmentLineNo` | Shipment Line No. | Shipment Line No. | ✅ |
| 44 | `profitPct` | Profit % | Profit % | ✅ |
| 45 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 46 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | ✅ |
| 47 | `purchaseOrderNo` | Purchase Order No. | Purchase Order No. | ✅ |
| 48 | `purchOrderLineNo` | Purch. Order Line No. | Purch. Order Line No. | ✅ |
| 49 | `dropShipment` | Drop Shipment | Drop Shipment | ✅ |
| 50 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 51 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 52 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 53 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 54 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 55 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | ✅ |
| 56 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 57 | `areaCode` | Area | Area | ✅ |
| 58 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 59 | `taxCategory` | Tax Category | Tax Category | ✅ |
| 60 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 61 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 62 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 63 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | ✅ |
| 64 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 65 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 66 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 67 | `outstandingAmountLcy` | Outstanding Amount (LCY) | Outstanding Amount (LCY) | ✅ |
| 68 | `shippedNotInvoicedLcy` | Shipped Not Invoiced (LCY) | Shipped Not Invoiced (LCY) Incl. VAT | ✅ |
| 69 | `shippedNotInvLcyNoVat` | Shipped Not Inv. (LCY) No VAT | Shipped Not Invoiced (LCY) | ✅ |
| 70 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 71 | `reserve` | Reserve | Reserve | ✅ |
| 72 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | ✅ |
| 73 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | ✅ |
| 74 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 75 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 76 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 77 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 78 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 79 | `invDiscAmountToInvoice` | Inv. Disc. Amount to Invoice | Inv. Disc. Amount to Invoice | ✅ |
| 80 | `vatIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 81 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | ✅ |
| 82 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | ✅ |
| 83 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 84 | `prepmtLineAmount` | Prepmt. Line Amount | Prepmt. Line Amount | ✅ |
| 85 | `prepmtAmtInv` | Prepmt. Amt. Inv. | Prepmt. Amt. Inv. | ✅ |
| 86 | `prepmtAmtInclVat` | Prepmt. Amt. Incl. VAT | Prepmt. Amt. Incl. VAT | ✅ |
| 87 | `prepaymentAmount` | Prepayment Amount | Prepayment Amount | ✅ |
| 88 | `prepmtVatBaseAmt` | Prepmt. VAT Base Amt. | Prepmt. VAT Base Amt. | ✅ |
| 89 | `prepaymentVatPct` | Prepayment VAT % | Prepayment VAT % | ✅ |
| 90 | `prepmtVatCalcType` | Prepmt. VAT Calc. Type | Prepmt. VAT Calc. Type | ✅ |
| 91 | `prepaymentVatIdentifier` | Prepayment VAT Identifier | Prepayment VAT Identifier | ✅ |
| 92 | `prepaymentTaxAreaCode` | Prepayment Tax Area Code | Prepayment Tax Area Code | ✅ |
| 93 | `prepaymentTaxLiable` | Prepayment Tax Liable | Prepayment Tax Liable | ✅ |
| 94 | `prepaymentTaxGroupCode` | Prepayment Tax Group Code | Prepayment Tax Group Code | ✅ |
| 95 | `prepmtAmtToDeduct` | Prepmt Amt to Deduct | Prepmt Amt to Deduct | ✅ |
| 96 | `prepmtAmtDeducted` | Prepmt Amt Deducted | Prepmt Amt Deducted | ✅ |
| 97 | `prepaymentLine` | Prepayment Line | Prepayment Line | ✅ |
| 98 | `prepmtAmountInvInclVat` | Prepmt. Amount Inv. Incl. VAT | Prepmt. Amount Inv. Incl. VAT | ✅ |
| 99 | `prepmtAmountInvLcy` | Prepmt. Amount Inv. (LCY) | Prepmt. Amount Inv. (LCY) | ✅ |
| 100 | `icPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 101 | `prepmtVatAmountInvLcy` | Prepmt. VAT Amount Inv. (LCY) | Prepmt. VAT Amount Inv. (LCY) | ✅ |
| 102 | `prepaymentVatDifference` | Prepayment VAT Difference | Prepayment VAT Difference | ✅ |
| 103 | `prepmtVatDiffToDeduct` | Prepmt VAT Diff. to Deduct | Prepmt VAT Diff. to Deduct | ✅ |
| 104 | `prepmtVatDiffDeducted` | Prepmt VAT Diff. Deducted | Prepmt VAT Diff. Deducted | ✅ |
| 105 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | ✅ |
| 106 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | ✅ |
| 107 | `prepmtPmtDiscountAmount` | Prepmt. Pmt. Discount Amount | Prepmt. Pmt. Discount Amount | ✅ |
| 108 | `lineDiscountCalculation` | Line Discount Calculation | Line Discount Calculation | ✅ |
| 109 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 110 | `qtyToAssembleToOrder` | Qty. to Assemble to Order | Qty. to Assemble to Order | ✅ |
| 111 | `qtyToAsmToOrderBase` | Qty. to Asm. to Order (Base) | Qty. to Asm. to Order (Base) | ✅ |
| 112 | `atoWhseOutstandingQty` | ATO Whse. Outstanding Qty. | ATO Whse. Outstanding Qty. | 🧮 computed |
| 113 | `atoWhseOutstdQtyBase` | ATO Whse. Outstd. Qty. (Base) | ATO Whse. Outstd. Qty. (Base) | 🧮 computed |
| 114 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 115 | `jobContractEntryNo` | Job Contract Entry No. | Project Contract Entry No. | ✅ |
| 116 | `postingDate` | Posting Date | Posting Date | 🧮 computed |
| 117 | `deferralCode` | Deferral Code | Deferral Code | ✅ |
| 118 | `returnsDeferralStartDate` | Returns Deferral Start Date | Returns Deferral Start Date | ✅ |
| 119 | `selectedAllocAccountNo` | Selected Alloc. Account No. | Allocation Account No. | ✅ |
| 120 | `allocAccModifiedByUser` | Alloc. Acc. Modified by User | Allocation Account Distributions Modified | 🧮 computed |
| 121 | `allocationAccountNo` | Allocation Account No. | Posting Allocation Account No. | ✅ |
| 122 | `allocSalesLineSystemid` | Alloc. Sales Line SystemId | Allocation Sales Line SystemId | ✅ |
| 123 | `variantCode` | Variant Code | Variant Code | ✅ |
| 124 | `binCode` | Bin Code | Bin Code | ✅ |
| 125 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 126 | `planned` | Planned | Planned | ✅ |
| 127 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 128 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 129 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 130 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 131 | `outstandingQtyBase` | Outstanding Qty. (Base) | Outstanding Qty. (Base) | ✅ |
| 132 | `qtyToInvoiceBase` | Qty. to Invoice (Base) | Qty. to Invoice (Base) | ✅ |
| 133 | `qtyToShipBase` | Qty. to Ship (Base) | Qty. to Ship (Base) | ✅ |
| 134 | `qtyShippedNotInvdBase` | Qty. Shipped Not Invd. (Base) | Qty. Shipped Not Invd. (Base) | ✅ |
| 135 | `qtyShippedBase` | Qty. Shipped (Base) | Qty. Shipped (Base) | ✅ |
| 136 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | ✅ |
| 137 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 138 | `faPostingDate` | FA Posting Date | FA Posting Date | ✅ |
| 139 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | ✅ |
| 140 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | ✅ |
| 141 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | ✅ |
| 142 | `useDuplicationList` | Use Duplication List | Use Duplication List | ✅ |
| 143 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 144 | `outOfStockSubstitution` | Out-of-Stock Substitution | Out-of-Stock Substitution | ✅ |
| 145 | `substitutionAvailable` | Substitution Available | Substitution Available | 🧮 computed |
| 146 | `originallyOrderedNo` | Originally Ordered No. | Originally Ordered No. | ✅ |
| 147 | `originallyOrderedVarCode` | Originally Ordered Var. Code | Originally Ordered Var. Code | ✅ |
| 148 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 149 | `nonstock` | Nonstock | Catalog | ✅ |
| 150 | `purchasingCode` | Purchasing Code | Purchasing Code | ✅ |
| 151 | `specialOrder` | Special Order | Special Order | ✅ |
| 152 | `specialOrderPurchaseNo` | Special Order Purchase No. | Special Order Purchase No. | ✅ |
| 153 | `specialOrderPurchLineNo` | Special Order Purch. Line No. | Special Order Purch. Line No. | ✅ |
| 154 | `itemReferenceNo` | Item Reference No. | Item Reference No. | ✅ |
| 155 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Reference Unit of Measure | ✅ |
| 156 | `itemReferenceType` | Item Reference Type | Item Reference Type | ✅ |
| 157 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | ✅ |
| 158 | `whseOutstandingQty` | Whse. Outstanding Qty. | Whse. Outstanding Qty. | 🧮 computed |
| 159 | `whseOutstandingQtyBase` | Whse. Outstanding Qty. (Base) | Whse. Outstanding Qty. (Base) | 🧮 computed |
| 160 | `completelyShipped` | Completely Shipped | Completely Shipped | ✅ |
| 161 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | ✅ |
| 162 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | ✅ |
| 163 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 164 | `outboundWhseHandlingTime` | Outbound Whse. Handling Time | Outbound Whse. Handling Time | ✅ |
| 165 | `plannedDeliveryDate` | Planned Delivery Date | Planned Delivery Date | ✅ |
| 166 | `plannedShipmentDate` | Planned Shipment Date | Planned Shipment Date | ✅ |
| 167 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 168 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 169 | `allowItemChargeAssignment` | Allow Item Charge Assignment | Allow Item Charge Assignment | ✅ |
| 170 | `qtyToAssign` | Qty. to Assign | Qty. to Assign | 🧮 computed |
| 171 | `qtyAssigned` | Qty. Assigned | Qty. Assigned | 🧮 computed |
| 172 | `returnQtyToReceive` | Return Qty. to Receive | Return Qty. to Receive | ✅ |
| 173 | `returnQtyToReceiveBase` | Return Qty. to Receive (Base) | Return Qty. to Receive (Base) | ✅ |
| 174 | `returnQtyRcdNotInvd` | Return Qty. Rcd. Not Invd. | Return Qty. Rcd. Not Invd. | ✅ |
| 175 | `retQtyRcdNotInvdBase` | Ret. Qty. Rcd. Not Invd.(Base) | Ret. Qty. Rcd. Not Invd.(Base) | ✅ |
| 176 | `returnRcdNotInvd` | Return Rcd. Not Invd. | Return Rcd. Not Invd. | ✅ |
| 177 | `returnRcdNotInvdLcy` | Return Rcd. Not Invd. (LCY) | Return Rcd. Not Invd. (LCY) | ✅ |
| 178 | `returnQtyReceived` | Return Qty. Received | Return Qty. Received | ✅ |
| 179 | `returnQtyReceivedBase` | Return Qty. Received (Base) | Return Qty. Received (Base) | ✅ |
| 180 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | ✅ |
| 181 | `itemChargeQtyToHandle` | Item Charge Qty. to Handle | Item Charge Qty. to Handle | 🧮 computed |
| 182 | `bomItemNo` | BOM Item No. | BOM Item No. | ✅ |
| 183 | `returnReceiptNo` | Return Receipt No. | Return Receipt No. | ✅ |
| 184 | `returnReceiptLineNo` | Return Receipt Line No. | Return Receipt Line No. | ✅ |
| 185 | `returnReasonCode` | Return Reason Code | Return Reason Code | ✅ |
| 186 | `copiedFromPostedDoc` | Copied From Posted Doc. | Copied From Posted Doc. | ✅ |
| 187 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 188 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 189 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 190 | `subtype` | Subtype | Subtype | ✅ |
| 191 | `priceDescription` | Price description | Price description | ✅ |
| 192 | `attachedDocCount` | Attached Doc Count | Attached Doc Count | 🧮 computed |
| 193 | `attachedLinesCount` | Attached Lines Count | Attached Lines Count | 🧮 computed |
| 194 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfSalesLineDiscounts

**Description:** Sales Line Discounts — line discount percentages by customer, item, and other sales pricing criteria. (Note: the classic Sales Line Discount table is obsolete-pending in BC, superseded by Price List Line in the V16 price engine, but remains fully functional.)

| Property | Value |
|---|---|
| **Source Table** | Sales Line Discount |
| Page ID | 90888 |
| Page Name | `ocpfSalesLineDiscounts` |
| Entity Set Name | `ocpfSalesLineDiscounts` |
| API Group | `ocpf_sales` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 12 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `salesCode` | Sales Code | Sales Code | ✅ |
| 4 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 5 | `startingDate` | Starting Date | Starting Date | ✅ |
| 6 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 7 | `salesType` | Sales Type | Sales Type | ✅ |
| 8 | `minimumQuantity` | Minimum Quantity | Minimum Quantity | ✅ |
| 9 | `endingDate` | Ending Date | Ending Date | ✅ |
| 10 | `type` | Type | Type | ✅ |
| 11 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 12 | `variantCode` | Variant Code | Variant Code | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfCustomerInvoiceDiscounts

**Description:** Customer Invoice Discounts — invoice discount percentages and service charges by customer discount group and currency (the sales/customer invoice discount setup).

| Property | Value |
|---|---|
| **Source Table** | Cust. Invoice Disc. |
| Page ID | 90889 |
| Page Name | `ocpfCustomerInvoiceDiscounts` |
| Entity Set Name | `ocpfCustomerInvoiceDiscounts` |
| API Group | `ocpf_sales` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 6 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `minimumAmount` | Minimum Amount | Minimum Amount | ✅ |
| 4 | `discountPct` | Discount % | Discount % | ✅ |
| 5 | `serviceCharge` | Service Charge | Service Charge | ✅ |
| 6 | `currencyCode` | Currency Code | Currency Code | ✅ |


[↑ Back to top](#table-of-contents)

---

## Purchasing

[↑ Table of Contents](#table-of-contents)

**API Group URL segment:** `ocpf_purchasing`  
**Pages:** 20 (12 editable, 8 read-only)  

### ocpfPurchaseOrders

**Description:** Open purchase orders awaiting receipt or invoicing.

| Property | Value |
|---|---|
| **Source Table** | Purchase Header |
| Page ID | 90890 |
| Page Name | `ocpfPurchaseOrders` |
| Entity Set Name | `ocpfPurchaseOrders` |
| API Group | `ocpf_purchasing` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Order)` |
| Field Count | 159 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | ✅ |
| 4 | `no` | No. | No. | ✅ |
| 5 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | ✅ |
| 6 | `payToName` | Pay-to Name | Pay-to Name | ✅ |
| 7 | `payToName2` | Pay-to Name 2 | Pay-to Name 2 | ✅ |
| 8 | `payToAddress` | Pay-to Address | Pay-to Address | ✅ |
| 9 | `payToAddress2` | Pay-to Address 2 | Pay-to Address 2 | ✅ |
| 10 | `payToCity` | Pay-to City | Pay-to City | ✅ |
| 11 | `payToContact` | Pay-to Contact | Pay-to Contact | ✅ |
| 12 | `yourReference` | Your Reference | Your Reference | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `shipToName` | Ship-to Name | Ship-to Name | ✅ |
| 15 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | ✅ |
| 16 | `shipToAddress` | Ship-to Address | Ship-to Address | ✅ |
| 17 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | ✅ |
| 18 | `shipToCity` | Ship-to City | Ship-to City | ✅ |
| 19 | `shipToContact` | Ship-to Contact | Ship-to Contact | ✅ |
| 20 | `orderDate` | Order Date | Order Date | ✅ |
| 21 | `postingDate` | Posting Date | Posting Date | ✅ |
| 22 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | ✅ |
| 23 | `postingDescription` | Posting Description | Posting Description | ✅ |
| 24 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 25 | `dueDate` | Due Date | Due Date | ✅ |
| 26 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 27 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 28 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 29 | `locationCode` | Location Code | Location Code | ✅ |
| 30 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 31 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 32 | `vendorPostingGroup` | Vendor Posting Group | Vendor Posting Group | ✅ |
| 33 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 34 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 35 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 36 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 37 | `languageCode` | Language Code | Language Code | ✅ |
| 38 | `formatRegion` | Format Region | Format Region | ✅ |
| 39 | `purchaserCode` | Purchaser Code | Purchaser Code | ✅ |
| 40 | `orderClass` | Order Class | Order Class | ✅ |
| 41 | `comment` | Comment | Comment | 🧮 computed |
| 42 | `noPrinted` | No. Printed | No. Printed | ✅ |
| 43 | `onHold` | On Hold | On Hold | ✅ |
| 44 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 45 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 46 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 47 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | 🧮 computed |
| 48 | `receive` | Receive | Receive | ✅ |
| 49 | `invoice` | Invoice | Invoice | ✅ |
| 50 | `printPostedDocuments` | Print Posted Documents | Print Posted Documents | ✅ |
| 51 | `amount` | Amount | Amount | 🧮 computed |
| 52 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 53 | `receivingNo` | Receiving No. | Receiving No. | ✅ |
| 54 | `postingNo` | Posting No. | Posting No. | ✅ |
| 55 | `lastReceivingNo` | Last Receiving No. | Last Receiving No. | ✅ |
| 56 | `lastPostingNo` | Last Posting No. | Last Posting No. | ✅ |
| 57 | `vendorOrderNo` | Vendor Order No. | Vendor Order No. | ✅ |
| 58 | `vendorShipmentNo` | Vendor Shipment No. | Vendor Shipment No. | ✅ |
| 59 | `vendorInvoiceNo` | Vendor Invoice No. | Vendor Invoice No. | ✅ |
| 60 | `vendorCrMemoNo` | Vendor Cr. Memo No. | Vendor Cr. Memo No. | ✅ |
| 61 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 62 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 63 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 64 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 65 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 66 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 67 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | ✅ |
| 68 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | ✅ |
| 69 | `buyFromVendorName2` | Buy-from Vendor Name 2 | Buy-from Vendor Name 2 | ✅ |
| 70 | `buyFromAddress` | Buy-from Address | Buy-from Address | ✅ |
| 71 | `buyFromAddress2` | Buy-from Address 2 | Buy-from Address 2 | ✅ |
| 72 | `buyFromCity` | Buy-from City | Buy-from City | ✅ |
| 73 | `buyFromContact` | Buy-from Contact | Buy-from Contact | ✅ |
| 74 | `payToPostCode` | Pay-to Post Code | Pay-to Post Code | ✅ |
| 75 | `payToCounty` | Pay-to County | Pay-to County | ✅ |
| 76 | `payToCountryRegionCode` | Pay-to Country/Region Code | Pay-to Country/Region Code | ✅ |
| 77 | `buyFromPostCode` | Buy-from Post Code | Buy-from Post Code | ✅ |
| 78 | `buyFromCounty` | Buy-from County | Buy-from County | ✅ |
| 79 | `buyFromCountryRegionCode` | Buy-from Country/Region Code | Buy-from Country/Region Code | ✅ |
| 80 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | ✅ |
| 81 | `shipToCounty` | Ship-to County | Ship-to County | ✅ |
| 82 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | ✅ |
| 83 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 84 | `orderAddressCode` | Order Address Code | Order Address Code | ✅ |
| 85 | `entryPoint` | Entry Point | Entry Point | ✅ |
| 86 | `correction` | Correction | Correction | ✅ |
| 87 | `documentDate` | Document Date | Document Date | ✅ |
| 88 | `areaCode` | Area | Area | ✅ |
| 89 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 90 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 91 | `noSeries` | No. Series | No. Series | ✅ |
| 92 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 93 | `receivingNoSeries` | Receiving No. Series | Receiving No. Series | ✅ |
| 94 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 95 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 96 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 97 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 98 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 99 | `status` | Status | Status | ✅ |
| 100 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | ✅ |
| 101 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | ✅ |
| 102 | `sendIcDocument` | Send IC Document | Send IC Document | ✅ |
| 103 | `icStatus` | IC Status | IC Status | ✅ |
| 104 | `buyFromIcPartnerCode` | Buy-from IC Partner Code | Buy-from IC Partner Code | ✅ |
| 105 | `payToIcPartnerCode` | Pay-to IC Partner Code | Pay-to IC Partner Code | ✅ |
| 106 | `icReferenceDocumentNo` | IC Reference Document No. | IC Reference Document No. | ✅ |
| 107 | `icDirection` | IC Direction | IC Direction | ✅ |
| 108 | `prepaymentNo` | Prepayment No. | Prepayment No. | ✅ |
| 109 | `lastPrepaymentNo` | Last Prepayment No. | Last Prepayment No. | ✅ |
| 110 | `prepmtCrMemoNo` | Prepmt. Cr. Memo No. | Prepmt. Cr. Memo No. | ✅ |
| 111 | `lastPrepmtCrMemoNo` | Last Prepmt. Cr. Memo No. | Last Prepmt. Cr. Memo No. | ✅ |
| 112 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 113 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | ✅ |
| 114 | `compressPrepayment` | Compress Prepayment | Compress Prepayment | ✅ |
| 115 | `prepaymentDueDate` | Prepayment Due Date | Prepayment Due Date | ✅ |
| 116 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | ✅ |
| 117 | `prepmtPostingDescription` | Prepmt. Posting Description | Prepmt. Posting Description | ✅ |
| 118 | `prepmtPmtDiscountDate` | Prepmt. Pmt. Discount Date | Prepmt. Pmt. Discount Date | ✅ |
| 119 | `prepmtPaymentTermsCode` | Prepmt. Payment Terms Code | Prepmt. Payment Terms Code | ✅ |
| 120 | `prepmtPaymentDiscountPct` | Prepmt. Payment Discount % | Prepmt. Payment Discount % | ✅ |
| 121 | `quoteNo` | Quote No. | Quote No. | ✅ |
| 122 | `jobQueueStatus` | Job Queue Status | Job Queue Status | ✅ |
| 123 | `jobQueueEntryId` | Job Queue Entry ID | Job Queue Entry ID | ✅ |
| 124 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 125 | `creditorNo` | Creditor No. | Creditor No. | ✅ |
| 126 | `paymentReference` | Payment Reference | Payment Reference | ✅ |
| 127 | `invoiceReceivedDate` | Invoice Received Date | Invoice Received Date | ✅ |
| 128 | `journalTemplName` | Journal Templ. Name | Journal Template Name | ✅ |
| 129 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 130 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | ✅ |
| 131 | `aRcdNotInvExVatLcy` | A. Rcd. Not Inv. Ex. VAT (LCY) | Amount Received Not Invoiced (LCY) | 🧮 computed |
| 132 | `amtRcdNotInvoicedLcy` | Amt. Rcd. Not Invoiced (LCY) | Amount Received Not Invoiced (LCY) Incl. VAT | 🧮 computed |
| 133 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 134 | `remitToCode` | Remit-to Code | Remit-to Code | ✅ |
| 135 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 136 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 137 | `docNoOccurrence` | Doc. No. Occurrence | Doc. No. Occurrence | ✅ |
| 138 | `campaignNo` | Campaign No. | Campaign No. | ✅ |
| 139 | `buyFromContactNo` | Buy-from Contact No. | Buy-from Contact No. | ✅ |
| 140 | `payToContactNo` | Pay-to Contact No. | Pay-to Contact No. | ✅ |
| 141 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 142 | `partiallyInvoiced` | Partially Invoiced | Partially Invoiced | 🧮 computed |
| 143 | `completelyReceived` | Completely Received | Completely Received | 🧮 computed |
| 144 | `postingFromWhseRef` | Posting from Whse. Ref. | Posting from Whse. Ref. | ✅ |
| 145 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 146 | `receivedNotInvoiced` | Received Not Invoiced | Received Not Invoiced | 🧮 computed |
| 147 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | ✅ |
| 148 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | ✅ |
| 149 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 150 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | ✅ |
| 151 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 152 | `vendorAuthorizationNo` | Vendor Authorization No. | Vendor Authorization No. | ✅ |
| 153 | `returnShipmentNo` | Return Shipment No. | Return Shipment No. | ✅ |
| 154 | `returnShipmentNoSeries` | Return Shipment No. Series | Return Shipment No. Series | ✅ |
| 155 | `ship` | Ship | Ship | ✅ |
| 156 | `lastReturnShipmentNo` | Last Return Shipment No. | Last Return Shipment No. | ✅ |
| 157 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 158 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |
| 159 | `pendingApprovals` | Pending Approvals | Pending Approvals | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfPurchaseOrderLines

**Description:** Lines of open purchase orders.

| Property | Value |
|---|---|
| **Source Table** | Purchase Line |
| Page ID | 90891 |
| Page Name | `ocpfPurchaseOrderLines` |
| Entity Set Name | `ocpfPurchaseOrderLines` |
| API Group | `ocpf_purchasing` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Order)` |
| Field Count | 211 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | ✅ |
| 4 | `documentNo` | Document No. | Document No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `type` | Type | Type | ✅ |
| 7 | `no` | No. | No. | ✅ |
| 8 | `locationCode` | Location Code | Location Code | ✅ |
| 9 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 10 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `description2` | Description 2 | Description 2 | ✅ |
| 13 | `unitOfMeasure` | Unit of Measure | Unit of Measure | ✅ |
| 14 | `quantity` | Quantity | Quantity | ✅ |
| 15 | `outstandingQuantity` | Outstanding Quantity | Outstanding Quantity | ✅ |
| 16 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | ✅ |
| 17 | `qtyToReceive` | Qty. to Receive | Qty. to Receive | ✅ |
| 18 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | ✅ |
| 19 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | ✅ |
| 20 | `vatPct` | VAT % | VAT % | ✅ |
| 21 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 22 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 23 | `amount` | Amount | Amount | ✅ |
| 24 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | ✅ |
| 25 | `unitPriceLcy` | Unit Price (LCY) | Unit Price (LCY) | ✅ |
| 26 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 27 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 28 | `netWeight` | Net Weight | Net Weight | ✅ |
| 29 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 30 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 31 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 32 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 33 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 34 | `jobNo` | Job No. | Project No. | ✅ |
| 35 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | ✅ |
| 36 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | ✅ |
| 37 | `outstandingAmount` | Outstanding Amount | Outstanding Amount | ✅ |
| 38 | `qtyRcdNotInvoiced` | Qty. Rcd. Not Invoiced | Qty. Rcd. Not Invoiced | ✅ |
| 39 | `amtRcdNotInvoiced` | Amt. Rcd. Not Invoiced | Amt. Rcd. Not Invoiced | ✅ |
| 40 | `quantityReceived` | Quantity Received | Quantity Received | ✅ |
| 41 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | ✅ |
| 42 | `receiptNo` | Receipt No. | Receipt No. | ✅ |
| 43 | `receiptLineNo` | Receipt Line No. | Receipt Line No. | ✅ |
| 44 | `orderNo` | Order No. | Order No. | ✅ |
| 45 | `orderLineNo` | Order Line No. | Order Line No. | ✅ |
| 46 | `profitPct` | Profit % | Profit % | ✅ |
| 47 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | ✅ |
| 48 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | ✅ |
| 49 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | ✅ |
| 50 | `salesOrderNo` | Sales Order No. | Sales Order No. | ✅ |
| 51 | `salesOrderLineNo` | Sales Order Line No. | Sales Order Line No. | ✅ |
| 52 | `dropShipment` | Drop Shipment | Drop Shipment | ✅ |
| 53 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 54 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 55 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 56 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 57 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 58 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | ✅ |
| 59 | `entryPoint` | Entry Point | Entry Point | ✅ |
| 60 | `areaCode` | Area | Area | ✅ |
| 61 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 62 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 63 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 64 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 65 | `useTax` | Use Tax | Use Tax | ✅ |
| 66 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 67 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 68 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 69 | `outstandingAmountLcy` | Outstanding Amount (LCY) | Outstanding Amount (LCY) | ✅ |
| 70 | `amtRcdNotInvoicedLcy` | Amt. Rcd. Not Invoiced (LCY) | Amt. Rcd. Not Invoiced (LCY) | ✅ |
| 71 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 72 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | ✅ |
| 73 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | ✅ |
| 74 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 75 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 76 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 77 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 78 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 79 | `invDiscAmountToInvoice` | Inv. Disc. Amount to Invoice | Inv. Disc. Amount to Invoice | ✅ |
| 80 | `vatIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 81 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | ✅ |
| 82 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | ✅ |
| 83 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 84 | `prepmtLineAmount` | Prepmt. Line Amount | Prepmt. Line Amount | ✅ |
| 85 | `prepmtAmtInv` | Prepmt. Amt. Inv. | Prepmt. Amt. Inv. | ✅ |
| 86 | `prepmtAmtInclVat` | Prepmt. Amt. Incl. VAT | Prepmt. Amt. Incl. VAT | ✅ |
| 87 | `prepaymentAmount` | Prepayment Amount | Prepayment Amount | ✅ |
| 88 | `prepmtVatBaseAmt` | Prepmt. VAT Base Amt. | Prepmt. VAT Base Amt. | ✅ |
| 89 | `prepaymentVatPct` | Prepayment VAT % | Prepayment VAT % | ✅ |
| 90 | `prepmtVatCalcType` | Prepmt. VAT Calc. Type | Prepmt. VAT Calc. Type | ✅ |
| 91 | `prepaymentVatIdentifier` | Prepayment VAT Identifier | Prepayment VAT Identifier | ✅ |
| 92 | `prepaymentTaxAreaCode` | Prepayment Tax Area Code | Prepayment Tax Area Code | ✅ |
| 93 | `prepaymentTaxLiable` | Prepayment Tax Liable | Prepayment Tax Liable | ✅ |
| 94 | `prepaymentTaxGroupCode` | Prepayment Tax Group Code | Prepayment Tax Group Code | ✅ |
| 95 | `prepmtAmtToDeduct` | Prepmt Amt to Deduct | Prepmt Amt to Deduct | ✅ |
| 96 | `prepmtAmtDeducted` | Prepmt Amt Deducted | Prepmt Amt Deducted | ✅ |
| 97 | `prepaymentLine` | Prepayment Line | Prepayment Line | ✅ |
| 98 | `prepmtAmountInvInclVat` | Prepmt. Amount Inv. Incl. VAT | Prepmt. Amount Inv. Incl. VAT | ✅ |
| 99 | `prepmtAmountInvLcy` | Prepmt. Amount Inv. (LCY) | Prepmt. Amount Inv. (LCY) | ✅ |
| 100 | `icPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 101 | `prepmtVatAmountInvLcy` | Prepmt. VAT Amount Inv. (LCY) | Prepmt. VAT Amount Inv. (LCY) | ✅ |
| 102 | `prepaymentVatDifference` | Prepayment VAT Difference | Prepayment VAT Difference | ✅ |
| 103 | `prepmtVatDiffToDeduct` | Prepmt VAT Diff. to Deduct | Prepmt VAT Diff. to Deduct | ✅ |
| 104 | `prepmtVatDiffDeducted` | Prepmt VAT Diff. Deducted | Prepmt VAT Diff. Deducted | ✅ |
| 105 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | ✅ |
| 106 | `outstandingAmtExVatLcy` | Outstanding Amt. Ex. VAT (LCY) | Outstanding Amt. Ex. VAT (LCY) | ✅ |
| 107 | `aRcdNotInvExVatLcy` | A. Rcd. Not Inv. Ex. VAT (LCY) | A. Rcd. Not Inv. Ex. VAT (LCY) | ✅ |
| 108 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | ✅ |
| 109 | `prepmtPmtDiscountAmount` | Prepmt. Pmt. Discount Amount | Prepmt. Pmt. Discount Amount | ✅ |
| 110 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 111 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 112 | `jobLineType` | Job Line Type | Project Line Type | ✅ |
| 113 | `jobUnitPrice` | Job Unit Price | Project Unit Price | ✅ |
| 114 | `jobTotalPrice` | Job Total Price | Project Total Price | ✅ |
| 115 | `jobLineAmount` | Job Line Amount | Project Line Amount | ✅ |
| 116 | `jobLineDiscountAmount` | Job Line Discount Amount | Project Line Discount Amount | ✅ |
| 117 | `jobLineDiscountPct` | Job Line Discount % | Project Line Discount % | ✅ |
| 118 | `jobUnitPriceLcy` | Job Unit Price (LCY) | Project Unit Price (LCY) | ✅ |
| 119 | `jobTotalPriceLcy` | Job Total Price (LCY) | Project Total Price (LCY) | ✅ |
| 120 | `jobLineAmountLcy` | Job Line Amount (LCY) | Project Line Amount (LCY) | ✅ |
| 121 | `jobLineDiscAmountLcy` | Job Line Disc. Amount (LCY) | Project Line Disc. Amount (LCY) | ✅ |
| 122 | `jobCurrencyFactor` | Job Currency Factor | Project Currency Factor | ✅ |
| 123 | `jobCurrencyCode` | Job Currency Code | Project Currency Code | ✅ |
| 124 | `jobPlanningLineNo` | Job Planning Line No. | Job Planning Line No. | ✅ |
| 125 | `jobRemainingQty` | Job Remaining Qty. | Project Remaining Qty. | ✅ |
| 126 | `jobRemainingQtyBase` | Job Remaining Qty. (Base) | Project Remaining Qty. (Base) | ✅ |
| 127 | `deferralCode` | Deferral Code | Deferral Code | ✅ |
| 128 | `returnsDeferralStartDate` | Returns Deferral Start Date | Returns Deferral Start Date | ✅ |
| 129 | `selectedAllocAccountNo` | Selected Alloc. Account No. | Allocation Account No. | ✅ |
| 130 | `allocAccModifiedByUser` | Alloc. Acc. Modified by User | Allocation Account Distributions Modified | 🧮 computed |
| 131 | `allocationAccountNo` | Allocation Account No. | Posting Allocation Account No. | ✅ |
| 132 | `allocPurchLineSystemid` | Alloc. Purch. Line SystemId | Allocation Purchase Line SystemId | ✅ |
| 133 | `variantCode` | Variant Code | Variant Code | ✅ |
| 134 | `binCode` | Bin Code | Bin Code | ✅ |
| 135 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 136 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 137 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 138 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 139 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 140 | `outstandingQtyBase` | Outstanding Qty. (Base) | Outstanding Qty. (Base) | ✅ |
| 141 | `qtyToInvoiceBase` | Qty. to Invoice (Base) | Qty. to Invoice (Base) | ✅ |
| 142 | `qtyToReceiveBase` | Qty. to Receive (Base) | Qty. to Receive (Base) | ✅ |
| 143 | `qtyRcdNotInvoicedBase` | Qty. Rcd. Not Invoiced (Base) | Qty. Rcd. Not Invoiced (Base) | ✅ |
| 144 | `qtyReceivedBase` | Qty. Received (Base) | Qty. Received (Base) | ✅ |
| 145 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | ✅ |
| 146 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 147 | `faPostingDate` | FA Posting Date | FA Posting Date | ✅ |
| 148 | `faPostingType` | FA Posting Type | FA Posting Type | ✅ |
| 149 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | ✅ |
| 150 | `salvageValue` | Salvage Value | Salvage Value | ✅ |
| 151 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | ✅ |
| 152 | `deprAcquisitionCost` | Depr. Acquisition Cost | Depr. Acquisition Cost | ✅ |
| 153 | `maintenanceCode` | Maintenance Code | Maintenance Code | ✅ |
| 154 | `insuranceNo` | Insurance No. | Insurance No. | ✅ |
| 155 | `budgetedFaNo` | Budgeted FA No. | Budgeted FA No. | ✅ |
| 156 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | ✅ |
| 157 | `useDuplicationList` | Use Duplication List | Use Duplication List | ✅ |
| 158 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 159 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 160 | `nonstock` | Nonstock | Catalog | ✅ |
| 161 | `purchasingCode` | Purchasing Code | Purchasing Code | ✅ |
| 162 | `specialOrder` | Special Order | Special Order | ✅ |
| 163 | `specialOrderSalesNo` | Special Order Sales No. | Special Order Sales No. | ✅ |
| 164 | `specialOrderSalesLineNo` | Special Order Sales Line No. | Special Order Sales Line No. | ✅ |
| 165 | `itemReferenceNo` | Item Reference No. | Item Reference No. | ✅ |
| 166 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Item Reference Unit of Measure | ✅ |
| 167 | `itemReferenceType` | Item Reference Type | Item Reference Type | ✅ |
| 168 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | ✅ |
| 169 | `whseOutstandingQtyBase` | Whse. Outstanding Qty. (Base) | Whse. Outstanding Qty. (Base) | 🧮 computed |
| 170 | `completelyReceived` | Completely Received | Completely Received | ✅ |
| 171 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | ✅ |
| 172 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | ✅ |
| 173 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 174 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | ✅ |
| 175 | `plannedReceiptDate` | Planned Receipt Date | Planned Receipt Date | ✅ |
| 176 | `orderDate` | Order Date | Order Date | ✅ |
| 177 | `allowItemChargeAssignment` | Allow Item Charge Assignment | Allow Item Charge Assignment | ✅ |
| 178 | `qtyToAssign` | Qty. to Assign | Qty. to Assign | 🧮 computed |
| 179 | `qtyAssigned` | Qty. Assigned | Qty. Assigned | 🧮 computed |
| 180 | `returnQtyToShip` | Return Qty. to Ship | Return Qty. to Ship | ✅ |
| 181 | `returnQtyToShipBase` | Return Qty. to Ship (Base) | Return Qty. to Ship (Base) | ✅ |
| 182 | `returnQtyShippedNotInvd` | Return Qty. Shipped Not Invd. | Return Qty. Shipped Not Invd. | ✅ |
| 183 | `retQtyShpdNotInvdBase` | Ret. Qty. Shpd Not Invd.(Base) | Ret. Qty. Shpd Not Invd.(Base) | ✅ |
| 184 | `returnShpdNotInvd` | Return Shpd. Not Invd. | Return Shpd. Not Invd. | ✅ |
| 185 | `returnShpdNotInvdLcy` | Return Shpd. Not Invd. (LCY) | Return Shpd. Not Invd. (LCY) | ✅ |
| 186 | `returnQtyShipped` | Return Qty. Shipped | Return Qty. Shipped | ✅ |
| 187 | `returnQtyShippedBase` | Return Qty. Shipped (Base) | Return Qty. Shipped (Base) | ✅ |
| 188 | `itemChargeQtyToHandle` | Item Charge Qty. to Handle | Item Charge Qty. to Handle | 🧮 computed |
| 189 | `nonDeductibleVatPct` | Non-Deductible VAT % | Non-Deductible VAT % | ✅ |
| 190 | `nonDeductibleVatBase` | Non-Deductible VAT Base | Non-Deductible VAT Base | ✅ |
| 191 | `nonDeductibleVatAmount` | Non-Deductible VAT Amount | Non-Deductible VAT Amount | ✅ |
| 192 | `nonDeductibleVatDiff` | Non-Deductible VAT Diff. | Non-Deductible VAT Difference | ✅ |
| 193 | `prepmtNonDeductVatBase` | Prepmt. Non-Deduct. VAT Base | Prepmt.  Non-Deductible VAT Base | ✅ |
| 194 | `prepmtNonDeductVatAmount` | Prepmt. Non-Deduct. VAT Amount | Prepmt. on-Deductible VAT Amount | ✅ |
| 195 | `itemChargeHasNonDedVat` | Item Charge Has Non.Ded. VAT | Item Charge Has Non-Deductible VAT | ✅ |
| 196 | `returnShipmentNo` | Return Shipment No. | Return Shipment No. | ✅ |
| 197 | `returnShipmentLineNo` | Return Shipment Line No. | Return Shipment Line No. | ✅ |
| 198 | `returnReasonCode` | Return Reason Code | Return Reason Code | ✅ |
| 199 | `subtype` | Subtype | Subtype | ✅ |
| 200 | `copiedFromPostedDoc` | Copied From Posted Doc. | Copied From Posted Doc. | ✅ |
| 201 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 202 | `attachedDocCount` | Attached Doc Count | Attached Doc Count | 🧮 computed |
| 203 | `attachedLinesCount` | Attached Lines Count | Attached Lines Count | 🧮 computed |
| 204 | `overReceiptQuantity` | Over-Receipt Quantity | Over-Receipt Quantity | ✅ |
| 205 | `overReceiptCode` | Over-Receipt Code | Over-Receipt Code | ✅ |
| 206 | `overReceiptApprovalStatus` | Over-Receipt Approval Status | Over-Receipt Approval Status | ✅ |
| 207 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | 🧮 computed |
| 208 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |
| 209 | `mpsOrder` | MPS Order | MPS Order | ✅ |
| 210 | `planningFlexibility` | Planning Flexibility | Planning Flexibility | ✅ |
| 211 | `safetyLeadTime` | Safety Lead Time | Safety Lead Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfPurchaseInvoices

**Description:** Open purchase invoices (unposted).

| Property | Value |
|---|---|
| **Source Table** | Purchase Header |
| Page ID | 90892 |
| Page Name | `ocpfPurchaseInvoices` |
| Entity Set Name | `ocpfPurchaseInvoices` |
| API Group | `ocpf_purchasing` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Invoice)` |
| Field Count | 159 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | ✅ |
| 4 | `no` | No. | No. | ✅ |
| 5 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | ✅ |
| 6 | `payToName` | Pay-to Name | Pay-to Name | ✅ |
| 7 | `payToName2` | Pay-to Name 2 | Pay-to Name 2 | ✅ |
| 8 | `payToAddress` | Pay-to Address | Pay-to Address | ✅ |
| 9 | `payToAddress2` | Pay-to Address 2 | Pay-to Address 2 | ✅ |
| 10 | `payToCity` | Pay-to City | Pay-to City | ✅ |
| 11 | `payToContact` | Pay-to Contact | Pay-to Contact | ✅ |
| 12 | `yourReference` | Your Reference | Your Reference | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `shipToName` | Ship-to Name | Ship-to Name | ✅ |
| 15 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | ✅ |
| 16 | `shipToAddress` | Ship-to Address | Ship-to Address | ✅ |
| 17 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | ✅ |
| 18 | `shipToCity` | Ship-to City | Ship-to City | ✅ |
| 19 | `shipToContact` | Ship-to Contact | Ship-to Contact | ✅ |
| 20 | `orderDate` | Order Date | Order Date | ✅ |
| 21 | `postingDate` | Posting Date | Posting Date | ✅ |
| 22 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | ✅ |
| 23 | `postingDescription` | Posting Description | Posting Description | ✅ |
| 24 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 25 | `dueDate` | Due Date | Due Date | ✅ |
| 26 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 27 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 28 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 29 | `locationCode` | Location Code | Location Code | ✅ |
| 30 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 31 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 32 | `vendorPostingGroup` | Vendor Posting Group | Vendor Posting Group | ✅ |
| 33 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 34 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 35 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 36 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 37 | `languageCode` | Language Code | Language Code | ✅ |
| 38 | `formatRegion` | Format Region | Format Region | ✅ |
| 39 | `purchaserCode` | Purchaser Code | Purchaser Code | ✅ |
| 40 | `orderClass` | Order Class | Order Class | ✅ |
| 41 | `comment` | Comment | Comment | 🧮 computed |
| 42 | `noPrinted` | No. Printed | No. Printed | ✅ |
| 43 | `onHold` | On Hold | On Hold | ✅ |
| 44 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 45 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 46 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 47 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | 🧮 computed |
| 48 | `receive` | Receive | Receive | ✅ |
| 49 | `invoice` | Invoice | Invoice | ✅ |
| 50 | `printPostedDocuments` | Print Posted Documents | Print Posted Documents | ✅ |
| 51 | `amount` | Amount | Amount | 🧮 computed |
| 52 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 53 | `receivingNo` | Receiving No. | Receiving No. | ✅ |
| 54 | `postingNo` | Posting No. | Posting No. | ✅ |
| 55 | `lastReceivingNo` | Last Receiving No. | Last Receiving No. | ✅ |
| 56 | `lastPostingNo` | Last Posting No. | Last Posting No. | ✅ |
| 57 | `vendorOrderNo` | Vendor Order No. | Vendor Order No. | ✅ |
| 58 | `vendorShipmentNo` | Vendor Shipment No. | Vendor Shipment No. | ✅ |
| 59 | `vendorInvoiceNo` | Vendor Invoice No. | Vendor Invoice No. | ✅ |
| 60 | `vendorCrMemoNo` | Vendor Cr. Memo No. | Vendor Cr. Memo No. | ✅ |
| 61 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 62 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 63 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 64 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 65 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 66 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 67 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | ✅ |
| 68 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | ✅ |
| 69 | `buyFromVendorName2` | Buy-from Vendor Name 2 | Buy-from Vendor Name 2 | ✅ |
| 70 | `buyFromAddress` | Buy-from Address | Buy-from Address | ✅ |
| 71 | `buyFromAddress2` | Buy-from Address 2 | Buy-from Address 2 | ✅ |
| 72 | `buyFromCity` | Buy-from City | Buy-from City | ✅ |
| 73 | `buyFromContact` | Buy-from Contact | Buy-from Contact | ✅ |
| 74 | `payToPostCode` | Pay-to Post Code | Pay-to Post Code | ✅ |
| 75 | `payToCounty` | Pay-to County | Pay-to County | ✅ |
| 76 | `payToCountryRegionCode` | Pay-to Country/Region Code | Pay-to Country/Region Code | ✅ |
| 77 | `buyFromPostCode` | Buy-from Post Code | Buy-from Post Code | ✅ |
| 78 | `buyFromCounty` | Buy-from County | Buy-from County | ✅ |
| 79 | `buyFromCountryRegionCode` | Buy-from Country/Region Code | Buy-from Country/Region Code | ✅ |
| 80 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | ✅ |
| 81 | `shipToCounty` | Ship-to County | Ship-to County | ✅ |
| 82 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | ✅ |
| 83 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 84 | `orderAddressCode` | Order Address Code | Order Address Code | ✅ |
| 85 | `entryPoint` | Entry Point | Entry Point | ✅ |
| 86 | `correction` | Correction | Correction | ✅ |
| 87 | `documentDate` | Document Date | Document Date | ✅ |
| 88 | `areaCode` | Area | Area | ✅ |
| 89 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 90 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 91 | `noSeries` | No. Series | No. Series | ✅ |
| 92 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 93 | `receivingNoSeries` | Receiving No. Series | Receiving No. Series | ✅ |
| 94 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 95 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 96 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 97 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 98 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 99 | `status` | Status | Status | ✅ |
| 100 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | ✅ |
| 101 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | ✅ |
| 102 | `sendIcDocument` | Send IC Document | Send IC Document | ✅ |
| 103 | `icStatus` | IC Status | IC Status | ✅ |
| 104 | `buyFromIcPartnerCode` | Buy-from IC Partner Code | Buy-from IC Partner Code | ✅ |
| 105 | `payToIcPartnerCode` | Pay-to IC Partner Code | Pay-to IC Partner Code | ✅ |
| 106 | `icReferenceDocumentNo` | IC Reference Document No. | IC Reference Document No. | ✅ |
| 107 | `icDirection` | IC Direction | IC Direction | ✅ |
| 108 | `prepaymentNo` | Prepayment No. | Prepayment No. | ✅ |
| 109 | `lastPrepaymentNo` | Last Prepayment No. | Last Prepayment No. | ✅ |
| 110 | `prepmtCrMemoNo` | Prepmt. Cr. Memo No. | Prepmt. Cr. Memo No. | ✅ |
| 111 | `lastPrepmtCrMemoNo` | Last Prepmt. Cr. Memo No. | Last Prepmt. Cr. Memo No. | ✅ |
| 112 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 113 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | ✅ |
| 114 | `compressPrepayment` | Compress Prepayment | Compress Prepayment | ✅ |
| 115 | `prepaymentDueDate` | Prepayment Due Date | Prepayment Due Date | ✅ |
| 116 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | ✅ |
| 117 | `prepmtPostingDescription` | Prepmt. Posting Description | Prepmt. Posting Description | ✅ |
| 118 | `prepmtPmtDiscountDate` | Prepmt. Pmt. Discount Date | Prepmt. Pmt. Discount Date | ✅ |
| 119 | `prepmtPaymentTermsCode` | Prepmt. Payment Terms Code | Prepmt. Payment Terms Code | ✅ |
| 120 | `prepmtPaymentDiscountPct` | Prepmt. Payment Discount % | Prepmt. Payment Discount % | ✅ |
| 121 | `quoteNo` | Quote No. | Quote No. | ✅ |
| 122 | `jobQueueStatus` | Job Queue Status | Job Queue Status | ✅ |
| 123 | `jobQueueEntryId` | Job Queue Entry ID | Job Queue Entry ID | ✅ |
| 124 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 125 | `creditorNo` | Creditor No. | Creditor No. | ✅ |
| 126 | `paymentReference` | Payment Reference | Payment Reference | ✅ |
| 127 | `invoiceReceivedDate` | Invoice Received Date | Invoice Received Date | ✅ |
| 128 | `journalTemplName` | Journal Templ. Name | Journal Template Name | ✅ |
| 129 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 130 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | ✅ |
| 131 | `aRcdNotInvExVatLcy` | A. Rcd. Not Inv. Ex. VAT (LCY) | Amount Received Not Invoiced (LCY) | 🧮 computed |
| 132 | `amtRcdNotInvoicedLcy` | Amt. Rcd. Not Invoiced (LCY) | Amount Received Not Invoiced (LCY) Incl. VAT | 🧮 computed |
| 133 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 134 | `remitToCode` | Remit-to Code | Remit-to Code | ✅ |
| 135 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 136 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 137 | `docNoOccurrence` | Doc. No. Occurrence | Doc. No. Occurrence | ✅ |
| 138 | `campaignNo` | Campaign No. | Campaign No. | ✅ |
| 139 | `buyFromContactNo` | Buy-from Contact No. | Buy-from Contact No. | ✅ |
| 140 | `payToContactNo` | Pay-to Contact No. | Pay-to Contact No. | ✅ |
| 141 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 142 | `partiallyInvoiced` | Partially Invoiced | Partially Invoiced | 🧮 computed |
| 143 | `completelyReceived` | Completely Received | Completely Received | 🧮 computed |
| 144 | `postingFromWhseRef` | Posting from Whse. Ref. | Posting from Whse. Ref. | ✅ |
| 145 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 146 | `receivedNotInvoiced` | Received Not Invoiced | Received Not Invoiced | 🧮 computed |
| 147 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | ✅ |
| 148 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | ✅ |
| 149 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 150 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | ✅ |
| 151 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 152 | `vendorAuthorizationNo` | Vendor Authorization No. | Vendor Authorization No. | ✅ |
| 153 | `returnShipmentNo` | Return Shipment No. | Return Shipment No. | ✅ |
| 154 | `returnShipmentNoSeries` | Return Shipment No. Series | Return Shipment No. Series | ✅ |
| 155 | `ship` | Ship | Ship | ✅ |
| 156 | `lastReturnShipmentNo` | Last Return Shipment No. | Last Return Shipment No. | ✅ |
| 157 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 158 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |
| 159 | `pendingApprovals` | Pending Approvals | Pending Approvals | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfPurchaseInvoiceLines

**Description:** Lines of open purchase invoices.

| Property | Value |
|---|---|
| **Source Table** | Purchase Line |
| Page ID | 90893 |
| Page Name | `ocpfPurchaseInvoiceLines` |
| Entity Set Name | `ocpfPurchaseInvoiceLines` |
| API Group | `ocpf_purchasing` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Invoice)` |
| Field Count | 211 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | ✅ |
| 4 | `documentNo` | Document No. | Document No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `type` | Type | Type | ✅ |
| 7 | `no` | No. | No. | ✅ |
| 8 | `locationCode` | Location Code | Location Code | ✅ |
| 9 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 10 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `description2` | Description 2 | Description 2 | ✅ |
| 13 | `unitOfMeasure` | Unit of Measure | Unit of Measure | ✅ |
| 14 | `quantity` | Quantity | Quantity | ✅ |
| 15 | `outstandingQuantity` | Outstanding Quantity | Outstanding Quantity | ✅ |
| 16 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | ✅ |
| 17 | `qtyToReceive` | Qty. to Receive | Qty. to Receive | ✅ |
| 18 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | ✅ |
| 19 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | ✅ |
| 20 | `vatPct` | VAT % | VAT % | ✅ |
| 21 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 22 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 23 | `amount` | Amount | Amount | ✅ |
| 24 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | ✅ |
| 25 | `unitPriceLcy` | Unit Price (LCY) | Unit Price (LCY) | ✅ |
| 26 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 27 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 28 | `netWeight` | Net Weight | Net Weight | ✅ |
| 29 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 30 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 31 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 32 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 33 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 34 | `jobNo` | Job No. | Project No. | ✅ |
| 35 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | ✅ |
| 36 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | ✅ |
| 37 | `outstandingAmount` | Outstanding Amount | Outstanding Amount | ✅ |
| 38 | `qtyRcdNotInvoiced` | Qty. Rcd. Not Invoiced | Qty. Rcd. Not Invoiced | ✅ |
| 39 | `amtRcdNotInvoiced` | Amt. Rcd. Not Invoiced | Amt. Rcd. Not Invoiced | ✅ |
| 40 | `quantityReceived` | Quantity Received | Quantity Received | ✅ |
| 41 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | ✅ |
| 42 | `receiptNo` | Receipt No. | Receipt No. | ✅ |
| 43 | `receiptLineNo` | Receipt Line No. | Receipt Line No. | ✅ |
| 44 | `orderNo` | Order No. | Order No. | ✅ |
| 45 | `orderLineNo` | Order Line No. | Order Line No. | ✅ |
| 46 | `profitPct` | Profit % | Profit % | ✅ |
| 47 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | ✅ |
| 48 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | ✅ |
| 49 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | ✅ |
| 50 | `salesOrderNo` | Sales Order No. | Sales Order No. | ✅ |
| 51 | `salesOrderLineNo` | Sales Order Line No. | Sales Order Line No. | ✅ |
| 52 | `dropShipment` | Drop Shipment | Drop Shipment | ✅ |
| 53 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 54 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 55 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 56 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 57 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 58 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | ✅ |
| 59 | `entryPoint` | Entry Point | Entry Point | ✅ |
| 60 | `areaCode` | Area | Area | ✅ |
| 61 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 62 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 63 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 64 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 65 | `useTax` | Use Tax | Use Tax | ✅ |
| 66 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 67 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 68 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 69 | `outstandingAmountLcy` | Outstanding Amount (LCY) | Outstanding Amount (LCY) | ✅ |
| 70 | `amtRcdNotInvoicedLcy` | Amt. Rcd. Not Invoiced (LCY) | Amt. Rcd. Not Invoiced (LCY) | ✅ |
| 71 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 72 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | ✅ |
| 73 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | ✅ |
| 74 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 75 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 76 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 77 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 78 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 79 | `invDiscAmountToInvoice` | Inv. Disc. Amount to Invoice | Inv. Disc. Amount to Invoice | ✅ |
| 80 | `vatIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 81 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | ✅ |
| 82 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | ✅ |
| 83 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 84 | `prepmtLineAmount` | Prepmt. Line Amount | Prepmt. Line Amount | ✅ |
| 85 | `prepmtAmtInv` | Prepmt. Amt. Inv. | Prepmt. Amt. Inv. | ✅ |
| 86 | `prepmtAmtInclVat` | Prepmt. Amt. Incl. VAT | Prepmt. Amt. Incl. VAT | ✅ |
| 87 | `prepaymentAmount` | Prepayment Amount | Prepayment Amount | ✅ |
| 88 | `prepmtVatBaseAmt` | Prepmt. VAT Base Amt. | Prepmt. VAT Base Amt. | ✅ |
| 89 | `prepaymentVatPct` | Prepayment VAT % | Prepayment VAT % | ✅ |
| 90 | `prepmtVatCalcType` | Prepmt. VAT Calc. Type | Prepmt. VAT Calc. Type | ✅ |
| 91 | `prepaymentVatIdentifier` | Prepayment VAT Identifier | Prepayment VAT Identifier | ✅ |
| 92 | `prepaymentTaxAreaCode` | Prepayment Tax Area Code | Prepayment Tax Area Code | ✅ |
| 93 | `prepaymentTaxLiable` | Prepayment Tax Liable | Prepayment Tax Liable | ✅ |
| 94 | `prepaymentTaxGroupCode` | Prepayment Tax Group Code | Prepayment Tax Group Code | ✅ |
| 95 | `prepmtAmtToDeduct` | Prepmt Amt to Deduct | Prepmt Amt to Deduct | ✅ |
| 96 | `prepmtAmtDeducted` | Prepmt Amt Deducted | Prepmt Amt Deducted | ✅ |
| 97 | `prepaymentLine` | Prepayment Line | Prepayment Line | ✅ |
| 98 | `prepmtAmountInvInclVat` | Prepmt. Amount Inv. Incl. VAT | Prepmt. Amount Inv. Incl. VAT | ✅ |
| 99 | `prepmtAmountInvLcy` | Prepmt. Amount Inv. (LCY) | Prepmt. Amount Inv. (LCY) | ✅ |
| 100 | `icPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 101 | `prepmtVatAmountInvLcy` | Prepmt. VAT Amount Inv. (LCY) | Prepmt. VAT Amount Inv. (LCY) | ✅ |
| 102 | `prepaymentVatDifference` | Prepayment VAT Difference | Prepayment VAT Difference | ✅ |
| 103 | `prepmtVatDiffToDeduct` | Prepmt VAT Diff. to Deduct | Prepmt VAT Diff. to Deduct | ✅ |
| 104 | `prepmtVatDiffDeducted` | Prepmt VAT Diff. Deducted | Prepmt VAT Diff. Deducted | ✅ |
| 105 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | ✅ |
| 106 | `outstandingAmtExVatLcy` | Outstanding Amt. Ex. VAT (LCY) | Outstanding Amt. Ex. VAT (LCY) | ✅ |
| 107 | `aRcdNotInvExVatLcy` | A. Rcd. Not Inv. Ex. VAT (LCY) | A. Rcd. Not Inv. Ex. VAT (LCY) | ✅ |
| 108 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | ✅ |
| 109 | `prepmtPmtDiscountAmount` | Prepmt. Pmt. Discount Amount | Prepmt. Pmt. Discount Amount | ✅ |
| 110 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 111 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 112 | `jobLineType` | Job Line Type | Project Line Type | ✅ |
| 113 | `jobUnitPrice` | Job Unit Price | Project Unit Price | ✅ |
| 114 | `jobTotalPrice` | Job Total Price | Project Total Price | ✅ |
| 115 | `jobLineAmount` | Job Line Amount | Project Line Amount | ✅ |
| 116 | `jobLineDiscountAmount` | Job Line Discount Amount | Project Line Discount Amount | ✅ |
| 117 | `jobLineDiscountPct` | Job Line Discount % | Project Line Discount % | ✅ |
| 118 | `jobUnitPriceLcy` | Job Unit Price (LCY) | Project Unit Price (LCY) | ✅ |
| 119 | `jobTotalPriceLcy` | Job Total Price (LCY) | Project Total Price (LCY) | ✅ |
| 120 | `jobLineAmountLcy` | Job Line Amount (LCY) | Project Line Amount (LCY) | ✅ |
| 121 | `jobLineDiscAmountLcy` | Job Line Disc. Amount (LCY) | Project Line Disc. Amount (LCY) | ✅ |
| 122 | `jobCurrencyFactor` | Job Currency Factor | Project Currency Factor | ✅ |
| 123 | `jobCurrencyCode` | Job Currency Code | Project Currency Code | ✅ |
| 124 | `jobPlanningLineNo` | Job Planning Line No. | Job Planning Line No. | ✅ |
| 125 | `jobRemainingQty` | Job Remaining Qty. | Project Remaining Qty. | ✅ |
| 126 | `jobRemainingQtyBase` | Job Remaining Qty. (Base) | Project Remaining Qty. (Base) | ✅ |
| 127 | `deferralCode` | Deferral Code | Deferral Code | ✅ |
| 128 | `returnsDeferralStartDate` | Returns Deferral Start Date | Returns Deferral Start Date | ✅ |
| 129 | `selectedAllocAccountNo` | Selected Alloc. Account No. | Allocation Account No. | ✅ |
| 130 | `allocAccModifiedByUser` | Alloc. Acc. Modified by User | Allocation Account Distributions Modified | 🧮 computed |
| 131 | `allocationAccountNo` | Allocation Account No. | Posting Allocation Account No. | ✅ |
| 132 | `allocPurchLineSystemid` | Alloc. Purch. Line SystemId | Allocation Purchase Line SystemId | ✅ |
| 133 | `variantCode` | Variant Code | Variant Code | ✅ |
| 134 | `binCode` | Bin Code | Bin Code | ✅ |
| 135 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 136 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 137 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 138 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 139 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 140 | `outstandingQtyBase` | Outstanding Qty. (Base) | Outstanding Qty. (Base) | ✅ |
| 141 | `qtyToInvoiceBase` | Qty. to Invoice (Base) | Qty. to Invoice (Base) | ✅ |
| 142 | `qtyToReceiveBase` | Qty. to Receive (Base) | Qty. to Receive (Base) | ✅ |
| 143 | `qtyRcdNotInvoicedBase` | Qty. Rcd. Not Invoiced (Base) | Qty. Rcd. Not Invoiced (Base) | ✅ |
| 144 | `qtyReceivedBase` | Qty. Received (Base) | Qty. Received (Base) | ✅ |
| 145 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | ✅ |
| 146 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 147 | `faPostingDate` | FA Posting Date | FA Posting Date | ✅ |
| 148 | `faPostingType` | FA Posting Type | FA Posting Type | ✅ |
| 149 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | ✅ |
| 150 | `salvageValue` | Salvage Value | Salvage Value | ✅ |
| 151 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | ✅ |
| 152 | `deprAcquisitionCost` | Depr. Acquisition Cost | Depr. Acquisition Cost | ✅ |
| 153 | `maintenanceCode` | Maintenance Code | Maintenance Code | ✅ |
| 154 | `insuranceNo` | Insurance No. | Insurance No. | ✅ |
| 155 | `budgetedFaNo` | Budgeted FA No. | Budgeted FA No. | ✅ |
| 156 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | ✅ |
| 157 | `useDuplicationList` | Use Duplication List | Use Duplication List | ✅ |
| 158 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 159 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 160 | `nonstock` | Nonstock | Catalog | ✅ |
| 161 | `purchasingCode` | Purchasing Code | Purchasing Code | ✅ |
| 162 | `specialOrder` | Special Order | Special Order | ✅ |
| 163 | `specialOrderSalesNo` | Special Order Sales No. | Special Order Sales No. | ✅ |
| 164 | `specialOrderSalesLineNo` | Special Order Sales Line No. | Special Order Sales Line No. | ✅ |
| 165 | `itemReferenceNo` | Item Reference No. | Item Reference No. | ✅ |
| 166 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Item Reference Unit of Measure | ✅ |
| 167 | `itemReferenceType` | Item Reference Type | Item Reference Type | ✅ |
| 168 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | ✅ |
| 169 | `whseOutstandingQtyBase` | Whse. Outstanding Qty. (Base) | Whse. Outstanding Qty. (Base) | 🧮 computed |
| 170 | `completelyReceived` | Completely Received | Completely Received | ✅ |
| 171 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | ✅ |
| 172 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | ✅ |
| 173 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 174 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | ✅ |
| 175 | `plannedReceiptDate` | Planned Receipt Date | Planned Receipt Date | ✅ |
| 176 | `orderDate` | Order Date | Order Date | ✅ |
| 177 | `allowItemChargeAssignment` | Allow Item Charge Assignment | Allow Item Charge Assignment | ✅ |
| 178 | `qtyToAssign` | Qty. to Assign | Qty. to Assign | 🧮 computed |
| 179 | `qtyAssigned` | Qty. Assigned | Qty. Assigned | 🧮 computed |
| 180 | `returnQtyToShip` | Return Qty. to Ship | Return Qty. to Ship | ✅ |
| 181 | `returnQtyToShipBase` | Return Qty. to Ship (Base) | Return Qty. to Ship (Base) | ✅ |
| 182 | `returnQtyShippedNotInvd` | Return Qty. Shipped Not Invd. | Return Qty. Shipped Not Invd. | ✅ |
| 183 | `retQtyShpdNotInvdBase` | Ret. Qty. Shpd Not Invd.(Base) | Ret. Qty. Shpd Not Invd.(Base) | ✅ |
| 184 | `returnShpdNotInvd` | Return Shpd. Not Invd. | Return Shpd. Not Invd. | ✅ |
| 185 | `returnShpdNotInvdLcy` | Return Shpd. Not Invd. (LCY) | Return Shpd. Not Invd. (LCY) | ✅ |
| 186 | `returnQtyShipped` | Return Qty. Shipped | Return Qty. Shipped | ✅ |
| 187 | `returnQtyShippedBase` | Return Qty. Shipped (Base) | Return Qty. Shipped (Base) | ✅ |
| 188 | `itemChargeQtyToHandle` | Item Charge Qty. to Handle | Item Charge Qty. to Handle | 🧮 computed |
| 189 | `nonDeductibleVatPct` | Non-Deductible VAT % | Non-Deductible VAT % | ✅ |
| 190 | `nonDeductibleVatBase` | Non-Deductible VAT Base | Non-Deductible VAT Base | ✅ |
| 191 | `nonDeductibleVatAmount` | Non-Deductible VAT Amount | Non-Deductible VAT Amount | ✅ |
| 192 | `nonDeductibleVatDiff` | Non-Deductible VAT Diff. | Non-Deductible VAT Difference | ✅ |
| 193 | `prepmtNonDeductVatBase` | Prepmt. Non-Deduct. VAT Base | Prepmt.  Non-Deductible VAT Base | ✅ |
| 194 | `prepmtNonDeductVatAmount` | Prepmt. Non-Deduct. VAT Amount | Prepmt. on-Deductible VAT Amount | ✅ |
| 195 | `itemChargeHasNonDedVat` | Item Charge Has Non.Ded. VAT | Item Charge Has Non-Deductible VAT | ✅ |
| 196 | `returnShipmentNo` | Return Shipment No. | Return Shipment No. | ✅ |
| 197 | `returnShipmentLineNo` | Return Shipment Line No. | Return Shipment Line No. | ✅ |
| 198 | `returnReasonCode` | Return Reason Code | Return Reason Code | ✅ |
| 199 | `subtype` | Subtype | Subtype | ✅ |
| 200 | `copiedFromPostedDoc` | Copied From Posted Doc. | Copied From Posted Doc. | ✅ |
| 201 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 202 | `attachedDocCount` | Attached Doc Count | Attached Doc Count | 🧮 computed |
| 203 | `attachedLinesCount` | Attached Lines Count | Attached Lines Count | 🧮 computed |
| 204 | `overReceiptQuantity` | Over-Receipt Quantity | Over-Receipt Quantity | ✅ |
| 205 | `overReceiptCode` | Over-Receipt Code | Over-Receipt Code | ✅ |
| 206 | `overReceiptApprovalStatus` | Over-Receipt Approval Status | Over-Receipt Approval Status | ✅ |
| 207 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | 🧮 computed |
| 208 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |
| 209 | `mpsOrder` | MPS Order | MPS Order | ✅ |
| 210 | `planningFlexibility` | Planning Flexibility | Planning Flexibility | ✅ |
| 211 | `safetyLeadTime` | Safety Lead Time | Safety Lead Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfPurchaseCreditMemos

**Description:** Open purchase credit memos (unposted).

| Property | Value |
|---|---|
| **Source Table** | Purchase Header |
| Page ID | 90894 |
| Page Name | `ocpfPurchaseCreditMemos` |
| Entity Set Name | `ocpfPurchaseCreditMemos` |
| API Group | `ocpf_purchasing` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const("Credit Memo")` |
| Field Count | 159 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | ✅ |
| 4 | `no` | No. | No. | ✅ |
| 5 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | ✅ |
| 6 | `payToName` | Pay-to Name | Pay-to Name | ✅ |
| 7 | `payToName2` | Pay-to Name 2 | Pay-to Name 2 | ✅ |
| 8 | `payToAddress` | Pay-to Address | Pay-to Address | ✅ |
| 9 | `payToAddress2` | Pay-to Address 2 | Pay-to Address 2 | ✅ |
| 10 | `payToCity` | Pay-to City | Pay-to City | ✅ |
| 11 | `payToContact` | Pay-to Contact | Pay-to Contact | ✅ |
| 12 | `yourReference` | Your Reference | Your Reference | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `shipToName` | Ship-to Name | Ship-to Name | ✅ |
| 15 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | ✅ |
| 16 | `shipToAddress` | Ship-to Address | Ship-to Address | ✅ |
| 17 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | ✅ |
| 18 | `shipToCity` | Ship-to City | Ship-to City | ✅ |
| 19 | `shipToContact` | Ship-to Contact | Ship-to Contact | ✅ |
| 20 | `orderDate` | Order Date | Order Date | ✅ |
| 21 | `postingDate` | Posting Date | Posting Date | ✅ |
| 22 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | ✅ |
| 23 | `postingDescription` | Posting Description | Posting Description | ✅ |
| 24 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 25 | `dueDate` | Due Date | Due Date | ✅ |
| 26 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 27 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 28 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 29 | `locationCode` | Location Code | Location Code | ✅ |
| 30 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 31 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 32 | `vendorPostingGroup` | Vendor Posting Group | Vendor Posting Group | ✅ |
| 33 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 34 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 35 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 36 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 37 | `languageCode` | Language Code | Language Code | ✅ |
| 38 | `formatRegion` | Format Region | Format Region | ✅ |
| 39 | `purchaserCode` | Purchaser Code | Purchaser Code | ✅ |
| 40 | `orderClass` | Order Class | Order Class | ✅ |
| 41 | `comment` | Comment | Comment | 🧮 computed |
| 42 | `noPrinted` | No. Printed | No. Printed | ✅ |
| 43 | `onHold` | On Hold | On Hold | ✅ |
| 44 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 45 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 46 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 47 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | 🧮 computed |
| 48 | `receive` | Receive | Receive | ✅ |
| 49 | `invoice` | Invoice | Invoice | ✅ |
| 50 | `printPostedDocuments` | Print Posted Documents | Print Posted Documents | ✅ |
| 51 | `amount` | Amount | Amount | 🧮 computed |
| 52 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 53 | `receivingNo` | Receiving No. | Receiving No. | ✅ |
| 54 | `postingNo` | Posting No. | Posting No. | ✅ |
| 55 | `lastReceivingNo` | Last Receiving No. | Last Receiving No. | ✅ |
| 56 | `lastPostingNo` | Last Posting No. | Last Posting No. | ✅ |
| 57 | `vendorOrderNo` | Vendor Order No. | Vendor Order No. | ✅ |
| 58 | `vendorShipmentNo` | Vendor Shipment No. | Vendor Shipment No. | ✅ |
| 59 | `vendorInvoiceNo` | Vendor Invoice No. | Vendor Invoice No. | ✅ |
| 60 | `vendorCrMemoNo` | Vendor Cr. Memo No. | Vendor Cr. Memo No. | ✅ |
| 61 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 62 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 63 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 64 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 65 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 66 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 67 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | ✅ |
| 68 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | ✅ |
| 69 | `buyFromVendorName2` | Buy-from Vendor Name 2 | Buy-from Vendor Name 2 | ✅ |
| 70 | `buyFromAddress` | Buy-from Address | Buy-from Address | ✅ |
| 71 | `buyFromAddress2` | Buy-from Address 2 | Buy-from Address 2 | ✅ |
| 72 | `buyFromCity` | Buy-from City | Buy-from City | ✅ |
| 73 | `buyFromContact` | Buy-from Contact | Buy-from Contact | ✅ |
| 74 | `payToPostCode` | Pay-to Post Code | Pay-to Post Code | ✅ |
| 75 | `payToCounty` | Pay-to County | Pay-to County | ✅ |
| 76 | `payToCountryRegionCode` | Pay-to Country/Region Code | Pay-to Country/Region Code | ✅ |
| 77 | `buyFromPostCode` | Buy-from Post Code | Buy-from Post Code | ✅ |
| 78 | `buyFromCounty` | Buy-from County | Buy-from County | ✅ |
| 79 | `buyFromCountryRegionCode` | Buy-from Country/Region Code | Buy-from Country/Region Code | ✅ |
| 80 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | ✅ |
| 81 | `shipToCounty` | Ship-to County | Ship-to County | ✅ |
| 82 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | ✅ |
| 83 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 84 | `orderAddressCode` | Order Address Code | Order Address Code | ✅ |
| 85 | `entryPoint` | Entry Point | Entry Point | ✅ |
| 86 | `correction` | Correction | Correction | ✅ |
| 87 | `documentDate` | Document Date | Document Date | ✅ |
| 88 | `areaCode` | Area | Area | ✅ |
| 89 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 90 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 91 | `noSeries` | No. Series | No. Series | ✅ |
| 92 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 93 | `receivingNoSeries` | Receiving No. Series | Receiving No. Series | ✅ |
| 94 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 95 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 96 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 97 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 98 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 99 | `status` | Status | Status | ✅ |
| 100 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | ✅ |
| 101 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | ✅ |
| 102 | `sendIcDocument` | Send IC Document | Send IC Document | ✅ |
| 103 | `icStatus` | IC Status | IC Status | ✅ |
| 104 | `buyFromIcPartnerCode` | Buy-from IC Partner Code | Buy-from IC Partner Code | ✅ |
| 105 | `payToIcPartnerCode` | Pay-to IC Partner Code | Pay-to IC Partner Code | ✅ |
| 106 | `icReferenceDocumentNo` | IC Reference Document No. | IC Reference Document No. | ✅ |
| 107 | `icDirection` | IC Direction | IC Direction | ✅ |
| 108 | `prepaymentNo` | Prepayment No. | Prepayment No. | ✅ |
| 109 | `lastPrepaymentNo` | Last Prepayment No. | Last Prepayment No. | ✅ |
| 110 | `prepmtCrMemoNo` | Prepmt. Cr. Memo No. | Prepmt. Cr. Memo No. | ✅ |
| 111 | `lastPrepmtCrMemoNo` | Last Prepmt. Cr. Memo No. | Last Prepmt. Cr. Memo No. | ✅ |
| 112 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 113 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | ✅ |
| 114 | `compressPrepayment` | Compress Prepayment | Compress Prepayment | ✅ |
| 115 | `prepaymentDueDate` | Prepayment Due Date | Prepayment Due Date | ✅ |
| 116 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | ✅ |
| 117 | `prepmtPostingDescription` | Prepmt. Posting Description | Prepmt. Posting Description | ✅ |
| 118 | `prepmtPmtDiscountDate` | Prepmt. Pmt. Discount Date | Prepmt. Pmt. Discount Date | ✅ |
| 119 | `prepmtPaymentTermsCode` | Prepmt. Payment Terms Code | Prepmt. Payment Terms Code | ✅ |
| 120 | `prepmtPaymentDiscountPct` | Prepmt. Payment Discount % | Prepmt. Payment Discount % | ✅ |
| 121 | `quoteNo` | Quote No. | Quote No. | ✅ |
| 122 | `jobQueueStatus` | Job Queue Status | Job Queue Status | ✅ |
| 123 | `jobQueueEntryId` | Job Queue Entry ID | Job Queue Entry ID | ✅ |
| 124 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 125 | `creditorNo` | Creditor No. | Creditor No. | ✅ |
| 126 | `paymentReference` | Payment Reference | Payment Reference | ✅ |
| 127 | `invoiceReceivedDate` | Invoice Received Date | Invoice Received Date | ✅ |
| 128 | `journalTemplName` | Journal Templ. Name | Journal Template Name | ✅ |
| 129 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 130 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | ✅ |
| 131 | `aRcdNotInvExVatLcy` | A. Rcd. Not Inv. Ex. VAT (LCY) | Amount Received Not Invoiced (LCY) | 🧮 computed |
| 132 | `amtRcdNotInvoicedLcy` | Amt. Rcd. Not Invoiced (LCY) | Amount Received Not Invoiced (LCY) Incl. VAT | 🧮 computed |
| 133 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 134 | `remitToCode` | Remit-to Code | Remit-to Code | ✅ |
| 135 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 136 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 137 | `docNoOccurrence` | Doc. No. Occurrence | Doc. No. Occurrence | ✅ |
| 138 | `campaignNo` | Campaign No. | Campaign No. | ✅ |
| 139 | `buyFromContactNo` | Buy-from Contact No. | Buy-from Contact No. | ✅ |
| 140 | `payToContactNo` | Pay-to Contact No. | Pay-to Contact No. | ✅ |
| 141 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 142 | `partiallyInvoiced` | Partially Invoiced | Partially Invoiced | 🧮 computed |
| 143 | `completelyReceived` | Completely Received | Completely Received | 🧮 computed |
| 144 | `postingFromWhseRef` | Posting from Whse. Ref. | Posting from Whse. Ref. | ✅ |
| 145 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 146 | `receivedNotInvoiced` | Received Not Invoiced | Received Not Invoiced | 🧮 computed |
| 147 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | ✅ |
| 148 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | ✅ |
| 149 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 150 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | ✅ |
| 151 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 152 | `vendorAuthorizationNo` | Vendor Authorization No. | Vendor Authorization No. | ✅ |
| 153 | `returnShipmentNo` | Return Shipment No. | Return Shipment No. | ✅ |
| 154 | `returnShipmentNoSeries` | Return Shipment No. Series | Return Shipment No. Series | ✅ |
| 155 | `ship` | Ship | Ship | ✅ |
| 156 | `lastReturnShipmentNo` | Last Return Shipment No. | Last Return Shipment No. | ✅ |
| 157 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 158 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |
| 159 | `pendingApprovals` | Pending Approvals | Pending Approvals | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfPurchaseCreditMemoLines

**Description:** Lines of open purchase credit memos.

| Property | Value |
|---|---|
| **Source Table** | Purchase Line |
| Page ID | 90895 |
| Page Name | `ocpfPurchaseCreditMemoLines` |
| Entity Set Name | `ocpfPurchaseCreditMemoLines` |
| API Group | `ocpf_purchasing` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const("Credit Memo")` |
| Field Count | 211 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | ✅ |
| 4 | `documentNo` | Document No. | Document No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `type` | Type | Type | ✅ |
| 7 | `no` | No. | No. | ✅ |
| 8 | `locationCode` | Location Code | Location Code | ✅ |
| 9 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 10 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `description2` | Description 2 | Description 2 | ✅ |
| 13 | `unitOfMeasure` | Unit of Measure | Unit of Measure | ✅ |
| 14 | `quantity` | Quantity | Quantity | ✅ |
| 15 | `outstandingQuantity` | Outstanding Quantity | Outstanding Quantity | ✅ |
| 16 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | ✅ |
| 17 | `qtyToReceive` | Qty. to Receive | Qty. to Receive | ✅ |
| 18 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | ✅ |
| 19 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | ✅ |
| 20 | `vatPct` | VAT % | VAT % | ✅ |
| 21 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 22 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 23 | `amount` | Amount | Amount | ✅ |
| 24 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | ✅ |
| 25 | `unitPriceLcy` | Unit Price (LCY) | Unit Price (LCY) | ✅ |
| 26 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 27 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 28 | `netWeight` | Net Weight | Net Weight | ✅ |
| 29 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 30 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 31 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 32 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 33 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 34 | `jobNo` | Job No. | Project No. | ✅ |
| 35 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | ✅ |
| 36 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | ✅ |
| 37 | `outstandingAmount` | Outstanding Amount | Outstanding Amount | ✅ |
| 38 | `qtyRcdNotInvoiced` | Qty. Rcd. Not Invoiced | Qty. Rcd. Not Invoiced | ✅ |
| 39 | `amtRcdNotInvoiced` | Amt. Rcd. Not Invoiced | Amt. Rcd. Not Invoiced | ✅ |
| 40 | `quantityReceived` | Quantity Received | Quantity Received | ✅ |
| 41 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | ✅ |
| 42 | `receiptNo` | Receipt No. | Receipt No. | ✅ |
| 43 | `receiptLineNo` | Receipt Line No. | Receipt Line No. | ✅ |
| 44 | `orderNo` | Order No. | Order No. | ✅ |
| 45 | `orderLineNo` | Order Line No. | Order Line No. | ✅ |
| 46 | `profitPct` | Profit % | Profit % | ✅ |
| 47 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | ✅ |
| 48 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | ✅ |
| 49 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | ✅ |
| 50 | `salesOrderNo` | Sales Order No. | Sales Order No. | ✅ |
| 51 | `salesOrderLineNo` | Sales Order Line No. | Sales Order Line No. | ✅ |
| 52 | `dropShipment` | Drop Shipment | Drop Shipment | ✅ |
| 53 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 54 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 55 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 56 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 57 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 58 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | ✅ |
| 59 | `entryPoint` | Entry Point | Entry Point | ✅ |
| 60 | `areaCode` | Area | Area | ✅ |
| 61 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 62 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 63 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 64 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 65 | `useTax` | Use Tax | Use Tax | ✅ |
| 66 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 67 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 68 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 69 | `outstandingAmountLcy` | Outstanding Amount (LCY) | Outstanding Amount (LCY) | ✅ |
| 70 | `amtRcdNotInvoicedLcy` | Amt. Rcd. Not Invoiced (LCY) | Amt. Rcd. Not Invoiced (LCY) | ✅ |
| 71 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 72 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | ✅ |
| 73 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | ✅ |
| 74 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 75 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 76 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 77 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 78 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 79 | `invDiscAmountToInvoice` | Inv. Disc. Amount to Invoice | Inv. Disc. Amount to Invoice | ✅ |
| 80 | `vatIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 81 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | ✅ |
| 82 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | ✅ |
| 83 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 84 | `prepmtLineAmount` | Prepmt. Line Amount | Prepmt. Line Amount | ✅ |
| 85 | `prepmtAmtInv` | Prepmt. Amt. Inv. | Prepmt. Amt. Inv. | ✅ |
| 86 | `prepmtAmtInclVat` | Prepmt. Amt. Incl. VAT | Prepmt. Amt. Incl. VAT | ✅ |
| 87 | `prepaymentAmount` | Prepayment Amount | Prepayment Amount | ✅ |
| 88 | `prepmtVatBaseAmt` | Prepmt. VAT Base Amt. | Prepmt. VAT Base Amt. | ✅ |
| 89 | `prepaymentVatPct` | Prepayment VAT % | Prepayment VAT % | ✅ |
| 90 | `prepmtVatCalcType` | Prepmt. VAT Calc. Type | Prepmt. VAT Calc. Type | ✅ |
| 91 | `prepaymentVatIdentifier` | Prepayment VAT Identifier | Prepayment VAT Identifier | ✅ |
| 92 | `prepaymentTaxAreaCode` | Prepayment Tax Area Code | Prepayment Tax Area Code | ✅ |
| 93 | `prepaymentTaxLiable` | Prepayment Tax Liable | Prepayment Tax Liable | ✅ |
| 94 | `prepaymentTaxGroupCode` | Prepayment Tax Group Code | Prepayment Tax Group Code | ✅ |
| 95 | `prepmtAmtToDeduct` | Prepmt Amt to Deduct | Prepmt Amt to Deduct | ✅ |
| 96 | `prepmtAmtDeducted` | Prepmt Amt Deducted | Prepmt Amt Deducted | ✅ |
| 97 | `prepaymentLine` | Prepayment Line | Prepayment Line | ✅ |
| 98 | `prepmtAmountInvInclVat` | Prepmt. Amount Inv. Incl. VAT | Prepmt. Amount Inv. Incl. VAT | ✅ |
| 99 | `prepmtAmountInvLcy` | Prepmt. Amount Inv. (LCY) | Prepmt. Amount Inv. (LCY) | ✅ |
| 100 | `icPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 101 | `prepmtVatAmountInvLcy` | Prepmt. VAT Amount Inv. (LCY) | Prepmt. VAT Amount Inv. (LCY) | ✅ |
| 102 | `prepaymentVatDifference` | Prepayment VAT Difference | Prepayment VAT Difference | ✅ |
| 103 | `prepmtVatDiffToDeduct` | Prepmt VAT Diff. to Deduct | Prepmt VAT Diff. to Deduct | ✅ |
| 104 | `prepmtVatDiffDeducted` | Prepmt VAT Diff. Deducted | Prepmt VAT Diff. Deducted | ✅ |
| 105 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | ✅ |
| 106 | `outstandingAmtExVatLcy` | Outstanding Amt. Ex. VAT (LCY) | Outstanding Amt. Ex. VAT (LCY) | ✅ |
| 107 | `aRcdNotInvExVatLcy` | A. Rcd. Not Inv. Ex. VAT (LCY) | A. Rcd. Not Inv. Ex. VAT (LCY) | ✅ |
| 108 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | ✅ |
| 109 | `prepmtPmtDiscountAmount` | Prepmt. Pmt. Discount Amount | Prepmt. Pmt. Discount Amount | ✅ |
| 110 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 111 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 112 | `jobLineType` | Job Line Type | Project Line Type | ✅ |
| 113 | `jobUnitPrice` | Job Unit Price | Project Unit Price | ✅ |
| 114 | `jobTotalPrice` | Job Total Price | Project Total Price | ✅ |
| 115 | `jobLineAmount` | Job Line Amount | Project Line Amount | ✅ |
| 116 | `jobLineDiscountAmount` | Job Line Discount Amount | Project Line Discount Amount | ✅ |
| 117 | `jobLineDiscountPct` | Job Line Discount % | Project Line Discount % | ✅ |
| 118 | `jobUnitPriceLcy` | Job Unit Price (LCY) | Project Unit Price (LCY) | ✅ |
| 119 | `jobTotalPriceLcy` | Job Total Price (LCY) | Project Total Price (LCY) | ✅ |
| 120 | `jobLineAmountLcy` | Job Line Amount (LCY) | Project Line Amount (LCY) | ✅ |
| 121 | `jobLineDiscAmountLcy` | Job Line Disc. Amount (LCY) | Project Line Disc. Amount (LCY) | ✅ |
| 122 | `jobCurrencyFactor` | Job Currency Factor | Project Currency Factor | ✅ |
| 123 | `jobCurrencyCode` | Job Currency Code | Project Currency Code | ✅ |
| 124 | `jobPlanningLineNo` | Job Planning Line No. | Job Planning Line No. | ✅ |
| 125 | `jobRemainingQty` | Job Remaining Qty. | Project Remaining Qty. | ✅ |
| 126 | `jobRemainingQtyBase` | Job Remaining Qty. (Base) | Project Remaining Qty. (Base) | ✅ |
| 127 | `deferralCode` | Deferral Code | Deferral Code | ✅ |
| 128 | `returnsDeferralStartDate` | Returns Deferral Start Date | Returns Deferral Start Date | ✅ |
| 129 | `selectedAllocAccountNo` | Selected Alloc. Account No. | Allocation Account No. | ✅ |
| 130 | `allocAccModifiedByUser` | Alloc. Acc. Modified by User | Allocation Account Distributions Modified | 🧮 computed |
| 131 | `allocationAccountNo` | Allocation Account No. | Posting Allocation Account No. | ✅ |
| 132 | `allocPurchLineSystemid` | Alloc. Purch. Line SystemId | Allocation Purchase Line SystemId | ✅ |
| 133 | `variantCode` | Variant Code | Variant Code | ✅ |
| 134 | `binCode` | Bin Code | Bin Code | ✅ |
| 135 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 136 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 137 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 138 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 139 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 140 | `outstandingQtyBase` | Outstanding Qty. (Base) | Outstanding Qty. (Base) | ✅ |
| 141 | `qtyToInvoiceBase` | Qty. to Invoice (Base) | Qty. to Invoice (Base) | ✅ |
| 142 | `qtyToReceiveBase` | Qty. to Receive (Base) | Qty. to Receive (Base) | ✅ |
| 143 | `qtyRcdNotInvoicedBase` | Qty. Rcd. Not Invoiced (Base) | Qty. Rcd. Not Invoiced (Base) | ✅ |
| 144 | `qtyReceivedBase` | Qty. Received (Base) | Qty. Received (Base) | ✅ |
| 145 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | ✅ |
| 146 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 147 | `faPostingDate` | FA Posting Date | FA Posting Date | ✅ |
| 148 | `faPostingType` | FA Posting Type | FA Posting Type | ✅ |
| 149 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | ✅ |
| 150 | `salvageValue` | Salvage Value | Salvage Value | ✅ |
| 151 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | ✅ |
| 152 | `deprAcquisitionCost` | Depr. Acquisition Cost | Depr. Acquisition Cost | ✅ |
| 153 | `maintenanceCode` | Maintenance Code | Maintenance Code | ✅ |
| 154 | `insuranceNo` | Insurance No. | Insurance No. | ✅ |
| 155 | `budgetedFaNo` | Budgeted FA No. | Budgeted FA No. | ✅ |
| 156 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | ✅ |
| 157 | `useDuplicationList` | Use Duplication List | Use Duplication List | ✅ |
| 158 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 159 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 160 | `nonstock` | Nonstock | Catalog | ✅ |
| 161 | `purchasingCode` | Purchasing Code | Purchasing Code | ✅ |
| 162 | `specialOrder` | Special Order | Special Order | ✅ |
| 163 | `specialOrderSalesNo` | Special Order Sales No. | Special Order Sales No. | ✅ |
| 164 | `specialOrderSalesLineNo` | Special Order Sales Line No. | Special Order Sales Line No. | ✅ |
| 165 | `itemReferenceNo` | Item Reference No. | Item Reference No. | ✅ |
| 166 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Item Reference Unit of Measure | ✅ |
| 167 | `itemReferenceType` | Item Reference Type | Item Reference Type | ✅ |
| 168 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | ✅ |
| 169 | `whseOutstandingQtyBase` | Whse. Outstanding Qty. (Base) | Whse. Outstanding Qty. (Base) | 🧮 computed |
| 170 | `completelyReceived` | Completely Received | Completely Received | ✅ |
| 171 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | ✅ |
| 172 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | ✅ |
| 173 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 174 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | ✅ |
| 175 | `plannedReceiptDate` | Planned Receipt Date | Planned Receipt Date | ✅ |
| 176 | `orderDate` | Order Date | Order Date | ✅ |
| 177 | `allowItemChargeAssignment` | Allow Item Charge Assignment | Allow Item Charge Assignment | ✅ |
| 178 | `qtyToAssign` | Qty. to Assign | Qty. to Assign | 🧮 computed |
| 179 | `qtyAssigned` | Qty. Assigned | Qty. Assigned | 🧮 computed |
| 180 | `returnQtyToShip` | Return Qty. to Ship | Return Qty. to Ship | ✅ |
| 181 | `returnQtyToShipBase` | Return Qty. to Ship (Base) | Return Qty. to Ship (Base) | ✅ |
| 182 | `returnQtyShippedNotInvd` | Return Qty. Shipped Not Invd. | Return Qty. Shipped Not Invd. | ✅ |
| 183 | `retQtyShpdNotInvdBase` | Ret. Qty. Shpd Not Invd.(Base) | Ret. Qty. Shpd Not Invd.(Base) | ✅ |
| 184 | `returnShpdNotInvd` | Return Shpd. Not Invd. | Return Shpd. Not Invd. | ✅ |
| 185 | `returnShpdNotInvdLcy` | Return Shpd. Not Invd. (LCY) | Return Shpd. Not Invd. (LCY) | ✅ |
| 186 | `returnQtyShipped` | Return Qty. Shipped | Return Qty. Shipped | ✅ |
| 187 | `returnQtyShippedBase` | Return Qty. Shipped (Base) | Return Qty. Shipped (Base) | ✅ |
| 188 | `itemChargeQtyToHandle` | Item Charge Qty. to Handle | Item Charge Qty. to Handle | 🧮 computed |
| 189 | `nonDeductibleVatPct` | Non-Deductible VAT % | Non-Deductible VAT % | ✅ |
| 190 | `nonDeductibleVatBase` | Non-Deductible VAT Base | Non-Deductible VAT Base | ✅ |
| 191 | `nonDeductibleVatAmount` | Non-Deductible VAT Amount | Non-Deductible VAT Amount | ✅ |
| 192 | `nonDeductibleVatDiff` | Non-Deductible VAT Diff. | Non-Deductible VAT Difference | ✅ |
| 193 | `prepmtNonDeductVatBase` | Prepmt. Non-Deduct. VAT Base | Prepmt.  Non-Deductible VAT Base | ✅ |
| 194 | `prepmtNonDeductVatAmount` | Prepmt. Non-Deduct. VAT Amount | Prepmt. on-Deductible VAT Amount | ✅ |
| 195 | `itemChargeHasNonDedVat` | Item Charge Has Non.Ded. VAT | Item Charge Has Non-Deductible VAT | ✅ |
| 196 | `returnShipmentNo` | Return Shipment No. | Return Shipment No. | ✅ |
| 197 | `returnShipmentLineNo` | Return Shipment Line No. | Return Shipment Line No. | ✅ |
| 198 | `returnReasonCode` | Return Reason Code | Return Reason Code | ✅ |
| 199 | `subtype` | Subtype | Subtype | ✅ |
| 200 | `copiedFromPostedDoc` | Copied From Posted Doc. | Copied From Posted Doc. | ✅ |
| 201 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 202 | `attachedDocCount` | Attached Doc Count | Attached Doc Count | 🧮 computed |
| 203 | `attachedLinesCount` | Attached Lines Count | Attached Lines Count | 🧮 computed |
| 204 | `overReceiptQuantity` | Over-Receipt Quantity | Over-Receipt Quantity | ✅ |
| 205 | `overReceiptCode` | Over-Receipt Code | Over-Receipt Code | ✅ |
| 206 | `overReceiptApprovalStatus` | Over-Receipt Approval Status | Over-Receipt Approval Status | ✅ |
| 207 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | 🧮 computed |
| 208 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |
| 209 | `mpsOrder` | MPS Order | MPS Order | ✅ |
| 210 | `planningFlexibility` | Planning Flexibility | Planning Flexibility | ✅ |
| 211 | `safetyLeadTime` | Safety Lead Time | Safety Lead Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedPurchaseInvoices

**Description:** Posted (finalized) purchase invoices.

| Property | Value |
|---|---|
| **Source Table** | Purch. Inv. Header |
| Page ID | 90896 |
| Page Name | `ocpfPostedPurchaseInvoices` |
| Entity Set Name | `ocpfPostedPurchaseInvoices` |
| API Group | `ocpf_purchasing` |
| Editable | ❌ No (GET only) |
| Field Count | 111 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | — |
| 5 | `payToName` | Pay-to Name | Pay-to Name | — |
| 6 | `payToName2` | Pay-to Name 2 | Pay-to Name 2 | — |
| 7 | `payToAddress` | Pay-to Address | Pay-to Address | — |
| 8 | `payToAddress2` | Pay-to Address 2 | Pay-to Address 2 | — |
| 9 | `payToCity` | Pay-to City | Pay-to City | — |
| 10 | `payToContact` | Pay-to Contact | Pay-to Contact | — |
| 11 | `yourReference` | Your Reference | Your Reference | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 14 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 15 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 16 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 17 | `shipToCity` | Ship-to City | Ship-to City | — |
| 18 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 19 | `orderDate` | Order Date | Order Date | — |
| 20 | `postingDate` | Posting Date | Posting Date | — |
| 21 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | — |
| 22 | `postingDescription` | Posting Description | Posting Description | — |
| 23 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 24 | `dueDate` | Due Date | Due Date | — |
| 25 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | — |
| 26 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 27 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | — |
| 28 | `locationCode` | Location Code | Location Code | — |
| 29 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 30 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 31 | `vendorPostingGroup` | Vendor Posting Group | Vendor Posting Group | — |
| 32 | `currencyCode` | Currency Code | Currency Code | — |
| 33 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 34 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | — |
| 35 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | — |
| 36 | `languageCode` | Language Code | Language Code | — |
| 37 | `formatRegion` | Format Region | Format Region | — |
| 38 | `purchaserCode` | Purchaser Code | Purchaser Code | — |
| 39 | `orderNo` | Order No. | Order No. | — |
| 40 | `comment` | Comment | Comment | 🧮 computed |
| 41 | `noPrinted` | No. Printed | No. Printed | — |
| 42 | `onHold` | On Hold | On Hold | — |
| 43 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 44 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 45 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 46 | `amount` | Amount | Amount | 🧮 computed |
| 47 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 48 | `vendorOrderNo` | Vendor Order No. | Vendor Order No. | — |
| 49 | `vendorInvoiceNo` | Vendor Invoice No. | Vendor Invoice No. | — |
| 50 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 51 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 52 | `reasonCode` | Reason Code | Reason Code | — |
| 53 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 54 | `transactionType` | Transaction Type | Transaction Type | — |
| 55 | `transportMethod` | Transport Method | Transport Method | — |
| 56 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | — |
| 57 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | — |
| 58 | `buyFromVendorName2` | Buy-from Vendor Name 2 | Buy-from Vendor Name 2 | — |
| 59 | `buyFromAddress` | Buy-from Address | Buy-from Address | — |
| 60 | `buyFromAddress2` | Buy-from Address 2 | Buy-from Address 2 | — |
| 61 | `buyFromCity` | Buy-from City | Buy-from City | — |
| 62 | `buyFromContact` | Buy-from Contact | Buy-from Contact | — |
| 63 | `payToPostCode` | Pay-to Post Code | Pay-to Post Code | — |
| 64 | `payToCounty` | Pay-to County | Pay-to County | — |
| 65 | `payToCountryRegionCode` | Pay-to Country/Region Code | Pay-to Country/Region Code | — |
| 66 | `buyFromPostCode` | Buy-from Post Code | Buy-from Post Code | — |
| 67 | `buyFromCounty` | Buy-from County | Buy-from County | — |
| 68 | `buyFromCountryRegionCode` | Buy-from Country/Region Code | Buy-from Country/Region Code | — |
| 69 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 70 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 71 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 72 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 73 | `orderAddressCode` | Order Address Code | Order Address Code | — |
| 74 | `entryPoint` | Entry Point | Entry Point | — |
| 75 | `correction` | Correction | Correction | — |
| 76 | `documentDate` | Document Date | Document Date | — |
| 77 | `areaCode` | Area | Area | — |
| 78 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 79 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 80 | `preAssignedNoSeries` | Pre-Assigned No. Series | Pre-Assigned No. Series | — |
| 81 | `noSeries` | No. Series | No. Series | — |
| 82 | `orderNoSeries` | Order No. Series | Order No. Series | — |
| 83 | `preAssignedNo` | Pre-Assigned No. | Pre-Assigned No. | — |
| 84 | `userId` | User ID | User ID | — |
| 85 | `sourceCode` | Source Code | Source Code | — |
| 86 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 87 | `taxLiable` | Tax Liable | Tax Liable | — |
| 88 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 89 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | — |
| 90 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | — |
| 91 | `prepaymentInvoice` | Prepayment Invoice | Prepayment Invoice | — |
| 92 | `prepaymentOrderNo` | Prepayment Order No. | Prepayment Order No. | — |
| 93 | `quoteNo` | Quote No. | Quote No. | — |
| 94 | `creditorNo` | Creditor No. | Creditor No. | — |
| 95 | `paymentReference` | Payment Reference | Payment Reference | — |
| 96 | `vatReportingDate` | VAT Reporting Date | VAT Date | — |
| 97 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | — |
| 98 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 99 | `remitToCode` | Remit-to Code | Remit-to Code | — |
| 100 | `closed` | Closed | Closed | 🧮 computed |
| 101 | `remainingAmount` | Remaining Amount | Remaining Amount | 🧮 computed |
| 102 | `vendorLedgerEntryNo` | Vendor Ledger Entry No. | Vendor Ledger Entry No. | — |
| 103 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 104 | `cancelled` | Cancelled | Cancelled | 🧮 computed |
| 105 | `corrective` | Corrective | Corrective | 🧮 computed |
| 106 | `campaignNo` | Campaign No. | Campaign No. | — |
| 107 | `buyFromContactNo` | Buy-from Contact No. | Buy-from Contact No. | — |
| 108 | `payToContactNo` | Pay-to Contact No. | Pay-to Contact No. | — |
| 109 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 110 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 111 | `draftInvoiceSystemid` | Draft Invoice SystemId | Draft Invoice SystemId | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedPurchaseInvoiceLines

**Description:** Lines of posted purchase invoices.

| Property | Value |
|---|---|
| **Source Table** | Purch. Inv. Line |
| Page ID | 90897 |
| Page Name | `ocpfPostedPurchaseInvoiceLines` |
| Entity Set Name | `ocpfPostedPurchaseInvoiceLines` |
| API Group | `ocpf_purchasing` |
| Editable | ❌ No (GET only) |
| Field Count | 118 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `no` | No. | No. | — |
| 7 | `locationCode` | Location Code | Location Code | — |
| 8 | `postingGroup` | Posting Group | Posting Group | — |
| 9 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | — |
| 10 | `description` | Description | Description | — |
| 11 | `description2` | Description 2 | Description 2 | — |
| 12 | `unitOfMeasure` | Unit of Measure | Unit of Measure | — |
| 13 | `quantity` | Quantity | Quantity | — |
| 14 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | — |
| 15 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 16 | `vatPct` | VAT % | VAT % | — |
| 17 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 18 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | — |
| 19 | `amount` | Amount | Amount | — |
| 20 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | — |
| 21 | `unitPriceLcy` | Unit Price (LCY) | Unit Price (LCY) | — |
| 22 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 23 | `grossWeight` | Gross Weight | Gross Weight | — |
| 24 | `netWeight` | Net Weight | Net Weight | — |
| 25 | `unitsPerParcel` | Units per Parcel | Units per Parcel | — |
| 26 | `unitVolume` | Unit Volume | Unit Volume | — |
| 27 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | — |
| 28 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 29 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 30 | `jobNo` | Job No. | Project No. | — |
| 31 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | — |
| 32 | `receiptNo` | Receipt No. | Receipt No. | — |
| 33 | `receiptLineNo` | Receipt Line No. | Receipt Line No. | — |
| 34 | `orderNo` | Order No. | Order No. | — |
| 35 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 36 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | — |
| 37 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | — |
| 38 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | — |
| 39 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 40 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 41 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 42 | `transactionType` | Transaction Type | Transaction Type | — |
| 43 | `transportMethod` | Transport Method | Transport Method | — |
| 44 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 45 | `entryPoint` | Entry Point | Entry Point | — |
| 46 | `areaCode` | Area | Area | — |
| 47 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 48 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 49 | `taxLiable` | Tax Liable | Tax Liable | — |
| 50 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 51 | `useTax` | Use Tax | Use Tax | — |
| 52 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 53 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 54 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | — |
| 55 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | — |
| 56 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | — |
| 57 | `unitCost` | Unit Cost | Unit Cost | — |
| 58 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | — |
| 59 | `lineAmount` | Line Amount | Line Amount | — |
| 60 | `vatDifference` | VAT Difference | VAT Difference | — |
| 61 | `vatIdentifier` | VAT Identifier | VAT Identifier | — |
| 62 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | — |
| 63 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | — |
| 64 | `prepaymentLine` | Prepayment Line | Prepayment Line | — |
| 65 | `icPartnerCode` | IC Partner Code | IC Partner Code | — |
| 66 | `postingDate` | Posting Date | Posting Date | — |
| 67 | `icCrossReferenceNo` | IC Cross-Reference No. | IC Item Reference No. | — |
| 68 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | — |
| 69 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 70 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 71 | `jobLineType` | Job Line Type | Project Line Type | — |
| 72 | `jobUnitPrice` | Job Unit Price | Project Unit Price | — |
| 73 | `jobTotalPrice` | Job Total Price | Project Total Price | — |
| 74 | `jobLineAmount` | Job Line Amount | Project Line Amount | — |
| 75 | `jobLineDiscountAmount` | Job Line Discount Amount | Project Line Discount Amount | — |
| 76 | `jobLineDiscountPct` | Job Line Discount % | Project Line Discount % | — |
| 77 | `jobUnitPriceLcy` | Job Unit Price (LCY) | Project Unit Price (LCY) | — |
| 78 | `jobTotalPriceLcy` | Job Total Price (LCY) | Project Total Price (LCY) | — |
| 79 | `jobLineAmountLcy` | Job Line Amount (LCY) | Project Line Amount (LCY) | — |
| 80 | `jobLineDiscAmountLcy` | Job Line Disc. Amount (LCY) | Project Line Disc. Amount (LCY) | — |
| 81 | `jobCurrencyFactor` | Job Currency Factor | Project Currency Factor | — |
| 82 | `jobCurrencyCode` | Job Currency Code | Project Currency Code | — |
| 83 | `jobPlanningLineNo` | Job Planning Line No. | Project Planning Line No. | — |
| 84 | `deferralCode` | Deferral Code | Deferral Code | — |
| 85 | `allocationAccountNo` | Allocation Account No. | Allocation Account No. | — |
| 86 | `allocPurchLineSystemid` | Alloc. Purch. Line SystemId | Allocation Purchase Line SystemId | — |
| 87 | `variantCode` | Variant Code | Variant Code | — |
| 88 | `binCode` | Bin Code | Bin Code | — |
| 89 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 90 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 91 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 92 | `faPostingDate` | FA Posting Date | FA Posting Date | — |
| 93 | `faPostingType` | FA Posting Type | FA Posting Type | — |
| 94 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | — |
| 95 | `salvageValue` | Salvage Value | Salvage Value | — |
| 96 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | — |
| 97 | `deprAcquisitionCost` | Depr. Acquisition Cost | Depr. Acquisition Cost | — |
| 98 | `maintenanceCode` | Maintenance Code | Maintenance Code | — |
| 99 | `insuranceNo` | Insurance No. | Insurance No. | — |
| 100 | `budgetedFaNo` | Budgeted FA No. | Budgeted FA No. | — |
| 101 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | — |
| 102 | `useDuplicationList` | Use Duplication List | Use Duplication List | — |
| 103 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 104 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 105 | `nonstock` | Nonstock | Catalog | — |
| 106 | `purchasingCode` | Purchasing Code | Purchasing Code | — |
| 107 | `itemReferenceNo` | Item Reference No. | Item Reference No. | — |
| 108 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Unit of Measure (Item Ref.) | — |
| 109 | `itemReferenceType` | Item Reference Type | Item Reference Type | — |
| 110 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | — |
| 111 | `nonDeductibleVatPct` | Non-Deductible VAT % | Non-Deductible VAT % | — |
| 112 | `nonDeductibleVatBase` | Non-Deductible VAT Base | Non-Deductible VAT Base | — |
| 113 | `nonDeductibleVatAmount` | Non-Deductible VAT Amount | Non-Deductible VAT Amount | — |
| 114 | `nonDeductibleVatDiff` | Non-Deductible VAT Diff. | Non-Deductible VAT Difference | — |
| 115 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 116 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 117 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | 🧮 computed |
| 118 | `overheadRate` | Overhead Rate | Overhead Rate | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedPurchaseCreditMemos

**Description:** Posted purchase credit memos.

| Property | Value |
|---|---|
| **Source Table** | Purch. Cr. Memo Hdr. |
| Page ID | 90898 |
| Page Name | `ocpfPostedPurchaseCreditMemos` |
| Entity Set Name | `ocpfPostedPurchaseCreditMemos` |
| API Group | `ocpf_purchasing` |
| Editable | ❌ No (GET only) |
| Field Count | 105 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | — |
| 5 | `payToName` | Pay-to Name | Pay-to Name | — |
| 6 | `payToName2` | Pay-to Name 2 | Pay-to Name 2 | — |
| 7 | `payToAddress` | Pay-to Address | Pay-to Address | — |
| 8 | `payToAddress2` | Pay-to Address 2 | Pay-to Address 2 | — |
| 9 | `payToCity` | Pay-to City | Pay-to City | — |
| 10 | `payToContact` | Pay-to Contact | Pay-to Contact | — |
| 11 | `yourReference` | Your Reference | Your Reference | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 14 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 15 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 16 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 17 | `shipToCity` | Ship-to City | Ship-to City | — |
| 18 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 19 | `postingDate` | Posting Date | Posting Date | — |
| 20 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | — |
| 21 | `postingDescription` | Posting Description | Posting Description | — |
| 22 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 23 | `dueDate` | Due Date | Due Date | — |
| 24 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | — |
| 25 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 26 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | — |
| 27 | `locationCode` | Location Code | Location Code | — |
| 28 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 29 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 30 | `vendorPostingGroup` | Vendor Posting Group | Vendor Posting Group | — |
| 31 | `currencyCode` | Currency Code | Currency Code | — |
| 32 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 33 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | — |
| 34 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | — |
| 35 | `languageCode` | Language Code | Language Code | — |
| 36 | `formatRegion` | Format Region | Format Region | — |
| 37 | `purchaserCode` | Purchaser Code | Purchaser Code | — |
| 38 | `comment` | Comment | Comment | 🧮 computed |
| 39 | `noPrinted` | No. Printed | No. Printed | — |
| 40 | `onHold` | On Hold | On Hold | — |
| 41 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 42 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 43 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 44 | `amount` | Amount | Amount | 🧮 computed |
| 45 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 46 | `vendorCrMemoNo` | Vendor Cr. Memo No. | Vendor Cr. Memo No. | — |
| 47 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 48 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 49 | `reasonCode` | Reason Code | Reason Code | — |
| 50 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 51 | `transactionType` | Transaction Type | Transaction Type | — |
| 52 | `transportMethod` | Transport Method | Transport Method | — |
| 53 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | — |
| 54 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | — |
| 55 | `buyFromVendorName2` | Buy-from Vendor Name 2 | Buy-from Vendor Name 2 | — |
| 56 | `buyFromAddress` | Buy-from Address | Buy-from Address | — |
| 57 | `buyFromAddress2` | Buy-from Address 2 | Buy-from Address 2 | — |
| 58 | `buyFromCity` | Buy-from City | Buy-from City | — |
| 59 | `buyFromContact` | Buy-from Contact | Buy-from Contact | — |
| 60 | `payToPostCode` | Pay-to Post Code | Pay-to Post Code | — |
| 61 | `payToCounty` | Pay-to County | Pay-to County | — |
| 62 | `payToCountryRegionCode` | Pay-to Country/Region Code | Pay-to Country/Region Code | — |
| 63 | `buyFromPostCode` | Buy-from Post Code | Buy-from Post Code | — |
| 64 | `buyFromCounty` | Buy-from County | Buy-from County | — |
| 65 | `buyFromCountryRegionCode` | Buy-from Country/Region Code | Buy-from Country/Region Code | — |
| 66 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 67 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 68 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 69 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 70 | `orderAddressCode` | Order Address Code | Order Address Code | — |
| 71 | `entryPoint` | Entry Point | Entry Point | — |
| 72 | `correction` | Correction | Correction | — |
| 73 | `documentDate` | Document Date | Document Date | — |
| 74 | `areaCode` | Area | Area | — |
| 75 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 76 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 77 | `preAssignedNoSeries` | Pre-Assigned No. Series | Pre-Assigned No. Series | — |
| 78 | `noSeries` | No. Series | No. Series | — |
| 79 | `preAssignedNo` | Pre-Assigned No. | Pre-Assigned No. | — |
| 80 | `userId` | User ID | User ID | — |
| 81 | `sourceCode` | Source Code | Source Code | — |
| 82 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 83 | `taxLiable` | Tax Liable | Tax Liable | — |
| 84 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 85 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | — |
| 86 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | — |
| 87 | `prepaymentCreditMemo` | Prepayment Credit Memo | Prepayment Credit Memo | — |
| 88 | `prepaymentOrderNo` | Prepayment Order No. | Prepayment Order No. | — |
| 89 | `vatReportingDate` | VAT Reporting Date | VAT Date | — |
| 90 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | — |
| 91 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 92 | `paid` | Paid | Paid | 🧮 computed |
| 93 | `remainingAmount` | Remaining Amount | Remaining Amount | 🧮 computed |
| 94 | `vendorLedgerEntryNo` | Vendor Ledger Entry No. | Vendor Ledger Entry No. | — |
| 95 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 96 | `cancelled` | Cancelled | Cancelled | 🧮 computed |
| 97 | `corrective` | Corrective | Corrective | 🧮 computed |
| 98 | `campaignNo` | Campaign No. | Campaign No. | — |
| 99 | `buyFromContactNo` | Buy-from Contact No. | Buy-from Contact No. | — |
| 100 | `payToContactNo` | Pay-to Contact No. | Pay-to Contact No. | — |
| 101 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 102 | `returnOrderNo` | Return Order No. | Return Order No. | — |
| 103 | `returnOrderNoSeries` | Return Order No. Series | Return Order No. Series | — |
| 104 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 105 | `draftCrMemoSystemid` | Draft Cr. Memo SystemId | Draft Cr. Memo System Id | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedPurchCrMemoLines

**Description:** Lines of posted purchase credit memos.

| Property | Value |
|---|---|
| **Source Table** | Purch. Cr. Memo Line |
| Page ID | 90899 |
| Page Name | `ocpfPostedPurchCrMemoLines` |
| Entity Set Name | `ocpfPostedPurchCrMemoLines` |
| API Group | `ocpf_purchasing` |
| Editable | ❌ No (GET only) |
| Field Count | 115 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `no` | No. | No. | — |
| 7 | `locationCode` | Location Code | Location Code | — |
| 8 | `postingGroup` | Posting Group | Posting Group | — |
| 9 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | — |
| 10 | `description` | Description | Description | — |
| 11 | `description2` | Description 2 | Description 2 | — |
| 12 | `unitOfMeasure` | Unit of Measure | Unit of Measure | — |
| 13 | `quantity` | Quantity | Quantity | — |
| 14 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | — |
| 15 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 16 | `vatPct` | VAT % | VAT % | — |
| 17 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 18 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | — |
| 19 | `amount` | Amount | Amount | — |
| 20 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | — |
| 21 | `unitPriceLcy` | Unit Price (LCY) | Unit Price (LCY) | — |
| 22 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 23 | `grossWeight` | Gross Weight | Gross Weight | — |
| 24 | `netWeight` | Net Weight | Net Weight | — |
| 25 | `unitsPerParcel` | Units per Parcel | Units per Parcel | — |
| 26 | `unitVolume` | Unit Volume | Unit Volume | — |
| 27 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | — |
| 28 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 29 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 30 | `jobNo` | Job No. | Project No. | — |
| 31 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | — |
| 32 | `orderNo` | Order No. | Order No. | — |
| 33 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 34 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | — |
| 35 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | — |
| 36 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | — |
| 37 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 38 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 39 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 40 | `transactionType` | Transaction Type | Transaction Type | — |
| 41 | `transportMethod` | Transport Method | Transport Method | — |
| 42 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 43 | `entryPoint` | Entry Point | Entry Point | — |
| 44 | `areaCode` | Area | Area | — |
| 45 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 46 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 47 | `taxLiable` | Tax Liable | Tax Liable | — |
| 48 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 49 | `useTax` | Use Tax | Use Tax | — |
| 50 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 51 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 52 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | — |
| 53 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | — |
| 54 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | — |
| 55 | `unitCost` | Unit Cost | Unit Cost | — |
| 56 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | — |
| 57 | `lineAmount` | Line Amount | Line Amount | — |
| 58 | `vatDifference` | VAT Difference | VAT Difference | — |
| 59 | `vatIdentifier` | VAT Identifier | VAT Identifier | — |
| 60 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | — |
| 61 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | — |
| 62 | `prepaymentLine` | Prepayment Line | Prepayment Line | — |
| 63 | `icPartnerCode` | IC Partner Code | IC Partner Code | — |
| 64 | `postingDate` | Posting Date | Posting Date | — |
| 65 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | — |
| 66 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | — |
| 67 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 68 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 69 | `jobLineType` | Job Line Type | Project Line Type | — |
| 70 | `jobUnitPrice` | Job Unit Price | Project Unit Price | — |
| 71 | `jobTotalPrice` | Job Total Price | Project Total Price | — |
| 72 | `jobLineAmount` | Job Line Amount | Project Line Amount | — |
| 73 | `jobLineDiscountAmount` | Job Line Discount Amount | Project Line Discount Amount | — |
| 74 | `jobLineDiscountPct` | Job Line Discount % | Project Line Discount % | — |
| 75 | `jobUnitPriceLcy` | Job Unit Price (LCY) | Project Unit Price (LCY) | — |
| 76 | `jobTotalPriceLcy` | Job Total Price (LCY) | Project Total Price (LCY) | — |
| 77 | `jobLineAmountLcy` | Job Line Amount (LCY) | Project Line Amount (LCY) | — |
| 78 | `jobLineDiscAmountLcy` | Job Line Disc. Amount (LCY) | Project Line Disc. Amount (LCY) | — |
| 79 | `jobCurrencyFactor` | Job Currency Factor | Project Currency Factor | — |
| 80 | `jobCurrencyCode` | Job Currency Code | Project Currency Code | — |
| 81 | `jobPlanningLineNo` | Job Planning Line No. | Project Planning Line No. | — |
| 82 | `deferralCode` | Deferral Code | Deferral Code | — |
| 83 | `variantCode` | Variant Code | Variant Code | — |
| 84 | `binCode` | Bin Code | Bin Code | — |
| 85 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 86 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 87 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 88 | `faPostingDate` | FA Posting Date | FA Posting Date | — |
| 89 | `faPostingType` | FA Posting Type | FA Posting Type | — |
| 90 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | — |
| 91 | `salvageValue` | Salvage Value | Salvage Value | — |
| 92 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | — |
| 93 | `deprAcquisitionCost` | Depr. Acquisition Cost | Depr. Acquisition Cost | — |
| 94 | `maintenanceCode` | Maintenance Code | Maintenance Code | — |
| 95 | `insuranceNo` | Insurance No. | Insurance No. | — |
| 96 | `budgetedFaNo` | Budgeted FA No. | Budgeted FA No. | — |
| 97 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | — |
| 98 | `useDuplicationList` | Use Duplication List | Use Duplication List | — |
| 99 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 100 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 101 | `nonstock` | Nonstock | Catalog | — |
| 102 | `purchasingCode` | Purchasing Code | Purchasing Code | — |
| 103 | `itemReferenceNo` | Item Reference No. | Item Reference No. | — |
| 104 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Unit of Measure (Item Ref.) | — |
| 105 | `itemReferenceType` | Item Reference Type | Item Reference Type | — |
| 106 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | — |
| 107 | `nonDeductibleVatPct` | Non-Deductible VAT % | Non-Deductible VAT % | — |
| 108 | `nonDeductibleVatBase` | Non-Deductible VAT Base | Non-Deductible VAT Base | — |
| 109 | `nonDeductibleVatAmount` | Non-Deductible VAT Amount | Non-Deductible VAT Amount | — |
| 110 | `nonDeductibleVatDiff` | Non-Deductible VAT Diff. | Non-Deductible VAT Difference | — |
| 111 | `returnShipmentNo` | Return Shipment No. | Return Shipment No. | — |
| 112 | `returnShipmentLineNo` | Return Shipment Line No. | Return Shipment Line No. | — |
| 113 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 114 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 115 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedPurchaseReceipts

**Description:** Posted purchase receipts (goods received).

| Property | Value |
|---|---|
| **Source Table** | Purch. Rcpt. Header |
| Page ID | 90900 |
| Page Name | `ocpfPostedPurchaseReceipts` |
| Entity Set Name | `ocpfPostedPurchaseReceipts` |
| API Group | `ocpf_purchasing` |
| Editable | ❌ No (GET only) |
| Field Count | 96 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | — |
| 5 | `payToName` | Pay-to Name | Pay-to Name | — |
| 6 | `payToName2` | Pay-to Name 2 | Pay-to Name 2 | — |
| 7 | `payToAddress` | Pay-to Address | Pay-to Address | — |
| 8 | `payToAddress2` | Pay-to Address 2 | Pay-to Address 2 | — |
| 9 | `payToCity` | Pay-to City | Pay-to City | — |
| 10 | `payToContact` | Pay-to Contact | Pay-to Contact | — |
| 11 | `yourReference` | Your Reference | Your Reference | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 14 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 15 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 16 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 17 | `shipToCity` | Ship-to City | Ship-to City | — |
| 18 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 19 | `orderDate` | Order Date | Order Date | — |
| 20 | `postingDate` | Posting Date | Posting Date | — |
| 21 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | — |
| 22 | `postingDescription` | Posting Description | Posting Description | — |
| 23 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 24 | `dueDate` | Due Date | Due Date | — |
| 25 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | — |
| 26 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 27 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | — |
| 28 | `locationCode` | Location Code | Location Code | — |
| 29 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 30 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 31 | `vendorPostingGroup` | Vendor Posting Group | Vendor Posting Group | — |
| 32 | `currencyCode` | Currency Code | Currency Code | — |
| 33 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 34 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | — |
| 35 | `languageCode` | Language Code | Language Code | — |
| 36 | `formatRegion` | Format Region | Format Region | — |
| 37 | `purchaserCode` | Purchaser Code | Purchaser Code | — |
| 38 | `orderNo` | Order No. | Order No. | — |
| 39 | `comment` | Comment | Comment | 🧮 computed |
| 40 | `noPrinted` | No. Printed | No. Printed | — |
| 41 | `onHold` | On Hold | On Hold | — |
| 42 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 43 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 44 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 45 | `vendorOrderNo` | Vendor Order No. | Vendor Order No. | — |
| 46 | `vendorShipmentNo` | Vendor Shipment No. | Vendor Shipment No. | — |
| 47 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 48 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 49 | `reasonCode` | Reason Code | Reason Code | — |
| 50 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 51 | `transactionType` | Transaction Type | Transaction Type | — |
| 52 | `transportMethod` | Transport Method | Transport Method | — |
| 53 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | — |
| 54 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | — |
| 55 | `buyFromVendorName2` | Buy-from Vendor Name 2 | Buy-from Vendor Name 2 | — |
| 56 | `buyFromAddress` | Buy-from Address | Buy-from Address | — |
| 57 | `buyFromAddress2` | Buy-from Address 2 | Buy-from Address 2 | — |
| 58 | `buyFromCity` | Buy-from City | Buy-from City | — |
| 59 | `buyFromContact` | Buy-from Contact | Buy-from Contact | — |
| 60 | `payToPostCode` | Pay-to Post Code | Pay-to Post Code | — |
| 61 | `payToCounty` | Pay-to County | Pay-to County | — |
| 62 | `payToCountryRegionCode` | Pay-to Country/Region Code | Pay-to Country/Region Code | — |
| 63 | `buyFromPostCode` | Buy-from Post Code | Buy-from Post Code | — |
| 64 | `buyFromCounty` | Buy-from County | Buy-from County | — |
| 65 | `buyFromCountryRegionCode` | Buy-from Country/Region Code | Buy-from Country/Region Code | — |
| 66 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 67 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 68 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 69 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 70 | `orderAddressCode` | Order Address Code | Order Address Code | — |
| 71 | `entryPoint` | Entry Point | Entry Point | — |
| 72 | `correction` | Correction | Correction | — |
| 73 | `documentDate` | Document Date | Document Date | — |
| 74 | `areaCode` | Area | Area | — |
| 75 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 76 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 77 | `noSeries` | No. Series | No. Series | — |
| 78 | `orderNoSeries` | Order No. Series | Order No. Series | — |
| 79 | `userId` | User ID | User ID | — |
| 80 | `sourceCode` | Source Code | Source Code | — |
| 81 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 82 | `taxLiable` | Tax Liable | Tax Liable | — |
| 83 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 84 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | — |
| 85 | `quoteNo` | Quote No. | Quote No. | — |
| 86 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | — |
| 87 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 88 | `campaignNo` | Campaign No. | Campaign No. | — |
| 89 | `buyFromContactNo` | Buy-from Contact No. | Buy-from Contact No. | — |
| 90 | `payToContactNo` | Pay-to Contact no. | Pay-to Contact no. | — |
| 91 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 92 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | — |
| 93 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | — |
| 94 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | — |
| 95 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | — |
| 96 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedPurchaseReceiptLines

**Description:** Lines of posted purchase receipts.

| Property | Value |
|---|---|
| **Source Table** | Purch. Rcpt. Line |
| Page ID | 90901 |
| Page Name | `ocpfPostedPurchaseReceiptLines` |
| Entity Set Name | `ocpfPostedPurchaseReceiptLines` |
| API Group | `ocpf_purchasing` |
| Editable | ❌ No (GET only) |
| Field Count | 117 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `no` | No. | No. | — |
| 7 | `locationCode` | Location Code | Location Code | — |
| 8 | `postingGroup` | Posting Group | Posting Group | — |
| 9 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | — |
| 10 | `description` | Description | Description | — |
| 11 | `description2` | Description 2 | Description 2 | — |
| 12 | `unitOfMeasure` | Unit of Measure | Unit of Measure | — |
| 13 | `quantity` | Quantity | Quantity | — |
| 14 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | — |
| 15 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 16 | `vatPct` | VAT % | VAT % | — |
| 17 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 18 | `unitPriceLcy` | Unit Price (LCY) | Unit Price (LCY) | — |
| 19 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 20 | `grossWeight` | Gross Weight | Gross Weight | — |
| 21 | `netWeight` | Net Weight | Net Weight | — |
| 22 | `unitsPerParcel` | Units per Parcel | Units per Parcel | — |
| 23 | `unitVolume` | Unit Volume | Unit Volume | — |
| 24 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | — |
| 25 | `itemRcptEntryNo` | Item Rcpt. Entry No. | Item Rcpt. Entry No. | — |
| 26 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 27 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 28 | `jobNo` | Job No. | Project No. | — |
| 29 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | — |
| 30 | `qtyRcdNotInvoiced` | Qty. Rcd. Not Invoiced | Qty. Rcd. Not Invoiced | — |
| 31 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | — |
| 32 | `orderNo` | Order No. | Order No. | — |
| 33 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 34 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | — |
| 35 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | — |
| 36 | `salesOrderNo` | Sales Order No. | Sales Order No. | — |
| 37 | `salesOrderLineNo` | Sales Order Line No. | Sales Order Line No. | — |
| 38 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 39 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 40 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 41 | `transactionType` | Transaction Type | Transaction Type | — |
| 42 | `transportMethod` | Transport Method | Transport Method | — |
| 43 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 44 | `entryPoint` | Entry Point | Entry Point | — |
| 45 | `areaCode` | Area | Area | — |
| 46 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 47 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 48 | `taxLiable` | Tax Liable | Tax Liable | — |
| 49 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 50 | `useTax` | Use Tax | Use Tax | — |
| 51 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 52 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 53 | `currencyCode` | Currency Code | Currency Code | 🧮 computed |
| 54 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | — |
| 55 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | — |
| 56 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | — |
| 57 | `unitCost` | Unit Cost | Unit Cost | — |
| 58 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | — |
| 59 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | — |
| 60 | `postingDate` | Posting Date | Posting Date | — |
| 61 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | — |
| 62 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 63 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 64 | `jobLineType` | Job Line Type | Project Line Type | — |
| 65 | `jobUnitPrice` | Job Unit Price | Project Unit Price | — |
| 66 | `jobTotalPrice` | Job Total Price | Project Total Price | — |
| 67 | `jobLineAmount` | Job Line Amount | Project Line Amount | — |
| 68 | `jobLineDiscountAmount` | Job Line Discount Amount | Project Line Discount Amount | — |
| 69 | `jobLineDiscountPct` | Job Line Discount % | Project Line Discount % | — |
| 70 | `jobUnitPriceLcy` | Job Unit Price (LCY) | Project Unit Price (LCY) | — |
| 71 | `jobTotalPriceLcy` | Job Total Price (LCY) | Project Total Price (LCY) | — |
| 72 | `jobLineAmountLcy` | Job Line Amount (LCY) | Project Line Amount (LCY) | — |
| 73 | `jobLineDiscAmountLcy` | Job Line Disc. Amount (LCY) | Project Line Disc. Amount (LCY) | — |
| 74 | `jobCurrencyFactor` | Job Currency Factor | Project Currency Factor | — |
| 75 | `jobCurrencyCode` | Job Currency Code | Project Currency Code | — |
| 76 | `jobPlanningLineNo` | Job Planning Line No. | Project Planning Line No. | — |
| 77 | `variantCode` | Variant Code | Variant Code | — |
| 78 | `binCode` | Bin Code | Bin Code | — |
| 79 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 80 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 81 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 82 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | — |
| 83 | `faPostingDate` | FA Posting Date | FA Posting Date | — |
| 84 | `faPostingType` | FA Posting Type | FA Posting Type | — |
| 85 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | — |
| 86 | `salvageValue` | Salvage Value | Salvage Value | — |
| 87 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | — |
| 88 | `deprAcquisitionCost` | Depr. Acquisition Cost | Depr. Acquisition Cost | — |
| 89 | `maintenanceCode` | Maintenance Code | Maintenance Code | — |
| 90 | `insuranceNo` | Insurance No. | Insurance No. | — |
| 91 | `budgetedFaNo` | Budgeted FA No. | Budgeted FA No. | — |
| 92 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | — |
| 93 | `useDuplicationList` | Use Duplication List | Use Duplication List | — |
| 94 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 95 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 96 | `nonstock` | Nonstock | Catalog | — |
| 97 | `purchasingCode` | Purchasing Code | Purchasing Code | — |
| 98 | `specialOrderSalesNo` | Special Order Sales No. | Special Order Sales No. | — |
| 99 | `specialOrderSalesLineNo` | Special Order Sales Line No. | Special Order Sales Line No. | — |
| 100 | `itemReferenceNo` | Item Reference No. | Item Reference No. | — |
| 101 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Unit of Measure (Item Ref.) | — |
| 102 | `itemReferenceType` | Item Reference Type | Item Reference Type | — |
| 103 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | — |
| 104 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | — |
| 105 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | — |
| 106 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | — |
| 107 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | — |
| 108 | `plannedReceiptDate` | Planned Receipt Date | Planned Receipt Date | — |
| 109 | `orderDate` | Order Date | Order Date | — |
| 110 | `itemChargeBaseAmount` | Item Charge Base Amount | Item Charge Base Amount | — |
| 111 | `correction` | Correction | Correction | — |
| 112 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 113 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 114 | `documentId` | Document Id | Document Id | — |
| 115 | `overReceiptQuantity` | Over-Receipt Quantity | Over-Receipt Quantity | — |
| 116 | `overReceiptCode2` | Over-Receipt Code 2 | Over-Receipt Code | — |
| 117 | `overheadRate` | Overhead Rate | Overhead Rate | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedReturnShipments

**Description:** Posted return shipments (goods returned to vendor).

| Property | Value |
|---|---|
| **Source Table** | Return Shipment Header |
| Page ID | 90902 |
| Page Name | `ocpfPostedReturnShipments` |
| Entity Set Name | `ocpfPostedReturnShipments` |
| API Group | `ocpf_purchasing` |
| Editable | ❌ No (GET only) |
| Field Count | 89 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | — |
| 5 | `payToName` | Pay-to Name | Pay-to Name | — |
| 6 | `payToName2` | Pay-to Name 2 | Pay-to Name 2 | — |
| 7 | `payToAddress` | Pay-to Address | Pay-to Address | — |
| 8 | `payToAddress2` | Pay-to Address 2 | Pay-to Address 2 | — |
| 9 | `payToCity` | Pay-to City | Pay-to City | — |
| 10 | `payToContact` | Pay-to Contact | Pay-to Contact | — |
| 11 | `yourReference` | Your Reference | Your Reference | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 14 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 15 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 16 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 17 | `shipToCity` | Ship-to City | Ship-to City | — |
| 18 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 19 | `postingDate` | Posting Date | Posting Date | — |
| 20 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | — |
| 21 | `postingDescription` | Posting Description | Posting Description | — |
| 22 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 23 | `dueDate` | Due Date | Due Date | — |
| 24 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | — |
| 25 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 26 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | — |
| 27 | `locationCode` | Location Code | Location Code | — |
| 28 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 29 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 30 | `vendorPostingGroup` | Vendor Posting Group | Vendor Posting Group | — |
| 31 | `currencyCode` | Currency Code | Currency Code | — |
| 32 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 33 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | — |
| 34 | `languageCode` | Language Code | Language Code | — |
| 35 | `formatRegion` | Format Region | Format Region | — |
| 36 | `purchaserCode` | Purchaser Code | Purchaser Code | — |
| 37 | `comment` | Comment | Comment | 🧮 computed |
| 38 | `noPrinted` | No. Printed | No. Printed | — |
| 39 | `onHold` | On Hold | On Hold | — |
| 40 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 41 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 42 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 43 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 44 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 45 | `reasonCode` | Reason Code | Reason Code | — |
| 46 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 47 | `transactionType` | Transaction Type | Transaction Type | — |
| 48 | `transportMethod` | Transport Method | Transport Method | — |
| 49 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | — |
| 50 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | — |
| 51 | `buyFromVendorName2` | Buy-from Vendor Name 2 | Buy-from Vendor Name 2 | — |
| 52 | `buyFromAddress` | Buy-from Address | Buy-from Address | — |
| 53 | `buyFromAddress2` | Buy-from Address 2 | Buy-from Address 2 | — |
| 54 | `buyFromCity` | Buy-from City | Buy-from City | — |
| 55 | `buyFromContact` | Buy-from Contact | Buy-from Contact | — |
| 56 | `payToPostCode` | Pay-to Post Code | Pay-to Post Code | — |
| 57 | `payToCounty` | Pay-to County | Pay-to County | — |
| 58 | `payToCountryRegionCode` | Pay-to Country/Region Code | Pay-to Country/Region Code | — |
| 59 | `buyFromPostCode` | Buy-from Post Code | Buy-from Post Code | — |
| 60 | `buyFromCounty` | Buy-from County | Buy-from County | — |
| 61 | `buyFromCountryRegionCode` | Buy-from Country/Region Code | Buy-from Country/Region Code | — |
| 62 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 63 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 64 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 65 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 66 | `orderAddressCode` | Order Address Code | Order Address Code | — |
| 67 | `entryPoint` | Entry Point | Entry Point | — |
| 68 | `correction` | Correction | Correction | — |
| 69 | `documentDate` | Document Date | Document Date | — |
| 70 | `areaCode` | Area | Area | — |
| 71 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 72 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 73 | `noSeries` | No. Series | No. Series | — |
| 74 | `userId` | User ID | User ID | — |
| 75 | `sourceCode` | Source Code | Source Code | — |
| 76 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 77 | `taxLiable` | Tax Liable | Tax Liable | — |
| 78 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 79 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | — |
| 80 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | — |
| 81 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 82 | `campaignNo` | Campaign No. | Campaign No. | — |
| 83 | `buyFromContactNo` | Buy-from Contact No. | Buy-from Contact No. | — |
| 84 | `payToContactNo` | Pay-to Contact No. | Pay-to Contact No. | — |
| 85 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 86 | `vendorAuthorizationNo` | Vendor Authorization No. | Vendor Authorization No. | — |
| 87 | `returnOrderNo` | Return Order No. | Return Order No. | — |
| 88 | `returnOrderNoSeries` | Return Order No. Series | Return Order No. Series | — |
| 89 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedReturnShipmentLines

**Description:** Lines of posted return shipments.

| Property | Value |
|---|---|
| **Source Table** | Return Shipment Line |
| Page ID | 90903 |
| Page Name | `ocpfPostedReturnShipmentLines` |
| Entity Set Name | `ocpfPostedReturnShipmentLines` |
| API Group | `ocpf_purchasing` |
| Editable | ❌ No (GET only) |
| Field Count | 89 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `no` | No. | No. | — |
| 7 | `locationCode` | Location Code | Location Code | — |
| 8 | `postingGroup` | Posting Group | Posting Group | — |
| 9 | `description` | Description | Description | — |
| 10 | `description2` | Description 2 | Description 2 | — |
| 11 | `unitOfMeasure` | Unit of Measure | Unit of Measure | — |
| 12 | `quantity` | Quantity | Quantity | — |
| 13 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | — |
| 14 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 15 | `vatPct` | VAT % | VAT % | — |
| 16 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 17 | `unitPriceLcy` | Unit Price (LCY) | Unit Price (LCY) | — |
| 18 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 19 | `grossWeight` | Gross Weight | Gross Weight | — |
| 20 | `netWeight` | Net Weight | Net Weight | — |
| 21 | `unitsPerParcel` | Units per Parcel | Units per Parcel | — |
| 22 | `unitVolume` | Unit Volume | Unit Volume | — |
| 23 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | — |
| 24 | `itemShptEntryNo` | Item Shpt. Entry No. | Item Shpt. Entry No. | — |
| 25 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 26 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 27 | `jobNo` | Job No. | Project No. | — |
| 28 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | — |
| 29 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | — |
| 30 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | — |
| 31 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | — |
| 32 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 33 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 34 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 35 | `transactionType` | Transaction Type | Transaction Type | — |
| 36 | `transportMethod` | Transport Method | Transport Method | — |
| 37 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 38 | `entryPoint` | Entry Point | Entry Point | — |
| 39 | `areaCode` | Area | Area | — |
| 40 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 41 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 42 | `taxLiable` | Tax Liable | Tax Liable | — |
| 43 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 44 | `useTax` | Use Tax | Use Tax | — |
| 45 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 46 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 47 | `currencyCode` | Currency Code | Currency Code | 🧮 computed |
| 48 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | — |
| 49 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | — |
| 50 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | — |
| 51 | `unitCost` | Unit Cost | Unit Cost | — |
| 52 | `postingDate` | Posting Date | Posting Date | — |
| 53 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | — |
| 54 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 55 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 56 | `jobPlanningLineNo` | Job Planning Line No. | Project Planning Line No. | — |
| 57 | `variantCode` | Variant Code | Variant Code | — |
| 58 | `binCode` | Bin Code | Bin Code | — |
| 59 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 60 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 61 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 62 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | — |
| 63 | `faPostingDate` | FA Posting Date | FA Posting Date | — |
| 64 | `faPostingType` | FA Posting Type | FA Posting Type | — |
| 65 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | — |
| 66 | `salvageValue` | Salvage Value | Salvage Value | — |
| 67 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | — |
| 68 | `deprAcquisitionCost` | Depr. Acquisition Cost | Depr. Acquisition Cost | — |
| 69 | `maintenanceCode` | Maintenance Code | Maintenance Code | — |
| 70 | `insuranceNo` | Insurance No. | Insurance No. | — |
| 71 | `budgetedFaNo` | Budgeted FA No. | Budgeted FA No. | — |
| 72 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | — |
| 73 | `useDuplicationList` | Use Duplication List | Use Duplication List | — |
| 74 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 75 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 76 | `nonstock` | Nonstock | Catalog | — |
| 77 | `purchasingCode` | Purchasing Code | Purchasing Code | — |
| 78 | `itemReferenceNo` | Item Reference No. | Item Reference No. | — |
| 79 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Unit of Measure (Item Ref.) | — |
| 80 | `itemReferenceType` | Item Reference Type | Item Reference Type | — |
| 81 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | — |
| 82 | `returnQtyShippedNotInvd` | Return Qty. Shipped Not Invd. | Return Qty. Shipped Not Invd. | — |
| 83 | `itemChargeBaseAmount` | Item Charge Base Amount | Item Charge Base Amount | — |
| 84 | `correction` | Correction | Correction | — |
| 85 | `returnOrderNo` | Return Order No. | Return Order No. | — |
| 86 | `returnOrderLineNo` | Return Order Line No. | Return Order Line No. | — |
| 87 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 88 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 89 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfPurchaseQuotes

**Description:** Purchase quotes — requests for pricing from vendors before ordering.

| Property | Value |
|---|---|
| **Source Table** | Purchase Header |
| Page ID | 90904 |
| Page Name | `ocpfPurchaseQuotes` |
| Entity Set Name | `ocpfPurchaseQuotes` |
| API Group | `ocpf_purchasing` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Quote)` |
| Field Count | 159 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | ✅ |
| 4 | `no` | No. | No. | ✅ |
| 5 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | ✅ |
| 6 | `payToName` | Pay-to Name | Pay-to Name | ✅ |
| 7 | `payToName2` | Pay-to Name 2 | Pay-to Name 2 | ✅ |
| 8 | `payToAddress` | Pay-to Address | Pay-to Address | ✅ |
| 9 | `payToAddress2` | Pay-to Address 2 | Pay-to Address 2 | ✅ |
| 10 | `payToCity` | Pay-to City | Pay-to City | ✅ |
| 11 | `payToContact` | Pay-to Contact | Pay-to Contact | ✅ |
| 12 | `yourReference` | Your Reference | Your Reference | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `shipToName` | Ship-to Name | Ship-to Name | ✅ |
| 15 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | ✅ |
| 16 | `shipToAddress` | Ship-to Address | Ship-to Address | ✅ |
| 17 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | ✅ |
| 18 | `shipToCity` | Ship-to City | Ship-to City | ✅ |
| 19 | `shipToContact` | Ship-to Contact | Ship-to Contact | ✅ |
| 20 | `orderDate` | Order Date | Order Date | ✅ |
| 21 | `postingDate` | Posting Date | Posting Date | ✅ |
| 22 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | ✅ |
| 23 | `postingDescription` | Posting Description | Posting Description | ✅ |
| 24 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 25 | `dueDate` | Due Date | Due Date | ✅ |
| 26 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 27 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 28 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 29 | `locationCode` | Location Code | Location Code | ✅ |
| 30 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 31 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 32 | `vendorPostingGroup` | Vendor Posting Group | Vendor Posting Group | ✅ |
| 33 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 34 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 35 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 36 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 37 | `languageCode` | Language Code | Language Code | ✅ |
| 38 | `formatRegion` | Format Region | Format Region | ✅ |
| 39 | `purchaserCode` | Purchaser Code | Purchaser Code | ✅ |
| 40 | `orderClass` | Order Class | Order Class | ✅ |
| 41 | `comment` | Comment | Comment | 🧮 computed |
| 42 | `noPrinted` | No. Printed | No. Printed | ✅ |
| 43 | `onHold` | On Hold | On Hold | ✅ |
| 44 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 45 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 46 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 47 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | 🧮 computed |
| 48 | `receive` | Receive | Receive | ✅ |
| 49 | `invoice` | Invoice | Invoice | ✅ |
| 50 | `printPostedDocuments` | Print Posted Documents | Print Posted Documents | ✅ |
| 51 | `amount` | Amount | Amount | 🧮 computed |
| 52 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 53 | `receivingNo` | Receiving No. | Receiving No. | ✅ |
| 54 | `postingNo` | Posting No. | Posting No. | ✅ |
| 55 | `lastReceivingNo` | Last Receiving No. | Last Receiving No. | ✅ |
| 56 | `lastPostingNo` | Last Posting No. | Last Posting No. | ✅ |
| 57 | `vendorOrderNo` | Vendor Order No. | Vendor Order No. | ✅ |
| 58 | `vendorShipmentNo` | Vendor Shipment No. | Vendor Shipment No. | ✅ |
| 59 | `vendorInvoiceNo` | Vendor Invoice No. | Vendor Invoice No. | ✅ |
| 60 | `vendorCrMemoNo` | Vendor Cr. Memo No. | Vendor Cr. Memo No. | ✅ |
| 61 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 62 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 63 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 64 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 65 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 66 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 67 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | ✅ |
| 68 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | ✅ |
| 69 | `buyFromVendorName2` | Buy-from Vendor Name 2 | Buy-from Vendor Name 2 | ✅ |
| 70 | `buyFromAddress` | Buy-from Address | Buy-from Address | ✅ |
| 71 | `buyFromAddress2` | Buy-from Address 2 | Buy-from Address 2 | ✅ |
| 72 | `buyFromCity` | Buy-from City | Buy-from City | ✅ |
| 73 | `buyFromContact` | Buy-from Contact | Buy-from Contact | ✅ |
| 74 | `payToPostCode` | Pay-to Post Code | Pay-to Post Code | ✅ |
| 75 | `payToCounty` | Pay-to County | Pay-to County | ✅ |
| 76 | `payToCountryRegionCode` | Pay-to Country/Region Code | Pay-to Country/Region Code | ✅ |
| 77 | `buyFromPostCode` | Buy-from Post Code | Buy-from Post Code | ✅ |
| 78 | `buyFromCounty` | Buy-from County | Buy-from County | ✅ |
| 79 | `buyFromCountryRegionCode` | Buy-from Country/Region Code | Buy-from Country/Region Code | ✅ |
| 80 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | ✅ |
| 81 | `shipToCounty` | Ship-to County | Ship-to County | ✅ |
| 82 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | ✅ |
| 83 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 84 | `orderAddressCode` | Order Address Code | Order Address Code | ✅ |
| 85 | `entryPoint` | Entry Point | Entry Point | ✅ |
| 86 | `correction` | Correction | Correction | ✅ |
| 87 | `documentDate` | Document Date | Document Date | ✅ |
| 88 | `areaCode` | Area | Area | ✅ |
| 89 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 90 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 91 | `noSeries` | No. Series | No. Series | ✅ |
| 92 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 93 | `receivingNoSeries` | Receiving No. Series | Receiving No. Series | ✅ |
| 94 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 95 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 96 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 97 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 98 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 99 | `status` | Status | Status | ✅ |
| 100 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | ✅ |
| 101 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | ✅ |
| 102 | `sendIcDocument` | Send IC Document | Send IC Document | ✅ |
| 103 | `icStatus` | IC Status | IC Status | ✅ |
| 104 | `buyFromIcPartnerCode` | Buy-from IC Partner Code | Buy-from IC Partner Code | ✅ |
| 105 | `payToIcPartnerCode` | Pay-to IC Partner Code | Pay-to IC Partner Code | ✅ |
| 106 | `icReferenceDocumentNo` | IC Reference Document No. | IC Reference Document No. | ✅ |
| 107 | `icDirection` | IC Direction | IC Direction | ✅ |
| 108 | `prepaymentNo` | Prepayment No. | Prepayment No. | ✅ |
| 109 | `lastPrepaymentNo` | Last Prepayment No. | Last Prepayment No. | ✅ |
| 110 | `prepmtCrMemoNo` | Prepmt. Cr. Memo No. | Prepmt. Cr. Memo No. | ✅ |
| 111 | `lastPrepmtCrMemoNo` | Last Prepmt. Cr. Memo No. | Last Prepmt. Cr. Memo No. | ✅ |
| 112 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 113 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | ✅ |
| 114 | `compressPrepayment` | Compress Prepayment | Compress Prepayment | ✅ |
| 115 | `prepaymentDueDate` | Prepayment Due Date | Prepayment Due Date | ✅ |
| 116 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | ✅ |
| 117 | `prepmtPostingDescription` | Prepmt. Posting Description | Prepmt. Posting Description | ✅ |
| 118 | `prepmtPmtDiscountDate` | Prepmt. Pmt. Discount Date | Prepmt. Pmt. Discount Date | ✅ |
| 119 | `prepmtPaymentTermsCode` | Prepmt. Payment Terms Code | Prepmt. Payment Terms Code | ✅ |
| 120 | `prepmtPaymentDiscountPct` | Prepmt. Payment Discount % | Prepmt. Payment Discount % | ✅ |
| 121 | `quoteNo` | Quote No. | Quote No. | ✅ |
| 122 | `jobQueueStatus` | Job Queue Status | Job Queue Status | ✅ |
| 123 | `jobQueueEntryId` | Job Queue Entry ID | Job Queue Entry ID | ✅ |
| 124 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 125 | `creditorNo` | Creditor No. | Creditor No. | ✅ |
| 126 | `paymentReference` | Payment Reference | Payment Reference | ✅ |
| 127 | `invoiceReceivedDate` | Invoice Received Date | Invoice Received Date | ✅ |
| 128 | `journalTemplName` | Journal Templ. Name | Journal Template Name | ✅ |
| 129 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 130 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | ✅ |
| 131 | `aRcdNotInvExVatLcy` | A. Rcd. Not Inv. Ex. VAT (LCY) | Amount Received Not Invoiced (LCY) | 🧮 computed |
| 132 | `amtRcdNotInvoicedLcy` | Amt. Rcd. Not Invoiced (LCY) | Amount Received Not Invoiced (LCY) Incl. VAT | 🧮 computed |
| 133 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 134 | `remitToCode` | Remit-to Code | Remit-to Code | ✅ |
| 135 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 136 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 137 | `docNoOccurrence` | Doc. No. Occurrence | Doc. No. Occurrence | ✅ |
| 138 | `campaignNo` | Campaign No. | Campaign No. | ✅ |
| 139 | `buyFromContactNo` | Buy-from Contact No. | Buy-from Contact No. | ✅ |
| 140 | `payToContactNo` | Pay-to Contact No. | Pay-to Contact No. | ✅ |
| 141 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 142 | `partiallyInvoiced` | Partially Invoiced | Partially Invoiced | 🧮 computed |
| 143 | `completelyReceived` | Completely Received | Completely Received | 🧮 computed |
| 144 | `postingFromWhseRef` | Posting from Whse. Ref. | Posting from Whse. Ref. | ✅ |
| 145 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 146 | `receivedNotInvoiced` | Received Not Invoiced | Received Not Invoiced | 🧮 computed |
| 147 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | ✅ |
| 148 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | ✅ |
| 149 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 150 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | ✅ |
| 151 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 152 | `vendorAuthorizationNo` | Vendor Authorization No. | Vendor Authorization No. | ✅ |
| 153 | `returnShipmentNo` | Return Shipment No. | Return Shipment No. | ✅ |
| 154 | `returnShipmentNoSeries` | Return Shipment No. Series | Return Shipment No. Series | ✅ |
| 155 | `ship` | Ship | Ship | ✅ |
| 156 | `lastReturnShipmentNo` | Last Return Shipment No. | Last Return Shipment No. | ✅ |
| 157 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 158 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |
| 159 | `pendingApprovals` | Pending Approvals | Pending Approvals | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfPurchaseQuoteLines

**Description:** Lines of open purchase quotes.

| Property | Value |
|---|---|
| **Source Table** | Purchase Line |
| Page ID | 90905 |
| Page Name | `ocpfPurchaseQuoteLines` |
| Entity Set Name | `ocpfPurchaseQuoteLines` |
| API Group | `ocpf_purchasing` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const(Quote)` |
| Field Count | 211 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | ✅ |
| 4 | `documentNo` | Document No. | Document No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `type` | Type | Type | ✅ |
| 7 | `no` | No. | No. | ✅ |
| 8 | `locationCode` | Location Code | Location Code | ✅ |
| 9 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 10 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `description2` | Description 2 | Description 2 | ✅ |
| 13 | `unitOfMeasure` | Unit of Measure | Unit of Measure | ✅ |
| 14 | `quantity` | Quantity | Quantity | ✅ |
| 15 | `outstandingQuantity` | Outstanding Quantity | Outstanding Quantity | ✅ |
| 16 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | ✅ |
| 17 | `qtyToReceive` | Qty. to Receive | Qty. to Receive | ✅ |
| 18 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | ✅ |
| 19 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | ✅ |
| 20 | `vatPct` | VAT % | VAT % | ✅ |
| 21 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 22 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 23 | `amount` | Amount | Amount | ✅ |
| 24 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | ✅ |
| 25 | `unitPriceLcy` | Unit Price (LCY) | Unit Price (LCY) | ✅ |
| 26 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 27 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 28 | `netWeight` | Net Weight | Net Weight | ✅ |
| 29 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 30 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 31 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 32 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 33 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 34 | `jobNo` | Job No. | Project No. | ✅ |
| 35 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | ✅ |
| 36 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | ✅ |
| 37 | `outstandingAmount` | Outstanding Amount | Outstanding Amount | ✅ |
| 38 | `qtyRcdNotInvoiced` | Qty. Rcd. Not Invoiced | Qty. Rcd. Not Invoiced | ✅ |
| 39 | `amtRcdNotInvoiced` | Amt. Rcd. Not Invoiced | Amt. Rcd. Not Invoiced | ✅ |
| 40 | `quantityReceived` | Quantity Received | Quantity Received | ✅ |
| 41 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | ✅ |
| 42 | `receiptNo` | Receipt No. | Receipt No. | ✅ |
| 43 | `receiptLineNo` | Receipt Line No. | Receipt Line No. | ✅ |
| 44 | `orderNo` | Order No. | Order No. | ✅ |
| 45 | `orderLineNo` | Order Line No. | Order Line No. | ✅ |
| 46 | `profitPct` | Profit % | Profit % | ✅ |
| 47 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | ✅ |
| 48 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | ✅ |
| 49 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | ✅ |
| 50 | `salesOrderNo` | Sales Order No. | Sales Order No. | ✅ |
| 51 | `salesOrderLineNo` | Sales Order Line No. | Sales Order Line No. | ✅ |
| 52 | `dropShipment` | Drop Shipment | Drop Shipment | ✅ |
| 53 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 54 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 55 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 56 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 57 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 58 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | ✅ |
| 59 | `entryPoint` | Entry Point | Entry Point | ✅ |
| 60 | `areaCode` | Area | Area | ✅ |
| 61 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 62 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 63 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 64 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 65 | `useTax` | Use Tax | Use Tax | ✅ |
| 66 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 67 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 68 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 69 | `outstandingAmountLcy` | Outstanding Amount (LCY) | Outstanding Amount (LCY) | ✅ |
| 70 | `amtRcdNotInvoicedLcy` | Amt. Rcd. Not Invoiced (LCY) | Amt. Rcd. Not Invoiced (LCY) | ✅ |
| 71 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 72 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | ✅ |
| 73 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | ✅ |
| 74 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 75 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 76 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 77 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 78 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 79 | `invDiscAmountToInvoice` | Inv. Disc. Amount to Invoice | Inv. Disc. Amount to Invoice | ✅ |
| 80 | `vatIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 81 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | ✅ |
| 82 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | ✅ |
| 83 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 84 | `prepmtLineAmount` | Prepmt. Line Amount | Prepmt. Line Amount | ✅ |
| 85 | `prepmtAmtInv` | Prepmt. Amt. Inv. | Prepmt. Amt. Inv. | ✅ |
| 86 | `prepmtAmtInclVat` | Prepmt. Amt. Incl. VAT | Prepmt. Amt. Incl. VAT | ✅ |
| 87 | `prepaymentAmount` | Prepayment Amount | Prepayment Amount | ✅ |
| 88 | `prepmtVatBaseAmt` | Prepmt. VAT Base Amt. | Prepmt. VAT Base Amt. | ✅ |
| 89 | `prepaymentVatPct` | Prepayment VAT % | Prepayment VAT % | ✅ |
| 90 | `prepmtVatCalcType` | Prepmt. VAT Calc. Type | Prepmt. VAT Calc. Type | ✅ |
| 91 | `prepaymentVatIdentifier` | Prepayment VAT Identifier | Prepayment VAT Identifier | ✅ |
| 92 | `prepaymentTaxAreaCode` | Prepayment Tax Area Code | Prepayment Tax Area Code | ✅ |
| 93 | `prepaymentTaxLiable` | Prepayment Tax Liable | Prepayment Tax Liable | ✅ |
| 94 | `prepaymentTaxGroupCode` | Prepayment Tax Group Code | Prepayment Tax Group Code | ✅ |
| 95 | `prepmtAmtToDeduct` | Prepmt Amt to Deduct | Prepmt Amt to Deduct | ✅ |
| 96 | `prepmtAmtDeducted` | Prepmt Amt Deducted | Prepmt Amt Deducted | ✅ |
| 97 | `prepaymentLine` | Prepayment Line | Prepayment Line | ✅ |
| 98 | `prepmtAmountInvInclVat` | Prepmt. Amount Inv. Incl. VAT | Prepmt. Amount Inv. Incl. VAT | ✅ |
| 99 | `prepmtAmountInvLcy` | Prepmt. Amount Inv. (LCY) | Prepmt. Amount Inv. (LCY) | ✅ |
| 100 | `icPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 101 | `prepmtVatAmountInvLcy` | Prepmt. VAT Amount Inv. (LCY) | Prepmt. VAT Amount Inv. (LCY) | ✅ |
| 102 | `prepaymentVatDifference` | Prepayment VAT Difference | Prepayment VAT Difference | ✅ |
| 103 | `prepmtVatDiffToDeduct` | Prepmt VAT Diff. to Deduct | Prepmt VAT Diff. to Deduct | ✅ |
| 104 | `prepmtVatDiffDeducted` | Prepmt VAT Diff. Deducted | Prepmt VAT Diff. Deducted | ✅ |
| 105 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | ✅ |
| 106 | `outstandingAmtExVatLcy` | Outstanding Amt. Ex. VAT (LCY) | Outstanding Amt. Ex. VAT (LCY) | ✅ |
| 107 | `aRcdNotInvExVatLcy` | A. Rcd. Not Inv. Ex. VAT (LCY) | A. Rcd. Not Inv. Ex. VAT (LCY) | ✅ |
| 108 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | ✅ |
| 109 | `prepmtPmtDiscountAmount` | Prepmt. Pmt. Discount Amount | Prepmt. Pmt. Discount Amount | ✅ |
| 110 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 111 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 112 | `jobLineType` | Job Line Type | Project Line Type | ✅ |
| 113 | `jobUnitPrice` | Job Unit Price | Project Unit Price | ✅ |
| 114 | `jobTotalPrice` | Job Total Price | Project Total Price | ✅ |
| 115 | `jobLineAmount` | Job Line Amount | Project Line Amount | ✅ |
| 116 | `jobLineDiscountAmount` | Job Line Discount Amount | Project Line Discount Amount | ✅ |
| 117 | `jobLineDiscountPct` | Job Line Discount % | Project Line Discount % | ✅ |
| 118 | `jobUnitPriceLcy` | Job Unit Price (LCY) | Project Unit Price (LCY) | ✅ |
| 119 | `jobTotalPriceLcy` | Job Total Price (LCY) | Project Total Price (LCY) | ✅ |
| 120 | `jobLineAmountLcy` | Job Line Amount (LCY) | Project Line Amount (LCY) | ✅ |
| 121 | `jobLineDiscAmountLcy` | Job Line Disc. Amount (LCY) | Project Line Disc. Amount (LCY) | ✅ |
| 122 | `jobCurrencyFactor` | Job Currency Factor | Project Currency Factor | ✅ |
| 123 | `jobCurrencyCode` | Job Currency Code | Project Currency Code | ✅ |
| 124 | `jobPlanningLineNo` | Job Planning Line No. | Job Planning Line No. | ✅ |
| 125 | `jobRemainingQty` | Job Remaining Qty. | Project Remaining Qty. | ✅ |
| 126 | `jobRemainingQtyBase` | Job Remaining Qty. (Base) | Project Remaining Qty. (Base) | ✅ |
| 127 | `deferralCode` | Deferral Code | Deferral Code | ✅ |
| 128 | `returnsDeferralStartDate` | Returns Deferral Start Date | Returns Deferral Start Date | ✅ |
| 129 | `selectedAllocAccountNo` | Selected Alloc. Account No. | Allocation Account No. | ✅ |
| 130 | `allocAccModifiedByUser` | Alloc. Acc. Modified by User | Allocation Account Distributions Modified | 🧮 computed |
| 131 | `allocationAccountNo` | Allocation Account No. | Posting Allocation Account No. | ✅ |
| 132 | `allocPurchLineSystemid` | Alloc. Purch. Line SystemId | Allocation Purchase Line SystemId | ✅ |
| 133 | `variantCode` | Variant Code | Variant Code | ✅ |
| 134 | `binCode` | Bin Code | Bin Code | ✅ |
| 135 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 136 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 137 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 138 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 139 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 140 | `outstandingQtyBase` | Outstanding Qty. (Base) | Outstanding Qty. (Base) | ✅ |
| 141 | `qtyToInvoiceBase` | Qty. to Invoice (Base) | Qty. to Invoice (Base) | ✅ |
| 142 | `qtyToReceiveBase` | Qty. to Receive (Base) | Qty. to Receive (Base) | ✅ |
| 143 | `qtyRcdNotInvoicedBase` | Qty. Rcd. Not Invoiced (Base) | Qty. Rcd. Not Invoiced (Base) | ✅ |
| 144 | `qtyReceivedBase` | Qty. Received (Base) | Qty. Received (Base) | ✅ |
| 145 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | ✅ |
| 146 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 147 | `faPostingDate` | FA Posting Date | FA Posting Date | ✅ |
| 148 | `faPostingType` | FA Posting Type | FA Posting Type | ✅ |
| 149 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | ✅ |
| 150 | `salvageValue` | Salvage Value | Salvage Value | ✅ |
| 151 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | ✅ |
| 152 | `deprAcquisitionCost` | Depr. Acquisition Cost | Depr. Acquisition Cost | ✅ |
| 153 | `maintenanceCode` | Maintenance Code | Maintenance Code | ✅ |
| 154 | `insuranceNo` | Insurance No. | Insurance No. | ✅ |
| 155 | `budgetedFaNo` | Budgeted FA No. | Budgeted FA No. | ✅ |
| 156 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | ✅ |
| 157 | `useDuplicationList` | Use Duplication List | Use Duplication List | ✅ |
| 158 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 159 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 160 | `nonstock` | Nonstock | Catalog | ✅ |
| 161 | `purchasingCode` | Purchasing Code | Purchasing Code | ✅ |
| 162 | `specialOrder` | Special Order | Special Order | ✅ |
| 163 | `specialOrderSalesNo` | Special Order Sales No. | Special Order Sales No. | ✅ |
| 164 | `specialOrderSalesLineNo` | Special Order Sales Line No. | Special Order Sales Line No. | ✅ |
| 165 | `itemReferenceNo` | Item Reference No. | Item Reference No. | ✅ |
| 166 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Item Reference Unit of Measure | ✅ |
| 167 | `itemReferenceType` | Item Reference Type | Item Reference Type | ✅ |
| 168 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | ✅ |
| 169 | `whseOutstandingQtyBase` | Whse. Outstanding Qty. (Base) | Whse. Outstanding Qty. (Base) | 🧮 computed |
| 170 | `completelyReceived` | Completely Received | Completely Received | ✅ |
| 171 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | ✅ |
| 172 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | ✅ |
| 173 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 174 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | ✅ |
| 175 | `plannedReceiptDate` | Planned Receipt Date | Planned Receipt Date | ✅ |
| 176 | `orderDate` | Order Date | Order Date | ✅ |
| 177 | `allowItemChargeAssignment` | Allow Item Charge Assignment | Allow Item Charge Assignment | ✅ |
| 178 | `qtyToAssign` | Qty. to Assign | Qty. to Assign | 🧮 computed |
| 179 | `qtyAssigned` | Qty. Assigned | Qty. Assigned | 🧮 computed |
| 180 | `returnQtyToShip` | Return Qty. to Ship | Return Qty. to Ship | ✅ |
| 181 | `returnQtyToShipBase` | Return Qty. to Ship (Base) | Return Qty. to Ship (Base) | ✅ |
| 182 | `returnQtyShippedNotInvd` | Return Qty. Shipped Not Invd. | Return Qty. Shipped Not Invd. | ✅ |
| 183 | `retQtyShpdNotInvdBase` | Ret. Qty. Shpd Not Invd.(Base) | Ret. Qty. Shpd Not Invd.(Base) | ✅ |
| 184 | `returnShpdNotInvd` | Return Shpd. Not Invd. | Return Shpd. Not Invd. | ✅ |
| 185 | `returnShpdNotInvdLcy` | Return Shpd. Not Invd. (LCY) | Return Shpd. Not Invd. (LCY) | ✅ |
| 186 | `returnQtyShipped` | Return Qty. Shipped | Return Qty. Shipped | ✅ |
| 187 | `returnQtyShippedBase` | Return Qty. Shipped (Base) | Return Qty. Shipped (Base) | ✅ |
| 188 | `itemChargeQtyToHandle` | Item Charge Qty. to Handle | Item Charge Qty. to Handle | 🧮 computed |
| 189 | `nonDeductibleVatPct` | Non-Deductible VAT % | Non-Deductible VAT % | ✅ |
| 190 | `nonDeductibleVatBase` | Non-Deductible VAT Base | Non-Deductible VAT Base | ✅ |
| 191 | `nonDeductibleVatAmount` | Non-Deductible VAT Amount | Non-Deductible VAT Amount | ✅ |
| 192 | `nonDeductibleVatDiff` | Non-Deductible VAT Diff. | Non-Deductible VAT Difference | ✅ |
| 193 | `prepmtNonDeductVatBase` | Prepmt. Non-Deduct. VAT Base | Prepmt.  Non-Deductible VAT Base | ✅ |
| 194 | `prepmtNonDeductVatAmount` | Prepmt. Non-Deduct. VAT Amount | Prepmt. on-Deductible VAT Amount | ✅ |
| 195 | `itemChargeHasNonDedVat` | Item Charge Has Non.Ded. VAT | Item Charge Has Non-Deductible VAT | ✅ |
| 196 | `returnShipmentNo` | Return Shipment No. | Return Shipment No. | ✅ |
| 197 | `returnShipmentLineNo` | Return Shipment Line No. | Return Shipment Line No. | ✅ |
| 198 | `returnReasonCode` | Return Reason Code | Return Reason Code | ✅ |
| 199 | `subtype` | Subtype | Subtype | ✅ |
| 200 | `copiedFromPostedDoc` | Copied From Posted Doc. | Copied From Posted Doc. | ✅ |
| 201 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 202 | `attachedDocCount` | Attached Doc Count | Attached Doc Count | 🧮 computed |
| 203 | `attachedLinesCount` | Attached Lines Count | Attached Lines Count | 🧮 computed |
| 204 | `overReceiptQuantity` | Over-Receipt Quantity | Over-Receipt Quantity | ✅ |
| 205 | `overReceiptCode` | Over-Receipt Code | Over-Receipt Code | ✅ |
| 206 | `overReceiptApprovalStatus` | Over-Receipt Approval Status | Over-Receipt Approval Status | ✅ |
| 207 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | 🧮 computed |
| 208 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |
| 209 | `mpsOrder` | MPS Order | MPS Order | ✅ |
| 210 | `planningFlexibility` | Planning Flexibility | Planning Flexibility | ✅ |
| 211 | `safetyLeadTime` | Safety Lead Time | Safety Lead Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfPurchaseBlanketOrders

**Description:** Purchase blanket orders — long-term framework agreements with vendors.

| Property | Value |
|---|---|
| **Source Table** | Purchase Header |
| Page ID | 90906 |
| Page Name | `ocpfPurchaseBlanketOrders` |
| Entity Set Name | `ocpfPurchaseBlanketOrders` |
| API Group | `ocpf_purchasing` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const("Blanket Order")` |
| Field Count | 159 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | ✅ |
| 4 | `no` | No. | No. | ✅ |
| 5 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | ✅ |
| 6 | `payToName` | Pay-to Name | Pay-to Name | ✅ |
| 7 | `payToName2` | Pay-to Name 2 | Pay-to Name 2 | ✅ |
| 8 | `payToAddress` | Pay-to Address | Pay-to Address | ✅ |
| 9 | `payToAddress2` | Pay-to Address 2 | Pay-to Address 2 | ✅ |
| 10 | `payToCity` | Pay-to City | Pay-to City | ✅ |
| 11 | `payToContact` | Pay-to Contact | Pay-to Contact | ✅ |
| 12 | `yourReference` | Your Reference | Your Reference | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `shipToName` | Ship-to Name | Ship-to Name | ✅ |
| 15 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | ✅ |
| 16 | `shipToAddress` | Ship-to Address | Ship-to Address | ✅ |
| 17 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | ✅ |
| 18 | `shipToCity` | Ship-to City | Ship-to City | ✅ |
| 19 | `shipToContact` | Ship-to Contact | Ship-to Contact | ✅ |
| 20 | `orderDate` | Order Date | Order Date | ✅ |
| 21 | `postingDate` | Posting Date | Posting Date | ✅ |
| 22 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | ✅ |
| 23 | `postingDescription` | Posting Description | Posting Description | ✅ |
| 24 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 25 | `dueDate` | Due Date | Due Date | ✅ |
| 26 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 27 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 28 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 29 | `locationCode` | Location Code | Location Code | ✅ |
| 30 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 31 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 32 | `vendorPostingGroup` | Vendor Posting Group | Vendor Posting Group | ✅ |
| 33 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 34 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 35 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 36 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 37 | `languageCode` | Language Code | Language Code | ✅ |
| 38 | `formatRegion` | Format Region | Format Region | ✅ |
| 39 | `purchaserCode` | Purchaser Code | Purchaser Code | ✅ |
| 40 | `orderClass` | Order Class | Order Class | ✅ |
| 41 | `comment` | Comment | Comment | 🧮 computed |
| 42 | `noPrinted` | No. Printed | No. Printed | ✅ |
| 43 | `onHold` | On Hold | On Hold | ✅ |
| 44 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 45 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 46 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 47 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | 🧮 computed |
| 48 | `receive` | Receive | Receive | ✅ |
| 49 | `invoice` | Invoice | Invoice | ✅ |
| 50 | `printPostedDocuments` | Print Posted Documents | Print Posted Documents | ✅ |
| 51 | `amount` | Amount | Amount | 🧮 computed |
| 52 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 53 | `receivingNo` | Receiving No. | Receiving No. | ✅ |
| 54 | `postingNo` | Posting No. | Posting No. | ✅ |
| 55 | `lastReceivingNo` | Last Receiving No. | Last Receiving No. | ✅ |
| 56 | `lastPostingNo` | Last Posting No. | Last Posting No. | ✅ |
| 57 | `vendorOrderNo` | Vendor Order No. | Vendor Order No. | ✅ |
| 58 | `vendorShipmentNo` | Vendor Shipment No. | Vendor Shipment No. | ✅ |
| 59 | `vendorInvoiceNo` | Vendor Invoice No. | Vendor Invoice No. | ✅ |
| 60 | `vendorCrMemoNo` | Vendor Cr. Memo No. | Vendor Cr. Memo No. | ✅ |
| 61 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 62 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | ✅ |
| 63 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 64 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 65 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 66 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 67 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | ✅ |
| 68 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | ✅ |
| 69 | `buyFromVendorName2` | Buy-from Vendor Name 2 | Buy-from Vendor Name 2 | ✅ |
| 70 | `buyFromAddress` | Buy-from Address | Buy-from Address | ✅ |
| 71 | `buyFromAddress2` | Buy-from Address 2 | Buy-from Address 2 | ✅ |
| 72 | `buyFromCity` | Buy-from City | Buy-from City | ✅ |
| 73 | `buyFromContact` | Buy-from Contact | Buy-from Contact | ✅ |
| 74 | `payToPostCode` | Pay-to Post Code | Pay-to Post Code | ✅ |
| 75 | `payToCounty` | Pay-to County | Pay-to County | ✅ |
| 76 | `payToCountryRegionCode` | Pay-to Country/Region Code | Pay-to Country/Region Code | ✅ |
| 77 | `buyFromPostCode` | Buy-from Post Code | Buy-from Post Code | ✅ |
| 78 | `buyFromCounty` | Buy-from County | Buy-from County | ✅ |
| 79 | `buyFromCountryRegionCode` | Buy-from Country/Region Code | Buy-from Country/Region Code | ✅ |
| 80 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | ✅ |
| 81 | `shipToCounty` | Ship-to County | Ship-to County | ✅ |
| 82 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | ✅ |
| 83 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 84 | `orderAddressCode` | Order Address Code | Order Address Code | ✅ |
| 85 | `entryPoint` | Entry Point | Entry Point | ✅ |
| 86 | `correction` | Correction | Correction | ✅ |
| 87 | `documentDate` | Document Date | Document Date | ✅ |
| 88 | `areaCode` | Area | Area | ✅ |
| 89 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 90 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 91 | `noSeries` | No. Series | No. Series | ✅ |
| 92 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 93 | `receivingNoSeries` | Receiving No. Series | Receiving No. Series | ✅ |
| 94 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 95 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 96 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 97 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 98 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 99 | `status` | Status | Status | ✅ |
| 100 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | ✅ |
| 101 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | ✅ |
| 102 | `sendIcDocument` | Send IC Document | Send IC Document | ✅ |
| 103 | `icStatus` | IC Status | IC Status | ✅ |
| 104 | `buyFromIcPartnerCode` | Buy-from IC Partner Code | Buy-from IC Partner Code | ✅ |
| 105 | `payToIcPartnerCode` | Pay-to IC Partner Code | Pay-to IC Partner Code | ✅ |
| 106 | `icReferenceDocumentNo` | IC Reference Document No. | IC Reference Document No. | ✅ |
| 107 | `icDirection` | IC Direction | IC Direction | ✅ |
| 108 | `prepaymentNo` | Prepayment No. | Prepayment No. | ✅ |
| 109 | `lastPrepaymentNo` | Last Prepayment No. | Last Prepayment No. | ✅ |
| 110 | `prepmtCrMemoNo` | Prepmt. Cr. Memo No. | Prepmt. Cr. Memo No. | ✅ |
| 111 | `lastPrepmtCrMemoNo` | Last Prepmt. Cr. Memo No. | Last Prepmt. Cr. Memo No. | ✅ |
| 112 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 113 | `prepaymentNoSeries` | Prepayment No. Series | Prepayment No. Series | ✅ |
| 114 | `compressPrepayment` | Compress Prepayment | Compress Prepayment | ✅ |
| 115 | `prepaymentDueDate` | Prepayment Due Date | Prepayment Due Date | ✅ |
| 116 | `prepmtCrMemoNoSeries` | Prepmt. Cr. Memo No. Series | Prepmt. Cr. Memo No. Series | ✅ |
| 117 | `prepmtPostingDescription` | Prepmt. Posting Description | Prepmt. Posting Description | ✅ |
| 118 | `prepmtPmtDiscountDate` | Prepmt. Pmt. Discount Date | Prepmt. Pmt. Discount Date | ✅ |
| 119 | `prepmtPaymentTermsCode` | Prepmt. Payment Terms Code | Prepmt. Payment Terms Code | ✅ |
| 120 | `prepmtPaymentDiscountPct` | Prepmt. Payment Discount % | Prepmt. Payment Discount % | ✅ |
| 121 | `quoteNo` | Quote No. | Quote No. | ✅ |
| 122 | `jobQueueStatus` | Job Queue Status | Job Queue Status | ✅ |
| 123 | `jobQueueEntryId` | Job Queue Entry ID | Job Queue Entry ID | ✅ |
| 124 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 125 | `creditorNo` | Creditor No. | Creditor No. | ✅ |
| 126 | `paymentReference` | Payment Reference | Payment Reference | ✅ |
| 127 | `invoiceReceivedDate` | Invoice Received Date | Invoice Received Date | ✅ |
| 128 | `journalTemplName` | Journal Templ. Name | Journal Template Name | ✅ |
| 129 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 130 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | ✅ |
| 131 | `aRcdNotInvExVatLcy` | A. Rcd. Not Inv. Ex. VAT (LCY) | Amount Received Not Invoiced (LCY) | 🧮 computed |
| 132 | `amtRcdNotInvoicedLcy` | Amt. Rcd. Not Invoiced (LCY) | Amount Received Not Invoiced (LCY) Incl. VAT | 🧮 computed |
| 133 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 134 | `remitToCode` | Remit-to Code | Remit-to Code | ✅ |
| 135 | `invoiceDiscountAmount` | Invoice Discount Amount | Invoice Discount Amount | 🧮 computed |
| 136 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 137 | `docNoOccurrence` | Doc. No. Occurrence | Doc. No. Occurrence | ✅ |
| 138 | `campaignNo` | Campaign No. | Campaign No. | ✅ |
| 139 | `buyFromContactNo` | Buy-from Contact No. | Buy-from Contact No. | ✅ |
| 140 | `payToContactNo` | Pay-to Contact No. | Pay-to Contact No. | ✅ |
| 141 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 142 | `partiallyInvoiced` | Partially Invoiced | Partially Invoiced | 🧮 computed |
| 143 | `completelyReceived` | Completely Received | Completely Received | 🧮 computed |
| 144 | `postingFromWhseRef` | Posting from Whse. Ref. | Posting from Whse. Ref. | ✅ |
| 145 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 146 | `receivedNotInvoiced` | Received Not Invoiced | Received Not Invoiced | 🧮 computed |
| 147 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | ✅ |
| 148 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | ✅ |
| 149 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 150 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | ✅ |
| 151 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 152 | `vendorAuthorizationNo` | Vendor Authorization No. | Vendor Authorization No. | ✅ |
| 153 | `returnShipmentNo` | Return Shipment No. | Return Shipment No. | ✅ |
| 154 | `returnShipmentNoSeries` | Return Shipment No. Series | Return Shipment No. Series | ✅ |
| 155 | `ship` | Ship | Ship | ✅ |
| 156 | `lastReturnShipmentNo` | Last Return Shipment No. | Last Return Shipment No. | ✅ |
| 157 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 158 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |
| 159 | `pendingApprovals` | Pending Approvals | Pending Approvals | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfPurchaseBlanketOrderLines

**Description:** Lines of open purchase blanket orders.

| Property | Value |
|---|---|
| **Source Table** | Purchase Line |
| Page ID | 90907 |
| Page Name | `ocpfPurchaseBlanketOrderLines` |
| Entity Set Name | `ocpfPurchaseBlanketOrderLines` |
| API Group | `ocpf_purchasing` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Source Table View | `where("Document Type" = const("Blanket Order")` |
| Field Count | 211 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `buyFromVendorNo` | Buy-from Vendor No. | Buy-from Vendor No. | ✅ |
| 4 | `documentNo` | Document No. | Document No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `type` | Type | Type | ✅ |
| 7 | `no` | No. | No. | ✅ |
| 8 | `locationCode` | Location Code | Location Code | ✅ |
| 9 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 10 | `expectedReceiptDate` | Expected Receipt Date | Expected Receipt Date | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `description2` | Description 2 | Description 2 | ✅ |
| 13 | `unitOfMeasure` | Unit of Measure | Unit of Measure | ✅ |
| 14 | `quantity` | Quantity | Quantity | ✅ |
| 15 | `outstandingQuantity` | Outstanding Quantity | Outstanding Quantity | ✅ |
| 16 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | ✅ |
| 17 | `qtyToReceive` | Qty. to Receive | Qty. to Receive | ✅ |
| 18 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | ✅ |
| 19 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | ✅ |
| 20 | `vatPct` | VAT % | VAT % | ✅ |
| 21 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 22 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 23 | `amount` | Amount | Amount | ✅ |
| 24 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | ✅ |
| 25 | `unitPriceLcy` | Unit Price (LCY) | Unit Price (LCY) | ✅ |
| 26 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 27 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 28 | `netWeight` | Net Weight | Net Weight | ✅ |
| 29 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 30 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 31 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 32 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 33 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 34 | `jobNo` | Job No. | Project No. | ✅ |
| 35 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | ✅ |
| 36 | `recalculateInvoiceDisc` | Recalculate Invoice Disc. | Recalculate Invoice Disc. | ✅ |
| 37 | `outstandingAmount` | Outstanding Amount | Outstanding Amount | ✅ |
| 38 | `qtyRcdNotInvoiced` | Qty. Rcd. Not Invoiced | Qty. Rcd. Not Invoiced | ✅ |
| 39 | `amtRcdNotInvoiced` | Amt. Rcd. Not Invoiced | Amt. Rcd. Not Invoiced | ✅ |
| 40 | `quantityReceived` | Quantity Received | Quantity Received | ✅ |
| 41 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | ✅ |
| 42 | `receiptNo` | Receipt No. | Receipt No. | ✅ |
| 43 | `receiptLineNo` | Receipt Line No. | Receipt Line No. | ✅ |
| 44 | `orderNo` | Order No. | Order No. | ✅ |
| 45 | `orderLineNo` | Order Line No. | Order Line No. | ✅ |
| 46 | `profitPct` | Profit % | Profit % | ✅ |
| 47 | `payToVendorNo` | Pay-to Vendor No. | Pay-to Vendor No. | ✅ |
| 48 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | ✅ |
| 49 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | ✅ |
| 50 | `salesOrderNo` | Sales Order No. | Sales Order No. | ✅ |
| 51 | `salesOrderLineNo` | Sales Order Line No. | Sales Order Line No. | ✅ |
| 52 | `dropShipment` | Drop Shipment | Drop Shipment | ✅ |
| 53 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 54 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 55 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 56 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 57 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 58 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | ✅ |
| 59 | `entryPoint` | Entry Point | Entry Point | ✅ |
| 60 | `areaCode` | Area | Area | ✅ |
| 61 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 62 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 63 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 64 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 65 | `useTax` | Use Tax | Use Tax | ✅ |
| 66 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 67 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 68 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 69 | `outstandingAmountLcy` | Outstanding Amount (LCY) | Outstanding Amount (LCY) | ✅ |
| 70 | `amtRcdNotInvoicedLcy` | Amt. Rcd. Not Invoiced (LCY) | Amt. Rcd. Not Invoiced (LCY) | ✅ |
| 71 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 72 | `blanketOrderNo` | Blanket Order No. | Blanket Order No. | ✅ |
| 73 | `blanketOrderLineNo` | Blanket Order Line No. | Blanket Order Line No. | ✅ |
| 74 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 75 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 76 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 77 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 78 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 79 | `invDiscAmountToInvoice` | Inv. Disc. Amount to Invoice | Inv. Disc. Amount to Invoice | ✅ |
| 80 | `vatIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 81 | `icPartnerRefType` | IC Partner Ref. Type | IC Partner Ref. Type | ✅ |
| 82 | `icPartnerReference` | IC Partner Reference | IC Partner Reference | ✅ |
| 83 | `prepaymentPct` | Prepayment % | Prepayment % | ✅ |
| 84 | `prepmtLineAmount` | Prepmt. Line Amount | Prepmt. Line Amount | ✅ |
| 85 | `prepmtAmtInv` | Prepmt. Amt. Inv. | Prepmt. Amt. Inv. | ✅ |
| 86 | `prepmtAmtInclVat` | Prepmt. Amt. Incl. VAT | Prepmt. Amt. Incl. VAT | ✅ |
| 87 | `prepaymentAmount` | Prepayment Amount | Prepayment Amount | ✅ |
| 88 | `prepmtVatBaseAmt` | Prepmt. VAT Base Amt. | Prepmt. VAT Base Amt. | ✅ |
| 89 | `prepaymentVatPct` | Prepayment VAT % | Prepayment VAT % | ✅ |
| 90 | `prepmtVatCalcType` | Prepmt. VAT Calc. Type | Prepmt. VAT Calc. Type | ✅ |
| 91 | `prepaymentVatIdentifier` | Prepayment VAT Identifier | Prepayment VAT Identifier | ✅ |
| 92 | `prepaymentTaxAreaCode` | Prepayment Tax Area Code | Prepayment Tax Area Code | ✅ |
| 93 | `prepaymentTaxLiable` | Prepayment Tax Liable | Prepayment Tax Liable | ✅ |
| 94 | `prepaymentTaxGroupCode` | Prepayment Tax Group Code | Prepayment Tax Group Code | ✅ |
| 95 | `prepmtAmtToDeduct` | Prepmt Amt to Deduct | Prepmt Amt to Deduct | ✅ |
| 96 | `prepmtAmtDeducted` | Prepmt Amt Deducted | Prepmt Amt Deducted | ✅ |
| 97 | `prepaymentLine` | Prepayment Line | Prepayment Line | ✅ |
| 98 | `prepmtAmountInvInclVat` | Prepmt. Amount Inv. Incl. VAT | Prepmt. Amount Inv. Incl. VAT | ✅ |
| 99 | `prepmtAmountInvLcy` | Prepmt. Amount Inv. (LCY) | Prepmt. Amount Inv. (LCY) | ✅ |
| 100 | `icPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 101 | `prepmtVatAmountInvLcy` | Prepmt. VAT Amount Inv. (LCY) | Prepmt. VAT Amount Inv. (LCY) | ✅ |
| 102 | `prepaymentVatDifference` | Prepayment VAT Difference | Prepayment VAT Difference | ✅ |
| 103 | `prepmtVatDiffToDeduct` | Prepmt VAT Diff. to Deduct | Prepmt VAT Diff. to Deduct | ✅ |
| 104 | `prepmtVatDiffDeducted` | Prepmt VAT Diff. Deducted | Prepmt VAT Diff. Deducted | ✅ |
| 105 | `icItemReferenceNo` | IC Item Reference No. | IC Item Reference No. | ✅ |
| 106 | `outstandingAmtExVatLcy` | Outstanding Amt. Ex. VAT (LCY) | Outstanding Amt. Ex. VAT (LCY) | ✅ |
| 107 | `aRcdNotInvExVatLcy` | A. Rcd. Not Inv. Ex. VAT (LCY) | A. Rcd. Not Inv. Ex. VAT (LCY) | ✅ |
| 108 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | ✅ |
| 109 | `prepmtPmtDiscountAmount` | Prepmt. Pmt. Discount Amount | Prepmt. Pmt. Discount Amount | ✅ |
| 110 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 111 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 112 | `jobLineType` | Job Line Type | Project Line Type | ✅ |
| 113 | `jobUnitPrice` | Job Unit Price | Project Unit Price | ✅ |
| 114 | `jobTotalPrice` | Job Total Price | Project Total Price | ✅ |
| 115 | `jobLineAmount` | Job Line Amount | Project Line Amount | ✅ |
| 116 | `jobLineDiscountAmount` | Job Line Discount Amount | Project Line Discount Amount | ✅ |
| 117 | `jobLineDiscountPct` | Job Line Discount % | Project Line Discount % | ✅ |
| 118 | `jobUnitPriceLcy` | Job Unit Price (LCY) | Project Unit Price (LCY) | ✅ |
| 119 | `jobTotalPriceLcy` | Job Total Price (LCY) | Project Total Price (LCY) | ✅ |
| 120 | `jobLineAmountLcy` | Job Line Amount (LCY) | Project Line Amount (LCY) | ✅ |
| 121 | `jobLineDiscAmountLcy` | Job Line Disc. Amount (LCY) | Project Line Disc. Amount (LCY) | ✅ |
| 122 | `jobCurrencyFactor` | Job Currency Factor | Project Currency Factor | ✅ |
| 123 | `jobCurrencyCode` | Job Currency Code | Project Currency Code | ✅ |
| 124 | `jobPlanningLineNo` | Job Planning Line No. | Job Planning Line No. | ✅ |
| 125 | `jobRemainingQty` | Job Remaining Qty. | Project Remaining Qty. | ✅ |
| 126 | `jobRemainingQtyBase` | Job Remaining Qty. (Base) | Project Remaining Qty. (Base) | ✅ |
| 127 | `deferralCode` | Deferral Code | Deferral Code | ✅ |
| 128 | `returnsDeferralStartDate` | Returns Deferral Start Date | Returns Deferral Start Date | ✅ |
| 129 | `selectedAllocAccountNo` | Selected Alloc. Account No. | Allocation Account No. | ✅ |
| 130 | `allocAccModifiedByUser` | Alloc. Acc. Modified by User | Allocation Account Distributions Modified | 🧮 computed |
| 131 | `allocationAccountNo` | Allocation Account No. | Posting Allocation Account No. | ✅ |
| 132 | `allocPurchLineSystemid` | Alloc. Purch. Line SystemId | Allocation Purchase Line SystemId | ✅ |
| 133 | `variantCode` | Variant Code | Variant Code | ✅ |
| 134 | `binCode` | Bin Code | Bin Code | ✅ |
| 135 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 136 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 137 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 138 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 139 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 140 | `outstandingQtyBase` | Outstanding Qty. (Base) | Outstanding Qty. (Base) | ✅ |
| 141 | `qtyToInvoiceBase` | Qty. to Invoice (Base) | Qty. to Invoice (Base) | ✅ |
| 142 | `qtyToReceiveBase` | Qty. to Receive (Base) | Qty. to Receive (Base) | ✅ |
| 143 | `qtyRcdNotInvoicedBase` | Qty. Rcd. Not Invoiced (Base) | Qty. Rcd. Not Invoiced (Base) | ✅ |
| 144 | `qtyReceivedBase` | Qty. Received (Base) | Qty. Received (Base) | ✅ |
| 145 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | ✅ |
| 146 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 147 | `faPostingDate` | FA Posting Date | FA Posting Date | ✅ |
| 148 | `faPostingType` | FA Posting Type | FA Posting Type | ✅ |
| 149 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | ✅ |
| 150 | `salvageValue` | Salvage Value | Salvage Value | ✅ |
| 151 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | ✅ |
| 152 | `deprAcquisitionCost` | Depr. Acquisition Cost | Depr. Acquisition Cost | ✅ |
| 153 | `maintenanceCode` | Maintenance Code | Maintenance Code | ✅ |
| 154 | `insuranceNo` | Insurance No. | Insurance No. | ✅ |
| 155 | `budgetedFaNo` | Budgeted FA No. | Budgeted FA No. | ✅ |
| 156 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | ✅ |
| 157 | `useDuplicationList` | Use Duplication List | Use Duplication List | ✅ |
| 158 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 159 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 160 | `nonstock` | Nonstock | Catalog | ✅ |
| 161 | `purchasingCode` | Purchasing Code | Purchasing Code | ✅ |
| 162 | `specialOrder` | Special Order | Special Order | ✅ |
| 163 | `specialOrderSalesNo` | Special Order Sales No. | Special Order Sales No. | ✅ |
| 164 | `specialOrderSalesLineNo` | Special Order Sales Line No. | Special Order Sales Line No. | ✅ |
| 165 | `itemReferenceNo` | Item Reference No. | Item Reference No. | ✅ |
| 166 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Item Reference Unit of Measure | ✅ |
| 167 | `itemReferenceType` | Item Reference Type | Item Reference Type | ✅ |
| 168 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | ✅ |
| 169 | `whseOutstandingQtyBase` | Whse. Outstanding Qty. (Base) | Whse. Outstanding Qty. (Base) | 🧮 computed |
| 170 | `completelyReceived` | Completely Received | Completely Received | ✅ |
| 171 | `requestedReceiptDate` | Requested Receipt Date | Requested Receipt Date | ✅ |
| 172 | `promisedReceiptDate` | Promised Receipt Date | Promised Receipt Date | ✅ |
| 173 | `leadTimeCalculation` | Lead Time Calculation | Lead Time Calculation | ✅ |
| 174 | `inboundWhseHandlingTime` | Inbound Whse. Handling Time | Inbound Whse. Handling Time | ✅ |
| 175 | `plannedReceiptDate` | Planned Receipt Date | Planned Receipt Date | ✅ |
| 176 | `orderDate` | Order Date | Order Date | ✅ |
| 177 | `allowItemChargeAssignment` | Allow Item Charge Assignment | Allow Item Charge Assignment | ✅ |
| 178 | `qtyToAssign` | Qty. to Assign | Qty. to Assign | 🧮 computed |
| 179 | `qtyAssigned` | Qty. Assigned | Qty. Assigned | 🧮 computed |
| 180 | `returnQtyToShip` | Return Qty. to Ship | Return Qty. to Ship | ✅ |
| 181 | `returnQtyToShipBase` | Return Qty. to Ship (Base) | Return Qty. to Ship (Base) | ✅ |
| 182 | `returnQtyShippedNotInvd` | Return Qty. Shipped Not Invd. | Return Qty. Shipped Not Invd. | ✅ |
| 183 | `retQtyShpdNotInvdBase` | Ret. Qty. Shpd Not Invd.(Base) | Ret. Qty. Shpd Not Invd.(Base) | ✅ |
| 184 | `returnShpdNotInvd` | Return Shpd. Not Invd. | Return Shpd. Not Invd. | ✅ |
| 185 | `returnShpdNotInvdLcy` | Return Shpd. Not Invd. (LCY) | Return Shpd. Not Invd. (LCY) | ✅ |
| 186 | `returnQtyShipped` | Return Qty. Shipped | Return Qty. Shipped | ✅ |
| 187 | `returnQtyShippedBase` | Return Qty. Shipped (Base) | Return Qty. Shipped (Base) | ✅ |
| 188 | `itemChargeQtyToHandle` | Item Charge Qty. to Handle | Item Charge Qty. to Handle | 🧮 computed |
| 189 | `nonDeductibleVatPct` | Non-Deductible VAT % | Non-Deductible VAT % | ✅ |
| 190 | `nonDeductibleVatBase` | Non-Deductible VAT Base | Non-Deductible VAT Base | ✅ |
| 191 | `nonDeductibleVatAmount` | Non-Deductible VAT Amount | Non-Deductible VAT Amount | ✅ |
| 192 | `nonDeductibleVatDiff` | Non-Deductible VAT Diff. | Non-Deductible VAT Difference | ✅ |
| 193 | `prepmtNonDeductVatBase` | Prepmt. Non-Deduct. VAT Base | Prepmt.  Non-Deductible VAT Base | ✅ |
| 194 | `prepmtNonDeductVatAmount` | Prepmt. Non-Deduct. VAT Amount | Prepmt. on-Deductible VAT Amount | ✅ |
| 195 | `itemChargeHasNonDedVat` | Item Charge Has Non.Ded. VAT | Item Charge Has Non-Deductible VAT | ✅ |
| 196 | `returnShipmentNo` | Return Shipment No. | Return Shipment No. | ✅ |
| 197 | `returnShipmentLineNo` | Return Shipment Line No. | Return Shipment Line No. | ✅ |
| 198 | `returnReasonCode` | Return Reason Code | Return Reason Code | ✅ |
| 199 | `subtype` | Subtype | Subtype | ✅ |
| 200 | `copiedFromPostedDoc` | Copied From Posted Doc. | Copied From Posted Doc. | ✅ |
| 201 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 202 | `attachedDocCount` | Attached Doc Count | Attached Doc Count | 🧮 computed |
| 203 | `attachedLinesCount` | Attached Lines Count | Attached Lines Count | 🧮 computed |
| 204 | `overReceiptQuantity` | Over-Receipt Quantity | Over-Receipt Quantity | ✅ |
| 205 | `overReceiptCode` | Over-Receipt Code | Over-Receipt Code | ✅ |
| 206 | `overReceiptApprovalStatus` | Over-Receipt Approval Status | Over-Receipt Approval Status | ✅ |
| 207 | `buyFromVendorName` | Buy-from Vendor Name | Buy-from Vendor Name | 🧮 computed |
| 208 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |
| 209 | `mpsOrder` | MPS Order | MPS Order | ✅ |
| 210 | `planningFlexibility` | Planning Flexibility | Planning Flexibility | ✅ |
| 211 | `safetyLeadTime` | Safety Lead Time | Safety Lead Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfPurchaseLineDiscounts

**Description:** Purchase Line Discounts — line discount percentages by vendor, item, and other purchase pricing criteria. (Note: the classic Purchase Line Discount table is obsolete-pending in BC, superseded by Price List Line in the V16 price engine, but remains fully functional.)

| Property | Value |
|---|---|
| **Source Table** | Purchase Line Discount |
| Page ID | 90908 |
| Page Name | `ocpfPurchaseLineDiscounts` |
| Entity Set Name | `ocpfPurchaseLineDiscounts` |
| API Group | `ocpf_purchasing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 10 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `itemNo` | Item No. | Item No. | ✅ |
| 3 | `vendorNo` | Vendor No. | Vendor No. | ✅ |
| 4 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 5 | `startingDate` | Starting Date | Starting Date | ✅ |
| 6 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 7 | `minimumQuantity` | Minimum Quantity | Minimum Quantity | ✅ |
| 8 | `endingDate` | Ending Date | Ending Date | ✅ |
| 9 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 10 | `variantCode` | Variant Code | Variant Code | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfVendorInvoiceDiscounts

**Description:** Vendor Invoice Discounts — invoice discount percentages and service charges by vendor discount group and currency.

| Property | Value |
|---|---|
| **Source Table** | Vendor Invoice Disc. |
| Page ID | 90909 |
| Page Name | `ocpfVendorInvoiceDiscounts` |
| Entity Set Name | `ocpfVendorInvoiceDiscounts` |
| API Group | `ocpf_purchasing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 6 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `minimumAmount` | Minimum Amount | Minimum Amount | ✅ |
| 4 | `discountPct` | Discount % | Discount % | ✅ |
| 5 | `serviceCharge` | Service Charge | Service Charge | ✅ |
| 6 | `currencyCode` | Currency Code | Currency Code | ✅ |


[↑ Back to top](#table-of-contents)

---

## Projects & Assets

[↑ Table of Contents](#table-of-contents)

**API Group URL segment:** `ocpf_projectsAndAssets`  
**Pages:** 14 (1 editable, 13 read-only)  

### ocpfProjects

**Description:** Projects (formerly Jobs) — tracks costs, budgets, and revenue for project work.

| Property | Value |
|---|---|
| **Source Table** | Job |
| Page ID | 90910 |
| Page Name | `ocpfProjects` |
| Entity Set Name | `ocpfProjects` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 106 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | — |
| 3 | `searchDescription` | Search Description | Search Description | — |
| 4 | `description` | Description | Description | — |
| 5 | `description2` | Description 2 | Description 2 | — |
| 6 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 7 | `creationDate` | Creation Date | Creation Date | — |
| 8 | `startingDate` | Starting Date | Starting Date | — |
| 9 | `endingDate` | Ending Date | Ending Date | — |
| 10 | `status` | Status | Status | — |
| 11 | `personResponsible` | Person Responsible | Person Responsible | — |
| 12 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 13 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 14 | `jobPostingGroup` | Job Posting Group | Project Posting Group | — |
| 15 | `blocked` | Blocked | Blocked | — |
| 16 | `lastDateModified` | Last Date Modified | Last Date Modified | — |
| 17 | `comment` | Comment | Comment | 🧮 computed |
| 18 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 19 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 20 | `locationCode` | Location Code | Location Code | — |
| 21 | `binCode` | Bin Code | Bin Code | — |
| 22 | `languageCode` | Language Code | Language Code | — |
| 23 | `scheduledResQty` | Scheduled Res. Qty. | Scheduled Res. Qty. | 🧮 computed |
| 24 | `resourceFilter` | Resource Filter | Resource Filter | 🔍 filter |
| 25 | `postingDateFilter` | Posting Date Filter | Posting Date Filter | 🔍 filter |
| 26 | `resourceGrFilter` | Resource Gr. Filter | Resource Gr. Filter | 🔍 filter |
| 27 | `scheduledResGrQty` | Scheduled Res. Gr. Qty. | Scheduled Res. Gr. Qty. | 🧮 computed |
| 28 | `billToName` | Bill-to Name | Bill-to Name | — |
| 29 | `billToAddress` | Bill-to Address | Bill-to Address | — |
| 30 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | — |
| 31 | `billToCity` | Bill-to City | Bill-to City | — |
| 32 | `billToCounty` | Bill-to County | Bill-to County | — |
| 33 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | — |
| 34 | `noSeries` | No. Series | No. Series | — |
| 35 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | — |
| 36 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | — |
| 37 | `taskBillingMethod` | Task Billing Method | Task Billing Method | — |
| 38 | `reserve` | Reserve | Reserve | — |
| 39 | `image` | Image | Image | — |
| 40 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | — |
| 41 | `wipMethod` | WIP Method | WIP Method | — |
| 42 | `currencyCode` | Currency Code | Currency Code | — |
| 43 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | — |
| 44 | `billToContact` | Bill-to Contact | Bill-to Contact | — |
| 45 | `planningDateFilter` | Planning Date Filter | Planning Date Filter | 🔍 filter |
| 46 | `totalWipCostAmount` | Total WIP Cost Amount | Total WIP Cost Amount | 🧮 computed |
| 47 | `totalWipCostGLAmount` | Total WIP Cost G/L Amount | Total WIP Cost G/L Amount | 🧮 computed |
| 48 | `wipEntriesExist` | WIP Entries Exist | WIP Entries Exist | 🧮 computed |
| 49 | `wipPostingDate` | WIP Posting Date | WIP Posting Date | — |
| 50 | `wipGLPostingDate` | WIP G/L Posting Date | WIP G/L Posting Date | 🧮 computed |
| 51 | `invoiceCurrencyCode` | Invoice Currency Code | Invoice Currency Code | — |
| 52 | `exchCalculationCost` | Exch. Calculation (Cost) | Exch. Calculation (Cost) | — |
| 53 | `exchCalculationPrice` | Exch. Calculation (Price) | Exch. Calculation (Price) | — |
| 54 | `allowScheduleContractLines` | Allow Schedule/Contract Lines | Allow Budget/Billable Lines | — |
| 55 | `complete` | Complete | Complete | — |
| 56 | `recogSalesAmount` | Recog. Sales Amount | Recog. Sales Amount | 🧮 computed |
| 57 | `recogSalesGLAmount` | Recog. Sales G/L Amount | Recog. Sales G/L Amount | 🧮 computed |
| 58 | `recogCostsAmount` | Recog. Costs Amount | Recog. Costs Amount | 🧮 computed |
| 59 | `recogCostsGLAmount` | Recog. Costs G/L Amount | Recog. Costs G/L Amount | 🧮 computed |
| 60 | `totalWipSalesAmount` | Total WIP Sales Amount | Total WIP Sales Amount | 🧮 computed |
| 61 | `totalWipSalesGLAmount` | Total WIP Sales G/L Amount | Total WIP Sales G/L Amount | 🧮 computed |
| 62 | `wipCompletionCalculated` | WIP Completion Calculated | WIP Completion Calculated | 🧮 computed |
| 63 | `nextInvoiceDate` | Next Invoice Date | Next Invoice Date | 🧮 computed |
| 64 | `applyUsageLink` | Apply Usage Link | Apply Usage Link | — |
| 65 | `wipWarnings` | WIP Warnings | WIP Warnings | 🧮 computed |
| 66 | `wipPostingMethod` | WIP Posting Method | WIP Posting Method | — |
| 67 | `appliedCostsGLAmount` | Applied Costs G/L Amount | Applied Costs G/L Amount | 🧮 computed |
| 68 | `appliedSalesGLAmount` | Applied Sales G/L Amount | Applied Sales G/L Amount | 🧮 computed |
| 69 | `calcRecogSalesAmount` | Calc. Recog. Sales Amount | Calc. Recog. Sales Amount | 🧮 computed |
| 70 | `calcRecogCostsAmount` | Calc. Recog. Costs Amount | Calc. Recog. Costs Amount | 🧮 computed |
| 71 | `calcRecogSalesGLAmount` | Calc. Recog. Sales G/L Amount | Calc. Recog. Sales G/L Amount | 🧮 computed |
| 72 | `calcRecogCostsGLAmount` | Calc. Recog. Costs G/L Amount | Calc. Recog. Costs G/L Amount | 🧮 computed |
| 73 | `wipCompletionPosted` | WIP Completion Posted | WIP Completion Posted | 🧮 computed |
| 74 | `overBudget` | Over Budget | Over Budget | — |
| 75 | `projectManager` | Project Manager | Project Manager | — |
| 76 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 77 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | — |
| 78 | `sellToCustomerName2` | Sell-to Customer Name 2 | Sell-to Customer Name 2 | — |
| 79 | `sellToAddress` | Sell-to Address | Sell-to Address | — |
| 80 | `sellToAddress2` | Sell-to Address 2 | Sell-to Address 2 | — |
| 81 | `sellToCity` | Sell-to City | Sell-to City | — |
| 82 | `sellToContact` | Sell-to Contact | Sell-to Contact | — |
| 83 | `sellToPostCode` | Sell-to Post Code | Sell-to Post Code | — |
| 84 | `sellToCounty` | Sell-to County | Sell-to County | — |
| 85 | `sellToCountryRegionCode` | Sell-to Country/Region Code | Sell-to Country/Region Code | — |
| 86 | `sellToPhoneNo` | Sell-to Phone No. | Sell-to Phone No. | — |
| 87 | `sellToEMail` | Sell-to E-Mail | Email | — |
| 88 | `sellToContactNo` | Sell-to Contact No. | Sell-to Contact No. | — |
| 89 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 90 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 91 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 92 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 93 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 94 | `shipToCity` | Ship-to City | Ship-to City | — |
| 95 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 96 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 97 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 98 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 99 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 100 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 101 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 102 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 103 | `yourReference` | Your Reference | Your Reference | — |
| 104 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 105 | `costCalculationMethod` | Cost Calculation Method | Cost Calculation Method | — |
| 106 | `completelyPicked` | Completely Picked | Completely Picked | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfProjectPostingGroups

**Description:** Project posting groups — defines G/L accounts for project transactions.

| Property | Value |
|---|---|
| **Source Table** | Job Posting Group |
| Page ID | 90911 |
| Page Name | `ocpfProjectPostingGroups` |
| Entity Set Name | `ocpfProjectPostingGroups` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 17 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | — |
| 3 | `wipCostsAccount` | WIP Costs Account | WIP Costs Account | — |
| 4 | `wipAccruedCostsAccount` | WIP Accrued Costs Account | WIP Accrued Costs Account | — |
| 5 | `jobCostsAppliedAccount` | Job Costs Applied Account | Project Costs Applied Account | — |
| 6 | `jobCostsAdjustmentAccount` | Job Costs Adjustment Account | Project Costs Adjustment Account | — |
| 7 | `gLExpenseAccContract` | G/L Expense Acc. (Contract) | G/L Expense Acc. (Contract) | — |
| 8 | `jobSalesAdjustmentAccount` | Job Sales Adjustment Account | Project Sales Adjustment Account | — |
| 9 | `wipAccruedSalesAccount` | WIP Accrued Sales Account | WIP Accrued Sales Account | — |
| 10 | `wipInvoicedSalesAccount` | WIP Invoiced Sales Account | WIP Invoiced Sales Account | — |
| 11 | `jobSalesAppliedAccount` | Job Sales Applied Account | Project Sales Applied Account | — |
| 12 | `recognizedCostsAccount` | Recognized Costs Account | Recognized Costs Account | — |
| 13 | `recognizedSalesAccount` | Recognized Sales Account | Recognized Sales Account | — |
| 14 | `itemCostsAppliedAccount` | Item Costs Applied Account | Item Costs Applied Account | — |
| 15 | `resourceCostsAppliedAccount` | Resource Costs Applied Account | Resource Costs Applied Account | — |
| 16 | `gLCostsAppliedAccount` | G/L Costs Applied Account | G/L Costs Applied Account | — |
| 17 | `description` | Description | Description | — |


[↑ Back to top](#table-of-contents)

---

### ocpfProjectTasks

**Description:** Project tasks — work breakdown structure lines within a project.

| Property | Value |
|---|---|
| **Source Table** | Job Task |
| Page ID | 90912 |
| Page Name | `ocpfProjectTasks` |
| Entity Set Name | `ocpfProjectTasks` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 75 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `jobNo` | Job No. | Project No. | — |
| 3 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 4 | `description` | Description | Description | — |
| 5 | `jobTaskType` | Job Task Type | Project Task Type | — |
| 6 | `wipTotal` | WIP-Total | WIP-Total | — |
| 7 | `jobPostingGroup` | Job Posting Group | Project Posting Group | — |
| 8 | `wipMethod` | WIP Method | WIP Method | — |
| 9 | `scheduleTotalCost` | Schedule (Total Cost) | Budget (Total Cost) | 🧮 computed |
| 10 | `scheduleTotalPrice` | Schedule (Total Price) | Budget (Total Price) | 🧮 computed |
| 11 | `usageTotalCost` | Usage (Total Cost) | Actual (Total Cost) | 🧮 computed |
| 12 | `usageTotalPrice` | Usage (Total Price) | Actual (Total Price) | 🧮 computed |
| 13 | `contractTotalCost` | Contract (Total Cost) | Billable (Total Cost) | 🧮 computed |
| 14 | `contractTotalPrice` | Contract (Total Price) | Billable (Total Price) | 🧮 computed |
| 15 | `contractInvoicedPrice` | Contract (Invoiced Price) | Invoiced (Total Price) | 🧮 computed |
| 16 | `contractInvoicedCost` | Contract (Invoiced Cost) | Invoiced (Total Cost) | 🧮 computed |
| 17 | `postingDateFilter` | Posting Date Filter | Posting Date Filter | 🔍 filter |
| 18 | `planningDateFilter` | Planning Date Filter | Planning Date Filter | 🔍 filter |
| 19 | `totaling` | Totaling | Totaling | — |
| 20 | `newPage` | New Page | New Page | — |
| 21 | `noOfBlankLines` | No. of Blank Lines | No. of Blank Lines | — |
| 22 | `indentation` | Indentation | Indentation | — |
| 23 | `locationCode` | Location Code | Location Code | — |
| 24 | `binCode` | Bin Code | Bin Code | — |
| 25 | `recognizedSalesAmount` | Recognized Sales Amount | Recognized Sales Amount | — |
| 26 | `recognizedCostsAmount` | Recognized Costs Amount | Recognized Costs Amount | — |
| 27 | `languageCode` | Language Code | Language Code | — |
| 28 | `recognizedSalesGLAmount` | Recognized Sales G/L Amount | Recognized Sales G/L Amount | — |
| 29 | `recognizedCostsGLAmount` | Recognized Costs G/L Amount | Recognized Costs G/L Amount | — |
| 30 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 31 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 32 | `outstandingOrders` | Outstanding Orders | Outstanding Orders | 🧮 computed |
| 33 | `amtRcdNotInvoiced` | Amt. Rcd. Not Invoiced | Amt. Rcd. Not Invoiced | 🧮 computed |
| 34 | `remainingTotalCost` | Remaining (Total Cost) | Remaining (Total Cost) | 🧮 computed |
| 35 | `remainingTotalPrice` | Remaining (Total Price) | Remaining (Total Price) | 🧮 computed |
| 36 | `startDate` | Start Date | Start Date | 🧮 computed |
| 37 | `endDate` | End Date | End Date | 🧮 computed |
| 38 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 39 | `billToName` | Bill-to Name | Bill-to Name | — |
| 40 | `billToAddress` | Bill-to Address | Bill-to Address | — |
| 41 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | — |
| 42 | `billToCity` | Bill-to City | Bill-to City | — |
| 43 | `billToCounty` | Bill-to County | Bill-to County | — |
| 44 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | — |
| 45 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | — |
| 46 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | — |
| 47 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | — |
| 48 | `billToContact` | Bill-to Contact | Bill-to Contact | — |
| 49 | `sellToCustomerNo` | Sell-to Customer No. | Sell-to Customer No. | — |
| 50 | `sellToCustomerName` | Sell-to Customer Name | Sell-to Customer Name | — |
| 51 | `sellToCustomerName2` | Sell-to Customer Name 2 | Sell-to Customer Name 2 | — |
| 52 | `sellToAddress` | Sell-to Address | Sell-to Address | — |
| 53 | `sellToAddress2` | Sell-to Address 2 | Sell-to Address 2 | — |
| 54 | `sellToCity` | Sell-to City | Sell-to City | — |
| 55 | `sellToContact` | Sell-to Contact | Sell-to Contact | — |
| 56 | `sellToPostCode` | Sell-to Post Code | Sell-to Post Code | — |
| 57 | `sellToCounty` | Sell-to County | Sell-to County | — |
| 58 | `sellToCountryRegionCode` | Sell-to Country/Region Code | Sell-to Country/Region Code | — |
| 59 | `sellToContactNo` | Sell-to Contact No. | Sell-to Contact No. | — |
| 60 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 61 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 62 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 63 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 64 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 65 | `shipToCity` | Ship-to City | Ship-to City | — |
| 66 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 67 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 68 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 69 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 70 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 71 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 72 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 73 | `yourReference` | Your Reference | Your Reference | — |
| 74 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 75 | `invoiceCurrencyCode` | Invoice Currency Code | Invoice Currency Code | — |


[↑ Back to top](#table-of-contents)

---

### ocpfProjectPlanningLines

**Description:** Project planning lines — budget and schedule lines for a project task.

| Property | Value |
|---|---|
| **Source Table** | Job Planning Line |
| Page ID | 90913 |
| Page Name | `ocpfProjectPlanningLines` |
| Entity Set Name | `ocpfProjectPlanningLines` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 102 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `lineNo` | Line No. | Line No. | — |
| 3 | `jobNo` | Job No. | Project No. | — |
| 4 | `planningDate` | Planning Date | Planning Date | — |
| 5 | `documentNo` | Document No. | Document No. | — |
| 6 | `type` | Type | Type | — |
| 7 | `no` | No. | No. | — |
| 8 | `description` | Description | Description | — |
| 9 | `quantity` | Quantity | Quantity | — |
| 10 | `directUnitCostLcy` | Direct Unit Cost (LCY) | Direct Unit Cost (LCY) | — |
| 11 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 12 | `totalCostLcy` | Total Cost (LCY) | Total Cost (LCY) | — |
| 13 | `unitPriceLcy` | Unit Price (LCY) | Unit Price (LCY) | — |
| 14 | `totalPriceLcy` | Total Price (LCY) | Total Price (LCY) | — |
| 15 | `resourceGroupNo` | Resource Group No. | Resource Group No. | — |
| 16 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 17 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | — |
| 18 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | — |
| 19 | `locationCode` | Location Code | Location Code | — |
| 20 | `lastDateModified` | Last Date Modified | Last Date Modified | — |
| 21 | `userId` | User ID | User ID | — |
| 22 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 23 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 24 | `countryRegionCode` | Country/Region Code | Country/Region Code | — |
| 25 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 26 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 27 | `documentDate` | Document Date | Document Date | — |
| 28 | `planningDueDate` | Planning Due Date | Planning Due Date | — |
| 29 | `qtyToAssemble` | Qty. to Assemble | Qty. to Assemble | — |
| 30 | `qtyToAssembleBase` | Qty. to Assemble (Base) | Qty. to Assemble (Base) | — |
| 31 | `assembleToOrder` | Assemble to Order | Assemble to Order | — |
| 32 | `bomItemNo` | BOM Item No. | BOM Item No. | — |
| 33 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 34 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 35 | `lineAmountLcy` | Line Amount (LCY) | Line Amount (LCY) | — |
| 36 | `unitCost` | Unit Cost | Unit Cost | — |
| 37 | `totalCost` | Total Cost | Total Cost | — |
| 38 | `unitPrice` | Unit Price | Unit Price | — |
| 39 | `totalPrice` | Total Price | Total Price | — |
| 40 | `lineAmount` | Line Amount | Line Amount | — |
| 41 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | — |
| 42 | `lineDiscountAmountLcy` | Line Discount Amount (LCY) | Line Discount Amount (LCY) | — |
| 43 | `costFactor` | Cost Factor | Cost Factor | — |
| 44 | `serialNo` | Serial No. | Serial No. | — |
| 45 | `lotNo` | Lot No. | Lot No. | — |
| 46 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 47 | `lineType` | Line Type | Line Type | — |
| 48 | `currencyCode` | Currency Code | Currency Code | — |
| 49 | `currencyDate` | Currency Date | Currency Date | — |
| 50 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 51 | `scheduleLine` | Schedule Line | Budget Line | — |
| 52 | `contractLine` | Contract Line | Billable Line | — |
| 53 | `jobContractEntryNo` | Job Contract Entry No. | Project Contract Entry No. | — |
| 54 | `invoicedAmountLcy` | Invoiced Amount (LCY) | Invoiced Amount (LCY) | 🧮 computed |
| 55 | `invoicedCostAmountLcy` | Invoiced Cost Amount (LCY) | Invoiced Cost Amount (LCY) | 🧮 computed |
| 56 | `vatUnitPrice` | VAT Unit Price | VAT Unit Price | — |
| 57 | `vatLineDiscountAmount` | VAT Line Discount Amount | VAT Line Discount Amount | — |
| 58 | `vatLineAmount` | VAT Line Amount | VAT Line Amount | — |
| 59 | `vatPct` | VAT % | VAT % | — |
| 60 | `description2` | Description 2 | Description 2 | — |
| 61 | `jobLedgerEntryNo` | Job Ledger Entry No. | Project Ledger Entry No. | — |
| 62 | `status` | Status | Status | — |
| 63 | `ledgerEntryType` | Ledger Entry Type | Ledger Entry Type | — |
| 64 | `ledgerEntryNo` | Ledger Entry No. | Ledger Entry No. | — |
| 65 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | — |
| 66 | `usageLink` | Usage Link | Usage Link | — |
| 67 | `remainingQty` | Remaining Qty. | Remaining Qty. | — |
| 68 | `remainingQtyBase` | Remaining Qty. (Base) | Remaining Qty. (Base) | — |
| 69 | `remainingTotalCost` | Remaining Total Cost | Remaining Total Cost | — |
| 70 | `remainingTotalCostLcy` | Remaining Total Cost (LCY) | Remaining Total Cost (LCY) | — |
| 71 | `remainingLineAmount` | Remaining Line Amount | Remaining Line Amount | — |
| 72 | `remainingLineAmountLcy` | Remaining Line Amount (LCY) | Remaining Line Amount (LCY) | — |
| 73 | `qtyPosted` | Qty. Posted | Qty. Posted | — |
| 74 | `qtyToTransferToJournal` | Qty. to Transfer to Journal | Qty. to Transfer to Journal | — |
| 75 | `postedTotalCost` | Posted Total Cost | Posted Total Cost | — |
| 76 | `postedTotalCostLcy` | Posted Total Cost (LCY) | Posted Total Cost (LCY) | — |
| 77 | `postedLineAmount` | Posted Line Amount | Posted Line Amount | — |
| 78 | `postedLineAmountLcy` | Posted Line Amount (LCY) | Posted Line Amount (LCY) | — |
| 79 | `qtyTransferredToInvoice` | Qty. Transferred to Invoice | Qty. Transferred to Invoice | 🧮 computed |
| 80 | `qtyToTransferToInvoice` | Qty. to Transfer to Invoice | Qty. to Transfer to Invoice | — |
| 81 | `qtyInvoiced` | Qty. Invoiced | Qty. Invoiced | 🧮 computed |
| 82 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | — |
| 83 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 84 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 85 | `reserve` | Reserve | Reserve | — |
| 86 | `planned` | Planned | Planned | — |
| 87 | `variantCode` | Variant Code | Variant Code | — |
| 88 | `binCode` | Bin Code | Bin Code | — |
| 89 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 90 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 91 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | — |
| 92 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | — |
| 93 | `plannedDeliveryDate` | Planned Delivery Date | Planned Delivery Date | — |
| 94 | `packageNo` | Package No. | Package No. | — |
| 95 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 96 | `costCalculationMethod` | Cost Calculation Method | Cost Calculation Method | — |
| 97 | `pickQty` | Pick Qty. | Pick Qty. | 🧮 computed |
| 98 | `qtyPicked` | Qty. Picked | Qty. Picked | — |
| 99 | `qtyPickedBase` | Qty. Picked (Base) | Qty. Picked (Base) | — |
| 100 | `completelyPicked` | Completely Picked | Completely Picked | — |
| 101 | `pickQtyBase` | Pick Qty. (Base) | Pick Qty. (Base) | 🧮 computed |
| 102 | `qtyOnJournal` | Qty. on Journal | Qty. on Journal | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfProjectLedgerEntries

**Description:** Project ledger entries — posted usage and billing transactions for projects.

| Property | Value |
|---|---|
| **Source Table** | Job Ledger Entry |
| Page ID | 90914 |
| Page Name | `ocpfProjectLedgerEntries` |
| Entity Set Name | `ocpfProjectLedgerEntries` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 82 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `jobNo` | Job No. | Project No. | — |
| 4 | `postingDate` | Posting Date | Posting Date | — |
| 5 | `documentNo` | Document No. | Document No. | — |
| 6 | `type` | Type | Type | — |
| 7 | `no` | No. | No. | — |
| 8 | `description` | Description | Description | — |
| 9 | `quantity` | Quantity | Quantity | — |
| 10 | `directUnitCostLcy` | Direct Unit Cost (LCY) | Direct Unit Cost (LCY) | — |
| 11 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 12 | `totalCostLcy` | Total Cost (LCY) | Total Cost (LCY) | — |
| 13 | `unitPriceLcy` | Unit Price (LCY) | Unit Price (LCY) | — |
| 14 | `totalPriceLcy` | Total Price (LCY) | Total Price (LCY) | — |
| 15 | `resourceGroupNo` | Resource Group No. | Resource Group No. | — |
| 16 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 17 | `jobRegisterNo` | Job Register No. | Job Register No. | — |
| 18 | `locationCode` | Location Code | Location Code | — |
| 19 | `jobPostingGroup` | Job Posting Group | Posting Group | — |
| 20 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 21 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 22 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 23 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 24 | `userId` | User ID | User ID | — |
| 25 | `sourceCode` | Source Code | Source Code | — |
| 26 | `shptMethodCode` | Shpt. Method Code | Shpt. Method Code | — |
| 27 | `amtToPostToGL` | Amt. to Post to G/L | Amt. to Post to G/L | — |
| 28 | `amtPostedToGL` | Amt. Posted to G/L | Amt. Posted to G/L | — |
| 29 | `entryType` | Entry Type | Entry Type | — |
| 30 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 31 | `reasonCode` | Reason Code | Reason Code | — |
| 32 | `transactionType` | Transaction Type | Transaction Type | — |
| 33 | `transportMethod` | Transport Method | Transport Method | — |
| 34 | `countryRegionCode` | Country/Region Code | Country/Region Code | — |
| 35 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 36 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 37 | `entryExitPoint` | Entry/Exit Point | Entry/Exit Point | — |
| 38 | `documentDate` | Document Date | Document Date | — |
| 39 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 40 | `areaCode` | Area | Area | — |
| 41 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 42 | `noSeries` | No. Series | No. Series | — |
| 43 | `additionalCurrencyTotalCost` | Additional-Currency Total Cost | Additional-Currency Total Cost | — |
| 44 | `addCurrencyTotalPrice` | Add.-Currency Total Price | Add.-Currency Total Price | — |
| 45 | `addCurrencyLineAmount` | Add.-Currency Line Amount | Add.-Currency Line Amount | — |
| 46 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 47 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 48 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 49 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 50 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 51 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 52 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |
| 53 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 54 | `lineAmountLcy` | Line Amount (LCY) | Line Amount (LCY) | — |
| 55 | `unitCost` | Unit Cost | Unit Cost | — |
| 56 | `totalCost` | Total Cost | Total Cost | — |
| 57 | `unitPrice` | Unit Price | Unit Price | — |
| 58 | `totalPrice` | Total Price | Total Price | — |
| 59 | `lineAmount` | Line Amount | Line Amount | — |
| 60 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | — |
| 61 | `lineDiscountAmountLcy` | Line Discount Amount (LCY) | Line Discount Amount (LCY) | — |
| 62 | `currencyCode` | Currency Code | Currency Code | — |
| 63 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 64 | `description2` | Description 2 | Description 2 | — |
| 65 | `ledgerEntryType` | Ledger Entry Type | Ledger Entry Type | — |
| 66 | `ledgerEntryNo` | Ledger Entry No. | Ledger Entry No. | — |
| 67 | `serialNo` | Serial No. | Serial No. | — |
| 68 | `lotNo` | Lot No. | Lot No. | — |
| 69 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 70 | `lineType` | Line Type | Line Type | — |
| 71 | `originalUnitCostLcy` | Original Unit Cost (LCY) | Original Unit Cost (LCY) | — |
| 72 | `originalTotalCostLcy` | Original Total Cost (LCY) | Original Total Cost (LCY) | — |
| 73 | `originalUnitCost` | Original Unit Cost | Original Unit Cost | — |
| 74 | `originalTotalCost` | Original Total Cost | Original Total Cost | — |
| 75 | `originalTotalCostAcy` | Original Total Cost (ACY) | Original Total Cost (ACY) | — |
| 76 | `adjusted` | Adjusted | Adjusted | — |
| 77 | `datetimeAdjusted` | DateTime Adjusted | DateTime Adjusted | — |
| 78 | `variantCode` | Variant Code | Variant Code | — |
| 79 | `binCode` | Bin Code | Bin Code | — |
| 80 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 81 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 82 | `packageNo` | Package No. | Package No. | — |


[↑ Back to top](#table-of-contents)

---

### ocpfFixedAssets

**Description:** Fixed assets — capital assets tracked for depreciation and disposal.

| Property | Value |
|---|---|
| **Source Table** | Fixed Asset |
| Page ID | 90915 |
| Page Name | `ocpfFixedAssets` |
| Entity Set Name | `ocpfFixedAssets` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 33 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | — |
| 3 | `description` | Description | Description | — |
| 4 | `searchDescription` | Search Description | Search Description | — |
| 5 | `description2` | Description 2 | Description 2 | — |
| 6 | `faClassCode` | FA Class Code | FA Class Code | — |
| 7 | `faSubclassCode` | FA Subclass Code | FA Subclass Code | — |
| 8 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 9 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 10 | `locationCode` | Location Code | Location Code | — |
| 11 | `faLocationCode` | FA Location Code | FA Location Code | — |
| 12 | `vendorNo` | Vendor No. | Vendor No. | — |
| 13 | `mainAssetComponent` | Main Asset/Component | Main Asset/Component | — |
| 14 | `componentOfMainAsset` | Component of Main Asset | Component of Main Asset | — |
| 15 | `budgetedAsset` | Budgeted Asset | Budgeted Asset | — |
| 16 | `warrantyDate` | Warranty Date | Warranty Date | — |
| 17 | `responsibleEmployee` | Responsible Employee | Responsible Employee | — |
| 18 | `serialNo` | Serial No. | Serial No. | — |
| 19 | `lastDateModified` | Last Date Modified | Last Date Modified | — |
| 20 | `insured` | Insured | Insured | 🧮 computed |
| 21 | `comment` | Comment | Comment | 🧮 computed |
| 22 | `blocked` | Blocked | Blocked | — |
| 23 | `maintenanceVendorNo` | Maintenance Vendor No. | Maintenance Vendor No. | — |
| 24 | `underMaintenance` | Under Maintenance | Under Maintenance | — |
| 25 | `nextServiceDate` | Next Service Date | Next Service Date | — |
| 26 | `inactive` | Inactive | Inactive | — |
| 27 | `faPostingDateFilter` | FA Posting Date Filter | FA Posting Date Filter | 🔍 filter |
| 28 | `noSeries` | No. Series | No. Series | — |
| 29 | `faPostingGroup` | FA Posting Group | FA Posting Group | — |
| 30 | `acquired` | Acquired | Acquired | 🧮 computed |
| 31 | `image` | Image | Image | — |
| 32 | `faLocationId` | FA Location Id | FA Location Id | — |
| 33 | `responsibleEmployeeId` | Responsible Employee Id | Responsible Employee | — |


[↑ Back to top](#table-of-contents)

---

### ocpfFaPostingGroups

**Description:** Fixed asset posting groups — G/L account mapping for FA transactions.

| Property | Value |
|---|---|
| **Source Table** | FA Posting Group |
| Page ID | 90916 |
| Page Name | `ocpfFaPostingGroups` |
| Entity Set Name | `ocpfFaPostingGroups` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 45 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | — |
| 3 | `acquisitionCostAccount` | Acquisition Cost Account | Acquisition Cost Account | — |
| 4 | `accumDepreciationAccount` | Accum. Depreciation Account | Accum. Depreciation Account | — |
| 5 | `writeDownAccount` | Write-Down Account | Write-Down Account | — |
| 6 | `appreciationAccount` | Appreciation Account | Appreciation Account | — |
| 7 | `custom1Account` | Custom 1 Account | Custom 1 Account | — |
| 8 | `custom2Account` | Custom 2 Account | Custom 2 Account | — |
| 9 | `acqCostAccOnDisposal` | Acq. Cost Acc. on Disposal | Acq. Cost Acc. on Disposal | — |
| 10 | `accumDeprAccOnDisposal` | Accum. Depr. Acc. on Disposal | Accum. Depr. Acc. on Disposal | — |
| 11 | `writeDownAccOnDisposal` | Write-Down Acc. on Disposal | Write-Down Acc. on Disposal | — |
| 12 | `appreciationAccOnDisposal` | Appreciation Acc. on Disposal | Appreciation Acc. on Disposal | — |
| 13 | `custom1AccountOnDisposal` | Custom 1 Account on Disposal | Custom 1 Account on Disposal | — |
| 14 | `custom2AccountOnDisposal` | Custom 2 Account on Disposal | Custom 2 Account on Disposal | — |
| 15 | `gainsAccOnDisposal` | Gains Acc. on Disposal | Gains Acc. on Disposal | — |
| 16 | `lossesAccOnDisposal` | Losses Acc. on Disposal | Losses Acc. on Disposal | — |
| 17 | `bookValAccOnDispGain` | Book Val. Acc. on Disp. (Gain) | Book Val. Acc. on Disp. (Gain) | — |
| 18 | `salesAccOnDispGain` | Sales Acc. on Disp. (Gain) | Sales Acc. on Disp. (Gain) | — |
| 19 | `writeDownBalAccOnDisp` | Write-Down Bal. Acc. on Disp. | Write-Down Bal. Acc. on Disp. | — |
| 20 | `apprecBalAccOnDisp` | Apprec. Bal. Acc. on Disp. | Apprec. Bal. Acc. on Disp. | — |
| 21 | `custom1BalAccOnDisposal` | Custom 1 Bal. Acc. on Disposal | Custom 1 Bal. Acc. on Disposal | — |
| 22 | `custom2BalAccOnDisposal` | Custom 2 Bal. Acc. on Disposal | Custom 2 Bal. Acc. on Disposal | — |
| 23 | `maintenanceExpenseAccount` | Maintenance Expense Account | Maintenance Expense Account | — |
| 24 | `maintenanceBalAcc` | Maintenance Bal. Acc. | Maintenance Bal. Acc. | — |
| 25 | `acquisitionCostBalAcc` | Acquisition Cost Bal. Acc. | Acquisition Cost Bal. Acc. | — |
| 26 | `depreciationExpenseAcc` | Depreciation Expense Acc. | Depreciation Expense Acc. | — |
| 27 | `writeDownExpenseAcc` | Write-Down Expense Acc. | Write-Down Expense Acc. | — |
| 28 | `appreciationBalAccount` | Appreciation Bal. Account | Appreciation Bal. Account | — |
| 29 | `custom1ExpenseAcc` | Custom 1 Expense Acc. | Custom 1 Expense Acc. | — |
| 30 | `custom2ExpenseAcc` | Custom 2 Expense Acc. | Custom 2 Expense Acc. | — |
| 31 | `salesBalAcc` | Sales Bal. Acc. | Sales Bal. Acc. | — |
| 32 | `allocatedAcquisitionCostPct` | Allocated Acquisition Cost % | Allocated Acquisition Cost % | 🧮 computed |
| 33 | `allocatedDepreciationPct` | Allocated Depreciation % | Allocated Depreciation % | 🧮 computed |
| 34 | `allocatedWriteDownPct` | Allocated Write-Down % | Allocated Write-Down % | 🧮 computed |
| 35 | `allocatedAppreciationPct` | Allocated Appreciation % | Allocated Appreciation % | 🧮 computed |
| 36 | `allocatedCustom1Pct` | Allocated Custom 1 % | Allocated Custom 1 % | 🧮 computed |
| 37 | `allocatedCustom2Pct` | Allocated Custom 2 % | Allocated Custom 2 % | 🧮 computed |
| 38 | `allocatedSalesPricePct` | Allocated Sales Price % | Allocated Sales Price % | 🧮 computed |
| 39 | `allocatedMaintenancePct` | Allocated Maintenance % | Allocated Maintenance % | 🧮 computed |
| 40 | `allocatedGainPct` | Allocated Gain % | Allocated Gain % | 🧮 computed |
| 41 | `allocatedLossPct` | Allocated Loss % | Allocated Loss % | 🧮 computed |
| 42 | `allocatedBookValuePctGain` | Allocated Book Value % (Gain) | Allocated Book Value % (Gain) | 🧮 computed |
| 43 | `allocatedBookValuePctLoss` | Allocated Book Value % (Loss) | Allocated Book Value % (Loss) | 🧮 computed |
| 44 | `salesAccOnDispLoss` | Sales Acc. on Disp. (Loss) | Sales Acc. on Disp. (Loss) | — |
| 45 | `bookValAccOnDispLoss` | Book Val. Acc. on Disp. (Loss) | Book Val. Acc. on Disp. (Loss) | — |


[↑ Back to top](#table-of-contents)

---

### ocpfFaLedgerEntries

**Description:** Fixed asset ledger entries — posted FA acquisition, depreciation, and disposal.

| Property | Value |
|---|---|
| **Source Table** | FA Ledger Entry |
| Page ID | 90917 |
| Page Name | `ocpfFaLedgerEntries` |
| Entity Set Name | `ocpfFaLedgerEntries` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 82 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `gLEntryNo` | G/L Entry No. | G/L Entry No. | — |
| 4 | `faNo` | FA No. | FA No. | — |
| 5 | `faPostingDate` | FA Posting Date | FA Posting Date | — |
| 6 | `postingDate` | Posting Date | Posting Date | — |
| 7 | `documentType` | Document Type | Document Type | — |
| 8 | `documentDate` | Document Date | Document Date | — |
| 9 | `documentNo` | Document No. | Document No. | — |
| 10 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 11 | `description` | Description | Description | — |
| 12 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | — |
| 13 | `faPostingCategory` | FA Posting Category | FA Posting Category | — |
| 14 | `faPostingType` | FA Posting Type | FA Posting Type | — |
| 15 | `amount` | Amount | Amount | — |
| 16 | `debitAmount` | Debit Amount | Debit Amount | — |
| 17 | `creditAmount` | Credit Amount | Credit Amount | — |
| 18 | `reclassificationEntry` | Reclassification Entry | Reclassification Entry | — |
| 19 | `partOfBookValue` | Part of Book Value | Part of Book Value | — |
| 20 | `partOfDepreciableBasis` | Part of Depreciable Basis | Part of Depreciable Basis | — |
| 21 | `disposalCalculationMethod` | Disposal Calculation Method | Disposal Calculation Method | — |
| 22 | `disposalEntryNo` | Disposal Entry No. | Disposal Entry No. | — |
| 23 | `noOfDepreciationDays` | No. of Depreciation Days | No. of Depreciation Days | — |
| 24 | `quantity` | Quantity | Quantity | — |
| 25 | `faNoBudgetedFaNo` | FA No./Budgeted FA No. | FA No./Budgeted FA No. | — |
| 26 | `faSubclassCode` | FA Subclass Code | FA Subclass Code | — |
| 27 | `faLocationCode` | FA Location Code | FA Location Code | — |
| 28 | `faPostingGroup` | FA Posting Group | FA Posting Group | — |
| 29 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 30 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 31 | `locationCode` | Location Code | Location Code | — |
| 32 | `userId` | User ID | User ID | — |
| 33 | `depreciationMethod` | Depreciation Method | Depreciation Method | — |
| 34 | `depreciationStartingDate` | Depreciation Starting Date | Depreciation Starting Date | — |
| 35 | `straightLinePct` | Straight-Line % | Straight-Line % | — |
| 36 | `noOfDepreciationYears` | No. of Depreciation Years | No. of Depreciation Years | — |
| 37 | `fixedDeprAmount` | Fixed Depr. Amount | Fixed Depr. Amount | — |
| 38 | `decliningBalancePct` | Declining-Balance % | Declining-Balance % | — |
| 39 | `depreciationTableCode` | Depreciation Table Code | Depreciation Table Code | — |
| 40 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 41 | `sourceCode` | Source Code | Source Code | — |
| 42 | `reasonCode` | Reason Code | Reason Code | — |
| 43 | `transactionNo` | Transaction No. | Transaction No. | — |
| 44 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 45 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 46 | `vatAmount` | VAT Amount | VAT Amount | — |
| 47 | `genPostingType` | Gen. Posting Type | Gen. Posting Type | — |
| 48 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 49 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 50 | `faClassCode` | FA Class Code | FA Class Code | — |
| 51 | `faExchangeRate` | FA Exchange Rate | FA Exchange Rate | — |
| 52 | `amountLcy` | Amount (LCY) | Amount (LCY) | — |
| 53 | `resultOnDisposal` | Result on Disposal | Result on Disposal | — |
| 54 | `correction` | Correction | Correction | — |
| 55 | `indexEntry` | Index Entry | Index Entry | — |
| 56 | `canceledFromFaNo` | Canceled from FA No. | Canceled from FA No. | — |
| 57 | `depreciationEndingDate` | Depreciation Ending Date | Depreciation Ending Date | — |
| 58 | `useFaLedgerCheck` | Use FA Ledger Check | Use FA Ledger Check | — |
| 59 | `automaticEntry` | Automatic Entry | Automatic Entry | — |
| 60 | `deprStartingDateCustom1` | Depr. Starting Date (Custom 1) | Depr. Starting Date (Custom 1) | — |
| 61 | `deprEndingDateCustom1` | Depr. Ending Date (Custom 1) | Depr. Ending Date (Custom 1) | — |
| 62 | `accumDeprPctCustom1` | Accum. Depr. % (Custom 1) | Accum. Depr. % (Custom 1) | — |
| 63 | `deprPctThisYearCustom1` | Depr. % this year (Custom 1) | Depr. % this year (Custom 1) | — |
| 64 | `propertyClassCustom1` | Property Class (Custom 1) | Property Class (Custom 1) | — |
| 65 | `noSeries` | No. Series | No. Series | — |
| 66 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 67 | `taxLiable` | Tax Liable | Tax Liable | — |
| 68 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 69 | `useTax` | Use Tax | Use Tax | — |
| 70 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 71 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 72 | `reversed` | Reversed | Reversed | — |
| 73 | `reversedByEntryNo` | Reversed by Entry No. | Reversed by Entry No. | — |
| 74 | `reversedEntryNo` | Reversed Entry No. | Reversed Entry No. | — |
| 75 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 76 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 77 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 78 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 79 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 80 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 81 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |
| 82 | `nonDedVatFaCost` | Non-Ded. VAT FA Cost | Non-Deductible VAT FA Cost | — |


[↑ Back to top](#table-of-contents)

---

### ocpfFaDepreciationBooks

**Description:** Fixed asset depreciation books — depreciation method and schedule per asset.

| Property | Value |
|---|---|
| **Source Table** | FA Depreciation Book |
| Page ID | 90918 |
| Page Name | `ocpfFaDepreciationBooks` |
| Entity Set Name | `ocpfFaDepreciationBooks` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 64 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `faNo` | FA No. | FA No. | — |
| 3 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | — |
| 4 | `depreciationMethod` | Depreciation Method | Depreciation Method | — |
| 5 | `depreciationStartingDate` | Depreciation Starting Date | Depreciation Starting Date | — |
| 6 | `straightLinePct` | Straight-Line % | Straight-Line % | — |
| 7 | `noOfDepreciationYears` | No. of Depreciation Years | No. of Depreciation Years | — |
| 8 | `noOfDepreciationMonths` | No. of Depreciation Months | No. of Depreciation Months | — |
| 9 | `fixedDeprAmount` | Fixed Depr. Amount | Fixed Depr. Amount | — |
| 10 | `decliningBalancePct` | Declining-Balance % | Declining-Balance % | — |
| 11 | `depreciationTableCode` | Depreciation Table Code | Depreciation Table Code | — |
| 12 | `finalRoundingAmount` | Final Rounding Amount | Final Rounding Amount | — |
| 13 | `endingBookValue` | Ending Book Value | Ending Book Value | — |
| 14 | `faPostingGroup` | FA Posting Group | FA Posting Group | — |
| 15 | `depreciationEndingDate` | Depreciation Ending Date | Depreciation Ending Date | — |
| 16 | `acquisitionCost` | Acquisition Cost | Acquisition Cost | 🧮 computed |
| 17 | `depreciation` | Depreciation | Depreciation | 🧮 computed |
| 18 | `bookValue` | Book Value | Book Value | 🧮 computed |
| 19 | `proceedsOnDisposal` | Proceeds on Disposal | Proceeds on Disposal | 🧮 computed |
| 20 | `gainLoss` | Gain/Loss | Gain/Loss | 🧮 computed |
| 21 | `writeDown` | Write-Down | Write-Down | 🧮 computed |
| 22 | `appreciation` | Appreciation | Appreciation | 🧮 computed |
| 23 | `custom1` | Custom 1 | Custom 1 | 🧮 computed |
| 24 | `custom2` | Custom 2 | Custom 2 | 🧮 computed |
| 25 | `depreciableBasis` | Depreciable Basis | Depreciable Basis | 🧮 computed |
| 26 | `salvageValue` | Salvage Value | Salvage Value | 🧮 computed |
| 27 | `bookValueOnDisposal` | Book Value on Disposal | Book Value on Disposal | 🧮 computed |
| 28 | `maintenance` | Maintenance | Maintenance | 🧮 computed |
| 29 | `maintenanceCodeFilter` | Maintenance Code Filter | Maintenance Code Filter | 🔍 filter |
| 30 | `faPostingDateFilter` | FA Posting Date Filter | FA Posting Date Filter | 🔍 filter |
| 31 | `acquisitionDate` | Acquisition Date | Acquisition Date | — |
| 32 | `gLAcquisitionDate` | G/L Acquisition Date | G/L Acquisition Date | — |
| 33 | `disposalDate` | Disposal Date | Disposal Date | — |
| 34 | `lastAcquisitionCostDate` | Last Acquisition Cost Date | Last Acquisition Cost Date | — |
| 35 | `lastDepreciationDate` | Last Depreciation Date | Last Depreciation Date | — |
| 36 | `lastWriteDownDate` | Last Write-Down Date | Last Write-Down Date | — |
| 37 | `lastAppreciationDate` | Last Appreciation Date | Last Appreciation Date | — |
| 38 | `lastCustom1Date` | Last Custom 1 Date | Last Custom 1 Date | — |
| 39 | `lastCustom2Date` | Last Custom 2 Date | Last Custom 2 Date | — |
| 40 | `lastSalvageValueDate` | Last Salvage Value Date | Last Salvage Value Date | — |
| 41 | `faExchangeRate` | FA Exchange Rate | FA Exchange Rate | — |
| 42 | `fixedDeprAmountBelowZero` | Fixed Depr. Amount below Zero | Fixed Depr. Amount below Zero | — |
| 43 | `lastDateModified` | Last Date Modified | Last Date Modified | — |
| 44 | `firstUserDefinedDeprDate` | First User-Defined Depr. Date | First User-Defined Depr. Date | — |
| 45 | `useFaLedgerCheck` | Use FA Ledger Check | Use FA Ledger Check | — |
| 46 | `lastMaintenanceDate` | Last Maintenance Date | Last Maintenance Date | — |
| 47 | `deprBelowZeroPct` | Depr. below Zero % | Depr. below Zero % | — |
| 48 | `projectedDisposalDate` | Projected Disposal Date | Projected Disposal Date | — |
| 49 | `projectedProceedsOnDisposal` | Projected Proceeds on Disposal | Projected Proceeds on Disposal | — |
| 50 | `deprStartingDateCustom1` | Depr. Starting Date (Custom 1) | Depr. Starting Date (Custom 1) | — |
| 51 | `deprEndingDateCustom1` | Depr. Ending Date (Custom 1) | Depr. Ending Date (Custom 1) | — |
| 52 | `accumDeprPctCustom1` | Accum. Depr. % (Custom 1) | Accum. Depr. % (Custom 1) | — |
| 53 | `deprThisYearPctCustom1` | Depr. This Year % (Custom 1) | Depr. This Year % (Custom 1) | — |
| 54 | `propertyClassCustom1` | Property Class (Custom 1) | Property Class (Custom 1) | — |
| 55 | `description` | Description | Description | — |
| 56 | `mainAssetComponent` | Main Asset/Component | Main Asset/Component | — |
| 57 | `componentOfMainAsset` | Component of Main Asset | Component of Main Asset | — |
| 58 | `faAddCurrencyFactor` | FA Add.-Currency Factor | FA Add.-Currency Factor | — |
| 59 | `useHalfYearConvention` | Use Half-Year Convention | Use Half-Year Convention | — |
| 60 | `useDbPctFirstFiscalYear` | Use DB% First Fiscal Year | Use DB% First Fiscal Year | — |
| 61 | `tempEndingDate` | Temp. Ending Date | Temp. Ending Date | — |
| 62 | `tempFixedDeprAmount` | Temp. Fixed Depr. Amount | Temp. Fixed Depr. Amount | — |
| 63 | `ignoreDefEndingBookValue` | Ignore Def. Ending Book Value | Ignore Def. Ending Book Value | — |
| 64 | `defaultFaDepreciationBook` | Default FA Depreciation Book | Default FA Depreciation Book | — |


[↑ Back to top](#table-of-contents)

---

### ocpfGeneralJournalTemplates

**Description:** General journal templates — named journal templates controlling posting behavior.

| Property | Value |
|---|---|
| **Source Table** | Gen. Journal Template |
| Page ID | 90919 |
| Page Name | `ocpfGeneralJournalTemplates` |
| Entity Set Name | `ocpfGeneralJournalTemplates` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 30 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `name` | Name | Name | — |
| 3 | `description` | Description | Description | — |
| 4 | `testReportId` | Test Report ID | Test Report ID | — |
| 5 | `pageId` | Page ID | Page ID | — |
| 6 | `postingReportId` | Posting Report ID | Posting Report ID | — |
| 7 | `forcePostingReport` | Force Posting Report | Force Posting Report | — |
| 8 | `type` | Type | Type | — |
| 9 | `sourceCode` | Source Code | Source Code | — |
| 10 | `reasonCode` | Reason Code | Reason Code | — |
| 11 | `recurring` | Recurring | Recurring | — |
| 12 | `testReportCaption` | Test Report Caption | Test Report Caption | 🧮 computed |
| 13 | `pageCaption` | Page Caption | Page Caption | 🧮 computed |
| 14 | `postingReportCaption` | Posting Report Caption | Posting Report Caption | 🧮 computed |
| 15 | `forceDocBalance` | Force Doc. Balance | Force Doc. Balance | — |
| 16 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 17 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 18 | `noSeries` | No. Series | No. Series | — |
| 19 | `postingNoSeries` | Posting No. Series | Posting No. Series | — |
| 20 | `copyVatSetupToJnlLines` | Copy VAT Setup to Jnl. Lines | Copy VAT Setup to Jnl. Lines | — |
| 21 | `allowVatDifference` | Allow VAT Difference | Allow VAT Difference | — |
| 22 | `custReceiptReportId` | Cust. Receipt Report ID | Cust. Receipt Report ID | — |
| 23 | `custReceiptReportCaption` | Cust. Receipt Report Caption | Cust. Receipt Report Caption | 🧮 computed |
| 24 | `vendorReceiptReportId` | Vendor Receipt Report ID | Vendor Receipt Report ID | — |
| 25 | `vendorReceiptReportCaption` | Vendor Receipt Report Caption | Vendor Receipt Report Caption | 🧮 computed |
| 26 | `incrementBatchName` | Increment Batch Name | Increment Batch Name | — |
| 27 | `copyToPostedJnlLines` | Copy to Posted Jnl. Lines | Copy to Posted Jnl. Lines | — |
| 28 | `allowPostingDateFrom` | Allow Posting Date From | Allow Posting Date From | — |
| 29 | `allowPostingDateTo` | Allow Posting Date To | Allow Posting Date To | — |
| 30 | `unlinkIncDocOnPosting` | Unlink Inc. Doc On Posting | Unlink Incoming Documents On Posting | — |


[↑ Back to top](#table-of-contents)

---

### ocpfGeneralJournalBatches

**Description:** General journal batches — named batches within a journal template.

| Property | Value |
|---|---|
| **Source Table** | Gen. Journal Batch |
| Page ID | 90920 |
| Page Name | `ocpfGeneralJournalBatches` |
| Entity Set Name | `ocpfGeneralJournalBatches` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 20 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `journalTemplateName` | Journal Template Name | Journal Template Name | — |
| 3 | `name` | Name | Name | — |
| 4 | `description` | Description | Description | — |
| 5 | `reasonCode` | Reason Code | Reason Code | — |
| 6 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 7 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 8 | `noSeries` | No. Series | No. Series | — |
| 9 | `postingNoSeries` | Posting No. Series | Posting No. Series | — |
| 10 | `copyVatSetupToJnlLines` | Copy VAT Setup to Jnl. Lines | Copy VAT Setup to Jnl. Lines | — |
| 11 | `allowVatDifference` | Allow VAT Difference | Allow VAT Difference | — |
| 12 | `allowPaymentExport` | Allow Payment Export | Allow Payment Export | — |
| 13 | `bankStatementImportFormat` | Bank Statement Import Format | Bank Statement Import Format | — |
| 14 | `templateType` | Template Type | Template Type | 🧮 computed |
| 15 | `recurring` | Recurring | Recurring | 🧮 computed |
| 16 | `suggestBalancingAmount` | Suggest Balancing Amount | Suggest Balancing Amount | — |
| 17 | `pendingApproval` | Pending Approval | Pending Approval | — |
| 18 | `copyToPostedJnlLines` | Copy to Posted Jnl. Lines | Copy to Posted Jnl. Lines | — |
| 19 | `lastModifiedDatetime` | Last Modified DateTime | Last Modified DateTime | — |
| 20 | `balaccountid` | BalAccountId | BalAccountId | — |


[↑ Back to top](#table-of-contents)

---

### ocpfGeneralJournalLines

**Description:** General journal lines — unposted journal lines ready for review and posting.

| Property | Value |
|---|---|
| **Source Table** | Gen. Journal Line |
| Page ID | 90921 |
| Page Name | `ocpfGeneralJournalLines` |
| Entity Set Name | `ocpfGeneralJournalLines` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 213 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `journalTemplateName` | Journal Template Name | Journal Template Name | ✅ |
| 3 | `lineNo` | Line No. | Line No. | ✅ |
| 4 | `accountType` | Account Type | Account Type | ✅ |
| 5 | `accountNo` | Account No. | Account No. | ✅ |
| 6 | `postingDate` | Posting Date | Posting Date | ✅ |
| 7 | `documentType` | Document Type | Document Type | ✅ |
| 8 | `documentNo` | Document No. | Document No. | ✅ |
| 9 | `description` | Description | Description | ✅ |
| 10 | `vatPct` | VAT % | VAT % | ✅ |
| 11 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 12 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 13 | `amount` | Amount | Amount | ✅ |
| 14 | `debitAmount` | Debit Amount | Debit Amount | ✅ |
| 15 | `creditAmount` | Credit Amount | Credit Amount | ✅ |
| 16 | `amountLcy` | Amount (LCY) | Amount (LCY) | ✅ |
| 17 | `balanceLcy` | Balance (LCY) | Balance (LCY) | ✅ |
| 18 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 19 | `salesPurchLcy` | Sales/Purch. (LCY) | Sales/Purch. (LCY) | ✅ |
| 20 | `profitLcy` | Profit (LCY) | Profit (LCY) | ✅ |
| 21 | `invDiscountLcy` | Inv. Discount (LCY) | Inv. Discount (LCY) | ✅ |
| 22 | `billToPayToNo` | Bill-to/Pay-to No. | Bill-to/Pay-to No. | ✅ |
| 23 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 24 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 25 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 26 | `salespersPurchCode` | Salespers./Purch. Code | Salespers./Purch. Code | ✅ |
| 27 | `pendingApproval` | Pending Approval | Pending Approval | ✅ |
| 28 | `sourceCode` | Source Code | Source Code | ✅ |
| 29 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 30 | `yourReference` | Your Reference | Your Reference | ✅ |
| 31 | `onHold` | On Hold | On Hold | ✅ |
| 32 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 33 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 34 | `dueDate` | Due Date | Due Date | ✅ |
| 35 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 36 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 37 | `jobNo` | Job No. | Project No. | ✅ |
| 38 | `quantity` | Quantity | Quantity | ✅ |
| 39 | `vatAmount` | VAT Amount | VAT Amount | ✅ |
| 40 | `vatPosting` | VAT Posting | VAT Posting | ✅ |
| 41 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 42 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 43 | `businessUnitCode` | Business Unit Code | Business Unit Code | ✅ |
| 44 | `journalBatchName` | Journal Batch Name | Journal Batch Name | ✅ |
| 45 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 46 | `recurringMethod` | Recurring Method | Recurring Method | ✅ |
| 47 | `expirationDate` | Expiration Date | Expiration Date | ✅ |
| 48 | `recurringFrequency` | Recurring Frequency | Recurring Frequency | ✅ |
| 49 | `allocatedAmtLcy` | Allocated Amt. (LCY) | Allocated Amt. (LCY) | 🧮 computed |
| 50 | `genPostingType` | Gen. Posting Type | Gen. Posting Type | ✅ |
| 51 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 52 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 53 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 54 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | ✅ |
| 55 | `allowApplication` | Allow Application | Allow Application | ✅ |
| 56 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 57 | `balGenPostingType` | Bal. Gen. Posting Type | Bal. Gen. Posting Type | ✅ |
| 58 | `balGenBusPostingGroup` | Bal. Gen. Bus. Posting Group | Bal. Gen. Bus. Posting Group | ✅ |
| 59 | `balGenProdPostingGroup` | Bal. Gen. Prod. Posting Group | Bal. Gen. Prod. Posting Group | ✅ |
| 60 | `balVatCalculationType` | Bal. VAT Calculation Type | Bal. VAT Calculation Type | ✅ |
| 61 | `balVatPct` | Bal. VAT % | Bal. VAT % | ✅ |
| 62 | `balVatAmount` | Bal. VAT Amount | Bal. VAT Amount | ✅ |
| 63 | `bankPaymentType` | Bank Payment Type | Bank Payment Type | ✅ |
| 64 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 65 | `balVatBaseAmount` | Bal. VAT Base Amount | Bal. VAT Base Amount | ✅ |
| 66 | `correction` | Correction | Correction | ✅ |
| 67 | `printPostedDocuments` | Print Posted Documents | Print Posted Documents | ✅ |
| 68 | `checkPrinted` | Check Printed | Check Printed | ✅ |
| 69 | `documentDate` | Document Date | Document Date | ✅ |
| 70 | `externalDocumentNo` | External Document No. | External Document No. | ✅ |
| 71 | `sourceType` | Source Type | Source Type | ✅ |
| 72 | `sourceNo` | Source No. | Source No. | ✅ |
| 73 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 74 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 75 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 76 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 77 | `useTax` | Use Tax | Use Tax | ✅ |
| 78 | `balTaxAreaCode` | Bal. Tax Area Code | Bal. Tax Area Code | ✅ |
| 79 | `balTaxLiable` | Bal. Tax Liable | Bal. Tax Liable | ✅ |
| 80 | `balTaxGroupCode` | Bal. Tax Group Code | Bal. Tax Group Code | ✅ |
| 81 | `balUseTax` | Bal. Use Tax | Bal. Use Tax | ✅ |
| 82 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 83 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 84 | `balVatBusPostingGroup` | Bal. VAT Bus. Posting Group | Bal. VAT Bus. Posting Group | ✅ |
| 85 | `balVatProdPostingGroup` | Bal. VAT Prod. Posting Group | Bal. VAT Prod. Posting Group | ✅ |
| 86 | `additionalCurrencyPosting` | Additional-Currency Posting | Additional-Currency Posting | ✅ |
| 87 | `faAddCurrencyFactor` | FA Add.-Currency Factor | FA Add.-Currency Factor | ✅ |
| 88 | `sourceCurrencyCode` | Source Currency Code | Source Currency Code | ✅ |
| 89 | `sourceCurrencyAmount` | Source Currency Amount | Source Currency Amount | ✅ |
| 90 | `sourceCurrVatBaseAmount` | Source Curr. VAT Base Amount | Source Curr. VAT Base Amount | ✅ |
| 91 | `sourceCurrVatAmount` | Source Curr. VAT Amount | Source Curr. VAT Amount | ✅ |
| 92 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 93 | `vatAmountLcy` | VAT Amount (LCY) | VAT Amount (LCY) | ✅ |
| 94 | `vatBaseAmountLcy` | VAT Base Amount (LCY) | VAT Base Amount (LCY) | ✅ |
| 95 | `balVatAmountLcy` | Bal. VAT Amount (LCY) | Bal. VAT Amount (LCY) | ✅ |
| 96 | `balVatBaseAmountLcy` | Bal. VAT Base Amount (LCY) | Bal. VAT Base Amount (LCY) | ✅ |
| 97 | `reversingEntry` | Reversing Entry | Reversing Entry | ✅ |
| 98 | `allowZeroAmountPosting` | Allow Zero-Amount Posting | Allow Zero-Amount Posting | ✅ |
| 99 | `shipToOrderAddressCode` | Ship-to/Order Address Code | Ship-to/Order Address Code | ✅ |
| 100 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 101 | `balVatDifference` | Bal. VAT Difference | Bal. VAT Difference | ✅ |
| 102 | `icPartnerCode` | IC Partner Code | IC Partner Code | ✅ |
| 103 | `icDirection` | IC Direction | IC Direction | ✅ |
| 104 | `icPartnerTransactionNo` | IC Partner Transaction No. | IC Partner Transaction No. | ✅ |
| 105 | `sellToBuyFromNo` | Sell-to/Buy-from No. | Sell-to/Buy-from No. | ✅ |
| 106 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 107 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 108 | `prepayment` | Prepayment | Prepayment | ✅ |
| 109 | `financialVoid` | Financial Void | Financial Void | ✅ |
| 110 | `copyVatSetupToJnlLines` | Copy VAT Setup to Jnl. Lines | Copy VAT Setup to Jnl. Lines | ✅ |
| 111 | `vatBaseBeforePmtDisc` | VAT Base Before Pmt. Disc. | VAT Base Before Pmt. Disc. | ✅ |
| 112 | `origPmtDiscPossible` | Orig. Pmt. Disc. Possible | Original Pmt. Disc. Possible | ✅ |
| 113 | `origPmtDiscPossibleLcy` | Orig. Pmt. Disc. Possible(LCY) | Orig. Pmt. Disc. Possible (LCY) | ✅ |
| 114 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 115 | `zeroSrcCurrAmount` | Zero Src. Curr. Amount | Zero Source Currency Amount | ✅ |
| 116 | `icAccountType` | IC Account Type | IC Account Type | ✅ |
| 117 | `icAccountNo` | IC Account No. | IC Account No. | ✅ |
| 118 | `jobQueueStatus` | Job Queue Status | Job Queue Status | ✅ |
| 119 | `jobQueueEntryId` | Job Queue Entry ID | Job Queue Entry ID | ✅ |
| 120 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 121 | `creditorNo` | Creditor No. | Creditor No. | ✅ |
| 122 | `paymentReference` | Payment Reference | Payment Reference | ✅ |
| 123 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 124 | `appliesToExtDocNo` | Applies-to Ext. Doc. No. | Applies-to Ext. Doc. No. | ✅ |
| 125 | `invoiceReceivedDate` | Invoice Received Date | Invoice Received Date | ✅ |
| 126 | `keepDescription` | Keep Description | Keep Description | ✅ |
| 127 | `recipientBankAccount` | Recipient Bank Account | Recipient Bank Account | ✅ |
| 128 | `messageToRecipient` | Message to Recipient | Message to Recipient | ✅ |
| 129 | `exportedToPaymentFile` | Exported to Payment File | Exported to Payment File | ✅ |
| 130 | `hasPaymentExportError` | Has Payment Export Error | Has Payment Export Error | 🧮 computed |
| 131 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 132 | `remitToCode` | Remit-to Code | Remit-to Code | ✅ |
| 133 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 134 | `jobUnitPriceLcy` | Job Unit Price (LCY) | Project Unit Price (LCY) | ✅ |
| 135 | `jobTotalPriceLcy` | Job Total Price (LCY) | Project Total Price (LCY) | ✅ |
| 136 | `jobQuantity` | Job Quantity | Project Quantity | ✅ |
| 137 | `jobUnitCostLcy` | Job Unit Cost (LCY) | Project Unit Cost (LCY) | ✅ |
| 138 | `jobLineDiscountPct` | Job Line Discount % | Project Line Discount % | ✅ |
| 139 | `jobLineDiscAmountLcy` | Job Line Disc. Amount (LCY) | Project Line Disc. Amount (LCY) | ✅ |
| 140 | `jobUnitOfMeasureCode` | Job Unit Of Measure Code | Project Unit Of Measure Code | ✅ |
| 141 | `jobLineType` | Job Line Type | Project Line Type | ✅ |
| 142 | `jobUnitPrice` | Job Unit Price | Project Unit Price | ✅ |
| 143 | `jobTotalPrice` | Job Total Price | Project Total Price | ✅ |
| 144 | `jobUnitCost` | Job Unit Cost | Project Unit Cost | ✅ |
| 145 | `jobTotalCost` | Job Total Cost | Project Total Cost | ✅ |
| 146 | `jobLineDiscountAmount` | Job Line Discount Amount | Project Line Discount Amount | ✅ |
| 147 | `jobLineAmount` | Job Line Amount | Project Line Amount | ✅ |
| 148 | `jobTotalCostLcy` | Job Total Cost (LCY) | Project Total Cost (LCY) | ✅ |
| 149 | `jobLineAmountLcy` | Job Line Amount (LCY) | Project Line Amount (LCY) | ✅ |
| 150 | `jobCurrencyFactor` | Job Currency Factor | Project Currency Factor | ✅ |
| 151 | `jobCurrencyCode` | Job Currency Code | Project Currency Code | ✅ |
| 152 | `jobPlanningLineNo` | Job Planning Line No. | Project Planning Line No. | ✅ |
| 153 | `jobRemainingQty` | Job Remaining Qty. | Project Remaining Qty. | ✅ |
| 154 | `directDebitMandateId` | Direct Debit Mandate ID | Direct Debit Mandate ID | ✅ |
| 155 | `dataExchEntryNo` | Data Exch. Entry No. | Data Exch. Entry No. | ✅ |
| 156 | `payerInformation` | Payer Information | Payer Information | ✅ |
| 157 | `transactionInformation` | Transaction Information | Transaction Information | ✅ |
| 158 | `dataExchLineNo` | Data Exch. Line No. | Data Exch. Line No. | ✅ |
| 159 | `appliedAutomatically` | Applied Automatically | Applied Automatically | ✅ |
| 160 | `linkedTableId` | Linked Table ID | Linked Table ID | ✅ |
| 161 | `linkedSystemId` | Linked System ID | Linked System ID | ✅ |
| 162 | `deferralCode` | Deferral Code | Deferral Code | ✅ |
| 163 | `deferralLineNo` | Deferral Line No. | Deferral Line No. | ✅ |
| 164 | `selectedAllocAccountNo` | Selected Alloc. Account No. | Allocation Account No. | ✅ |
| 165 | `allocAccModifiedByUser` | Alloc. Acc. Modified by User | Allocation Account Distributions Modified | 🧮 computed |
| 166 | `allocationAccountNo` | Allocation Account No. | Posting Allocation Account No. | ✅ |
| 167 | `allocJournalLineSystemid` | Alloc. Journal Line SystemId | Allocation Journal Line SystemId | ✅ |
| 168 | `campaignNo` | Campaign No. | Campaign No. | ✅ |
| 169 | `prodOrderNo` | Prod. Order No. | Prod. Order No. | ✅ |
| 170 | `faPostingDate` | FA Posting Date | FA Posting Date | ✅ |
| 171 | `faPostingType` | FA Posting Type | FA Posting Type | ✅ |
| 172 | `depreciationBookCode` | Depreciation Book Code | Depreciation Book Code | ✅ |
| 173 | `salvageValue` | Salvage Value | Salvage Value | ✅ |
| 174 | `noOfDepreciationDays` | No. of Depreciation Days | No. of Depreciation Days | ✅ |
| 175 | `deprUntilFaPostingDate` | Depr. until FA Posting Date | Depr. until FA Posting Date | ✅ |
| 176 | `deprAcquisitionCost` | Depr. Acquisition Cost | Depr. Acquisition Cost | ✅ |
| 177 | `maintenanceCode` | Maintenance Code | Maintenance Code | ✅ |
| 178 | `insuranceNo` | Insurance No. | Insurance No. | ✅ |
| 179 | `budgetedFaNo` | Budgeted FA No. | Budgeted FA No. | ✅ |
| 180 | `duplicateInDepreciationBook` | Duplicate in Depreciation Book | Duplicate in Depreciation Book | ✅ |
| 181 | `useDuplicationList` | Use Duplication List | Use Duplication List | ✅ |
| 182 | `faReclassificationEntry` | FA Reclassification Entry | FA Reclassification Entry | ✅ |
| 183 | `faErrorEntryNo` | FA Error Entry No. | FA Error Entry No. | ✅ |
| 184 | `indexEntry` | Index Entry | Index Entry | ✅ |
| 185 | `sourceLineNo` | Source Line No. | Source Line No. | ✅ |
| 186 | `comment` | Comment | Comment | ✅ |
| 187 | `checkExported` | Check Exported | Check Exported | ✅ |
| 188 | `checkTransmitted` | Check Transmitted | Check Transmitted | ✅ |
| 189 | `reverseDateCalculation` | Reverse Date Calculation | Reverse Date Calculation | ✅ |
| 190 | `nonDeductibleVatPct` | Non-Deductible VAT % | Non-Deductible VAT % | ✅ |
| 191 | `nonDeductibleVatBase` | Non-Deductible VAT Base | Non-Deductible VAT Base | ✅ |
| 192 | `nonDeductibleVatAmount` | Non-Deductible VAT Amount | Non-Deductible VAT Amount | ✅ |
| 193 | `nonDeductibleVatBaseLcy` | Non-Deductible VAT Base LCY | Non-Deductible VAT Base LCY | ✅ |
| 194 | `nonDeductibleVatAmountLcy` | Non-Deductible VAT Amount LCY | Non-Deductible VAT Amount LCY | ✅ |
| 195 | `nonDeductibleVatBaseAcy` | Non-Deductible VAT Base ACY | Non-Deductible VAT Base ACY | ✅ |
| 196 | `nonDeductibleVatAmountAcy` | Non-Deductible VAT Amount ACY | Non-Deductible VAT Amount ACY | ✅ |
| 197 | `faGLAccountNo` | FA G/L Account No. | FA G/L Account No. | ✅ |
| 198 | `nonDeductibleVatDiff` | Non-Deductible VAT Diff. | Non-Deductible VAT Difference | ✅ |
| 199 | `balNonDedVatPct` | Bal. Non-Ded. VAT % | Bal. Non-Deductible VAT % | ✅ |
| 200 | `balNonDedVatBase` | Bal. Non-Ded. VAT Base | Bal. Non-Deductible VAT Base | ✅ |
| 201 | `balNonDedVatAmount` | Bal. Non-Ded. VAT Amount | Bal. Non-Deductible VAT Amount | ✅ |
| 202 | `balNonDedVatBaseLcy` | Bal. Non-Ded. VAT Base LCY | Bal. Non-Deductible VAT Base LCY | ✅ |
| 203 | `balNonDedVatAmountLcy` | Bal. Non-Ded. VAT Amount LCY | Bal. Non-Deductible VAT Amount LCY | ✅ |
| 204 | `nonDedVatFaCost` | Non-Ded. VAT FA Cost | Non-Ded. VAT FA Cost | ✅ |
| 205 | `accountId` | Account Id | Account Id | ✅ |
| 206 | `customerId` | Customer Id | Customer Id | ✅ |
| 207 | `appliesToInvoiceId` | Applies-to Invoice Id | Applies-to Invoice Id | ✅ |
| 208 | `contactGraphId` | Contact Graph Id | Contact Graph Id | ✅ |
| 209 | `lastModifiedDatetime` | Last Modified DateTime | Last Modified DateTime | ✅ |
| 210 | `journalBatchId` | Journal Batch Id | Journal Batch Id | ✅ |
| 211 | `paymentMethodId` | Payment Method Id | Payment Method Id | ✅ |
| 212 | `balanceAccountId` | Balance Account Id | Balance Account Id | ✅ |
| 213 | `vendorId` | Vendor Id | Vendor Id | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfPriceListHeaders

**Description:** Price list headers — named price lists with effectivity dates and assignment scope.

| Property | Value |
|---|---|
| **Source Table** | Price List Header |
| Page ID | 90922 |
| Page Name | `ocpfPriceListHeaders` |
| Entity Set Name | `ocpfPriceListHeaders` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 23 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | — |
| 3 | `description` | Description | Description | — |
| 4 | `sourceGroup` | Source Group | Assign-to Group | — |
| 5 | `sourceType` | Source Type | Assign-to Type | — |
| 6 | `sourceNo` | Source No. | Assign-to No. (custom) | — |
| 7 | `parentSourceNo` | Parent Source No. | Assign-to Parent No. (projects) | — |
| 8 | `sourceId` | Source ID | Assign-to ID | — |
| 9 | `priceType` | Price Type | Price Type | — |
| 10 | `amountType` | Amount Type | Defines | — |
| 11 | `currencyCode` | Currency Code | Currency Code | — |
| 12 | `startingDate` | Starting Date | Starting Date | — |
| 13 | `endingDate` | Ending Date | Ending Date | — |
| 14 | `priceIncludesVat` | Price Includes VAT | Price Includes VAT | — |
| 15 | `vatBusPostingGrPrice` | VAT Bus. Posting Gr. (Price) | VAT Bus. Posting Gr. (Price) | — |
| 16 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 17 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 18 | `noSeries` | No. Series | No. Series | — |
| 19 | `status` | Status | Status | — |
| 20 | `filterSourceNo` | Filter Source No. | Filter Source No. | — |
| 21 | `allowUpdatingDefaults` | Allow Updating Defaults | Allow Updating Defaults | — |
| 22 | `assignToNo` | Assign-to No. | Assign-to No. | — |
| 23 | `assignToParentNo` | Assign-to Parent No. | Assign-to Parent No. | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPriceListLines

**Description:** Price list lines — individual price or discount rules within a price list.

| Property | Value |
|---|---|
| **Source Table** | Price List Line |
| Page ID | 90923 |
| Page Name | `ocpfPriceListLines` |
| Entity Set Name | `ocpfPriceListLines` |
| API Group | `ocpf_projectsAndAssets` |
| Editable | ❌ No (GET only) |
| Field Count | 38 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `priceListCode` | Price List Code | Price List Code | — |
| 3 | `lineNo` | Line No. | Line No. | — |
| 4 | `sourceType` | Source Type | Assign-to Type | — |
| 5 | `sourceNo` | Source No. | Assign-to No. (custom) | — |
| 6 | `parentSourceNo` | Parent Source No. | Assign-to Parent No. (custom) | — |
| 7 | `sourceId` | Source ID | Assign-to ID | — |
| 8 | `assetType` | Asset Type | Product Type | — |
| 9 | `assetNo` | Asset No. | Product No. (custom) | — |
| 10 | `variantCode` | Variant Code | Variant Code (custom) | — |
| 11 | `currencyCode` | Currency Code | Currency Code | — |
| 12 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 13 | `startingDate` | Starting Date | Starting Date | — |
| 14 | `endingDate` | Ending Date | Ending Date | — |
| 15 | `minimumQuantity` | Minimum Quantity | Minimum Quantity | — |
| 16 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code (custom) | — |
| 17 | `amountType` | Amount Type | Defines | — |
| 18 | `unitPrice` | Unit Price | Unit Price | — |
| 19 | `costFactor` | Cost Factor | Cost Factor | — |
| 20 | `unitCost` | Unit Cost | Unit Cost | — |
| 21 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 22 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 23 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 24 | `priceIncludesVat` | Price Includes VAT | Price Includes VAT | — |
| 25 | `vatBusPostingGrPrice` | VAT Bus. Posting Gr. (Price) | VAT Bus. Posting Gr. (Price) | — |
| 26 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 27 | `assetId` | Asset ID | Asset ID | — |
| 28 | `lineAmount` | Line Amount | Line Amount | — |
| 29 | `priceType` | Price Type | Price Type | — |
| 30 | `description` | Description | Description | — |
| 31 | `status` | Status | Price Status | — |
| 32 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | — |
| 33 | `sourceGroup` | Source Group | Source Group | — |
| 34 | `productNo` | Product No. | Product No. | — |
| 35 | `assignToNo` | Assign-to No. | Assign-to No. | — |
| 36 | `assignToParentNo` | Assign-to Parent No. | Assign-to Parent No. | — |
| 37 | `variantCodeLookup` | Variant Code Lookup | Variant Code | — |
| 38 | `unitOfMeasureCodeLookup` | Unit of Measure Code Lookup | Unit of Measure Code | — |


[↑ Back to top](#table-of-contents)

---

## System & Setup

[↑ Table of Contents](#table-of-contents)

**API Group URL segment:** `ocpf_systemAndSetup`  
**Pages:** 9 (0 editable, 9 read-only)  

### ocpfDocumentAttachments

**Description:** Document attachments — files and links attached to any BC record.

| Property | Value |
|---|---|
| **Source Table** | Document Attachment |
| Page ID | 90930 |
| Page Name | `ocpfDocumentAttachments` |
| Entity Set Name | `ocpfDocumentAttachments` |
| API Group | `ocpf_systemAndSetup` |
| Editable | ❌ No (GET only) |
| Field Count | 18 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `id` | ID | ID | — |
| 3 | `tableId` | Table ID | Table ID | — |
| 4 | `no` | No. | No. | — |
| 5 | `attachedDate` | Attached Date | Attached Date | — |
| 6 | `fileName` | File Name | Attachment | — |
| 7 | `fileType` | File Type | File Type | — |
| 8 | `fileExtension` | File Extension | File Extension | — |
| 9 | `documentReferenceId` | Document Reference ID | Document Reference ID | — |
| 10 | `attachedBy` | Attached By | Attached By | — |
| 11 | `user` | User | User | 🧮 computed |
| 12 | `documentFlowPurchase` | Document Flow Purchase | Flow to Purch. Trx | — |
| 13 | `documentFlowSales` | Document Flow Sales | Flow to Sales Trx | — |
| 14 | `documentType` | Document Type | Document Type | — |
| 15 | `lineNo` | Line No. | Line No. | — |
| 16 | `vatReportConfigCode` | VAT Report Config. Code | VAT Report Config. Code | — |
| 17 | `documentFlowService` | Document Flow Service | Flow to Service Trx | — |
| 18 | `documentFlowProduction` | Document Flow Production | Flow to Production Trx | — |


[↑ Back to top](#table-of-contents)

---

### ocpfCompanyInformation

**Description:** Company information — name, address, registration, and contact details for this company.

| Property | Value |
|---|---|
| **Source Table** | Company Information |
| Page ID | 90931 |
| Page Name | `ocpfCompanyInformation` |
| Entity Set Name | `ocpfCompanyInformation` |
| API Group | `ocpf_systemAndSetup` |
| Editable | ❌ No (GET only) |
| Field Count | 60 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `primaryKey` | Primary Key | Primary Key | — |
| 3 | `name` | Name | Name | — |
| 4 | `name2` | Name 2 | Name 2 | — |
| 5 | `address` | Address | Address | — |
| 6 | `address2` | Address 2 | Address 2 | — |
| 7 | `city` | City | City | — |
| 8 | `phoneNo` | Phone No. | Phone No. | — |
| 9 | `phoneNo2` | Phone No. 2 | Phone No. 2 | — |
| 10 | `telexNo` | Telex No. | Telex No. | — |
| 11 | `faxNo` | Fax No. | Fax No. | — |
| 12 | `giroNo` | Giro No. | Giro No. | — |
| 13 | `bankName` | Bank Name | Bank Name | — |
| 14 | `bankBranchNo` | Bank Branch No. | Bank Branch No. | — |
| 15 | `bankAccountNo` | Bank Account No. | Bank Account No. | — |
| 16 | `paymentRoutingNo` | Payment Routing No. | Payment Routing No. | — |
| 17 | `customsPermitNo` | Customs Permit No. | Customs Permit No. | — |
| 18 | `customsPermitDate` | Customs Permit Date | Customs Permit Date | — |
| 19 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 20 | `registrationNo` | Registration No. | Registration No. | — |
| 21 | `telexAnswerBack` | Telex Answer Back | Telex Answer Back | — |
| 22 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 23 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 24 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 25 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 26 | `shipToCity` | Ship-to City | Ship-to City | — |
| 27 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 28 | `locationCode` | Location Code | Location Code | — |
| 29 | `postCode` | Post Code | Post Code | — |
| 30 | `county` | County | County | — |
| 31 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 32 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 33 | `eMail` | E-Mail | Email | — |
| 34 | `homePage` | Home Page | Home Page | — |
| 35 | `countryRegionCode` | Country/Region Code | Country/Region Code | — |
| 36 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 37 | `iban` | IBAN | IBAN | — |
| 38 | `swiftCode` | SWIFT Code | SWIFT Code | — |
| 39 | `industrialClassification` | Industrial Classification | Industrial Classification | — |
| 40 | `systemIndicator` | System Indicator | System Indicator | — |
| 41 | `customSystemIndicatorText` | Custom System Indicator Text | Custom System Indicator Text | — |
| 42 | `systemIndicatorStyle` | System Indicator Style | System Indicator Style | — |
| 43 | `allowBlankPaymentInfo` | Allow Blank Payment Info. | Allow Blank Payment Info. | — |
| 44 | `contactPerson` | Contact Person | Contact Person | — |
| 45 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | — |
| 46 | `gln` | GLN | GLN | — |
| 47 | `eoriNumber` | EORI Number | EORI Number | — |
| 48 | `useGlnInElectronicDocument` | Use GLN in Electronic Document | Use GLN in Electronic Documents | — |
| 49 | `pictureLastModDateTime` | Picture - Last Mod. Date Time | Picture - Last Mod. Date Time | — |
| 50 | `lastModifiedDateTime` | Last Modified Date Time | Last Modified Date Time | — |
| 51 | `createdDatetime` | Created DateTime | Created DateTime | — |
| 52 | `demoCompany` | Demo Company | Demo Company | — |
| 53 | `alternativeLanguageCode` | Alternative Language Code | Alternative Language Code | — |
| 54 | `brandColorValue` | Brand Color Value | Brand Color Value | — |
| 55 | `brandColorCode` | Brand Color Code | Brand Color Code | — |
| 56 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 57 | `checkAvailPeriodCalc` | Check-Avail. Period Calc. | Check-Avail. Period Calc. | — |
| 58 | `checkAvailTimeBucket` | Check-Avail. Time Bucket | Check-Avail. Time Bucket | — |
| 59 | `baseCalendarCode` | Base Calendar Code | Base Calendar Code | — |
| 60 | `calConvergenceTimeFrame` | Cal. Convergence Time Frame | Cal. Convergence Time Frame | — |


[↑ Back to top](#table-of-contents)

---

### ocpfWarehouseEntries

**Description:** Warehouse entries — posted inventory movements through warehouse locations.

| Property | Value |
|---|---|
| **Source Table** | Warehouse Entry |
| Page ID | 90932 |
| Page Name | `ocpfWarehouseEntries` |
| Entity Set Name | `ocpfWarehouseEntries` |
| API Group | `ocpf_systemAndSetup` |
| Editable | ❌ No (GET only) |
| Field Count | 45 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `journalBatchName` | Journal Batch Name | Journal Batch Name | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `registeringDate` | Registering Date | Registering Date | — |
| 6 | `locationCode` | Location Code | Location Code | — |
| 7 | `zoneCode` | Zone Code | Zone Code | — |
| 8 | `binCode` | Bin Code | Bin Code | — |
| 9 | `description` | Description | Description | — |
| 10 | `itemNo` | Item No. | Item No. | — |
| 11 | `quantity` | Quantity | Quantity | — |
| 12 | `qtyBase` | Qty. (Base) | Qty. (Base) | — |
| 13 | `warehouseRegisterNo` | Warehouse Register No. | Warehouse Register No. | — |
| 14 | `siftBucketNo` | SIFT Bucket No. | SIFT Bucket No. | — |
| 15 | `sourceType` | Source Type | Source Type | — |
| 16 | `sourceSubtype` | Source Subtype | Source Subtype | — |
| 17 | `sourceNo` | Source No. | Source No. | — |
| 18 | `sourceLineNo` | Source Line No. | Source Line No. | — |
| 19 | `sourceSublineNo` | Source Subline No. | Source Subline No. | — |
| 20 | `sourceDocument` | Source Document | Source Document | — |
| 21 | `sourceCode` | Source Code | Source Code | — |
| 22 | `reasonCode` | Reason Code | Reason Code | — |
| 23 | `noSeries` | No. Series | No. Series | — |
| 24 | `binTypeCode` | Bin Type Code | Bin Type Code | — |
| 25 | `cubage` | Cubage | Cubage | — |
| 26 | `weight` | Weight | Weight | — |
| 27 | `journalTemplateName` | Journal Template Name | Journal Template Name | — |
| 28 | `whseDocumentNo` | Whse. Document No. | Whse. Document No. | — |
| 29 | `whseDocumentType` | Whse. Document Type | Whse. Document Type | — |
| 30 | `whseDocumentLineNo` | Whse. Document Line No. | Whse. Document Line No. | — |
| 31 | `entryType` | Entry Type | Entry Type | — |
| 32 | `referenceDocument` | Reference Document | Reference Document | — |
| 33 | `referenceNo` | Reference No. | Reference No. | — |
| 34 | `userId` | User ID | User ID | — |
| 35 | `variantCode` | Variant Code | Variant Code | — |
| 36 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 37 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 38 | `serialNo` | Serial No. | Serial No. | — |
| 39 | `lotNo` | Lot No. | Lot No. | — |
| 40 | `warrantyDate` | Warranty Date | Warranty Date | — |
| 41 | `expirationDate` | Expiration Date | Expiration Date | — |
| 42 | `packageNo` | Package No. | Package No. | — |
| 43 | `physInvtCountingPeriodCode` | Phys Invt Counting Period Code | Phys Invt Counting Period Code | — |
| 44 | `physInvtCountingPeriodType` | Phys Invt Counting Period Type | Phys Invt Counting Period Type | — |
| 45 | `dedicated` | Dedicated | Dedicated | — |


[↑ Back to top](#table-of-contents)

---

### ocpfReminderHeaders

**Description:** Reminder headers — open reminder documents sent to customers with overdue balances.

| Property | Value |
|---|---|
| **Source Table** | Reminder Header |
| Page ID | 90933 |
| Page Name | `ocpfReminderHeaders` |
| Entity Set Name | `ocpfReminderHeaders` |
| API Group | `ocpf_systemAndSetup` |
| Editable | ❌ No (GET only) |
| Field Count | 51 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | — |
| 3 | `customerNo` | Customer No. | Customer No. | — |
| 4 | `name` | Name | Name | — |
| 5 | `name2` | Name 2 | Name 2 | — |
| 6 | `address` | Address | Address | — |
| 7 | `address2` | Address 2 | Address 2 | — |
| 8 | `postCode` | Post Code | Post Code | — |
| 9 | `city` | City | City | — |
| 10 | `county` | County | County | — |
| 11 | `countryRegionCode` | Country/Region Code | Country/Region Code | — |
| 12 | `languageCode` | Language Code | Language Code | — |
| 13 | `currencyCode` | Currency Code | Currency Code | — |
| 14 | `contact` | Contact | Contact | — |
| 15 | `yourReference` | Your Reference | Your Reference | — |
| 16 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 17 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 18 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | — |
| 19 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 20 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 21 | `reasonCode` | Reason Code | Reason Code | — |
| 22 | `postingDate` | Posting Date | Posting Date | — |
| 23 | `documentDate` | Document Date | Document Date | — |
| 24 | `dueDate` | Due Date | Due Date | — |
| 25 | `reminderTermsCode` | Reminder Terms Code | Reminder Terms Code | — |
| 26 | `finChargeTermsCode` | Fin. Charge Terms Code | Fin. Charge Terms Code | — |
| 27 | `postInterest` | Post Interest | Post Interest | — |
| 28 | `postAdditionalFee` | Post Additional Fee | Post Additional Fee | — |
| 29 | `reminderLevel` | Reminder Level | Reminder Level | — |
| 30 | `postingDescription` | Posting Description | Posting Description | — |
| 31 | `comment` | Comment | Comment | 🧮 computed |
| 32 | `remainingAmount` | Remaining Amount | Remaining Amount | 🧮 computed |
| 33 | `interestAmount` | Interest Amount | Interest Amount | 🧮 computed |
| 34 | `additionalFee` | Additional Fee | Additional Fee | 🧮 computed |
| 35 | `vatAmount` | VAT Amount | VAT Amount | 🧮 computed |
| 36 | `noSeries` | No. Series | No. Series | — |
| 37 | `issuingNoSeries` | Issuing No. Series | Issuing No. Series | — |
| 38 | `issuingNo` | Issuing No. | Issuing No. | — |
| 39 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 40 | `taxLiable` | Tax Liable | Tax Liable | — |
| 41 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 42 | `useHeaderLevel` | Use Header Level | Use Header Level | — |
| 43 | `addFeePerLine` | Add. Fee per Line | Add. Fee per Line | 🧮 computed |
| 44 | `postAddFeePerLine` | Post Add. Fee per Line | Post Add. Fee per Line | — |
| 45 | `vatReportingDate` | VAT Reporting Date | VAT Date | — |
| 46 | `formatRegion` | Format Region | Format Region | — |
| 47 | `emailText` | Email Text | Email Text | — |
| 48 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | — |
| 49 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 50 | `reminderAutomationCode` | Reminder Automation Code | Reminder Automation Code | — |
| 51 | `assignedUserId` | Assigned User ID | Assigned User ID | — |


[↑ Back to top](#table-of-contents)

---

### ocpfReminderLines

**Description:** Reminder lines — individual overdue invoice lines within a reminder document.

| Property | Value |
|---|---|
| **Source Table** | Reminder Line |
| Page ID | 90934 |
| Page Name | `ocpfReminderLines` |
| Entity Set Name | `ocpfReminderLines` |
| API Group | `ocpf_systemAndSetup` |
| Editable | ❌ No (GET only) |
| Field Count | 31 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `reminderNo` | Reminder No. | Reminder No. | — |
| 3 | `lineNo` | Line No. | Line No. | — |
| 4 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `entryNo` | Entry No. | Entry No. | — |
| 7 | `noOfReminders` | No. of Reminders | No. of Reminders | — |
| 8 | `postingDate` | Posting Date | Posting Date | — |
| 9 | `documentDate` | Document Date | Document Date | — |
| 10 | `dueDate` | Due Date | Due Date | — |
| 11 | `documentType` | Document Type | Document Type | — |
| 12 | `documentNo` | Document No. | Document No. | — |
| 13 | `description` | Description | Description | — |
| 14 | `originalAmount` | Original Amount | Original Amount | — |
| 15 | `remainingAmount` | Remaining Amount | Remaining Amount | — |
| 16 | `no` | No. | No. | — |
| 17 | `amount` | Amount | Amount | — |
| 18 | `interestRate` | Interest Rate | Interest Rate | — |
| 19 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 20 | `vatPct` | VAT % | VAT % | — |
| 21 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 22 | `vatAmount` | VAT Amount | VAT Amount | — |
| 23 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 24 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 25 | `vatIdentifier` | VAT Identifier | VAT Identifier | — |
| 26 | `lineType` | Line Type | Line Type | — |
| 27 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | — |
| 28 | `appliesToDocumentType` | Applies-to Document Type | Applies-to Document Type | — |
| 29 | `appliesToDocumentNo` | Applies-to Document No. | Applies-to Document No. | — |
| 30 | `detailedInterestRatesEntry` | Detailed Interest Rates Entry | Detailed Interest Rates Entry | — |
| 31 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | — |


[↑ Back to top](#table-of-contents)

---

### ocpfFinanceChargeMemoHeaders

**Description:** Finance charge memo headers — open finance charge documents for overdue customers.

| Property | Value |
|---|---|
| **Source Table** | Finance Charge Memo Header |
| Page ID | 90935 |
| Page Name | `ocpfFinanceChargeMemoHeaders` |
| Entity Set Name | `ocpfFinanceChargeMemoHeaders` |
| API Group | `ocpf_systemAndSetup` |
| Editable | ❌ No (GET only) |
| Field Count | 44 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | — |
| 3 | `customerNo` | Customer No. | Customer No. | — |
| 4 | `name` | Name | Name | — |
| 5 | `name2` | Name 2 | Name 2 | — |
| 6 | `address` | Address | Address | — |
| 7 | `address2` | Address 2 | Address 2 | — |
| 8 | `postCode` | Post Code | Post Code | — |
| 9 | `city` | City | City | — |
| 10 | `county` | County | County | — |
| 11 | `countryRegionCode` | Country/Region Code | Country/Region Code | — |
| 12 | `languageCode` | Language Code | Language Code | — |
| 13 | `currencyCode` | Currency Code | Currency Code | — |
| 14 | `contact` | Contact | Contact | — |
| 15 | `yourReference` | Your Reference | Your Reference | — |
| 16 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 17 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 18 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | — |
| 19 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 20 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 21 | `reasonCode` | Reason Code | Reason Code | — |
| 22 | `postingDate` | Posting Date | Posting Date | — |
| 23 | `documentDate` | Document Date | Document Date | — |
| 24 | `dueDate` | Due Date | Due Date | — |
| 25 | `finChargeTermsCode` | Fin. Charge Terms Code | Fin. Charge Terms Code | — |
| 26 | `postInterest` | Post Interest | Post Interest | — |
| 27 | `postAdditionalFee` | Post Additional Fee | Post Additional Fee | — |
| 28 | `postingDescription` | Posting Description | Posting Description | — |
| 29 | `comment` | Comment | Comment | 🧮 computed |
| 30 | `remainingAmount` | Remaining Amount | Remaining Amount | 🧮 computed |
| 31 | `interestAmount` | Interest Amount | Interest Amount | 🧮 computed |
| 32 | `additionalFee` | Additional Fee | Additional Fee | 🧮 computed |
| 33 | `vatAmount` | VAT Amount | VAT Amount | 🧮 computed |
| 34 | `noSeries` | No. Series | No. Series | — |
| 35 | `issuingNoSeries` | Issuing No. Series | Issuing No. Series | — |
| 36 | `issuingNo` | Issuing No. | Issuing No. | — |
| 37 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 38 | `taxLiable` | Tax Liable | Tax Liable | — |
| 39 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 40 | `vatReportingDate` | VAT Reporting Date | VAT Date | — |
| 41 | `formatRegion` | Format Region | Format Region | — |
| 42 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | — |
| 43 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 44 | `assignedUserId` | Assigned User ID | Assigned User ID | — |


[↑ Back to top](#table-of-contents)

---

### ocpfFinanceChargeMemoLines

**Description:** Finance charge memo lines — individual charge lines within a finance charge memo.

| Property | Value |
|---|---|
| **Source Table** | Finance Charge Memo Line |
| Page ID | 90936 |
| Page Name | `ocpfFinanceChargeMemoLines` |
| Entity Set Name | `ocpfFinanceChargeMemoLines` |
| API Group | `ocpf_systemAndSetup` |
| Editable | ❌ No (GET only) |
| Field Count | 28 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `financeChargeMemoNo` | Finance Charge Memo No. | Finance Charge Memo No. | — |
| 3 | `lineNo` | Line No. | Line No. | — |
| 4 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `entryNo` | Entry No. | Entry No. | — |
| 7 | `postingDate` | Posting Date | Posting Date | — |
| 8 | `documentDate` | Document Date | Document Date | — |
| 9 | `dueDate` | Due Date | Due Date | — |
| 10 | `documentType` | Document Type | Document Type | — |
| 11 | `documentNo` | Document No. | Document No. | — |
| 12 | `description` | Description | Description | — |
| 13 | `originalAmount` | Original Amount | Original Amount | — |
| 14 | `remainingAmount` | Remaining Amount | Remaining Amount | — |
| 15 | `no` | No. | No. | — |
| 16 | `amount` | Amount | Amount | — |
| 17 | `interestRate` | Interest Rate | Interest Rate | — |
| 18 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 19 | `vatPct` | VAT % | VAT % | — |
| 20 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 21 | `vatAmount` | VAT Amount | VAT Amount | — |
| 22 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 23 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 24 | `vatIdentifier` | VAT Identifier | VAT Identifier | — |
| 25 | `lineType` | Line Type | Line Type | — |
| 26 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | — |
| 27 | `detailedInterestRatesEntry` | Detailed Interest Rates Entry | Detailed Interest Rates Entry | — |
| 28 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | — |


[↑ Back to top](#table-of-contents)

---

### ocpfApprovalEntries

**Description:** Approval entries — workflow approval requests and their current status.

| Property | Value |
|---|---|
| **Source Table** | Approval Entry |
| Page ID | 90937 |
| Page Name | `ocpfApprovalEntries` |
| Entity Set Name | `ocpfApprovalEntries` |
| API Group | `ocpf_systemAndSetup` |
| Editable | ❌ No (GET only) |
| Field Count | 29 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `tableId` | Table ID | Table ID | — |
| 3 | `documentType` | Document Type | Document Type | — |
| 4 | `documentNo` | Document No. | Document No. | — |
| 5 | `sequenceNo` | Sequence No. | Sequence No. | — |
| 6 | `approvalCode` | Approval Code | Approval Code | — |
| 7 | `senderId` | Sender ID | Sender ID | — |
| 8 | `salespersPurchCode` | Salespers./Purch. Code | Salespers./Purch. Code | — |
| 9 | `approverId` | Approver ID | Approver ID | — |
| 10 | `status` | Status | Status | — |
| 11 | `dateTimeSentForApproval` | Date-Time Sent for Approval | Date-Time Sent for Approval | — |
| 12 | `lastDateTimeModified` | Last Date-Time Modified | Last Date-Time Modified | — |
| 13 | `lastModifiedByUserId` | Last Modified By User ID | Last Modified By User ID | — |
| 14 | `comment` | Comment | Comment | 🧮 computed |
| 15 | `dueDate` | Due Date | Approval Due Date | — |
| 16 | `amount` | Amount | Amount | — |
| 17 | `amountLcy` | Amount (LCY) | Amount (LCY) | — |
| 18 | `currencyCode` | Currency Code | Currency Code | — |
| 19 | `approvalType` | Approval Type | Approval Type | — |
| 20 | `limitType` | Limit Type | Limit Type | — |
| 21 | `availableCreditLimitLcy` | Available Credit Limit (LCY) | Available Credit Limit (LCY) | — |
| 22 | `pendingApprovals` | Pending Approvals | Pending Approvals | 🧮 computed |
| 23 | `recordIdToApprove` | Record ID to Approve | Record ID to Approve | — |
| 24 | `delegationDateFormula` | Delegation Date Formula | Delegation Date Formula | — |
| 25 | `numberOfApprovedRequests` | Number of Approved Requests | Number of Approved Requests | 🧮 computed |
| 26 | `numberOfRejectedRequests` | Number of Rejected Requests | Number of Rejected Requests | 🧮 computed |
| 27 | `entryNo` | Entry No. | Entry No. | — |
| 28 | `workflowStepInstanceId` | Workflow Step Instance ID | Workflow Step Instance ID | — |
| 29 | `relatedToChange` | Related to Change | Related to Change | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfWorkflowStepInstances

**Description:** Workflow step instances — active steps within running workflow instances.

| Property | Value |
|---|---|
| **Source Table** | Workflow Step Instance |
| Page ID | 90938 |
| Page Name | `ocpfWorkflowStepInstances` |
| Entity Set Name | `ocpfWorkflowStepInstances` |
| API Group | `ocpf_systemAndSetup` |
| Editable | ❌ No (GET only) |
| Field Count | 20 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `id` | ID | ID | — |
| 3 | `workflowCode` | Workflow Code | Workflow Code | — |
| 4 | `workflowStepId` | Workflow Step ID | Workflow Step ID | — |
| 5 | `description` | Description | Description | — |
| 6 | `entryPoint` | Entry Point | Entry Point | — |
| 7 | `recordId` | Record ID | Record ID | — |
| 8 | `createdDateTime` | Created Date-Time | Created Date-Time | — |
| 9 | `createdByUserId` | Created By User ID | Created By User ID | — |
| 10 | `lastModifiedDateTime` | Last Modified Date-Time | Last Modified Date-Time | — |
| 11 | `lastModifiedByUserId` | Last Modified By User ID | Last Modified By User ID | — |
| 12 | `status` | Status | Status | — |
| 13 | `previousWorkflowStepId` | Previous Workflow Step ID | Previous Workflow Step ID | — |
| 14 | `nextWorkflowStepId` | Next Workflow Step ID | Next Workflow Step ID | — |
| 15 | `type` | Type | Type | — |
| 16 | `functionName` | Function Name | Function Name | — |
| 17 | `argument` | Argument | Argument | — |
| 18 | `originalWorkflowCode` | Original Workflow Code | Original Workflow Code | — |
| 19 | `originalWorkflowStepId` | Original Workflow Step ID | Original Workflow Step ID | — |
| 20 | `sequenceNo` | Sequence No. | Sequence No. | — |


[↑ Back to top](#table-of-contents)

---

## Manufacturing

*Category introduced in API v3.1 (`ocpf_manufacturing`). Covers production BOMs, routings, capacities, production orders, and assembly management.*

### ocpfManufacturingSetup

**Description:** Manufacturing Setup — company-wide settings that control planning, scheduling, and numbering for production.

| Property | Value |
|---|---|
| **Source Table** | Manufacturing Setup |
| Page ID | 90939 |
| Page Name | `ocpfManufacturingSetup` |
| Entity Set Name | `ocpfManufacturingSetup` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 27 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `primaryKey` | Primary Key | Primary Key | ✅ |
| 3 | `normalStartingTime` | Normal Starting Time | Normal Starting Time | ✅ |
| 4 | `normalEndingTime` | Normal Ending Time | Normal Ending Time | ✅ |
| 5 | `docNoIsProdOrderNo` | Doc. No. Is Prod. Order No. | Doc. No. Is Prod. Order No. | ✅ |
| 6 | `costInclSetup` | Cost Incl. Setup | Cost Incl. Setup | ✅ |
| 7 | `dynamicLowLevelCode` | Dynamic Low-Level Code | Dynamic Low-Level Code | ✅ |
| 8 | `planningWarning` | Planning Warning | Planning Warning | ✅ |
| 9 | `simulatedOrderNos` | Simulated Order Nos. | Simulated Order Nos. | ✅ |
| 10 | `plannedOrderNos` | Planned Order Nos. | Planned Order Nos. | ✅ |
| 11 | `firmPlannedOrderNos` | Firm Planned Order Nos. | Firm Planned Order Nos. | ✅ |
| 12 | `releasedOrderNos` | Released Order Nos. | Released Order Nos. | ✅ |
| 13 | `workCenterNos` | Work Center Nos. | Work Center Nos. | ✅ |
| 14 | `machineCenterNos` | Machine Center Nos. | Machine Center Nos. | ✅ |
| 15 | `productionBomNos` | Production BOM Nos. | Production BOM Nos. | ✅ |
| 16 | `routingNos` | Routing Nos. | Routing Nos. | ✅ |
| 17 | `componentsAtLocation` | Components at Location | Components at Location | ✅ |
| 18 | `showCapacityIn` | Show Capacity In | Show Capacity In | ✅ |
| 19 | `defaultConsumCalcBasedOn` | Default Consum. Calc. Based on | Default Consumption Calculation Based on | ✅ |
| 20 | `finishOrderWithoutOutput` | Finish Order without Output | Allow Finishing Prod. Order with no Output | ✅ |
| 21 | `incNonInvCostToProd` | Inc. Non. Inv. Cost To Prod | Include Non-Inventory Items to Produced Items | ✅ |
| 22 | `loadSkuCostOnManufacturing` | Load SKU Cost on Manufacturing | Load SKU Cost on Manufacturing | ✅ |
| 23 | `manualScheduling` | Manual Scheduling | Manual Scheduling | ✅ |
| 24 | `safetyLeadTimeForManSch` | Safety Lead Time for Man. Sch. | Safety Lead Time for Manual Scheduling | ✅ |
| 25 | `defaultGenBusPostGroup` | Default Gen. Bus. Post. Group | Default General Business Posting Group | ✅ |
| 26 | `defaultFlushingMethod` | Default Flushing Method | Default Flushing Method | ✅ |
| 27 | `presetOutputQuantity` | Preset Output Quantity | Preset Output Quantity | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfWorkShifts

**Description:** Work Shifts — named shifts used to define working time in shop calendars.

| Property | Value |
|---|---|
| **Source Table** | Work Shift |
| Page ID | 90940 |
| Page Name | `ocpfWorkShifts` |
| Entity Set Name | `ocpfWorkShifts` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfShopCalendars

**Description:** Shop Calendars — base calendars that define the working days and shifts available to capacity resources.

| Property | Value |
|---|---|
| **Source Table** | Shop Calendar |
| Page ID | 90941 |
| Page Name | `ocpfShopCalendars` |
| Entity Set Name | `ocpfShopCalendars` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfShopCalendarWorkingDays

**Description:** Shop Calendar Working Days — the weekday/shift lines that make up each shop calendar.

| Property | Value |
|---|---|
| **Source Table** | Shop Calendar Working Days |
| Page ID | 90942 |
| Page Name | `ocpfShopCalendarWorkingDays` |
| Entity Set Name | `ocpfShopCalendarWorkingDays` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 6 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `shopCalendarCode` | Shop Calendar Code | Shop Calendar Code | ✅ |
| 3 | `day` | Day | Day | ✅ |
| 4 | `workShiftCode` | Work Shift Code | Work Shift Code | ✅ |
| 5 | `startingTime` | Starting Time | Starting Time | ✅ |
| 6 | `endingTime` | Ending Time | Ending Time | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfWorkCenterGroups

**Description:** Work Center Groups — groupings of work centers for consolidated capacity views.

| Property | Value |
|---|---|
| **Source Table** | Work Center Group |
| Page ID | 90943 |
| Page Name | `ocpfWorkCenterGroups` |
| Entity Set Name | `ocpfWorkCenterGroups` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 9 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 5 | `workShiftFilter` | Work Shift Filter | Work Shift Filter | 🔍 filter |
| 6 | `capacityTotal` | Capacity (Total) | Capacity (Total) | 🧮 computed |
| 7 | `capacityEffective` | Capacity (Effective) | Capacity (Effective) | 🧮 computed |
| 8 | `prodOrderNeedQty` | Prod. Order Need (Qty.) | Prod. Order Need (Qty.) | 🧮 computed |
| 9 | `prodOrderStatusFilter` | Prod. Order Status Filter | Prod. Order Status Filter | 🔍 filter |


[↑ Back to top](#table-of-contents)

---

### ocpfWorkCenters

**Description:** Work Centers — capacity resources (departments, lines, or cells) on which routing operations are performed, including costing and calendar settings.

| Property | Value |
|---|---|
| **Source Table** | Work Center |
| Page ID | 90944 |
| Page Name | `ocpfWorkCenters` |
| Entity Set Name | `ocpfWorkCenters` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 50 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `searchName` | Search Name | Search Name | ✅ |
| 5 | `name2` | Name 2 | Name 2 | ✅ |
| 6 | `address` | Address | Address | ✅ |
| 7 | `address2` | Address 2 | Address 2 | ✅ |
| 8 | `city` | City | City | ✅ |
| 9 | `postCode` | Post Code | Post Code | ✅ |
| 10 | `alternateWorkCenter` | Alternate Work Center | Alternate Work Center | ✅ |
| 11 | `workCenterGroupCode` | Work Center Group Code | Work Center Group Code | ✅ |
| 12 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | ✅ |
| 13 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | ✅ |
| 14 | `subcontractorNo` | Subcontractor No. | Subcontractor No. | ✅ |
| 15 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | ✅ |
| 16 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | ✅ |
| 17 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 18 | `queueTime` | Queue Time | Queue Time | ✅ |
| 19 | `queueTimeUnitOfMeasCode` | Queue Time Unit of Meas. Code | Queue Time Unit of Meas. Code | ✅ |
| 20 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 21 | `comment` | Comment | Comment | 🧮 computed |
| 22 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 23 | `capacity` | Capacity | Capacity | ✅ |
| 24 | `efficiency` | Efficiency | Efficiency | ✅ |
| 25 | `maximumEfficiency` | Maximum Efficiency | Maximum Efficiency | ✅ |
| 26 | `minimumEfficiency` | Minimum Efficiency | Minimum Efficiency | ✅ |
| 27 | `calendarRoundingPrecision` | Calendar Rounding Precision | Calendar Rounding Precision | ✅ |
| 28 | `simulationType` | Simulation Type | Simulation Type | ✅ |
| 29 | `shopCalendarCode` | Shop Calendar Code | Shop Calendar Code | ✅ |
| 30 | `blocked` | Blocked | Blocked | ✅ |
| 31 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 32 | `workShiftFilter` | Work Shift Filter | Work Shift Filter | 🔍 filter |
| 33 | `capacityTotal` | Capacity (Total) | Capacity (Total) | 🧮 computed |
| 34 | `capacityEffective` | Capacity (Effective) | Capacity (Effective) | 🧮 computed |
| 35 | `prodOrderNeedQty` | Prod. Order Need (Qty.) | Prod. Order Need (Qty.) | 🧮 computed |
| 36 | `prodOrderNeedAmount` | Prod. Order Need Amount | Prod. Order Need Amount | 🧮 computed |
| 37 | `prodOrderStatusFilter` | Prod. Order Status Filter | Prod. Order Status Filter | 🔍 filter |
| 38 | `unitCostCalculation` | Unit Cost Calculation | Unit Cost Calculation | ✅ |
| 39 | `specificUnitCost` | Specific Unit Cost | Specific Unit Cost | ✅ |
| 40 | `consolidatedCalendar` | Consolidated Calendar | Consolidated Calendar | ✅ |
| 41 | `flushingMethod` | Flushing Method | Flushing Method | ✅ |
| 42 | `noSeries` | No. Series | No. Series | ✅ |
| 43 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |
| 44 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 45 | `county` | County | County | ✅ |
| 46 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 47 | `locationCode` | Location Code | Location Code | ✅ |
| 48 | `openShopFloorBinCode` | Open Shop Floor Bin Code | Open Shop Floor Bin Code | ✅ |
| 49 | `toProductionBinCode` | To-Production Bin Code | To-Production Bin Code | ✅ |
| 50 | `fromProductionBinCode` | From-Production Bin Code | From-Production Bin Code | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfMachineCenters

**Description:** Machine Centers — individual machines belonging to a work center, with their own capacity, efficiency, and cost settings.

| Property | Value |
|---|---|
| **Source Table** | Machine Center |
| Page ID | 90945 |
| Page Name | `ocpfMachineCenters` |
| Entity Set Name | `ocpfMachineCenters` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 54 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `name` | Name | Name | ✅ |
| 4 | `searchName` | Search Name | Search Name | ✅ |
| 5 | `name2` | Name 2 | Name 2 | ✅ |
| 6 | `address` | Address | Address | ✅ |
| 7 | `address2` | Address 2 | Address 2 | ✅ |
| 8 | `city` | City | City | ✅ |
| 9 | `postCode` | Post Code | Post Code | ✅ |
| 10 | `workCenterNo` | Work Center No. | Work Center No. | ✅ |
| 11 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | ✅ |
| 12 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | ✅ |
| 13 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 14 | `queueTime` | Queue Time | Queue Time | ✅ |
| 15 | `queueTimeUnitOfMeasCode` | Queue Time Unit of Meas. Code | Queue Time Unit of Meas. Code | ✅ |
| 16 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 17 | `comment` | Comment | Comment | 🧮 computed |
| 18 | `capacity` | Capacity | Capacity | ✅ |
| 19 | `efficiency` | Efficiency | Efficiency | ✅ |
| 20 | `maximumEfficiency` | Maximum Efficiency | Maximum Efficiency | ✅ |
| 21 | `minimumEfficiency` | Minimum Efficiency | Minimum Efficiency | ✅ |
| 22 | `blocked` | Blocked | Blocked | ✅ |
| 23 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 24 | `workShiftFilter` | Work Shift Filter | Work Shift Filter | 🔍 filter |
| 25 | `capacityTotal` | Capacity (Total) | Capacity (Total) | 🧮 computed |
| 26 | `capacityEffective` | Capacity (Effective) | Capacity (Effective) | 🧮 computed |
| 27 | `prodOrderNeedQty` | Prod. Order Need (Qty.) | Prod. Order Need (Qty.) | 🧮 computed |
| 28 | `prodOrderNeedAmount` | Prod. Order Need Amount | Prod. Order Need Amount | 🧮 computed |
| 29 | `prodOrderStatusFilter` | Prod. Order Status Filter | Prod. Order Status Filter | 🔍 filter |
| 30 | `setupTime` | Setup Time | Setup Time | ✅ |
| 31 | `waitTime` | Wait Time | Wait Time | ✅ |
| 32 | `moveTime` | Move Time | Move Time | ✅ |
| 33 | `fixedScrapQuantity` | Fixed Scrap Quantity | Fixed Scrap Quantity | ✅ |
| 34 | `scrapPct` | Scrap % | Scrap % | ✅ |
| 35 | `setupTimeUnitOfMeasCode` | Setup Time Unit of Meas. Code | Setup Time Unit of Meas. Code | ✅ |
| 36 | `waitTimeUnitOfMeasCode` | Wait Time Unit of Meas. Code | Wait Time Unit of Meas. Code | ✅ |
| 37 | `sendAheadQuantity` | Send-Ahead Quantity | Send-Ahead Quantity | ✅ |
| 38 | `moveTimeUnitOfMeasCode` | Move Time Unit of Meas. Code | Move Time Unit of Meas. Code | ✅ |
| 39 | `flushingMethod` | Flushing Method | Flushing Method | ✅ |
| 40 | `minimumProcessTime` | Minimum Process Time | Minimum Process Time | ✅ |
| 41 | `maximumProcessTime` | Maximum Process Time | Maximum Process Time | ✅ |
| 42 | `concurrentCapacities` | Concurrent Capacities | Concurrent Capacities | ✅ |
| 43 | `itemFilter` | Item Filter | Item Filter | 🔍 filter |
| 44 | `stopCodeFilter` | Stop Code Filter | Stop Code Filter | 🔍 filter |
| 45 | `scrapCodeFilter` | Scrap Code Filter | Scrap Code Filter | 🔍 filter |
| 46 | `noSeries` | No. Series | No. Series | ✅ |
| 47 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |
| 48 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 49 | `county` | County | County | ✅ |
| 50 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 51 | `locationCode` | Location Code | Location Code | ✅ |
| 52 | `openShopFloorBinCode` | Open Shop Floor Bin Code | Open Shop Floor Bin Code | ✅ |
| 53 | `toProductionBinCode` | To-Production Bin Code | To-Production Bin Code | ✅ |
| 54 | `fromProductionBinCode` | From-Production Bin Code | From-Production Bin Code | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfCapacityUnitsOfMeasure

**Description:** Capacity Units of Measure — time units (minutes, hours, days) used to express capacity and run times.

| Property | Value |
|---|---|
| **Source Table** | Capacity Unit of Measure |
| Page ID | 90946 |
| Page Name | `ocpfCapacityUnitsOfMeasure` |
| Entity Set Name | `ocpfCapacityUnitsOfMeasure` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 4 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `type` | Type | Type | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfCalendarEntries

**Description:** Calendar Entries — calculated available capacity per work/machine center, date, and shift. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Calendar Entry |
| Page ID | 90947 |
| Page Name | `ocpfCalendarEntries` |
| Entity Set Name | `ocpfCalendarEntries` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 17 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `capacityType` | Capacity Type | Capacity Type | — |
| 3 | `no` | No. | No. | — |
| 4 | `date` | Date | Date | — |
| 5 | `workShiftCode` | Work Shift Code | Work Shift Code | — |
| 6 | `startingTime` | Starting Time | Starting Time | — |
| 7 | `endingTime` | Ending Time | Ending Time | — |
| 8 | `workCenterNo` | Work Center No. | Work Center No. | — |
| 9 | `workCenterGroupCode` | Work Center Group Code | Work Center Group Code | — |
| 10 | `capacityTotal` | Capacity (Total) | Capacity (Total) | — |
| 11 | `capacityEffective` | Capacity (Effective) | Capacity (Effective) | — |
| 12 | `efficiency` | Efficiency | Efficiency | — |
| 13 | `capacity` | Capacity | Capacity | — |
| 14 | `absenceEfficiency` | Absence Efficiency | Absence Efficiency | — |
| 15 | `absenceCapacity` | Absence Capacity | Absence Capacity | — |
| 16 | `startingDateTime` | Starting Date-Time | Starting Date-Time | — |
| 17 | `endingDateTime` | Ending Date-Time | Ending Date-Time | — |


[↑ Back to top](#table-of-contents)

---

### ocpfCalendarAbsenceEntries

**Description:** Calendar Absence Entries — registered capacity downtime (maintenance, holidays) per work/machine center. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Calendar Absence Entry |
| Page ID | 90948 |
| Page Name | `ocpfCalendarAbsenceEntries` |
| Entity Set Name | `ocpfCalendarAbsenceEntries` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 13 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `capacityType` | Capacity Type | Capacity Type | — |
| 3 | `no` | No. | No. | — |
| 4 | `date` | Date | Date | — |
| 5 | `startingTime` | Starting Time | Starting Time | — |
| 6 | `endingTime` | Ending Time | Ending Time | — |
| 7 | `workCenterNo` | Work Center No. | Work Center No. | — |
| 8 | `workCenterGroupCode` | Work Center Group Code | Work Center Group Code | — |
| 9 | `capacity` | Capacity | Capacity | — |
| 10 | `startingDateTime` | Starting Date-Time | Starting Date-Time | — |
| 11 | `endingDateTime` | Ending Date-Time | Ending Date-Time | — |
| 12 | `description` | Description | Description | — |
| 13 | `updated` | Updated | Updated | — |


[↑ Back to top](#table-of-contents)

---

### ocpfStops

**Description:** Stop Codes — reasons for production stops, used on output journal lines and capacity ledger entries.

| Property | Value |
|---|---|
| **Source Table** | Stop |
| Page ID | 90949 |
| Page Name | `ocpfStops` |
| Entity Set Name | `ocpfStops` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfScraps

**Description:** Scrap Codes — reasons for scrapped quantities in production output.

| Property | Value |
|---|---|
| **Source Table** | Scrap |
| Page ID | 90950 |
| Page Name | `ocpfScraps` |
| Entity Set Name | `ocpfScraps` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfRoutingLinks

**Description:** Routing Links — codes that connect production BOM components to specific routing operations for just-in-time consumption.

| Property | Value |
|---|---|
| **Source Table** | Routing Link |
| Page ID | 90951 |
| Page Name | `ocpfRoutingLinks` |
| Entity Set Name | `ocpfRoutingLinks` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfStandardTasks

**Description:** Standard Tasks — reusable operation descriptions that can be assigned to routing lines.

| Property | Value |
|---|---|
| **Source Table** | Standard Task |
| Page ID | 90952 |
| Page Name | `ocpfStandardTasks` |
| Entity Set Name | `ocpfStandardTasks` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfRoutingHeaders

**Description:** Routings — headers describing the sequence of operations required to produce an item.

| Property | Value |
|---|---|
| **Source Table** | Routing Header |
| Page ID | 90953 |
| Page Name | `ocpfRoutingHeaders` |
| Entity Set Name | `ocpfRoutingHeaders` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 11 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `description2` | Description 2 | Description 2 | ✅ |
| 5 | `searchDescription` | Search Description | Search Description | ✅ |
| 6 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 7 | `comment` | Comment | Comment | 🧮 computed |
| 8 | `status` | Status | Status | ✅ |
| 9 | `type` | Type | Type | ✅ |
| 10 | `versionNos` | Version Nos. | Version Nos. | ✅ |
| 11 | `noSeries` | No. Series | No. Series | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfRoutingLines

**Description:** Routing Lines — the individual operations of a routing: work/machine center, times, and scheduling parameters.

| Property | Value |
|---|---|
| **Source Table** | Routing Line |
| Page ID | 90954 |
| Page Name | `ocpfRoutingLines` |
| Entity Set Name | `ocpfRoutingLines` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 35 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `routingNo` | Routing No. | Routing No. | ✅ |
| 3 | `versionCode` | Version Code | Version Code | ✅ |
| 4 | `operationNo` | Operation No. | Operation No. | ✅ |
| 5 | `nextOperationNo` | Next Operation No. | Next Operation No. | ✅ |
| 6 | `previousOperationNo` | Previous Operation No. | Previous Operation No. | ✅ |
| 7 | `type` | Type | Type | ✅ |
| 8 | `no` | No. | No. | ✅ |
| 9 | `workCenterNo` | Work Center No. | Work Center No. | ✅ |
| 10 | `workCenterGroupCode` | Work Center Group Code | Work Center Group Code | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `setupTime` | Setup Time | Setup Time | ✅ |
| 13 | `runTime` | Run Time | Run Time | ✅ |
| 14 | `waitTime` | Wait Time | Wait Time | ✅ |
| 15 | `moveTime` | Move Time | Move Time | ✅ |
| 16 | `fixedScrapQuantity` | Fixed Scrap Quantity | Fixed Scrap Quantity | ✅ |
| 17 | `lotSize` | Lot Size | Lot Size | ✅ |
| 18 | `scrapFactorPct` | Scrap Factor % | Scrap Factor % | ✅ |
| 19 | `setupTimeUnitOfMeasCode` | Setup Time Unit of Meas. Code | Setup Time Unit of Meas. Code | ✅ |
| 20 | `runTimeUnitOfMeasCode` | Run Time Unit of Meas. Code | Run Time Unit of Meas. Code | ✅ |
| 21 | `waitTimeUnitOfMeasCode` | Wait Time Unit of Meas. Code | Wait Time Unit of Meas. Code | ✅ |
| 22 | `moveTimeUnitOfMeasCode` | Move Time Unit of Meas. Code | Move Time Unit of Meas. Code | ✅ |
| 23 | `minimumProcessTime` | Minimum Process Time | Minimum Process Time | ✅ |
| 24 | `maximumProcessTime` | Maximum Process Time | Maximum Process Time | ✅ |
| 25 | `concurrentCapacities` | Concurrent Capacities | Concurrent Capacities | ✅ |
| 26 | `sendAheadQuantity` | Send-Ahead Quantity | Send-Ahead Quantity | ✅ |
| 27 | `routingLinkCode` | Routing Link Code | Routing Link Code | ✅ |
| 28 | `standardTaskCode` | Standard Task Code | Standard Task Code | ✅ |
| 29 | `unitCostPer` | Unit Cost per | Unit Cost per | ✅ |
| 30 | `recalculate` | Recalculate | Recalculate | ✅ |
| 31 | `comment` | Comment | Comment | 🧮 computed |
| 32 | `sequenceNoForward` | Sequence No. (Forward) | Sequence No. (Forward) | ✅ |
| 33 | `sequenceNoBackward` | Sequence No. (Backward) | Sequence No. (Backward) | ✅ |
| 34 | `fixedScrapQtyAccum` | Fixed Scrap Qty. (Accum.) | Fixed Scrap Qty. (Accum.) | ✅ |
| 35 | `scrapFactorPctAccumulated` | Scrap Factor % (Accumulated) | Scrap Factor % (Accumulated) | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfRoutingVersions

**Description:** Routing Versions — dated alternative versions of a routing.

| Property | Value |
|---|---|
| **Source Table** | Routing Version |
| Page ID | 90955 |
| Page Name | `ocpfRoutingVersions` |
| Entity Set Name | `ocpfRoutingVersions` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 9 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `routingNo` | Routing No. | Routing No. | ✅ |
| 3 | `versionCode` | Version Code | Version Code | ✅ |
| 4 | `description` | Description | Description | ✅ |
| 5 | `startingDate` | Starting Date | Starting Date | ✅ |
| 6 | `status` | Status | Status | ✅ |
| 7 | `type` | Type | Type | ✅ |
| 8 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 9 | `noSeries` | No. Series | No. Series | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfProductionBomHeaders

**Description:** Production BOMs — headers listing the materials and components required to produce an item.

| Property | Value |
|---|---|
| **Source Table** | Production BOM Header |
| Page ID | 90956 |
| Page Name | `ocpfProductionBomHeaders` |
| Entity Set Name | `ocpfProductionBomHeaders` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 13 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `description2` | Description 2 | Description 2 | ✅ |
| 5 | `searchName` | Search Name | Search Name | ✅ |
| 6 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 7 | `lowLevelCode` | Low-Level Code | Low-Level Code | ✅ |
| 8 | `comment` | Comment | Comment | 🧮 computed |
| 9 | `creationDate` | Creation Date | Creation Date | ✅ |
| 10 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 11 | `status` | Status | Status | ✅ |
| 12 | `versionNos` | Version Nos. | Version Nos. | ✅ |
| 13 | `noSeries` | No. Series | No. Series | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfProductionBomLines

**Description:** Production BOM Lines — the component lines of a production BOM, with quantity per, scrap, and routing link.

| Property | Value |
|---|---|
| **Source Table** | Production BOM Line |
| Page ID | 90957 |
| Page Name | `ocpfProductionBomLines` |
| Entity Set Name | `ocpfProductionBomLines` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 25 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `productionBomNo` | Production BOM No. | Production BOM No. | ✅ |
| 3 | `lineNo` | Line No. | Line No. | ✅ |
| 4 | `versionCode` | Version Code | Version Code | ✅ |
| 5 | `type` | Type | Type | ✅ |
| 6 | `no` | No. | No. | ✅ |
| 7 | `description` | Description | Description | ✅ |
| 8 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 9 | `quantity` | Quantity | Quantity | ✅ |
| 10 | `position` | Position | Position | ✅ |
| 11 | `position2` | Position 2 | Position 2 | ✅ |
| 12 | `position3` | Position 3 | Position 3 | ✅ |
| 13 | `leadTimeOffset` | Lead-Time Offset | Lead-Time Offset | ✅ |
| 14 | `routingLinkCode` | Routing Link Code | Routing Link Code | ✅ |
| 15 | `scrapPct` | Scrap % | Scrap % | ✅ |
| 16 | `variantCode` | Variant Code | Variant Code | ✅ |
| 17 | `comment` | Comment | Comment | 🧮 computed |
| 18 | `startingDate` | Starting Date | Starting Date | ✅ |
| 19 | `endingDate` | Ending Date | Ending Date | ✅ |
| 20 | `length` | Length | Length | ✅ |
| 21 | `width` | Width | Width | ✅ |
| 22 | `weight` | Weight | Weight | ✅ |
| 23 | `depth` | Depth | Depth | ✅ |
| 24 | `calculationFormula` | Calculation Formula | Calculation Formula | ✅ |
| 25 | `quantityPer` | Quantity per | Quantity per | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfProductionBomVersions

**Description:** Production BOM Versions — dated alternative versions of a production BOM.

| Property | Value |
|---|---|
| **Source Table** | Production BOM Version |
| Page ID | 90958 |
| Page Name | `ocpfProductionBomVersions` |
| Entity Set Name | `ocpfProductionBomVersions` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 9 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `productionBomNo` | Production BOM No. | Production BOM No. | ✅ |
| 3 | `versionCode` | Version Code | Version Code | ✅ |
| 4 | `description` | Description | Description | ✅ |
| 5 | `startingDate` | Starting Date | Starting Date | ✅ |
| 6 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 7 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 8 | `status` | Status | Status | ✅ |
| 9 | `noSeries` | No. Series | No. Series | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfFamilies

**Description:** Families — groups of items produced together in a single production run.

| Property | Value |
|---|---|
| **Source Table** | Family |
| Page ID | 90959 |
| Page Name | `ocpfFamilies` |
| Entity Set Name | `ocpfFamilies` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 8 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `description2` | Description 2 | Description 2 | ✅ |
| 5 | `searchName` | Search Name | Search Name | ✅ |
| 6 | `blocked` | Blocked | Blocked | ✅ |
| 7 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 8 | `routingNo` | Routing No. | Routing No. | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfFamilyLines

**Description:** Family Lines — the items and quantities that make up a production family.

| Property | Value |
|---|---|
| **Source Table** | Family Line |
| Page ID | 90960 |
| Page Name | `ocpfFamilyLines` |
| Entity Set Name | `ocpfFamilyLines` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 9 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `familyNo` | Family No. | Family No. | ✅ |
| 3 | `lineNo` | Line No. | Line No. | ✅ |
| 4 | `itemNo` | Item No. | Item No. | ✅ |
| 5 | `description` | Description | Description | ✅ |
| 6 | `description2` | Description 2 | Description 2 | ✅ |
| 7 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 8 | `quantity` | Quantity | Quantity | ✅ |
| 9 | `lowLevelCode` | Low-Level Code | Low-Level Code | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfProductionOrders

**Description:** Production Orders — orders (simulated through finished) that drive manufacturing of items, with status, dates, and quantities.

| Property | Value |
|---|---|
| **Source Table** | Production Order |
| Page ID | 90961 |
| Page Name | `ocpfProductionOrders` |
| Entity Set Name | `ocpfProductionOrders` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 56 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `status` | Status | Status | ✅ |
| 3 | `no` | No. | No. | ✅ |
| 4 | `description` | Description | Description | ✅ |
| 5 | `searchDescription` | Search Description | Search Description | ✅ |
| 6 | `description2` | Description 2 | Description 2 | ✅ |
| 7 | `creationDate` | Creation Date | Creation Date | ✅ |
| 8 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 9 | `sourceType` | Source Type | Source Type | ✅ |
| 10 | `sourceNo` | Source No. | Source No. | ✅ |
| 11 | `routingNo` | Routing No. | Routing No. | ✅ |
| 12 | `variantCode` | Variant Code | Variant Code | ✅ |
| 13 | `inventoryPostingGroup` | Inventory Posting Group | Inventory Posting Group | ✅ |
| 14 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 15 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 16 | `comment` | Comment | Comment | 🧮 computed |
| 17 | `startingTime` | Starting Time | Starting Time | ✅ |
| 18 | `startingDate` | Starting Date | Starting Date | ✅ |
| 19 | `endingTime` | Ending Time | Ending Time | ✅ |
| 20 | `endingDate` | Ending Date | Ending Date | ✅ |
| 21 | `dueDate` | Due Date | Due Date | ✅ |
| 22 | `finishedDate` | Finished Date | Finished Date | ✅ |
| 23 | `blocked` | Blocked | Blocked | ✅ |
| 24 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 25 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 26 | `locationCode` | Location Code | Location Code | ✅ |
| 27 | `binCode` | Bin Code | Bin Code | ✅ |
| 28 | `replanRefNo` | Replan Ref. No. | Replan Ref. No. | ✅ |
| 29 | `replanRefStatus` | Replan Ref. Status | Replan Ref. Status | ✅ |
| 30 | `lowLevelCode` | Low-Level Code | Low-Level Code | ✅ |
| 31 | `quantity` | Quantity | Quantity | ✅ |
| 32 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 33 | `costAmount` | Cost Amount | Cost Amount | ✅ |
| 34 | `workCenterFilter` | Work Center Filter | Work Center Filter | 🔍 filter |
| 35 | `capacityTypeFilter` | Capacity Type Filter | Capacity Type Filter | 🔍 filter |
| 36 | `capacityNoFilter` | Capacity No. Filter | Capacity No. Filter | 🔍 filter |
| 37 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 38 | `expectedOperationCostAmt` | Expected Operation Cost Amt. | Expected Operation Cost Amt. | 🧮 computed |
| 39 | `expectedComponentCostAmt` | Expected Component Cost Amt. | Expected Component Cost Amt. | 🧮 computed |
| 40 | `actualTimeUsed` | Actual Time Used | Actual Time Used | 🧮 computed |
| 41 | `allocatedCapacityNeed` | Allocated Capacity Need | Allocated Capacity Need | 🧮 computed |
| 42 | `expectedCapacityNeed` | Expected Capacity Need | Expected Capacity Need | 🧮 computed |
| 43 | `noSeries` | No. Series | No. Series | ✅ |
| 44 | `plannedOrderNo` | Planned Order No. | Planned Order No. | ✅ |
| 45 | `firmPlannedOrderNo` | Firm Planned Order No. | Firm Planned Order No. | ✅ |
| 46 | `simulatedOrderNo` | Simulated Order No. | Simulated Order No. | ✅ |
| 47 | `expectedMaterialOvhdCost` | Expected Material Ovhd. Cost | Expected Material Ovhd. Cost | 🧮 computed |
| 48 | `expectedCapacityOvhdCost` | Expected Capacity Ovhd. Cost | Expected Capacity Ovhd. Cost | 🧮 computed |
| 49 | `startingDateTime` | Starting Date-Time | Starting Date-Time | ✅ |
| 50 | `endingDateTime` | Ending Date-Time | Ending Date-Time | ✅ |
| 51 | `documentPutAwayStatus` | Document Put-away Status | Document Put-away Status | ✅ |
| 52 | `reopened` | Reopened | Reopened | ✅ |
| 53 | `manualScheduling` | Manual Scheduling | Manual Scheduling | ✅ |
| 54 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 55 | `completelyPicked` | Completely Picked | Completely Picked | 🧮 computed |
| 56 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfProdOrderLines

**Description:** Production Order Lines — the items being produced on a production order, with scheduled dates and quantities.

| Property | Value |
|---|---|
| **Source Table** | Prod. Order Line |
| Page ID | 90962 |
| Page Name | `ocpfProdOrderLines` |
| Entity Set Name | `ocpfProdOrderLines` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 65 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `status` | Status | Status | ✅ |
| 3 | `prodOrderNo` | Prod. Order No. | Prod. Order No. | ✅ |
| 4 | `lineNo` | Line No. | Line No. | ✅ |
| 5 | `itemNo` | Item No. | Item No. | ✅ |
| 6 | `variantCode` | Variant Code | Variant Code | ✅ |
| 7 | `description` | Description | Description | ✅ |
| 8 | `description2` | Description 2 | Description 2 | ✅ |
| 9 | `locationCode` | Location Code | Location Code | ✅ |
| 10 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 11 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 12 | `binCode` | Bin Code | Bin Code | ✅ |
| 13 | `quantity` | Quantity | Quantity | ✅ |
| 14 | `finishedQuantity` | Finished Quantity | Finished Quantity | ✅ |
| 15 | `remainingQuantity` | Remaining Quantity | Remaining Quantity | ✅ |
| 16 | `scrapPct` | Scrap % | Scrap % | ✅ |
| 17 | `dueDate` | Due Date | Due Date | ✅ |
| 18 | `startingDate` | Starting Date | Starting Date | ✅ |
| 19 | `startingTime` | Starting Time | Starting Time | ✅ |
| 20 | `endingDate` | Ending Date | Ending Date | ✅ |
| 21 | `endingTime` | Ending Time | Ending Time | ✅ |
| 22 | `planningLevelCode` | Planning Level Code | Planning Level Code | ✅ |
| 23 | `priority` | Priority | Priority | ✅ |
| 24 | `productionBomNo` | Production BOM No. | Production BOM No. | ✅ |
| 25 | `routingNo` | Routing No. | Routing No. | ✅ |
| 26 | `inventoryPostingGroup` | Inventory Posting Group | Inventory Posting Group | ✅ |
| 27 | `routingReferenceNo` | Routing Reference No. | Routing Reference No. | ✅ |
| 28 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 29 | `putAwayStatus` | Put-away Status | Put-away Status | ✅ |
| 30 | `costAmount` | Cost Amount | Cost Amount | ✅ |
| 31 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 32 | `capacityTypeFilter` | Capacity Type Filter | Capacity Type Filter | 🔍 filter |
| 33 | `capacityNoFilter` | Capacity No. Filter | Capacity No. Filter | 🔍 filter |
| 34 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 35 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 36 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 37 | `manualScheduling` | Manual Scheduling | Manual Scheduling | ✅ |
| 38 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 39 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 40 | `finishedQtyBase` | Finished Qty. (Base) | Finished Qty. (Base) | ✅ |
| 41 | `remainingQtyBase` | Remaining Qty. (Base) | Remaining Qty. (Base) | ✅ |
| 42 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 43 | `expectedOperationCostAmt` | Expected Operation Cost Amt. | Expected Operation Cost Amt. | 🧮 computed |
| 44 | `totalExpOperOutputQty` | Total Exp. Oper. Output (Qty.) | Total Exp. Oper. Output (Qty.) | 🧮 computed |
| 45 | `expectedComponentCostAmt` | Expected Component Cost Amt. | Expected Component Cost Amt. | 🧮 computed |
| 46 | `startingDateTime` | Starting Date-Time | Starting Date-Time | ✅ |
| 47 | `endingDateTime` | Ending Date-Time | Ending Date-Time | ✅ |
| 48 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 49 | `costAmountAcy` | Cost Amount (ACY) | Cost Amount (ACY) | ✅ |
| 50 | `unitCostAcy` | Unit Cost (ACY) | Unit Cost (ACY) | ✅ |
| 51 | `qtyPutAway` | Qty. Put Away | Qty. Put Away | ✅ |
| 52 | `qtyPutAwayBase` | Qty. Put Away (Base) | Qty. Put Away (Base) | ✅ |
| 53 | `putAwayQty` | Put-away Qty. | Put-away Qty. | 🧮 computed |
| 54 | `putAwayQtyBase` | Put-away Qty. (Base) | Put-away Qty. (Base) | 🧮 computed |
| 55 | `lotNoFilter` | Lot No. Filter | Lot No. Filter | 🔍 filter |
| 56 | `serialNoFilter` | Serial No. Filter | Serial No. Filter | 🔍 filter |
| 57 | `packageNoFilter` | Package No. Filter | Package No. Filter | 🔍 filter |
| 58 | `productionBomVersionCode` | Production BOM Version Code | Production BOM Version Code | ✅ |
| 59 | `routingVersionCode` | Routing Version Code | Routing Version Code | ✅ |
| 60 | `routingType` | Routing Type | Routing Type | ✅ |
| 61 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 62 | `mpsOrder` | MPS Order | MPS Order | ✅ |
| 63 | `planningFlexibility` | Planning Flexibility | Planning Flexibility | ✅ |
| 64 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | ✅ |
| 65 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfProdOrderComponents

**Description:** Production Order Components — the material requirements of each production order line.

| Property | Value |
|---|---|
| **Source Table** | Prod. Order Component |
| Page ID | 90963 |
| Page Name | `ocpfProdOrderComponents` |
| Entity Set Name | `ocpfProdOrderComponents` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 60 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `status` | Status | Status | ✅ |
| 3 | `prodOrderNo` | Prod. Order No. | Prod. Order No. | ✅ |
| 4 | `prodOrderLineNo` | Prod. Order Line No. | Prod. Order Line No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `itemNo` | Item No. | Item No. | ✅ |
| 7 | `description` | Description | Description | ✅ |
| 8 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 9 | `quantity` | Quantity | Quantity | ✅ |
| 10 | `position` | Position | Position | ✅ |
| 11 | `position2` | Position 2 | Position 2 | ✅ |
| 12 | `position3` | Position 3 | Position 3 | ✅ |
| 13 | `leadTimeOffset` | Lead-Time Offset | Lead-Time Offset | ✅ |
| 14 | `routingLinkCode` | Routing Link Code | Routing Link Code | ✅ |
| 15 | `scrapPct` | Scrap % | Scrap % | ✅ |
| 16 | `variantCode` | Variant Code | Variant Code | ✅ |
| 17 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 18 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 19 | `expectedQuantity` | Expected Quantity | Expected Quantity | ✅ |
| 20 | `remainingQuantity` | Remaining Quantity | Remaining Quantity | ✅ |
| 21 | `actConsumptionQty` | Act. Consumption (Qty) | Act. Consumption (Qty) | 🧮 computed |
| 22 | `flushingMethod` | Flushing Method | Flushing Method | ✅ |
| 23 | `locationCode` | Location Code | Location Code | ✅ |
| 24 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 25 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 26 | `binCode` | Bin Code | Bin Code | ✅ |
| 27 | `suppliedByLineNo` | Supplied-by Line No. | Supplied-by Line No. | ✅ |
| 28 | `planningLevelCode` | Planning Level Code | Planning Level Code | ✅ |
| 29 | `itemLowLevelCode` | Item Low-Level Code | Item Low-Level Code | ✅ |
| 30 | `length` | Length | Length | ✅ |
| 31 | `width` | Width | Width | ✅ |
| 32 | `weight` | Weight | Weight | ✅ |
| 33 | `depth` | Depth | Depth | ✅ |
| 34 | `calculationFormula` | Calculation Formula | Calculation Formula | ✅ |
| 35 | `quantityPer` | Quantity per | Quantity per | ✅ |
| 36 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 37 | `costAmount` | Cost Amount | Cost Amount | ✅ |
| 38 | `dueDate` | Due Date | Due Date | ✅ |
| 39 | `dueTime` | Due Time | Due Time | ✅ |
| 40 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 41 | `remainingQtyBase` | Remaining Qty. (Base) | Remaining Qty. (Base) | ✅ |
| 42 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 43 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 44 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 45 | `expectedQtyBase` | Expected Qty. (Base) | Expected Qty. (Base) | ✅ |
| 46 | `dueDateTime` | Due Date-Time | Due Date-Time | ✅ |
| 47 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 48 | `substitutionAvailable` | Substitution Available | Substitution Available | 🧮 computed |
| 49 | `originalItemNo` | Original Item No. | Original Item No. | ✅ |
| 50 | `originalVariantCode` | Original Variant Code | Original Variant Code | ✅ |
| 51 | `pickQty` | Pick Qty. | Pick Qty. | 🧮 computed |
| 52 | `qtyPicked` | Qty. Picked | Qty. Picked | ✅ |
| 53 | `qtyPickedBase` | Qty. Picked (Base) | Qty. Picked (Base) | ✅ |
| 54 | `completelyPicked` | Completely Picked | Completely Picked | ✅ |
| 55 | `pickQtyBase` | Pick Qty. (Base) | Pick Qty. (Base) | 🧮 computed |
| 56 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | ✅ |
| 57 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | ✅ |
| 58 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |
| 59 | `directCostAmount` | Direct Cost Amount | Direct Cost Amount | ✅ |
| 60 | `overheadAmount` | Overhead Amount | Overhead Amount | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfProdOrderRoutingLines

**Description:** Production Order Routing Lines — the scheduled operations for each production order.

| Property | Value |
|---|---|
| **Source Table** | Prod. Order Routing Line |
| Page ID | 90964 |
| Page Name | `ocpfProdOrderRoutingLines` |
| Entity Set Name | `ocpfProdOrderRoutingLines` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 63 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `routingNo` | Routing No. | Routing No. | ✅ |
| 3 | `routingReferenceNo` | Routing Reference No. | Routing Reference No. | ✅ |
| 4 | `operationNo` | Operation No. | Operation No. | ✅ |
| 5 | `nextOperationNo` | Next Operation No. | Next Operation No. | ✅ |
| 6 | `previousOperationNo` | Previous Operation No. | Previous Operation No. | ✅ |
| 7 | `type` | Type | Type | ✅ |
| 8 | `no` | No. | No. | ✅ |
| 9 | `workCenterNo` | Work Center No. | Work Center No. | ✅ |
| 10 | `workCenterGroupCode` | Work Center Group Code | Work Center Group Code | ✅ |
| 11 | `description` | Description | Description | ✅ |
| 12 | `setupTime` | Setup Time | Setup Time | ✅ |
| 13 | `runTime` | Run Time | Run Time | ✅ |
| 14 | `waitTime` | Wait Time | Wait Time | ✅ |
| 15 | `moveTime` | Move Time | Move Time | ✅ |
| 16 | `fixedScrapQuantity` | Fixed Scrap Quantity | Fixed Scrap Quantity | ✅ |
| 17 | `lotSize` | Lot Size | Lot Size | ✅ |
| 18 | `scrapFactorPct` | Scrap Factor % | Scrap Factor % | ✅ |
| 19 | `setupTimeUnitOfMeasCode` | Setup Time Unit of Meas. Code | Setup Time Unit of Meas. Code | ✅ |
| 20 | `runTimeUnitOfMeasCode` | Run Time Unit of Meas. Code | Run Time Unit of Meas. Code | ✅ |
| 21 | `waitTimeUnitOfMeasCode` | Wait Time Unit of Meas. Code | Wait Time Unit of Meas. Code | ✅ |
| 22 | `moveTimeUnitOfMeasCode` | Move Time Unit of Meas. Code | Move Time Unit of Meas. Code | ✅ |
| 23 | `minimumProcessTime` | Minimum Process Time | Minimum Process Time | ✅ |
| 24 | `maximumProcessTime` | Maximum Process Time | Maximum Process Time | ✅ |
| 25 | `concurrentCapacities` | Concurrent Capacities | Concurrent Capacities | ✅ |
| 26 | `sendAheadQuantity` | Send-Ahead Quantity | Send-Ahead Quantity | ✅ |
| 27 | `routingLinkCode` | Routing Link Code | Routing Link Code | ✅ |
| 28 | `standardTaskCode` | Standard Task Code | Standard Task Code | ✅ |
| 29 | `unitCostPer` | Unit Cost per | Unit Cost per | ✅ |
| 30 | `recalculate` | Recalculate | Recalculate | ✅ |
| 31 | `sequenceNoForward` | Sequence No. (Forward) | Sequence No. (Forward) | ✅ |
| 32 | `sequenceNoBackward` | Sequence No. (Backward) | Sequence No. (Backward) | ✅ |
| 33 | `fixedScrapQtyAccum` | Fixed Scrap Qty. (Accum.) | Fixed Scrap Qty. (Accum.) | ✅ |
| 34 | `scrapFactorPctAccumulated` | Scrap Factor % (Accumulated) | Scrap Factor % (Accumulated) | ✅ |
| 35 | `sequenceNoActual` | Sequence No. (Actual) | Sequence No. (Actual) | ✅ |
| 36 | `directUnitCost` | Direct Unit Cost | Direct Unit Cost | ✅ |
| 37 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | ✅ |
| 38 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |
| 39 | `startingTime` | Starting Time | Starting Time | ✅ |
| 40 | `startingDate` | Starting Date | Starting Date | ✅ |
| 41 | `endingTime` | Ending Time | Ending Time | ✅ |
| 42 | `endingDate` | Ending Date | Ending Date | ✅ |
| 43 | `status` | Status | Status | ✅ |
| 44 | `prodOrderNo` | Prod. Order No. | Prod. Order No. | ✅ |
| 45 | `unitCostCalculation` | Unit Cost Calculation | Unit Cost Calculation | ✅ |
| 46 | `inputQuantity` | Input Quantity | Input Quantity | ✅ |
| 47 | `criticalPath` | Critical Path | Critical Path | ✅ |
| 48 | `routingStatus` | Routing Status | Routing Status | ✅ |
| 49 | `flushingMethod` | Flushing Method | Flushing Method | ✅ |
| 50 | `expectedOperationCostAmt` | Expected Operation Cost Amt. | Expected Operation Cost Amt. | ✅ |
| 51 | `expectedCapacityNeed` | Expected Capacity Need | Expected Capacity Need | ✅ |
| 52 | `expectedCapacityOvhdCost` | Expected Capacity Ovhd. Cost | Expected Capacity Ovhd. Cost | ✅ |
| 53 | `startingDateTime` | Starting Date-Time | Starting Date-Time | ✅ |
| 54 | `endingDateTime` | Ending Date-Time | Ending Date-Time | ✅ |
| 55 | `scheduleManually` | Schedule Manually | Schedule Manually | ✅ |
| 56 | `locationCode` | Location Code | Location Code | ✅ |
| 57 | `openShopFloorBinCode` | Open Shop Floor Bin Code | Open Shop Floor Bin Code | ✅ |
| 58 | `toProductionBinCode` | To-Production Bin Code | To-Production Bin Code | ✅ |
| 59 | `fromProductionBinCode` | From-Production Bin Code | From-Production Bin Code | ✅ |
| 60 | `postedOutputQuantity` | Posted Output Quantity | Posted Output Quantity | 🧮 computed |
| 61 | `postedScrapQuantity` | Posted Scrap Quantity | Posted Scrap Quantity | 🧮 computed |
| 62 | `postedRunTime` | Posted Run Time | Posted Run Time | 🧮 computed |
| 63 | `postedSetupTime` | Posted Setup Time | Posted Setup Time | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfProdOrderCapacityNeeds

**Description:** Production Order Capacity Needs — calculated capacity requirements per operation and time bucket. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Prod. Order Capacity Need |
| Page ID | 90965 |
| Page Name | `ocpfProdOrderCapacityNeeds` |
| Entity Set Name | `ocpfProdOrderCapacityNeeds` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 29 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `status` | Status | Status | — |
| 3 | `prodOrderNo` | Prod. Order No. | Prod. Order No. | — |
| 4 | `routingNo` | Routing No. | Routing No. | — |
| 5 | `lineNo` | Line No. | Line No. | — |
| 6 | `operationNo` | Operation No. | Operation No. | — |
| 7 | `type` | Type | Type | — |
| 8 | `no` | No. | No. | — |
| 9 | `workCenterNo` | Work Center No. | Work Center No. | — |
| 10 | `workCenterGroupCode` | Work Center Group Code | Work Center Group Code | — |
| 11 | `routingReferenceNo` | Routing Reference No. | Routing Reference No. | — |
| 12 | `date` | Date | Date | — |
| 13 | `startingTime` | Starting Time | Starting Time | — |
| 14 | `endingTime` | Ending Time | Ending Time | — |
| 15 | `allocatedTime` | Allocated Time | Allocated Time | — |
| 16 | `sendAheadType` | Send-Ahead Type | Send-Ahead Type | — |
| 17 | `timeType` | Time Type | Time Type | — |
| 18 | `neededTime` | Needed Time | Needed Time | — |
| 19 | `neededTimeMs` | Needed Time (ms) | Needed Time (ms) | — |
| 20 | `lotSize` | Lot Size | Lot Size | — |
| 21 | `concurrentCapacities` | Concurrent Capacities | Concurrent Capacities | — |
| 22 | `efficiency` | Efficiency | Efficiency | — |
| 23 | `startingDateTime` | Starting Date-Time | Starting Date-Time | — |
| 24 | `endingDateTime` | Ending Date-Time | Ending Date-Time | — |
| 25 | `worksheetTemplateName` | Worksheet Template Name | Worksheet Template Name | — |
| 26 | `worksheetBatchName` | Worksheet Batch Name | Worksheet Batch Name | — |
| 27 | `worksheetLineNo` | Worksheet Line No. | Worksheet Line No. | — |
| 28 | `active` | Active | Active | — |
| 29 | `requestedOnly` | Requested Only | Requested Only | — |


[↑ Back to top](#table-of-contents)

---

### ocpfCapacityLedgerEntries

**Description:** Capacity Ledger Entries — posted output, run times, and stop/scrap quantities per operation. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Capacity Ledger Entry |
| Page ID | 90966 |
| Page Name | `ocpfCapacityLedgerEntries` |
| Entity Set Name | `ocpfCapacityLedgerEntries` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 40 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `postingDate` | Posting Date | Posting Date | — |
| 5 | `type` | Type | Type | — |
| 6 | `documentNo` | Document No. | Document No. | — |
| 7 | `description` | Description | Description | — |
| 8 | `quantity` | Quantity | Quantity | — |
| 9 | `invoicedQuantity` | Invoiced Quantity | Invoiced Quantity | — |
| 10 | `itemRegisterNo` | Item Register No. | Item Register No. | — |
| 11 | `siftBucketNo` | SIFT Bucket No. | SIFT Bucket No. | — |
| 12 | `capUnitOfMeasureCode` | Cap. Unit of Measure Code | Cap. Unit of Measure Code | — |
| 13 | `qtyPerCapUnitOfMeasure` | Qty. per Cap. Unit of Measure | Qty. per Cap. Unit of Measure | — |
| 14 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 15 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 16 | `completelyInvoiced` | Completely Invoiced | Completely Invoiced | — |
| 17 | `itemNo` | Item No. | Item No. | — |
| 18 | `variantCode` | Variant Code | Variant Code | — |
| 19 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 20 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 21 | `documentDate` | Document Date | Document Date | — |
| 22 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 23 | `directCost` | Direct Cost | Direct Cost | 🧮 computed |
| 24 | `overheadCost` | Overhead Cost | Overhead Cost | 🧮 computed |
| 25 | `directCostAcy` | Direct Cost (ACY) | Direct Cost (ACY) | 🧮 computed |
| 26 | `overheadCostAcy` | Overhead Cost (ACY) | Overhead Cost (ACY) | 🧮 computed |
| 27 | `subcontracting` | Subcontracting | Subcontracting | — |
| 28 | `reversed` | Reversed | Reversed | — |
| 29 | `reversedByEntryNo` | Reversed by Entry No. | Reversed by Entry No. | — |
| 30 | `reversedEntryNo` | Reversed Entry No. | Reversed Entry No. | — |
| 31 | `orderType` | Order Type | Order Type | — |
| 32 | `orderNo` | Order No. | Order No. | — |
| 33 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 34 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 35 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 36 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 37 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 38 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 39 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 40 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfAssemblySetup

**Description:** Assembly Setup — company-wide settings and number series for assembly management.

| Property | Value |
|---|---|
| **Source Table** | Assembly Setup |
| Page ID | 90967 |
| Page Name | `ocpfAssemblySetup` |
| Entity Set Name | `ocpfAssemblySetup` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 12 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `primaryKey` | Primary Key | Primary Key | ✅ |
| 3 | `stockoutWarning` | Stockout Warning | Stockout Warning | ✅ |
| 4 | `assemblyOrderNos` | Assembly Order Nos. | Assembly Order Nos. | ✅ |
| 5 | `assemblyQuoteNos` | Assembly Quote Nos. | Assembly Quote Nos. | ✅ |
| 6 | `blanketAssemblyOrderNos` | Blanket Assembly Order Nos. | Blanket Assembly Order Nos. | ✅ |
| 7 | `postedAssemblyOrderNos` | Posted Assembly Order Nos. | Posted Assembly Order Nos. | ✅ |
| 8 | `copyComponentDimensionsFrom` | Copy Component Dimensions from | Copy Component Dimensions from | ✅ |
| 9 | `defaultLocationForOrders` | Default Location for Orders | Default Location for Orders | ✅ |
| 10 | `copyCommentsWhenPosting` | Copy Comments when Posting | Copy Comments when Posting | ✅ |
| 11 | `createMovementsAutomatically` | Create Movements Automatically | Create Movements Automatically | ✅ |
| 12 | `defaultGenBusPostGroup` | Default Gen. Bus. Post. Group | Default General Business Posting Group | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfBomComponents

**Description:** Assembly BOM Components — the component lines (items or resources) that define an assembly item's bill of materials.

| Property | Value |
|---|---|
| **Source Table** | BOM Component |
| Page ID | 90968 |
| Page Name | `ocpfBomComponents` |
| Entity Set Name | `ocpfBomComponents` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 19 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `parentItemNo` | Parent Item No. | Parent Item No. | ✅ |
| 3 | `lineNo` | Line No. | Line No. | ✅ |
| 4 | `type` | Type | Type | ✅ |
| 5 | `no` | No. | No. | ✅ |
| 6 | `assemblyBom` | Assembly BOM | Assembly BOM | 🧮 computed |
| 7 | `description` | Description | Description | ✅ |
| 8 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 9 | `quantityPer` | Quantity per | Quantity per | ✅ |
| 10 | `position` | Position | Position | ✅ |
| 11 | `position2` | Position 2 | Position 2 | ✅ |
| 12 | `position3` | Position 3 | Position 3 | ✅ |
| 13 | `machineNo` | Machine No. | Machine No. | ✅ |
| 14 | `leadTimeOffset` | Lead-Time Offset | Lead-Time Offset | ✅ |
| 15 | `bomDescription` | BOM Description | BOM Description | 🧮 computed |
| 16 | `resourceUsageType` | Resource Usage Type | Resource Usage Type | ✅ |
| 17 | `variantCode` | Variant Code | Variant Code | ✅ |
| 18 | `installedInLineNo` | Installed in Line No. | Installed in Line No. | ✅ |
| 19 | `installedInItemNo` | Installed in Item No. | Installed in Item No. | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfAssemblyHeaders

**Description:** Assembly Orders — open assembly order and quote headers for assemble-to-stock and assemble-to-order flows.

| Property | Value |
|---|---|
| **Source Table** | Assembly Header |
| Page ID | 90969 |
| Page Name | `ocpfAssemblyHeaders` |
| Entity Set Name | `ocpfAssemblyHeaders` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 50 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `no` | No. | No. | ✅ |
| 4 | `description` | Description | Description | ✅ |
| 5 | `searchDescription` | Search Description | Search Description | ✅ |
| 6 | `description2` | Description 2 | Description 2 | ✅ |
| 7 | `creationDate` | Creation Date | Creation Date | ✅ |
| 8 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 9 | `itemNo` | Item No. | Item No. | ✅ |
| 10 | `variantCode` | Variant Code | Variant Code | ✅ |
| 11 | `inventoryPostingGroup` | Inventory Posting Group | Inventory Posting Group | ✅ |
| 12 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 13 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 14 | `comment` | Comment | Comment | 🧮 computed |
| 15 | `locationCode` | Location Code | Location Code | ✅ |
| 16 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 17 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 18 | `postingDate` | Posting Date | Posting Date | ✅ |
| 19 | `dueDate` | Due Date | Due Date | ✅ |
| 20 | `startingDate` | Starting Date | Starting Date | ✅ |
| 21 | `endingDate` | Ending Date | Ending Date | ✅ |
| 22 | `binCode` | Bin Code | Bin Code | ✅ |
| 23 | `quantity` | Quantity | Quantity | ✅ |
| 24 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 25 | `remainingQuantity` | Remaining Quantity | Remaining Quantity | ✅ |
| 26 | `remainingQuantityBase` | Remaining Quantity (Base) | Remaining Quantity (Base) | ✅ |
| 27 | `assembledQuantity` | Assembled Quantity | Assembled Quantity | ✅ |
| 28 | `assembledQuantityBase` | Assembled Quantity (Base) | Assembled Quantity (Base) | ✅ |
| 29 | `quantityToAssemble` | Quantity to Assemble | Quantity to Assemble | ✅ |
| 30 | `quantityToAssembleBase` | Quantity to Assemble (Base) | Quantity to Assemble (Base) | ✅ |
| 31 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 32 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 33 | `planningFlexibility` | Planning Flexibility | Planning Flexibility | ✅ |
| 34 | `mpsOrder` | MPS Order | MPS Order | ✅ |
| 35 | `assembleToOrder` | Assemble to Order | Assemble to Order | 🧮 computed |
| 36 | `postingNo` | Posting No. | Posting No. | ✅ |
| 37 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 38 | `costAmount` | Cost Amount | Cost Amount | ✅ |
| 39 | `rolledUpAssemblyCost` | Rolled-up Assembly Cost | Rolled-up Assembly Cost | 🧮 computed |
| 40 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | ✅ |
| 41 | `overheadRate` | Overhead Rate | Overhead Rate | ✅ |
| 42 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 43 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 44 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 45 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 46 | `noSeries` | No. Series | No. Series | ✅ |
| 47 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 48 | `status` | Status | Status | ✅ |
| 49 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 50 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfAssemblyLines

**Description:** Assembly Lines — component consumption lines of open assembly orders.

| Property | Value |
|---|---|
| **Source Table** | Assembly Line |
| Page ID | 90970 |
| Page Name | `ocpfAssemblyLines` |
| Entity Set Name | `ocpfAssemblyLines` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 50 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `documentNo` | Document No. | Document No. | ✅ |
| 4 | `lineNo` | Line No. | Line No. | ✅ |
| 5 | `type` | Type | Type | ✅ |
| 6 | `no` | No. | No. | ✅ |
| 7 | `variantCode` | Variant Code | Variant Code | ✅ |
| 8 | `description` | Description | Description | ✅ |
| 9 | `description2` | Description 2 | Description 2 | ✅ |
| 10 | `leadTimeOffset` | Lead-Time Offset | Lead-Time Offset | ✅ |
| 11 | `resourceUsageType` | Resource Usage Type | Resource Usage Type | ✅ |
| 12 | `locationCode` | Location Code | Location Code | ✅ |
| 13 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 14 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 15 | `binCode` | Bin Code | Bin Code | ✅ |
| 16 | `position` | Position | Position | ✅ |
| 17 | `position2` | Position 2 | Position 2 | ✅ |
| 18 | `position3` | Position 3 | Position 3 | ✅ |
| 19 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 20 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | ✅ |
| 21 | `quantity` | Quantity | Quantity | ✅ |
| 22 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 23 | `remainingQuantity` | Remaining Quantity | Remaining Quantity | ✅ |
| 24 | `remainingQuantityBase` | Remaining Quantity (Base) | Remaining Quantity (Base) | ✅ |
| 25 | `consumedQuantity` | Consumed Quantity | Consumed Quantity | ✅ |
| 26 | `consumedQuantityBase` | Consumed Quantity (Base) | Consumed Quantity (Base) | ✅ |
| 27 | `quantityToConsume` | Quantity to Consume | Quantity to Consume | ✅ |
| 28 | `quantityToConsumeBase` | Quantity to Consume (Base) | Quantity to Consume (Base) | ✅ |
| 29 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 30 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 31 | `availWarning` | Avail. Warning | Avail. Warning | ✅ |
| 32 | `substitutionAvailable` | Substitution Available | Substitution Available | 🧮 computed |
| 33 | `dueDate` | Due Date | Due Date | ✅ |
| 34 | `reserve` | Reserve | Reserve | ✅ |
| 35 | `quantityPer` | Quantity per | Quantity per | ✅ |
| 36 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 37 | `inventoryPostingGroup` | Inventory Posting Group | Inventory Posting Group | ✅ |
| 38 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 39 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 40 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 41 | `costAmount` | Cost Amount | Cost Amount | ✅ |
| 42 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 43 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 44 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 45 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 46 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 47 | `pickQty` | Pick Qty. | Pick Qty. | 🧮 computed |
| 48 | `pickQtyBase` | Pick Qty. (Base) | Pick Qty. (Base) | 🧮 computed |
| 49 | `qtyPicked` | Qty. Picked | Qty. Picked | ✅ |
| 50 | `qtyPickedBase` | Qty. Picked (Base) | Qty. Picked (Base) | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedAssemblyHeaders

**Description:** Posted Assembly Orders — headers of posted (completed) assembly orders. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Posted Assembly Header |
| Page ID | 90971 |
| Page Name | `ocpfPostedAssemblyHeaders` |
| Entity Set Name | `ocpfPostedAssemblyHeaders` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 37 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | — |
| 3 | `description` | Description | Description | — |
| 4 | `searchDescription` | Search Description | Search Description | — |
| 5 | `description2` | Description 2 | Description 2 | — |
| 6 | `orderNo` | Order No. | Order No. | — |
| 7 | `itemNo` | Item No. | Item No. | — |
| 8 | `variantCode` | Variant Code | Variant Code | — |
| 9 | `inventoryPostingGroup` | Inventory Posting Group | Inventory Posting Group | — |
| 10 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 11 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 12 | `comment` | Comment | Comment | 🧮 computed |
| 13 | `locationCode` | Location Code | Location Code | — |
| 14 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 15 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 16 | `postingDate` | Posting Date | Posting Date | — |
| 17 | `dueDate` | Due Date | Due Date | — |
| 18 | `startingDate` | Starting Date | Starting Date | — |
| 19 | `endingDate` | Ending Date | Ending Date | — |
| 20 | `binCode` | Bin Code | Bin Code | — |
| 21 | `itemRcptEntryNo` | Item Rcpt. Entry No. | Item Rcpt. Entry No. | — |
| 22 | `quantity` | Quantity | Quantity | — |
| 23 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 24 | `assembleToOrder` | Assemble to Order | Assemble to Order | 🧮 computed |
| 25 | `unitCost` | Unit Cost | Unit Cost | — |
| 26 | `costAmount` | Cost Amount | Cost Amount | — |
| 27 | `indirectCostPct` | Indirect Cost % | Indirect Cost % | — |
| 28 | `overheadRate` | Overhead Rate | Overhead Rate | — |
| 29 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 30 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 31 | `reversed` | Reversed | Reversed | — |
| 32 | `noSeries` | No. Series | No. Series | — |
| 33 | `postingNoSeries` | Posting No. Series | Posting No. Series | — |
| 34 | `orderNoSeries` | Order No. Series | Order No. Series | — |
| 35 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 36 | `userId` | User ID | User ID | — |
| 37 | `sourceCode` | Source Code | Source Code | — |


[↑ Back to top](#table-of-contents)

---

### ocpfPostedAssemblyLines

**Description:** Posted Assembly Lines — component lines of posted assembly orders. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Posted Assembly Line |
| Page ID | 90972 |
| Page Name | `ocpfPostedAssemblyLines` |
| Entity Set Name | `ocpfPostedAssemblyLines` |
| API Group | `ocpf_manufacturing` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 32 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentNo` | Document No. | Document No. | — |
| 3 | `lineNo` | Line No. | Line No. | — |
| 4 | `orderNo` | Order No. | Order No. | — |
| 5 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 6 | `type` | Type | Type | — |
| 7 | `no` | No. | No. | — |
| 8 | `variantCode` | Variant Code | Variant Code | — |
| 9 | `description` | Description | Description | — |
| 10 | `description2` | Description 2 | Description 2 | — |
| 11 | `leadTimeOffset` | Lead-Time Offset | Lead-Time Offset | — |
| 12 | `resourceUsageType` | Resource Usage Type | Resource Usage Type | — |
| 13 | `locationCode` | Location Code | Location Code | — |
| 14 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 15 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 16 | `binCode` | Bin Code | Bin Code | — |
| 17 | `position` | Position | Position | — |
| 18 | `position2` | Position 2 | Position 2 | — |
| 19 | `position3` | Position 3 | Position 3 | — |
| 20 | `itemShptEntryNo` | Item Shpt. Entry No. | Item Shpt. Entry No. | — |
| 21 | `quantity` | Quantity | Quantity | — |
| 22 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 23 | `dueDate` | Due Date | Due Date | — |
| 24 | `quantityPer` | Quantity per | Quantity per | — |
| 25 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 26 | `inventoryPostingGroup` | Inventory Posting Group | Inventory Posting Group | — |
| 27 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 28 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 29 | `unitCost` | Unit Cost | Unit Cost | — |
| 30 | `costAmount` | Cost Amount | Cost Amount | — |
| 31 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 32 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |


[↑ Back to top](#table-of-contents)

---

## Service Management

*Category introduced in API v3.1 (`ocpf_serviceManagement`). Covers service items, service documents, contracts, fault/resolution codes, and posted service documents.*

### ocpfServiceMgtSetup

**Description:** Service Management Setup — company-wide settings, defaults, and number series for service management.

| Property | Value |
|---|---|
| **Source Table** | Service Mgt. Setup |
| Page ID | 90924 |
| Page Name | `ocpfServiceMgtSetup` |
| Entity Set Name | `ocpfServiceMgtSetup` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 71 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `primaryKey` | Primary Key | Primary Key | ✅ |
| 3 | `faultReportingLevel` | Fault Reporting Level | Fault Reporting Level | ✅ |
| 4 | `linkServiceToServiceItem` | Link Service to Service Item | Link Service to Service Item | ✅ |
| 5 | `salespersonMandatory` | Salesperson Mandatory | Salesperson Mandatory | ✅ |
| 6 | `warrantyDiscPctParts` | Warranty Disc. % (Parts) | Warranty Disc. % (Parts) | ✅ |
| 7 | `warrantyDiscPctLabor` | Warranty Disc. % (Labor) | Warranty Disc. % (Labor) | ✅ |
| 8 | `contractRspTimeMandatory` | Contract Rsp. Time Mandatory | Contract Rsp. Time Mandatory | ✅ |
| 9 | `serviceOrderStartingFee` | Service Order Starting Fee | Service Order Starting Fee | ✅ |
| 10 | `registerContractChanges` | Register Contract Changes | Register Contract Changes | ✅ |
| 11 | `contractInvLineTextCode` | Contract Inv. Line Text Code | Contract Inv. Line Text Code | ✅ |
| 12 | `contractLineInvTextCode` | Contract Line Inv. Text Code | Contract Line Inv. Text Code | ✅ |
| 13 | `contractInvPeriodTextCode` | Contract Inv. Period Text Code | Contract Inv. Period Text Code | ✅ |
| 14 | `contractCreditLineTextCode` | Contract Credit Line Text Code | Contract Credit Line Text Code | ✅ |
| 15 | `sendFirstWarningTo` | Send First Warning To | Send First Warning To | ✅ |
| 16 | `sendSecondWarningTo` | Send Second Warning To | Send Second Warning To | ✅ |
| 17 | `sendThirdWarningTo` | Send Third Warning To | Send Third Warning To | ✅ |
| 18 | `firstWarningWithinHours` | First Warning Within (Hours) | First Warning Within (Hours) | ✅ |
| 19 | `secondWarningWithinHours` | Second Warning Within (Hours) | Second Warning Within (Hours) | ✅ |
| 20 | `thirdWarningWithinHours` | Third Warning Within (Hours) | Third Warning Within (Hours) | ✅ |
| 21 | `nextServiceCalcMethod` | Next Service Calc. Method | Next Service Calc. Method | ✅ |
| 22 | `serviceOrderTypeMandatory` | Service Order Type Mandatory | Service Order Type Mandatory | ✅ |
| 23 | `serviceZonesOption` | Service Zones Option | Service Zones Option | ✅ |
| 24 | `serviceOrderStartMandatory` | Service Order Start Mandatory | Service Order Start Mandatory | ✅ |
| 25 | `serviceOrderFinishMandatory` | Service Order Finish Mandatory | Service Order Finish Mandatory | ✅ |
| 26 | `resourceSkillsOption` | Resource Skills Option | Resource Skills Option | ✅ |
| 27 | `oneServiceItemLineOrder` | One Service Item Line/Order | One Service Item Line/Order | ✅ |
| 28 | `unitOfMeasureMandatory` | Unit of Measure Mandatory | Unit of Measure Mandatory | ✅ |
| 29 | `faultReasonCodeMandatory` | Fault Reason Code Mandatory | Fault Reason Code Mandatory | ✅ |
| 30 | `contractServOrdMaxDays` | Contract Serv. Ord.  Max. Days | Contract Serv. Ord.  Max. Days | ✅ |
| 31 | `lastContractServiceDate` | Last Contract Service Date | Last Contract Service Date | ✅ |
| 32 | `workTypeCodeMandatory` | Work Type Code Mandatory | Work Type Code Mandatory | ✅ |
| 33 | `logoPositionOnDocuments` | Logo Position on Documents | Logo Position on Documents | ✅ |
| 34 | `useContractCancelReason` | Use Contract Cancel Reason | Use Contract Cancel Reason | ✅ |
| 35 | `defaultResponseTimeHours` | Default Response Time (Hours) | Default Response Time (Hours) | ✅ |
| 36 | `extDocNoMandatory` | Ext. Doc. No. Mandatory | Ext. Doc. No. Mandatory | ✅ |
| 37 | `defaultWarrantyDuration` | Default Warranty Duration | Default Warranty Duration | ✅ |
| 38 | `serviceInvoiceNos` | Service Invoice Nos. | Service Invoice Nos. | ✅ |
| 39 | `contractInvoiceNos` | Contract Invoice Nos. | Contract Invoice Nos. | ✅ |
| 40 | `serviceItemNos` | Service Item Nos. | Service Item Nos. | ✅ |
| 41 | `serviceOrderNos` | Service Order Nos. | Service Order Nos. | ✅ |
| 42 | `serviceContractNos` | Service Contract Nos. | Service Contract Nos. | ✅ |
| 43 | `contractTemplateNos` | Contract Template Nos. | Contract Template Nos. | ✅ |
| 44 | `troubleshootingNos` | Troubleshooting Nos. | Troubleshooting Nos. | ✅ |
| 45 | `prepaidPostingDocumentNos` | Prepaid Posting Document Nos. | Prepaid Posting Document Nos. | ✅ |
| 46 | `loanerNos` | Loaner Nos. | Loaner Nos. | ✅ |
| 47 | `servJobResponsibilityCode` | Serv. Job Responsibility Code | Serv. Job Responsibility Code | ✅ |
| 48 | `contractValueCalcMethod` | Contract Value Calc. Method | Contract Value Calc. Method | ✅ |
| 49 | `contractValuePct` | Contract Value % | Contract Value % | ✅ |
| 50 | `serviceQuoteNos` | Service Quote Nos. | Service Quote Nos. | ✅ |
| 51 | `postedServiceInvoiceNos` | Posted Service Invoice Nos. | Posted Service Invoice Nos. | ✅ |
| 52 | `postedServCreditMemoNos` | Posted Serv. Credit Memo Nos. | Posted Serv. Credit Memo Nos. | ✅ |
| 53 | `postedServiceShipmentNos` | Posted Service Shipment Nos. | Posted Service Shipment Nos. | ✅ |
| 54 | `shipmentOnInvoice` | Shipment on Invoice | Shipment on Invoice | ✅ |
| 55 | `skipManualReservation` | Skip Manual Reservation | Skip Manual Reservation | ✅ |
| 56 | `copyCommentsOrderToInvoice` | Copy Comments Order to Invoice | Copy Comments Order to Invoice | ✅ |
| 57 | `copyCommentsOrderToShpt` | Copy Comments Order to Shpt. | Copy Comments Order to Shpt. | ✅ |
| 58 | `serviceCreditMemoNos` | Service Credit Memo Nos. | Service Credit Memo Nos. | ✅ |
| 59 | `allowMultiplePostingGroups` | Allow Multiple Posting Groups | Allow Multiple Posting Groups | ✅ |
| 60 | `checkMultiplePostingGroups` | Check Multiple Posting Groups | Check Multiple Posting Groups | ✅ |
| 61 | `archiveQuotes` | Archive Quotes | Archive Quotes | ✅ |
| 62 | `archiveOrders` | Archive Orders | Archive Orders | ✅ |
| 63 | `delFiledContWMainCont` | Del. Filed Cont. w. main Cont. | Delete Filed Contracts with related main Contract | ✅ |
| 64 | `servInvTemplateName` | Serv. Inv. Template Name | Serv. Invoice Template Name | ✅ |
| 65 | `servContrInvTemplName` | Serv. Contr. Inv. Templ. Name | Serv. Contract Invoice Template Name | ✅ |
| 66 | `servContrCrMTemplName` | Serv. Contr. Cr.M. Templ. Name | Serv. Contract Cr. Memo Template Name | ✅ |
| 67 | `servCrMemoTemplName` | Serv. Cr. Memo Templ. Name | Serv. Cr. Memo Template Name | ✅ |
| 68 | `copyLineDescrToGLEntry` | Copy Line Descr. to G/L Entry | Copy Line Descr. to G/L Entry | ✅ |
| 69 | `copyTimeSheetToOrder` | Copy Time Sheet to Order | Copy Time Sheet to Order | ✅ |
| 70 | `baseCalendarCode` | Base Calendar Code | Base Calendar Code | ✅ |
| 71 | `contractCreditMemoNos` | Contract Credit Memo Nos. | Contract Credit Memo Nos. | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceOrderTypes

**Description:** Service Order Types — categories for classifying service orders.

| Property | Value |
|---|---|
| **Source Table** | Service Order Type |
| Page ID | 90925 |
| Page Name | `ocpfServiceOrderTypes` |
| Entity Set Name | `ocpfServiceOrderTypes` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceCosts

**Description:** Service Costs — predefined cost lines (travel, call-out fees) that can be added to service documents.

| Property | Value |
|---|---|
| **Source Table** | Service Cost |
| Page ID | 90926 |
| Page Name | `ocpfServiceCosts` |
| Entity Set Name | `ocpfServiceCosts` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 10 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `accountNo` | Account No. | Account No. | ✅ |
| 5 | `defaultUnitPrice` | Default Unit Price | Default Unit Price | ✅ |
| 6 | `defaultQuantity` | Default Quantity | Default Quantity | ✅ |
| 7 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 8 | `costType` | Cost Type | Cost Type | ✅ |
| 9 | `serviceZoneCode` | Service Zone Code | Service Zone Code | ✅ |
| 10 | `defaultUnitCost` | Default Unit Cost | Default Unit Cost | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceZones

**Description:** Service Zones — geographic zones used to assign resources to customer service areas.

| Property | Value |
|---|---|
| **Source Table** | Service Zone |
| Page ID | 90973 |
| Page Name | `ocpfServiceZones` |
| Entity Set Name | `ocpfServiceZones` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceItemGroups

**Description:** Service Item Groups — groupings of service items with shared defaults for contracts, warranty, and response time.

| Property | Value |
|---|---|
| **Source Table** | Service Item Group |
| Page ID | 90974 |
| Page Name | `ocpfServiceItemGroups` |
| Entity Set Name | `ocpfServiceItemGroups` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 7 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `createServiceItem` | Create Service Item | Create Service Item | ✅ |
| 5 | `defaultContractDiscountPct` | Default Contract Discount % | Default Contract Discount % | ✅ |
| 6 | `defaultServPriceGroupCode` | Default Serv. Price Group Code | Default Serv. Price Group Code | ✅ |
| 7 | `defaultResponseTimeHours` | Default Response Time (Hours) | Default Response Time (Hours) | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfRepairStatuses

**Description:** Repair Statuses — stages of repair work on service item lines and how they affect service order status.

| Property | Value |
|---|---|
| **Source Table** | Repair Status |
| Page ID | 90975 |
| Page Name | `ocpfRepairStatuses` |
| Entity Set Name | `ocpfRepairStatuses` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 19 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `serviceOrderStatus` | Service Order Status | Service Order Status | ✅ |
| 5 | `priority` | Priority | Priority | ✅ |
| 6 | `initial` | Initial | Initial | ✅ |
| 7 | `partlyServiced` | Partly Serviced | Partly Serviced | ✅ |
| 8 | `inProcess` | In Process | In Process | ✅ |
| 9 | `finished` | Finished | Finished | ✅ |
| 10 | `referred` | Referred | Referred | ✅ |
| 11 | `sparePartOrdered` | Spare Part Ordered | Spare Part Ordered | ✅ |
| 12 | `sparePartReceived` | Spare Part Received | Spare Part Received | ✅ |
| 13 | `waitingForCustomer` | Waiting for Customer | Waiting for Customer | ✅ |
| 14 | `quoteFinished` | Quote Finished | Quote Finished | ✅ |
| 15 | `postingAllowed` | Posting Allowed | Posting Allowed | ✅ |
| 16 | `pendingStatusAllowed` | Pending Status Allowed | Pending Status Allowed | ✅ |
| 17 | `inProcessStatusAllowed` | In Process Status Allowed | In Process Status Allowed | ✅ |
| 18 | `finishedStatusAllowed` | Finished Status Allowed | Finished Status Allowed | ✅ |
| 19 | `onHoldStatusAllowed` | On Hold Status Allowed | On Hold Status Allowed | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfFaultAreas

**Description:** Fault Areas — areas of a service item where faults occur, used in fault reporting.

| Property | Value |
|---|---|
| **Source Table** | Fault Area |
| Page ID | 90976 |
| Page Name | `ocpfFaultAreas` |
| Entity Set Name | `ocpfFaultAreas` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfSymptomCodes

**Description:** Symptom Codes — customer-reported symptoms used in service fault reporting.

| Property | Value |
|---|---|
| **Source Table** | Symptom Code |
| Page ID | 90977 |
| Page Name | `ocpfSymptomCodes` |
| Entity Set Name | `ocpfSymptomCodes` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfFaultCodes

**Description:** Fault Codes — identified faults, optionally per fault area and symptom, used in service fault reporting.

| Property | Value |
|---|---|
| **Source Table** | Fault Code |
| Page ID | 90978 |
| Page Name | `ocpfFaultCodes` |
| Entity Set Name | `ocpfFaultCodes` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 5 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `faultAreaCode` | Fault Area Code | Fault Area Code | ✅ |
| 3 | `symptomCode` | Symptom Code | Symptom Code | ✅ |
| 4 | `code` | Code | Code | ✅ |
| 5 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfFaultReasonCodes

**Description:** Fault Reason Codes — root-cause reasons for faults, with options to exclude warranty or contract discounts.

| Property | Value |
|---|---|
| **Source Table** | Fault Reason Code |
| Page ID | 90979 |
| Page Name | `ocpfFaultReasonCodes` |
| Entity Set Name | `ocpfFaultReasonCodes` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 5 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `excludeWarrantyDiscount` | Exclude Warranty Discount | Exclude Warranty Discount | ✅ |
| 5 | `excludeContractDiscount` | Exclude Contract Discount | Exclude Contract Discount | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfResolutionCodes

**Description:** Resolution Codes — how faults were resolved, used in service fault/resolution reporting.

| Property | Value |
|---|---|
| **Source Table** | Resolution Code |
| Page ID | 90980 |
| Page Name | `ocpfResolutionCodes` |
| Entity Set Name | `ocpfResolutionCodes` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 3 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfLoaners

**Description:** Loaners — units lent to customers while their service items are being repaired.

| Property | Value |
|---|---|
| **Source Table** | Loaner |
| Page ID | 90981 |
| Page Name | `ocpfLoaners` |
| Entity Set Name | `ocpfLoaners` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 14 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `description2` | Description 2 | Description 2 | ✅ |
| 5 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 6 | `itemNo` | Item No. | Item No. | ✅ |
| 7 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |
| 8 | `comment` | Comment | Comment | 🧮 computed |
| 9 | `blocked` | Blocked | Blocked | ✅ |
| 10 | `noSeries` | No. Series | No. Series | ✅ |
| 11 | `documentNo` | Document No. | Document No. | 🧮 computed |
| 12 | `lent` | Lent | Lent | 🧮 computed |
| 13 | `serialNo` | Serial No. | Serial No. | ✅ |
| 14 | `documentType` | Document Type | Document Type | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfLoanerEntries

**Description:** Loaner Entries — the lending and receiving history of loaner units. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Loaner Entry |
| Page ID | 90982 |
| Page Name | `ocpfLoanerEntries` |
| Entity Set Name | `ocpfLoanerEntries` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 14 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `loanerNo` | Loaner No. | Loaner No. | — |
| 4 | `documentNo` | Document No. | Document No. | — |
| 5 | `serviceItemLineNo` | Service Item Line No. | Service Item Line No. | — |
| 6 | `serviceItemNo` | Service Item No. | Service Item No. | — |
| 7 | `serviceItemGroupCode` | Service Item Group Code | Service Item Group Code | — |
| 8 | `customerNo` | Customer No. | Customer No. | — |
| 9 | `dateLent` | Date Lent | Date Lent | — |
| 10 | `timeLent` | Time Lent | Time Lent | — |
| 11 | `dateReceived` | Date Received | Date Received | — |
| 12 | `timeReceived` | Time Received | Time Received | — |
| 13 | `lent` | Lent | Lent | — |
| 14 | `documentType` | Document Type | Document Type | — |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceItems

**Description:** Service Items — customer-owned equipment units that are serviced, with warranty, contract, and installation details.

| Property | Value |
|---|---|
| **Source Table** | Service Item |
| Page ID | 90983 |
| Page Name | `ocpfServiceItems` |
| Entity Set Name | `ocpfServiceItems` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 82 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | ✅ |
| 3 | `serialNo` | Serial No. | Serial No. | ✅ |
| 4 | `serviceItemGroupCode` | Service Item Group Code | Service Item Group Code | ✅ |
| 5 | `description` | Description | Description | ✅ |
| 6 | `description2` | Description 2 | Description 2 | ✅ |
| 7 | `status` | Status | Status | ✅ |
| 8 | `priority` | Priority | Priority | ✅ |
| 9 | `customerNo` | Customer No. | Customer No. | ✅ |
| 10 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 11 | `itemNo` | Item No. | Item No. | ✅ |
| 12 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 13 | `locationOfServiceItem` | Location of Service Item | Location of Service Item | ✅ |
| 14 | `salesUnitPrice` | Sales Unit Price | Sales Unit Price | ✅ |
| 15 | `salesUnitCost` | Sales Unit Cost | Sales Unit Cost | ✅ |
| 16 | `warrantyStartingDateLabor` | Warranty Starting Date (Labor) | Warranty Starting Date (Labor) | ✅ |
| 17 | `warrantyEndingDateLabor` | Warranty Ending Date (Labor) | Warranty Ending Date (Labor) | ✅ |
| 18 | `warrantyStartingDateParts` | Warranty Starting Date (Parts) | Warranty Starting Date (Parts) | ✅ |
| 19 | `warrantyEndingDateParts` | Warranty Ending Date (Parts) | Warranty Ending Date (Parts) | ✅ |
| 20 | `warrantyPctParts` | Warranty % (Parts) | Warranty % (Parts) | ✅ |
| 21 | `warrantyPctLabor` | Warranty % (Labor) | Warranty % (Labor) | ✅ |
| 22 | `responseTimeHours` | Response Time (Hours) | Response Time (Hours) | ✅ |
| 23 | `installationDate` | Installation Date | Installation Date | ✅ |
| 24 | `salesDate` | Sales Date | Sales Date | ✅ |
| 25 | `lastServiceDate` | Last Service Date | Last Service Date | ✅ |
| 26 | `defaultContractValue` | Default Contract Value | Default Contract Value | ✅ |
| 27 | `defaultContractDiscountPct` | Default Contract Discount % | Default Contract Discount % | ✅ |
| 28 | `noOfActiveContracts` | No. of Active Contracts | No. of Active Contracts | 🧮 computed |
| 29 | `vendorNo` | Vendor No. | Vendor No. | ✅ |
| 30 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | ✅ |
| 31 | `blocked` | Blocked | Blocked | ✅ |
| 32 | `noSeries` | No. Series | No. Series | ✅ |
| 33 | `itemDescription` | Item Description | Item Description | 🧮 computed |
| 34 | `name` | Name | Name | 🧮 computed |
| 35 | `address` | Address | Address | 🧮 computed |
| 36 | `address2` | Address 2 | Address 2 | 🧮 computed |
| 37 | `postCode` | Post Code | Post Code | 🧮 computed |
| 38 | `city` | City | City | 🧮 computed |
| 39 | `contact` | Contact | Contact | 🧮 computed |
| 40 | `phoneNo` | Phone No. | Phone No. | 🧮 computed |
| 41 | `shipToName` | Ship-to Name | Ship-to Name | 🧮 computed |
| 42 | `shipToAddress` | Ship-to Address | Ship-to Address | 🧮 computed |
| 43 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | 🧮 computed |
| 44 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | 🧮 computed |
| 45 | `shipToCity` | Ship-to City | Ship-to City | 🧮 computed |
| 46 | `shipToContact` | Ship-to Contact | Ship-to Contact | 🧮 computed |
| 47 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | 🧮 computed |
| 48 | `usageCost` | Usage (Cost) | Usage (Cost) | 🧮 computed |
| 49 | `usageAmount` | Usage (Amount) | Usage (Amount) | 🧮 computed |
| 50 | `invoicedAmount` | Invoiced Amount | Invoiced Amount | 🧮 computed |
| 51 | `totalQuantity` | Total Quantity | Total Quantity | 🧮 computed |
| 52 | `totalQtyInvoiced` | Total Qty. Invoiced | Total Qty. Invoiced | 🧮 computed |
| 53 | `resourcesUsed` | Resources Used | Resources Used | 🧮 computed |
| 54 | `partsUsed` | Parts Used | Parts Used | 🧮 computed |
| 55 | `costUsed` | Cost Used | Cost Used | 🧮 computed |
| 56 | `vendorName` | Vendor Name | Vendor Name | 🧮 computed |
| 57 | `vendorItemName` | Vendor Item Name | Vendor Item Name | ✅ |
| 58 | `comment` | Comment | Comment | 🧮 computed |
| 59 | `serviceItemComponents` | Service Item Components | Service Item Components | 🧮 computed |
| 60 | `preferredResource` | Preferred Resource | Preferred Resource | ✅ |
| 61 | `variantCode` | Variant Code | Variant Code | ✅ |
| 62 | `county` | County | County | 🧮 computed |
| 63 | `shipToCounty` | Ship-to County | Ship-to County | 🧮 computed |
| 64 | `contractCost` | Contract Cost | Contract Cost | 🧮 computed |
| 65 | `countryRegionCode` | Country/Region Code | Country/Region Code | 🧮 computed |
| 66 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | 🧮 computed |
| 67 | `name2` | Name 2 | Name 2 | 🧮 computed |
| 68 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | 🧮 computed |
| 69 | `servicePriceGroupCode` | Service Price Group Code | Service Price Group Code | ✅ |
| 70 | `defaultContractCost` | Default Contract Cost | Default Contract Cost | ✅ |
| 71 | `prepaidAmount` | Prepaid Amount | Prepaid Amount | 🧮 computed |
| 72 | `searchDescription` | Search Description | Search Description | ✅ |
| 73 | `serviceContracts` | Service Contracts | Service Contracts | 🧮 computed |
| 74 | `totalQtyConsumed` | Total Qty. Consumed | Total Qty. Consumed | 🧮 computed |
| 75 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 76 | `typeFilter` | Type Filter | Type Filter | 🔍 filter |
| 77 | `contractFilter` | Contract Filter | Contract Filter | 🔍 filter |
| 78 | `serviceOrderFilter` | Service Order Filter | Service Order Filter | 🔍 filter |
| 79 | `salesServShptDocumentNo` | Sales/Serv. Shpt. Document No. | Sales/Serv. Shpt. Document No. | ✅ |
| 80 | `salesServShptLineNo` | Sales/Serv. Shpt. Line No. | Sales/Serv. Shpt. Line No. | ✅ |
| 81 | `shipmentType` | Shipment Type | Shipment Type | ✅ |
| 82 | `shipToEMail` | Ship-to E-Mail | Ship-to Email | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceItemComponents

**Description:** Service Item Components — the parts that make up a service item, tracked for replacement history.

| Property | Value |
|---|---|
| **Source Table** | Service Item Component |
| Page ID | 90984 |
| Page Name | `ocpfServiceItemComponents` |
| Entity Set Name | `ocpfServiceItemComponents` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 14 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `parentServiceItemNo` | Parent Service Item No. | Parent Service Item No. | ✅ |
| 3 | `lineNo` | Line No. | Line No. | ✅ |
| 4 | `active` | Active | Active | ✅ |
| 5 | `type` | Type | Type | ✅ |
| 6 | `no` | No. | No. | ✅ |
| 7 | `dateInstalled` | Date Installed | Date Installed | ✅ |
| 8 | `variantCode` | Variant Code | Variant Code | ✅ |
| 9 | `serialNo` | Serial No. | Serial No. | ✅ |
| 10 | `description` | Description | Description | ✅ |
| 11 | `description2` | Description 2 | Description 2 | ✅ |
| 12 | `serviceOrderNo` | Service Order No. | Service Order No. | ✅ |
| 13 | `fromLineNo` | From Line No. | From Line No. | ✅ |
| 14 | `lastDateModified` | Last Date Modified | Last Date Modified | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceHeaders

**Description:** Service Documents — open service quotes, orders, invoices, and credit memos with customer, status, and response details.

| Property | Value |
|---|---|
| **Source Table** | Service Header |
| Page ID | 90985 |
| Page Name | `ocpfServiceHeaders` |
| Entity Set Name | `ocpfServiceHeaders` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 156 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `customerNo` | Customer No. | Customer No. | ✅ |
| 4 | `no` | No. | No. | ✅ |
| 5 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 6 | `billToName` | Bill-to Name | Bill-to Name | ✅ |
| 7 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | ✅ |
| 8 | `billToAddress` | Bill-to Address | Bill-to Address | ✅ |
| 9 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | ✅ |
| 10 | `billToCity` | Bill-to City | Bill-to City | ✅ |
| 11 | `billToContact` | Bill-to Contact | Bill-to Contact | ✅ |
| 12 | `yourReference` | Your Reference | Your Reference | ✅ |
| 13 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 14 | `shipToName` | Ship-to Name | Ship-to Name | ✅ |
| 15 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | ✅ |
| 16 | `shipToAddress` | Ship-to Address | Ship-to Address | ✅ |
| 17 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | ✅ |
| 18 | `shipToCity` | Ship-to City | Ship-to City | ✅ |
| 19 | `shipToContact` | Ship-to Contact | Ship-to Contact | ✅ |
| 20 | `orderDate` | Order Date | Order Date | ✅ |
| 21 | `postingDate` | Posting Date | Posting Date | ✅ |
| 22 | `postingDescription` | Posting Description | Posting Description | ✅ |
| 23 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 24 | `dueDate` | Due Date | Due Date | ✅ |
| 25 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | ✅ |
| 26 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | ✅ |
| 27 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | ✅ |
| 28 | `locationCode` | Location Code | Location Code | ✅ |
| 29 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 30 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 31 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | ✅ |
| 32 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 33 | `currencyFactor` | Currency Factor | Currency Factor | ✅ |
| 34 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 35 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | ✅ |
| 36 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | ✅ |
| 37 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 38 | `languageCode` | Language Code | Language Code | ✅ |
| 39 | `formatRegion` | Format Region | Format Region | ✅ |
| 40 | `salespersonCode` | Salesperson Code | Salesperson Code | ✅ |
| 41 | `comment` | Comment | Comment | 🧮 computed |
| 42 | `noPrinted` | No. Printed | No. Printed | ✅ |
| 43 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | ✅ |
| 44 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | ✅ |
| 45 | `balAccountNo` | Bal. Account No. | Bal. Account No. | ✅ |
| 46 | `amount` | Amount | Amount | 🧮 computed |
| 47 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 48 | `shippingNo` | Shipping No. | Shipping No. | ✅ |
| 49 | `postingNo` | Posting No. | Posting No. | ✅ |
| 50 | `lastShippingNo` | Last Shipping No. | Last Shipping No. | ✅ |
| 51 | `lastPostingNo` | Last Posting No. | Last Posting No. | ✅ |
| 52 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | ✅ |
| 53 | `combineShipments` | Combine Shipments | Combine Shipments | ✅ |
| 54 | `reasonCode` | Reason Code | Reason Code | ✅ |
| 55 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 56 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | ✅ |
| 57 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 58 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 59 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | ✅ |
| 60 | `name` | Name | Name | ✅ |
| 61 | `name2` | Name 2 | Name 2 | ✅ |
| 62 | `address` | Address | Address | ✅ |
| 63 | `address2` | Address 2 | Address 2 | ✅ |
| 64 | `city` | City | City | ✅ |
| 65 | `contactName` | Contact Name | Contact Name | ✅ |
| 66 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | ✅ |
| 67 | `billToCounty` | Bill-to County | Bill-to County | ✅ |
| 68 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | ✅ |
| 69 | `postCode` | Post Code | Post Code | ✅ |
| 70 | `county` | County | County | ✅ |
| 71 | `countryRegionCode` | Country/Region Code | Country/Region Code | ✅ |
| 72 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | ✅ |
| 73 | `shipToCounty` | Ship-to County | Ship-to County | ✅ |
| 74 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | ✅ |
| 75 | `balAccountType` | Bal. Account Type | Bal. Account Type | ✅ |
| 76 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 77 | `correction` | Correction | Correction | ✅ |
| 78 | `documentDate` | Document Date | Document Date | ✅ |
| 79 | `externalDocumentNo` | External Document No. | External Document No. | ✅ |
| 80 | `area` | Area | Area | ✅ |
| 81 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 82 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 83 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 84 | `noSeries` | No. Series | No. Series | ✅ |
| 85 | `postingNoSeries` | Posting No. Series | Posting No. Series | ✅ |
| 86 | `shippingNoSeries` | Shipping No. Series | Shipping No. Series | ✅ |
| 87 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 88 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 89 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 90 | `reserve` | Reserve | Reserve | ✅ |
| 91 | `appliesToId` | Applies-to ID | Applies-to ID | ✅ |
| 92 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | ✅ |
| 93 | `status` | Status | Status | ✅ |
| 94 | `invoiceDiscountCalculation` | Invoice Discount Calculation | Invoice Discount Calculation | ✅ |
| 95 | `invoiceDiscountValue` | Invoice Discount Value | Invoice Discount Value | ✅ |
| 96 | `companyBankAccountCode` | Company Bank Account Code | Bank Account Code | ✅ |
| 97 | `releaseStatus` | Release Status | Release Status | ✅ |
| 98 | `vatReportingDate` | VAT Reporting Date | VAT Date | ✅ |
| 99 | `incomingDocumentEntryNo` | Incoming Document Entry No. | Incoming Document Entry No. | ✅ |
| 100 | `journalTemplName` | Journal Templ. Name | Journal Template Name | ✅ |
| 101 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 102 | `directDebitMandateId` | Direct Debit Mandate ID | Direct Debit Mandate ID | ✅ |
| 103 | `noOfArchivedVersions` | No. of Archived Versions | No. of Archived Versions | 🧮 computed |
| 104 | `docNoOccurrence` | Doc. No. Occurrence | Doc. No. Occurrence | ✅ |
| 105 | `contactNo` | Contact No. | Contact No. | ✅ |
| 106 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | ✅ |
| 107 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 108 | `shippingAdvice` | Shipping Advice | Shipping Advice | ✅ |
| 109 | `completelyShipped` | Completely Shipped | Completely Shipped | 🧮 computed |
| 110 | `locationFilter` | Location Filter | Location Filter | 🔍 filter |
| 111 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 112 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 113 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 114 | `description` | Description | Description | ✅ |
| 115 | `serviceOrderType` | Service Order Type | Service Order Type | ✅ |
| 116 | `linkServiceToServiceItem` | Link Service to Service Item | Link Service to Service Item | ✅ |
| 117 | `priority` | Priority | Priority | ✅ |
| 118 | `allocatedHours` | Allocated Hours | Allocated Hours | 🧮 computed |
| 119 | `phoneNo` | Phone No. | Phone No. | ✅ |
| 120 | `eMail` | E-Mail | Email | ✅ |
| 121 | `phoneNo2` | Phone No. 2 | Phone No. 2 | ✅ |
| 122 | `faxNo` | Fax No. | Fax No. | ✅ |
| 123 | `noOfUnallocatedItems` | No. of Unallocated Items | No. of Unallocated Items | 🧮 computed |
| 124 | `orderTime` | Order Time | Order Time | ✅ |
| 125 | `defaultResponseTimeHours` | Default Response Time (Hours) | Default Response Time (Hours) | ✅ |
| 126 | `actualResponseTimeHours` | Actual Response Time (Hours) | Actual Response Time (Hours) | ✅ |
| 127 | `serviceTimeHours` | Service Time (Hours) | Service Time (Hours) | ✅ |
| 128 | `responseDate` | Response Date | Response Date | ✅ |
| 129 | `responseTime` | Response Time | Response Time | ✅ |
| 130 | `startingDate` | Starting Date | Starting Date | ✅ |
| 131 | `startingTime` | Starting Time | Starting Time | ✅ |
| 132 | `finishingDate` | Finishing Date | Finishing Date | ✅ |
| 133 | `finishingTime` | Finishing Time | Finishing Time | ✅ |
| 134 | `contractServHoursExist` | Contract Serv. Hours Exist | Contract Serv. Hours Exist | 🧮 computed |
| 135 | `reallocationNeeded` | Reallocation Needed | Reallocation Needed | 🧮 computed |
| 136 | `notifyCustomer` | Notify Customer | Notify Customer | ✅ |
| 137 | `maxLaborUnitPrice` | Max. Labor Unit Price | Max. Labor Unit Price | ✅ |
| 138 | `warningStatus` | Warning Status | Warning Status | ✅ |
| 139 | `noOfAllocations` | No. of Allocations | No. of Allocations | 🧮 computed |
| 140 | `contractNo` | Contract No. | Contract No. | ✅ |
| 141 | `typeFilter` | Type Filter | Type Filter | 🔍 filter |
| 142 | `customerFilter` | Customer Filter | Customer Filter | 🔍 filter |
| 143 | `resourceFilter` | Resource Filter | Resource Filter | 🔍 filter |
| 144 | `contractFilter` | Contract Filter | Contract Filter | 🔍 filter |
| 145 | `shipToFaxNo` | Ship-to Fax No. | Ship-to Fax No. | ✅ |
| 146 | `shipToEMail` | Ship-to E-Mail | Ship-to Email | ✅ |
| 147 | `resourceGroupFilter` | Resource Group Filter | Resource Group Filter | 🔍 filter |
| 148 | `shipToPhone` | Ship-to Phone | Ship-to Phone | ✅ |
| 149 | `shipToPhone2` | Ship-to Phone 2 | Ship-to Phone 2 | ✅ |
| 150 | `serviceZoneFilter` | Service Zone Filter | Service Zone Filter | 🔍 filter |
| 151 | `serviceZoneCode` | Service Zone Code | Service Zone Code | ✅ |
| 152 | `expectedFinishingDate` | Expected Finishing Date | Expected Finishing Date | ✅ |
| 153 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 154 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 155 | `assignedUserId` | Assigned User ID | Assigned User ID | ✅ |
| 156 | `quoteNo` | Quote No. | Quote No. | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceItemLines

**Description:** Service Item Lines — the service items being worked on within a service order, with fault/resolution and repair status.

| Property | Value |
|---|---|
| **Source Table** | Service Item Line |
| Page ID | 90986 |
| Page Name | `ocpfServiceItemLines` |
| Entity Set Name | `ocpfServiceItemLines` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 64 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentNo` | Document No. | Document No. | ✅ |
| 3 | `lineNo` | Line No. | Line No. | ✅ |
| 4 | `serviceItemNo` | Service Item No. | Service Item No. | ✅ |
| 5 | `serviceItemGroupCode` | Service Item Group Code | Service Item Group Code | ✅ |
| 6 | `itemNo` | Item No. | Item No. | ✅ |
| 7 | `serialNo` | Serial No. | Serial No. | ✅ |
| 8 | `description` | Description | Description | ✅ |
| 9 | `description2` | Description 2 | Description 2 | ✅ |
| 10 | `repairStatusCode` | Repair Status Code | Repair Status Code | ✅ |
| 11 | `priority` | Priority | Priority | ✅ |
| 12 | `responseTimeHours` | Response Time (Hours) | Response Time (Hours) | ✅ |
| 13 | `responseDate` | Response Date | Response Date | ✅ |
| 14 | `responseTime` | Response Time | Response Time | ✅ |
| 15 | `startingDate` | Starting Date | Starting Date | ✅ |
| 16 | `startingTime` | Starting Time | Starting Time | ✅ |
| 17 | `finishingDate` | Finishing Date | Finishing Date | ✅ |
| 18 | `finishingTime` | Finishing Time | Finishing Time | ✅ |
| 19 | `serviceShelfNo` | Service Shelf No. | Service Shelf No. | ✅ |
| 20 | `warrantyStartingDateParts` | Warranty Starting Date (Parts) | Warranty Starting Date (Parts) | ✅ |
| 21 | `warrantyEndingDateParts` | Warranty Ending Date (Parts) | Warranty Ending Date (Parts) | ✅ |
| 22 | `warranty` | Warranty | Warranty | ✅ |
| 23 | `warrantyPctParts` | Warranty % (Parts) | Warranty % (Parts) | ✅ |
| 24 | `warrantyPctLabor` | Warranty % (Labor) | Warranty % (Labor) | ✅ |
| 25 | `warrantyStartingDateLabor` | Warranty Starting Date (Labor) | Warranty Starting Date (Labor) | ✅ |
| 26 | `warrantyEndingDateLabor` | Warranty Ending Date (Labor) | Warranty Ending Date (Labor) | ✅ |
| 27 | `contractNo` | Contract No. | Contract No. | ✅ |
| 28 | `locationOfServiceItem` | Location of Service Item | Location of Service Item | 🧮 computed |
| 29 | `loanerNo` | Loaner No. | Loaner No. | ✅ |
| 30 | `vendorNo` | Vendor No. | Vendor No. | ✅ |
| 31 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | ✅ |
| 32 | `faultReasonCode` | Fault Reason Code | Fault Reason Code | ✅ |
| 33 | `servicePriceGroupCode` | Service Price Group Code | Service Price Group Code | ✅ |
| 34 | `faultAreaCode` | Fault Area Code | Fault Area Code | ✅ |
| 35 | `symptomCode` | Symptom Code | Symptom Code | ✅ |
| 36 | `faultCode` | Fault Code | Fault Code | ✅ |
| 37 | `resolutionCode` | Resolution Code | Resolution Code | ✅ |
| 38 | `faultComment` | Fault Comment | Fault Comment | 🧮 computed |
| 39 | `resolutionComment` | Resolution Comment | Resolution Comment | 🧮 computed |
| 40 | `variantCode` | Variant Code | Variant Code | ✅ |
| 41 | `serviceItemLoanerComment` | Service Item Loaner Comment | Service Item Loaner Comment | 🧮 computed |
| 42 | `actualResponseTimeHours` | Actual Response Time (Hours) | Actual Response Time (Hours) | ✅ |
| 43 | `documentType` | Document Type | Document Type | ✅ |
| 44 | `servPriceAdjmtGrCode` | Serv. Price Adjmt. Gr. Code | Serv. Price Adjmt. Gr. Code | ✅ |
| 45 | `adjustmentType` | Adjustment Type | Adjustment Type | ✅ |
| 46 | `baseAmountToAdjust` | Base Amount to Adjust | Base Amount to Adjust | ✅ |
| 47 | `noOfActiveFinishedAllocs` | No. of Active/Finished Allocs | No. of Active/Finished Allocs | 🧮 computed |
| 48 | `noOfAllocations` | No. of Allocations | No. of Allocations | 🧮 computed |
| 49 | `noOfPreviousServices` | No. of Previous Services | No. of Previous Services | 🧮 computed |
| 50 | `contractLineNo` | Contract Line No. | Contract Line No. | ✅ |
| 51 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 52 | `customerNo` | Customer No. | Customer No. | ✅ |
| 53 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 54 | `resourceFilter` | Resource Filter | Resource Filter | 🔍 filter |
| 55 | `allocationDateFilter` | Allocation Date Filter | Allocation Date Filter | 🔍 filter |
| 56 | `repairStatusCodeFilter` | Repair Status Code Filter | Repair Status Code Filter | 🔍 filter |
| 57 | `allocationStatusFilter` | Allocation Status Filter | Allocation Status Filter | 🔍 filter |
| 58 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 59 | `serviceOrderFilter` | Service Order Filter | Service Order Filter | 🔍 filter |
| 60 | `resourceGroupFilter` | Resource Group Filter | Resource Group Filter | 🔍 filter |
| 61 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 62 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 63 | `releaseStatus` | Release Status | Release Status | ✅ |
| 64 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceLines

**Description:** Service Lines — the items, resources, and costs consumed or invoiced on service documents.

| Property | Value |
|---|---|
| **Source Table** | Service Line |
| Page ID | 90987 |
| Page Name | `ocpfServiceLines` |
| Entity Set Name | `ocpfServiceLines` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 157 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `documentType` | Document Type | Document Type | ✅ |
| 3 | `customerNo` | Customer No. | Customer No. | ✅ |
| 4 | `documentNo` | Document No. | Document No. | ✅ |
| 5 | `lineNo` | Line No. | Line No. | ✅ |
| 6 | `type` | Type | Type | ✅ |
| 7 | `no` | No. | No. | ✅ |
| 8 | `locationCode` | Location Code | Location Code | ✅ |
| 9 | `postingGroup` | Posting Group | Posting Group | ✅ |
| 10 | `description` | Description | Description | ✅ |
| 11 | `description2` | Description 2 | Description 2 | ✅ |
| 12 | `unitOfMeasure` | Unit of Measure | Unit of Measure | ✅ |
| 13 | `quantity` | Quantity | Quantity | ✅ |
| 14 | `outstandingQuantity` | Outstanding Quantity | Outstanding Quantity | ✅ |
| 15 | `qtyToInvoice` | Qty. to Invoice | Qty. to Invoice | ✅ |
| 16 | `qtyToShip` | Qty. to Ship | Qty. to Ship | ✅ |
| 17 | `unitPrice` | Unit Price | Unit Price | ✅ |
| 18 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | ✅ |
| 19 | `vatPct` | VAT % | VAT % | ✅ |
| 20 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 21 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 22 | `amount` | Amount | Amount | ✅ |
| 23 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | ✅ |
| 24 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | ✅ |
| 25 | `grossWeight` | Gross Weight | Gross Weight | ✅ |
| 26 | `netWeight` | Net Weight | Net Weight | ✅ |
| 27 | `unitsPerParcel` | Units per Parcel | Units per Parcel | ✅ |
| 28 | `unitVolume` | Unit Volume | Unit Volume | ✅ |
| 29 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | ✅ |
| 30 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 31 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 32 | `customerPriceGroup` | Customer Price Group | Customer Price Group | ✅ |
| 33 | `jobNo` | Job No. | Project No. | ✅ |
| 34 | `jobTaskNo` | Job Task No. | Project Task No. | ✅ |
| 35 | `jobLineType` | Job Line Type | Project Line Type | ✅ |
| 36 | `workTypeCode` | Work Type Code | Work Type Code | ✅ |
| 37 | `outstandingAmount` | Outstanding Amount | Outstanding Amount | ✅ |
| 38 | `qtyShippedNotInvoiced` | Qty. Shipped Not Invoiced | Qty. Shipped Not Invoiced | ✅ |
| 39 | `shippedNotInvoiced` | Shipped Not Invoiced | Shipped Not Invoiced | ✅ |
| 40 | `quantityShipped` | Quantity Shipped | Quantity Shipped | ✅ |
| 41 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | ✅ |
| 42 | `shipmentNo` | Shipment No. | Shipment No. | ✅ |
| 43 | `shipmentLineNo` | Shipment Line No. | Shipment Line No. | ✅ |
| 44 | `orderNo` | Order No. | Order No. | ✅ |
| 45 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 46 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | ✅ |
| 47 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | ✅ |
| 48 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | ✅ |
| 49 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | ✅ |
| 50 | `transactionType` | Transaction Type | Transaction Type | ✅ |
| 51 | `transportMethod` | Transport Method | Transport Method | ✅ |
| 52 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | ✅ |
| 53 | `exitPoint` | Exit Point | Exit Point | ✅ |
| 54 | `area` | Area | Area | ✅ |
| 55 | `transactionSpecification` | Transaction Specification | Transaction Specification | ✅ |
| 56 | `taxAreaCode` | Tax Area Code | Tax Area Code | ✅ |
| 57 | `taxLiable` | Tax Liable | Tax Liable | ✅ |
| 58 | `taxGroupCode` | Tax Group Code | Tax Group Code | ✅ |
| 59 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | ✅ |
| 60 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | ✅ |
| 61 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | ✅ |
| 62 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 63 | `outstandingAmountLcy` | Outstanding Amount (LCY) | Outstanding Amount (LCY) | ✅ |
| 64 | `shippedNotInvoicedLcy` | Shipped Not Invoiced (LCY) | Shipped Not Invoiced (LCY) | ✅ |
| 65 | `reservedQuantity` | Reserved Quantity | Reserved Quantity | 🧮 computed |
| 66 | `reserve` | Reserve | Reserve | ✅ |
| 67 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | ✅ |
| 68 | `unitCost` | Unit Cost | Unit Cost | ✅ |
| 69 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | ✅ |
| 70 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 71 | `vatDifference` | VAT Difference | VAT Difference | ✅ |
| 72 | `invDiscAmountToInvoice` | Inv. Disc. Amount to Invoice | Inv. Disc. Amount to Invoice | ✅ |
| 73 | `vatIdentifier` | VAT Identifier | VAT Identifier | ✅ |
| 74 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | ✅ |
| 75 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 76 | `timeSheetNo` | Time Sheet No. | Time Sheet No. | ✅ |
| 77 | `timeSheetLineNo` | Time Sheet Line No. | Time Sheet Line No. | ✅ |
| 78 | `timeSheetDate` | Time Sheet Date | Time Sheet Date | ✅ |
| 79 | `jobPlanningLineNo` | Job Planning Line No. | Project Planning Line No. | ✅ |
| 80 | `jobRemainingQty` | Job Remaining Qty. | Project Remaining Qty. | ✅ |
| 81 | `jobRemainingQtyBase` | Job Remaining Qty. (Base) | Project Remaining Qty. (Base) | ✅ |
| 82 | `jobRemainingTotalCost` | Job Remaining Total Cost | Project Remaining Total Cost | ✅ |
| 83 | `jobRemainingTotalCostLcy` | Job Remaining Total Cost (LCY) | Project Remaining Total Cost (LCY) | ✅ |
| 84 | `jobRemainingLineAmount` | Job Remaining Line Amount | Project Remaining Line Amount | ✅ |
| 85 | `variantCode` | Variant Code | Variant Code | ✅ |
| 86 | `binCode` | Bin Code | Bin Code | ✅ |
| 87 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | ✅ |
| 88 | `planned` | Planned | Planned | ✅ |
| 89 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 90 | `qtyRoundingPrecision` | Qty. Rounding Precision | Qty. Rounding Precision | ✅ |
| 91 | `qtyRoundingPrecisionBase` | Qty. Rounding Precision (Base) | Qty. Rounding Precision (Base) | ✅ |
| 92 | `quantityBase` | Quantity (Base) | Quantity (Base) | ✅ |
| 93 | `outstandingQtyBase` | Outstanding Qty. (Base) | Outstanding Qty. (Base) | ✅ |
| 94 | `qtyToInvoiceBase` | Qty. to Invoice (Base) | Qty. to Invoice (Base) | ✅ |
| 95 | `qtyToShipBase` | Qty. to Ship (Base) | Qty. to Ship (Base) | ✅ |
| 96 | `qtyShippedNotInvdBase` | Qty. Shipped Not Invd. (Base) | Qty. Shipped Not Invd. (Base) | ✅ |
| 97 | `qtyShippedBase` | Qty. Shipped (Base) | Qty. Shipped (Base) | ✅ |
| 98 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | ✅ |
| 99 | `reservedQtyBase` | Reserved Qty. (Base) | Reserved Qty. (Base) | 🧮 computed |
| 100 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 101 | `substitutionAvailable` | Substitution Available | Substitution Available | 🧮 computed |
| 102 | `itemCategoryCode` | Item Category Code | Item Category Code | ✅ |
| 103 | `nonstock` | Nonstock | Catalog | ✅ |
| 104 | `itemReferenceNo` | Item Reference No. | Item Reference No. | ✅ |
| 105 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Reference Unit of Measure | ✅ |
| 106 | `itemReferenceType` | Item Reference Type | Item Reference Type | ✅ |
| 107 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | ✅ |
| 108 | `whseOutstandingQtyBase` | Whse. Outstanding Qty. (Base) | Whse. Outstanding Qty. (Base) | 🧮 computed |
| 109 | `completelyShipped` | Completely Shipped | Completely Shipped | ✅ |
| 110 | `requestedDeliveryDate` | Requested Delivery Date | Requested Delivery Date | ✅ |
| 111 | `promisedDeliveryDate` | Promised Delivery Date | Promised Delivery Date | ✅ |
| 112 | `shippingTime` | Shipping Time | Shipping Time | ✅ |
| 113 | `plannedDeliveryDate` | Planned Delivery Date | Planned Delivery Date | ✅ |
| 114 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | ✅ |
| 115 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | ✅ |
| 116 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | ✅ |
| 117 | `serviceItemNo` | Service Item No. | Service Item No. | ✅ |
| 118 | `applToServiceEntry` | Appl.-to Service Entry | Appl.-to Service Entry | ✅ |
| 119 | `serviceItemLineNo` | Service Item Line No. | Service Item Line No. | ✅ |
| 120 | `serviceItemSerialNo` | Service Item Serial No. | Service Item Serial No. | ✅ |
| 121 | `serviceItemLineDescription` | Service Item Line Description | Service Item Line Description | 🧮 computed |
| 122 | `servPriceAdjmtGrCode` | Serv. Price Adjmt. Gr. Code | Serv. Price Adjmt. Gr. Code | ✅ |
| 123 | `postingDate` | Posting Date | Posting Date | ✅ |
| 124 | `orderDate` | Order Date | Order Date | ✅ |
| 125 | `neededByDate` | Needed by Date | Needed by Date | ✅ |
| 126 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 127 | `qtyToConsume` | Qty. to Consume | Qty. to Consume | ✅ |
| 128 | `quantityConsumed` | Quantity Consumed | Quantity Consumed | ✅ |
| 129 | `qtyToConsumeBase` | Qty. to Consume (Base) | Qty. to Consume (Base) | ✅ |
| 130 | `qtyConsumedBase` | Qty. Consumed (Base) | Qty. Consumed (Base) | ✅ |
| 131 | `servicePriceGroupCode` | Service Price Group Code | Service Price Group Code | ✅ |
| 132 | `faultAreaCode` | Fault Area Code | Fault Area Code | ✅ |
| 133 | `symptomCode` | Symptom Code | Symptom Code | ✅ |
| 134 | `faultCode` | Fault Code | Fault Code | ✅ |
| 135 | `resolutionCode` | Resolution Code | Resolution Code | ✅ |
| 136 | `excludeWarranty` | Exclude Warranty | Exclude Warranty | ✅ |
| 137 | `warranty` | Warranty | Warranty | ✅ |
| 138 | `contractNo` | Contract No. | Contract No. | ✅ |
| 139 | `contractDiscPct` | Contract Disc. % | Contract Disc. % | ✅ |
| 140 | `warrantyDiscPct` | Warranty Disc. % | Warranty Disc. % | ✅ |
| 141 | `componentLineNo` | Component Line No. | Component Line No. | ✅ |
| 142 | `sparePartAction` | Spare Part Action | Spare Part Action | ✅ |
| 143 | `faultReasonCode` | Fault Reason Code | Fault Reason Code | ✅ |
| 144 | `replacedItemNo` | Replaced Item No. | Replaced Item No. | ✅ |
| 145 | `excludeContractDiscount` | Exclude Contract Discount | Exclude Contract Discount | ✅ |
| 146 | `replacedItemType` | Replaced Item Type | Replaced Item Type | ✅ |
| 147 | `priceAdjmtStatus` | Price Adjmt. Status | Price Adjmt. Status | ✅ |
| 148 | `lineDiscountType` | Line Discount Type | Line Discount Type | ✅ |
| 149 | `copyComponentsFrom` | Copy Components From | Copy Components From | ✅ |
| 150 | `returnReasonCode` | Return Reason Code | Return Reason Code | ✅ |
| 151 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | ✅ |
| 152 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | ✅ |
| 153 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | ✅ |
| 154 | `qtyPicked` | Qty. Picked | Qty. Picked | ✅ |
| 155 | `qtyPickedBase` | Qty. Picked (Base) | Qty. Picked (Base) | ✅ |
| 156 | `completelyPicked` | Completely Picked | Completely Picked | ✅ |
| 157 | `pickQtyBase` | Pick Qty. (Base) | Pick Qty. (Base) | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceLedgerEntries

**Description:** Service Ledger Entries — posted usage, sales, and contract transactions from service management. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Service Ledger Entry |
| Page ID | 90988 |
| Page Name | `ocpfServiceLedgerEntries` |
| Entity Set Name | `ocpfServiceLedgerEntries` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 64 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `serviceContractNo` | Service Contract No. | Service Contract No. | — |
| 4 | `documentType` | Document Type | Document Type | — |
| 5 | `documentNo` | Document No. | Document No. | — |
| 6 | `servContractAccGrCode` | Serv. Contract Acc. Gr. Code | Serv. Contract Acc. Gr. Code | — |
| 7 | `documentLineNo` | Document Line No. | Document Line No. | — |
| 8 | `movedFromPrepaidAcc` | Moved from Prepaid Acc. | Moved from Prepaid Acc. | — |
| 9 | `postingDate` | Posting Date | Posting Date | — |
| 10 | `amountLcy` | Amount (LCY) | Amount (LCY) | — |
| 11 | `customerNo` | Customer No. | Customer No. | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `itemNoServiced` | Item No. (Serviced) | Item No. (Serviced) | — |
| 14 | `serialNoServiced` | Serial No. (Serviced) | Serial No. (Serviced) | — |
| 15 | `userId` | User ID | User ID | — |
| 16 | `contractInvoicePeriod` | Contract Invoice Period | Contract Invoice Period | — |
| 17 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 18 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 19 | `serviceItemNoServiced` | Service Item No. (Serviced) | Service Item No. (Serviced) | — |
| 20 | `variantCodeServiced` | Variant Code (Serviced) | Variant Code (Serviced) | — |
| 21 | `contractGroupCode` | Contract Group Code | Contract Group Code | — |
| 22 | `type` | Type | Type | — |
| 23 | `no` | No. | No. | — |
| 24 | `costAmount` | Cost Amount | Cost Amount | — |
| 25 | `discountAmount` | Discount Amount | Discount Amount | — |
| 26 | `unitCost` | Unit Cost | Unit Cost | — |
| 27 | `quantity` | Quantity | Quantity | — |
| 28 | `chargedQty` | Charged Qty. | Charged Qty. | — |
| 29 | `unitPrice` | Unit Price | Unit Price | — |
| 30 | `discountPct` | Discount % | Discount % | — |
| 31 | `contractDiscAmount` | Contract Disc. Amount | Contract Disc. Amount | — |
| 32 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 33 | `faultReasonCode` | Fault Reason Code | Fault Reason Code | — |
| 34 | `description` | Description | Description | — |
| 35 | `serviceOrderType` | Service Order Type | Service Order Type | — |
| 36 | `serviceOrderNo` | Service Order No. | Service Order No. | — |
| 37 | `jobNo` | Job No. | Project No. | — |
| 38 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 39 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 40 | `locationCode` | Location Code | Location Code | — |
| 41 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 42 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 43 | `binCode` | Bin Code | Bin Code | — |
| 44 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 45 | `variantCode` | Variant Code | Variant Code | — |
| 46 | `entryType` | Entry Type | Entry Type | — |
| 47 | `open` | Open | Open | — |
| 48 | `servPriceAdjmtGrCode` | Serv. Price Adjmt. Gr. Code | Serv. Price Adjmt. Gr. Code | — |
| 49 | `servicePriceGroupCode` | Service Price Group Code | Service Price Group Code | — |
| 50 | `prepaid` | Prepaid | Prepaid | — |
| 51 | `applyUntilEntryNo` | Apply Until Entry No. | Apply Until Entry No. | — |
| 52 | `appliesToEntryNo` | Applies-to Entry No. | Applies-to Entry No. | — |
| 53 | `amount` | Amount | Amount | — |
| 54 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 55 | `jobLineType` | Job Line Type | Project Line Type | — |
| 56 | `jobPosted` | Job Posted | Project Posted | — |
| 57 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 58 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 59 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 60 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 61 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 62 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 63 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 64 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfWarrantyLedgerEntries

**Description:** Warranty Ledger Entries — posted warranty coverage transactions for service items. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Warranty Ledger Entry |
| Page ID | 90989 |
| Page Name | `ocpfWarrantyLedgerEntries` |
| Entity Set Name | `ocpfWarrantyLedgerEntries` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 42 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `entryNo` | Entry No. | Entry No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `postingDate` | Posting Date | Posting Date | — |
| 5 | `customerNo` | Customer No. | Customer No. | — |
| 6 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 7 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 8 | `variantCodeServiced` | Variant Code (Serviced) | Variant Code (Serviced) | — |
| 9 | `serviceItemNoServiced` | Service Item No. (Serviced) | Service Item No. (Serviced) | — |
| 10 | `itemNoServiced` | Item No. (Serviced) | Item No. (Serviced) | — |
| 11 | `serialNoServiced` | Serial No. (Serviced) | Serial No. (Serviced) | — |
| 12 | `serviceItemGroupServiced` | Service Item Group (Serviced) | Service Item Group (Serviced) | — |
| 13 | `serviceOrderNo` | Service Order No. | Service Order No. | — |
| 14 | `serviceContractNo` | Service Contract No. | Service Contract No. | — |
| 15 | `faultReasonCode` | Fault Reason Code | Fault Reason Code | — |
| 16 | `faultAreaCode` | Fault Area Code | Fault Area Code | — |
| 17 | `faultCode` | Fault Code | Fault Code | — |
| 18 | `symptomCode` | Symptom Code | Symptom Code | — |
| 19 | `resolutionCode` | Resolution Code | Resolution Code | — |
| 20 | `type` | Type | Type | — |
| 21 | `no` | No. | No. | — |
| 22 | `quantity` | Quantity | Quantity | — |
| 23 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 24 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 25 | `amount` | Amount | Amount | — |
| 26 | `description` | Description | Description | — |
| 27 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 28 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 29 | `globalDimension1Code` | Global Dimension 1 Code | Global Dimension 1 Code | — |
| 30 | `globalDimension2Code` | Global Dimension 2 Code | Global Dimension 2 Code | — |
| 31 | `open` | Open | Open | — |
| 32 | `vendorNo` | Vendor No. | Vendor No. | — |
| 33 | `vendorItemNo` | Vendor Item No. | Vendor Item No. | — |
| 34 | `variantCode` | Variant Code | Variant Code | — |
| 35 | `serviceOrderLineNo` | Service Order Line No. | Service Order Line No. | — |
| 36 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 37 | `shortcutDimension3Code` | Shortcut Dimension 3 Code | Shortcut Dimension 3 Code | 🧮 computed |
| 38 | `shortcutDimension4Code` | Shortcut Dimension 4 Code | Shortcut Dimension 4 Code | 🧮 computed |
| 39 | `shortcutDimension5Code` | Shortcut Dimension 5 Code | Shortcut Dimension 5 Code | 🧮 computed |
| 40 | `shortcutDimension6Code` | Shortcut Dimension 6 Code | Shortcut Dimension 6 Code | 🧮 computed |
| 41 | `shortcutDimension7Code` | Shortcut Dimension 7 Code | Shortcut Dimension 7 Code | 🧮 computed |
| 42 | `shortcutDimension8Code` | Shortcut Dimension 8 Code | Shortcut Dimension 8 Code | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceRegisters

**Description:** Service Registers — audit registers linking ranges of posted service ledger entries. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Service Register |
| Page ID | 90990 |
| Page Name | `ocpfServiceRegisters` |
| Entity Set Name | `ocpfServiceRegisters` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 10 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `no` | No. | No. | — |
| 3 | `fromEntryNo` | From Entry No. | From Entry No. | — |
| 4 | `toEntryNo` | To Entry No. | To Entry No. | — |
| 5 | `fromWarrantyEntryNo` | From Warranty Entry No. | From Warranty Entry No. | — |
| 6 | `toWarrantyEntryNo` | To Warranty Entry No. | To Warranty Entry No. | — |
| 7 | `creationDate` | Creation Date | Creation Date | — |
| 8 | `sourceCode` | Source Code | Source Code | — |
| 9 | `userId` | User ID | User ID | — |
| 10 | `creationTime` | Creation Time | Creation Time | — |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceContractHeaders

**Description:** Service Contracts — contract and quote headers covering service items, with invoicing, response, and renewal terms.

| Property | Value |
|---|---|
| **Source Table** | Service Contract Header |
| Page ID | 90991 |
| Page Name | `ocpfServiceContractHeaders` |
| Entity Set Name | `ocpfServiceContractHeaders` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 107 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `contractNo` | Contract No. | Contract No. | ✅ |
| 3 | `contractType` | Contract Type | Contract Type | ✅ |
| 4 | `description` | Description | Description | ✅ |
| 5 | `description2` | Description 2 | Description 2 | ✅ |
| 6 | `status` | Status | Status | ✅ |
| 7 | `changeStatus` | Change Status | Change Status | ✅ |
| 8 | `customerNo` | Customer No. | Customer No. | ✅ |
| 9 | `name` | Name | Name | 🧮 computed |
| 10 | `address` | Address | Address | 🧮 computed |
| 11 | `address2` | Address 2 | Address 2 | 🧮 computed |
| 12 | `postCode` | Post Code | Post Code | 🧮 computed |
| 13 | `city` | City | City | 🧮 computed |
| 14 | `contactName` | Contact Name | Contact Name | ✅ |
| 15 | `yourReference` | Your Reference | Your Reference | ✅ |
| 16 | `salespersonCode` | Salesperson Code | Salesperson Code | ✅ |
| 17 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | ✅ |
| 18 | `billToName` | Bill-to Name | Bill-to Name | 🧮 computed |
| 19 | `billToAddress` | Bill-to Address | Bill-to Address | 🧮 computed |
| 20 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | 🧮 computed |
| 21 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | 🧮 computed |
| 22 | `billToCity` | Bill-to City | Bill-to City | 🧮 computed |
| 23 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 24 | `shipToName` | Ship-to Name | Ship-to Name | 🧮 computed |
| 25 | `shipToAddress` | Ship-to Address | Ship-to Address | 🧮 computed |
| 26 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | 🧮 computed |
| 27 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | 🧮 computed |
| 28 | `shipToCity` | Ship-to City | Ship-to City | 🧮 computed |
| 29 | `servContractAccGrCode` | Serv. Contract Acc. Gr. Code | Serv. Contract Acc. Gr. Code | ✅ |
| 30 | `invoicePeriod` | Invoice Period | Invoice Period | ✅ |
| 31 | `lastInvoiceDate` | Last Invoice Date | Last Invoice Date | ✅ |
| 32 | `nextInvoiceDate` | Next Invoice Date | Next Invoice Date | ✅ |
| 33 | `startingDate` | Starting Date | Starting Date | ✅ |
| 34 | `expirationDate` | Expiration Date | Expiration Date | ✅ |
| 35 | `firstServiceDate` | First Service Date | First Service Date | ✅ |
| 36 | `maxLaborUnitPrice` | Max. Labor Unit Price | Max. Labor Unit Price | ✅ |
| 37 | `calcdAnnualAmount` | Calcd. Annual Amount | Calcd. Annual Amount | 🧮 computed |
| 38 | `annualAmount` | Annual Amount | Annual Amount | ✅ |
| 39 | `amountPerPeriod` | Amount per Period | Amount per Period | ✅ |
| 40 | `combineInvoices` | Combine Invoices | Combine Invoices | ✅ |
| 41 | `prepaid` | Prepaid | Prepaid | ✅ |
| 42 | `nextInvoicePeriod` | Next Invoice Period | Next Invoice Period | ✅ |
| 43 | `serviceZoneCode` | Service Zone Code | Service Zone Code | ✅ |
| 44 | `languageCode` | Language Code | Language Code | ✅ |
| 45 | `formatRegion` | Format Region | Format Region | ✅ |
| 46 | `cancelReasonCode` | Cancel Reason Code | Cancel Reason Code | ✅ |
| 47 | `lastPriceUpdateDate` | Last Price Update Date | Last Price Update Date | ✅ |
| 48 | `nextPriceUpdateDate` | Next Price Update Date | Next Price Update Date | ✅ |
| 49 | `lastPriceUpdatePct` | Last Price Update % | Last Price Update % | ✅ |
| 50 | `responseTimeHours` | Response Time (Hours) | Response Time (Hours) | ✅ |
| 51 | `contractLinesOnInvoice` | Contract Lines on Invoice | Contract Lines on Invoice | ✅ |
| 52 | `noOfPostedInvoices` | No. of Posted Invoices | No. of Posted Invoices | 🧮 computed |
| 53 | `noOfUnpostedInvoices` | No. of Unposted Invoices | No. of Unposted Invoices | 🧮 computed |
| 54 | `servicePeriod` | Service Period | Service Period | ✅ |
| 55 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | ✅ |
| 56 | `invoiceAfterService` | Invoice after Service | Invoice after Service | ✅ |
| 57 | `quoteType` | Quote Type | Quote Type | ✅ |
| 58 | `allowUnbalancedAmounts` | Allow Unbalanced Amounts | Allow Unbalanced Amounts | ✅ |
| 59 | `contractGroupCode` | Contract Group Code | Contract Group Code | ✅ |
| 60 | `serviceOrderType` | Service Order Type | Service Order Type | ✅ |
| 61 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | ✅ |
| 62 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | ✅ |
| 63 | `acceptBefore` | Accept Before | Accept Before | ✅ |
| 64 | `automaticCreditMemos` | Automatic Credit Memos | Automatic Credit Memos | ✅ |
| 65 | `templateNo` | Template No. | Template No. | ✅ |
| 66 | `priceUpdatePeriod` | Price Update Period | Price Update Period | ✅ |
| 67 | `priceInvIncreaseCode` | Price Inv. Increase Code | Price Inv. Increase Code | ✅ |
| 68 | `printIncreaseText` | Print Increase Text | Print Increase Text | ✅ |
| 69 | `currencyCode` | Currency Code | Currency Code | ✅ |
| 70 | `noSeries` | No. Series | No. Series | ✅ |
| 71 | `probability` | Probability | Probability | ✅ |
| 72 | `comment` | Comment | Comment | 🧮 computed |
| 73 | `responsibilityCenter` | Responsibility Center | Responsibility Center | ✅ |
| 74 | `phoneNo` | Phone No. | Phone No. | ✅ |
| 75 | `faxNo` | Fax No. | Fax No. | ✅ |
| 76 | `eMail` | E-Mail | Email | ✅ |
| 77 | `billToCounty` | Bill-to County | Bill-to County | 🧮 computed |
| 78 | `county` | County | County | 🧮 computed |
| 79 | `shipToCounty` | Ship-to County | Ship-to County | 🧮 computed |
| 80 | `countryRegionCode` | Country/Region Code | Country/Region Code | 🧮 computed |
| 81 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | 🧮 computed |
| 82 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | 🧮 computed |
| 83 | `name2` | Name 2 | Name 2 | 🧮 computed |
| 84 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | 🧮 computed |
| 85 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | 🧮 computed |
| 86 | `nextInvoicePeriodStart` | Next Invoice Period Start | Next Invoice Period Start | ✅ |
| 87 | `nextInvoicePeriodEnd` | Next Invoice Period End | Next Invoice Period End | ✅ |
| 88 | `contractInvoiceAmount` | Contract Invoice Amount | Contract Invoice Amount | 🧮 computed |
| 89 | `contractPrepaidAmount` | Contract Prepaid Amount | Contract Prepaid Amount | 🧮 computed |
| 90 | `contractDiscountAmount` | Contract Discount Amount | Contract Discount Amount | 🧮 computed |
| 91 | `contractCostAmount` | Contract Cost Amount | Contract Cost Amount | 🧮 computed |
| 92 | `contractGainLossAmount` | Contract Gain/Loss Amount | Contract Gain/Loss Amount | 🧮 computed |
| 93 | `noOfPostedCreditMemos` | No. of Posted Credit Memos | No. of Posted Credit Memos | 🧮 computed |
| 94 | `noOfUnpostedCreditMemos` | No. of Unposted Credit Memos | No. of Unposted Credit Memos | 🧮 computed |
| 95 | `typeFilter` | Type Filter | Type Filter | 🔍 filter |
| 96 | `reasonCodeFilter` | Reason Code Filter | Reason Code Filter | 🔍 filter |
| 97 | `postedServiceOrderFilter` | Posted Service Order Filter | Posted Service Order Filter | 🔍 filter |
| 98 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 99 | `itemFilter` | Item Filter | Item Filter | 🔍 filter |
| 100 | `paymentMethodCode` | Payment Method Code | Payment Method Code | ✅ |
| 101 | `shipToPhoneNo` | Ship-to Phone No. | Ship-to Phone No. | 🧮 computed |
| 102 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | ✅ |
| 103 | `directDebitMandateId` | Direct Debit Mandate ID | Direct Debit Mandate ID | ✅ |
| 104 | `contactNo` | Contact No. | Contact No. | ✅ |
| 105 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | ✅ |
| 106 | `billToContact` | Bill-to Contact | Bill-to Contact | ✅ |
| 107 | `lastInvoicePeriodEnd` | Last Invoice Period End | Last Invoice Period End | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceContractLines

**Description:** Service Contract Lines — the service items covered by each service contract.

| Property | Value |
|---|---|
| **Source Table** | Service Contract Line |
| Page ID | 90992 |
| Page Name | `ocpfServiceContractLines` |
| Entity Set Name | `ocpfServiceContractLines` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 32 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `contractType` | Contract Type | Contract Type | ✅ |
| 3 | `contractNo` | Contract No. | Contract No. | ✅ |
| 4 | `lineNo` | Line No. | Line No. | ✅ |
| 5 | `contractStatus` | Contract Status | Contract Status | ✅ |
| 6 | `serviceItemNo` | Service Item No. | Service Item No. | ✅ |
| 7 | `description` | Description | Description | ✅ |
| 8 | `serialNo` | Serial No. | Serial No. | ✅ |
| 9 | `serviceItemGroupCode` | Service Item Group Code | Service Item Group Code | ✅ |
| 10 | `customerNo` | Customer No. | Customer No. | ✅ |
| 11 | `shipToCode` | Ship-to Code | Ship-to Code | ✅ |
| 12 | `itemNo` | Item No. | Item No. | ✅ |
| 13 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | ✅ |
| 14 | `responseTimeHours` | Response Time (Hours) | Response Time (Hours) | ✅ |
| 15 | `lastPlannedServiceDate` | Last Planned Service Date | Last Planned Service Date | ✅ |
| 16 | `nextPlannedServiceDate` | Next Planned Service Date | Next Planned Service Date | ✅ |
| 17 | `lastServiceDate` | Last Service Date | Last Service Date | ✅ |
| 18 | `lastPreventiveMaintDate` | Last Preventive Maint. Date | Last Preventive Maint. Date | ✅ |
| 19 | `invoicedToDate` | Invoiced to Date | Invoiced to Date | ✅ |
| 20 | `creditMemoDate` | Credit Memo Date | Credit Memo Date | ✅ |
| 21 | `contractExpirationDate` | Contract Expiration Date | Contract Expiration Date | ✅ |
| 22 | `servicePeriod` | Service Period | Service Period | ✅ |
| 23 | `lineValue` | Line Value | Line Value | ✅ |
| 24 | `lineDiscountPct` | Line Discount % | Line Discount % | ✅ |
| 25 | `lineAmount` | Line Amount | Line Amount | ✅ |
| 26 | `variantCode` | Variant Code | Variant Code | ✅ |
| 27 | `startingDate` | Starting Date | Starting Date | ✅ |
| 28 | `newLine` | New Line | New Line | ✅ |
| 29 | `credited` | Credited | Credited | ✅ |
| 30 | `lineCost` | Line Cost | Line Cost | ✅ |
| 31 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | ✅ |
| 32 | `profit` | Profit | Profit | ✅ |


[↑ Back to top](#table-of-contents)

---

### ocpfContractGroups

**Description:** Contract Groups — groupings of service contracts for filtering and bulk operations.

| Property | Value |
|---|---|
| **Source Table** | Contract Group |
| Page ID | 90993 |
| Page Name | `ocpfContractGroups` |
| Entity Set Name | `ocpfContractGroups` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ✅ Yes (POST/PATCH/DELETE supported) |
| Field Count | 6 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `code` | Code | Code | ✅ |
| 3 | `description` | Description | Description | ✅ |
| 4 | `discOnContrOrdersOnly` | Disc. on Contr. Orders Only | Disc. on Contr. Orders Only | ✅ |
| 5 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 6 | `contractGainLossAmount` | Contract Gain/Loss Amount | Contract Gain/Loss Amount | 🧮 computed |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceShipmentHeaders

**Description:** Posted Service Shipments — headers of posted service shipments. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Service Shipment Header |
| Page ID | 90994 |
| Page Name | `ocpfServiceShipmentHeaders` |
| Entity Set Name | `ocpfServiceShipmentHeaders` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 133 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `customerNo` | Customer No. | Customer No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 5 | `billToName` | Bill-to Name | Bill-to Name | — |
| 6 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | — |
| 7 | `billToAddress` | Bill-to Address | Bill-to Address | — |
| 8 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | — |
| 9 | `billToCity` | Bill-to City | Bill-to City | — |
| 10 | `billToContact` | Bill-to Contact | Bill-to Contact | — |
| 11 | `yourReference` | Your Reference | Your Reference | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 14 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 15 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 16 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 17 | `shipToCity` | Ship-to City | Ship-to City | — |
| 18 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 19 | `orderDate` | Order Date | Order Date | — |
| 20 | `postingDate` | Posting Date | Posting Date | — |
| 21 | `postingDescription` | Posting Description | Posting Description | — |
| 22 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 23 | `dueDate` | Due Date | Due Date | — |
| 24 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | — |
| 25 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 26 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | — |
| 27 | `locationCode` | Location Code | Location Code | — |
| 28 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 29 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 30 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | — |
| 31 | `currencyCode` | Currency Code | Currency Code | — |
| 32 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 33 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 34 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | — |
| 35 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | — |
| 36 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 37 | `languageCode` | Language Code | Language Code | — |
| 38 | `formatRegion` | Format Region | Format Region | — |
| 39 | `salespersonCode` | Salesperson Code | Salesperson Code | — |
| 40 | `orderNo` | Order No. | Order No. | — |
| 41 | `comment` | Comment | Comment | 🧮 computed |
| 42 | `noPrinted` | No. Printed | No. Printed | — |
| 43 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 44 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 45 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 46 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 47 | `reasonCode` | Reason Code | Reason Code | — |
| 48 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 49 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | — |
| 50 | `transactionType` | Transaction Type | Transaction Type | — |
| 51 | `transportMethod` | Transport Method | Transport Method | — |
| 52 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | — |
| 53 | `name` | Name | Name | — |
| 54 | `name2` | Name 2 | Name 2 | — |
| 55 | `address` | Address | Address | — |
| 56 | `address2` | Address 2 | Address 2 | — |
| 57 | `city` | City | City | — |
| 58 | `contactName` | Contact Name | Contact Name | — |
| 59 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | — |
| 60 | `billToCounty` | Bill-to County | Bill-to County | — |
| 61 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | — |
| 62 | `postCode` | Post Code | Post Code | — |
| 63 | `county` | County | County | — |
| 64 | `countryRegionCode` | Country/Region Code | Country/Region Code | — |
| 65 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 66 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 67 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 68 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 69 | `exitPoint` | Exit Point | Exit Point | — |
| 70 | `correction` | Correction | Correction | — |
| 71 | `documentDate` | Document Date | Document Date | — |
| 72 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 73 | `area` | Area | Area | — |
| 74 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 75 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 76 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | — |
| 77 | `noSeries` | No. Series | No. Series | — |
| 78 | `orderNoSeries` | Order No. Series | Order No. Series | — |
| 79 | `userId` | User ID | User ID | — |
| 80 | `sourceCode` | Source Code | Source Code | — |
| 81 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 82 | `taxLiable` | Tax Liable | Tax Liable | — |
| 83 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 84 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | — |
| 85 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | — |
| 86 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 87 | `contactNo` | Contact No. | Contact No. | — |
| 88 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | — |
| 89 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 90 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | — |
| 91 | `dateFilter` | Date Filter | Date Filter | 🔍 filter |
| 92 | `description` | Description | Description | — |
| 93 | `serviceOrderType` | Service Order Type | Service Order Type | — |
| 94 | `linkServiceToServiceItem` | Link Service to Service Item | Link Service to Service Item | — |
| 95 | `priority` | Priority | Priority | — |
| 96 | `allocatedHours` | Allocated Hours | Allocated Hours | 🧮 computed |
| 97 | `phoneNo` | Phone No. | Phone No. | — |
| 98 | `eMail` | E-Mail | Email | — |
| 99 | `phoneNo2` | Phone No. 2 | Phone No. 2 | — |
| 100 | `faxNo` | Fax No. | Fax No. | — |
| 101 | `noOfUnallocatedItems` | No. of Unallocated Items | No. of Unallocated Items | 🧮 computed |
| 102 | `orderTime` | Order Time | Order Time | — |
| 103 | `defaultResponseTimeHours` | Default Response Time (Hours) | Default Response Time (Hours) | — |
| 104 | `actualResponseTimeHours` | Actual Response Time (Hours) | Actual Response Time (Hours) | — |
| 105 | `serviceTimeHours` | Service Time (Hours) | Service Time (Hours) | — |
| 106 | `responseDate` | Response Date | Response Date | — |
| 107 | `responseTime` | Response Time | Response Time | — |
| 108 | `startingDate` | Starting Date | Starting Date | — |
| 109 | `startingTime` | Starting Time | Starting Time | — |
| 110 | `finishingDate` | Finishing Date | Finishing Date | — |
| 111 | `finishingTime` | Finishing Time | Finishing Time | — |
| 112 | `contractServHoursExist` | Contract Serv. Hours Exist | Contract Serv. Hours Exist | 🧮 computed |
| 113 | `reallocationNeeded` | Reallocation Needed | Reallocation Needed | 🧮 computed |
| 114 | `notifyCustomer` | Notify Customer | Notify Customer | — |
| 115 | `maxLaborUnitPrice` | Max. Labor Unit Price | Max. Labor Unit Price | — |
| 116 | `warningStatus` | Warning Status | Warning Status | — |
| 117 | `noOfAllocations` | No. of Allocations | No. of Allocations | 🧮 computed |
| 118 | `contractNo` | Contract No. | Contract No. | — |
| 119 | `typeFilter` | Type Filter | Type Filter | 🔍 filter |
| 120 | `customerFilter` | Customer Filter | Customer Filter | 🔍 filter |
| 121 | `resourceFilter` | Resource Filter | Resource Filter | 🔍 filter |
| 122 | `contractFilter` | Contract Filter | Contract Filter | 🔍 filter |
| 123 | `shipToFaxNo` | Ship-to Fax No. | Ship-to Fax No. | — |
| 124 | `shipToEMail` | Ship-to E-Mail | Ship-to Email | — |
| 125 | `resourceGroupFilter` | Resource Group Filter | Resource Group Filter | 🔍 filter |
| 126 | `shipToPhone` | Ship-to Phone | Ship-to Phone | — |
| 127 | `shipToPhone2` | Ship-to Phone 2 | Ship-to Phone 2 | — |
| 128 | `serviceZoneFilter` | Service Zone Filter | Service Zone Filter | 🔍 filter |
| 129 | `serviceZoneCode` | Service Zone Code | Service Zone Code | — |
| 130 | `expectedFinishingDate` | Expected Finishing Date | Expected Finishing Date | — |
| 131 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 132 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 133 | `quoteNo` | Quote No. | Quote No. | — |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceShipmentLines

**Description:** Posted Service Shipment Lines — lines of posted service shipments. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Service Shipment Line |
| Page ID | 90995 |
| Page Name | `ocpfServiceShipmentLines` |
| Entity Set Name | `ocpfServiceShipmentLines` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 102 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `customerNo` | Customer No. | Customer No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `no` | No. | No. | — |
| 7 | `locationCode` | Location Code | Location Code | — |
| 8 | `postingGroup` | Posting Group | Posting Group | — |
| 9 | `description` | Description | Description | — |
| 10 | `description2` | Description 2 | Description 2 | — |
| 11 | `unitOfMeasure` | Unit of Measure | Unit of Measure | — |
| 12 | `quantity` | Quantity | Quantity | — |
| 13 | `unitPrice` | Unit Price | Unit Price | — |
| 14 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 15 | `vatPct` | VAT % | VAT % | — |
| 16 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 17 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 18 | `grossWeight` | Gross Weight | Gross Weight | — |
| 19 | `netWeight` | Net Weight | Net Weight | — |
| 20 | `unitsPerParcel` | Units per Parcel | Units per Parcel | — |
| 21 | `unitVolume` | Unit Volume | Unit Volume | — |
| 22 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | — |
| 23 | `itemShptEntryNo` | Item Shpt. Entry No. | Item Shpt. Entry No. | — |
| 24 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 25 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 26 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 27 | `jobNo` | Job No. | Project No. | — |
| 28 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 29 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 30 | `qtyShippedNotInvoiced` | Qty. Shipped Not Invoiced | Qty. Shipped Not Invoiced | — |
| 31 | `quantityInvoiced` | Quantity Invoiced | Quantity Invoiced | — |
| 32 | `orderNo` | Order No. | Order No. | — |
| 33 | `orderLineNo` | Order Line No. | Order Line No. | — |
| 34 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 35 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 36 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 37 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 38 | `transactionType` | Transaction Type | Transaction Type | — |
| 39 | `transportMethod` | Transport Method | Transport Method | — |
| 40 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 41 | `exitPoint` | Exit Point | Exit Point | — |
| 42 | `area` | Area | Area | — |
| 43 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 44 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 45 | `taxLiable` | Tax Liable | Tax Liable | — |
| 46 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 47 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 48 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 49 | `currencyCode` | Currency Code | Currency Code | — |
| 50 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | — |
| 51 | `unitCost` | Unit Cost | Unit Cost | — |
| 52 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 53 | `timeSheetNo` | Time Sheet No. | Time Sheet No. | — |
| 54 | `timeSheetLineNo` | Time Sheet Line No. | Time Sheet Line No. | — |
| 55 | `timeSheetDate` | Time Sheet Date | Time Sheet Date | — |
| 56 | `jobPlanningLineNo` | Job Planning Line No. | Project Planning Line No. | — |
| 57 | `variantCode` | Variant Code | Variant Code | — |
| 58 | `binCode` | Bin Code | Bin Code | — |
| 59 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 60 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 61 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 62 | `qtyShippedNotInvdBase` | Qty. Shipped Not Invd. (Base) | Qty. Shipped Not Invd. (Base) | — |
| 63 | `qtyInvoicedBase` | Qty. Invoiced (Base) | Qty. Invoiced (Base) | — |
| 64 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 65 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 66 | `nonstock` | Nonstock | Catalog | — |
| 67 | `correction` | Correction | Correction | — |
| 68 | `applToWarrantyEntry` | Appl.-to Warranty Entry | Appl.-to Warranty Entry | — |
| 69 | `serviceItemNo` | Service Item No. | Service Item No. | — |
| 70 | `applToServiceEntry` | Appl.-to Service Entry | Appl.-to Service Entry | — |
| 71 | `serviceItemLineNo` | Service Item Line No. | Service Item Line No. | — |
| 72 | `serviceItemSerialNo` | Service Item Serial No. | Service Item Serial No. | — |
| 73 | `serviceItemLineDescription` | Service Item Line Description | Service Item Line Description | — |
| 74 | `postingDate` | Posting Date | Posting Date | — |
| 75 | `orderDate` | Order Date | Order Date | — |
| 76 | `neededByDate` | Needed by Date | Needed by Date | — |
| 77 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 78 | `quantityConsumed` | Quantity Consumed | Quantity Consumed | — |
| 79 | `qtyConsumedBase` | Qty. Consumed (Base) | Qty. Consumed (Base) | — |
| 80 | `servicePriceGroupCode` | Service Price Group Code | Service Price Group Code | — |
| 81 | `faultAreaCode` | Fault Area Code | Fault Area Code | — |
| 82 | `symptomCode` | Symptom Code | Symptom Code | — |
| 83 | `faultCode` | Fault Code | Fault Code | — |
| 84 | `resolutionCode` | Resolution Code | Resolution Code | — |
| 85 | `excludeWarranty` | Exclude Warranty | Exclude Warranty | — |
| 86 | `warranty` | Warranty | Warranty | — |
| 87 | `contractNo` | Contract No. | Contract No. | — |
| 88 | `contractDiscPct` | Contract Disc. % | Contract Disc. % | — |
| 89 | `warrantyDiscPct` | Warranty Disc. % | Warranty Disc. % | — |
| 90 | `componentLineNo` | Component Line No. | Component Line No. | — |
| 91 | `sparePartAction` | Spare Part Action | Spare Part Action | — |
| 92 | `faultReasonCode` | Fault Reason Code | Fault Reason Code | — |
| 93 | `replacedItemNo` | Replaced Item No. | Replaced Item No. | — |
| 94 | `excludeContractDiscount` | Exclude Contract Discount | Exclude Contract Discount | — |
| 95 | `replacedItemType` | Replaced Item Type | Replaced Item Type | — |
| 96 | `priceAdjmtStatus` | Price Adjmt. Status | Price Adjmt. Status | — |
| 97 | `lineDiscountType` | Line Discount Type | Line Discount Type | — |
| 98 | `copyComponentsFrom` | Copy Components From | Copy Components From | — |
| 99 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 100 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 101 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 102 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceInvoiceHeaders

**Description:** Posted Service Invoices — headers of posted service invoices. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Service Invoice Header |
| Page ID | 90996 |
| Page Name | `ocpfServiceInvoiceHeaders` |
| Entity Set Name | `ocpfServiceInvoiceHeaders` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 147 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `customerNo` | Customer No. | Customer No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 5 | `billToName` | Bill-to Name | Bill-to Name | — |
| 6 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | — |
| 7 | `billToAddress` | Bill-to Address | Bill-to Address | — |
| 8 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | — |
| 9 | `billToCity` | Bill-to City | Bill-to City | — |
| 10 | `billToContact` | Bill-to Contact | Bill-to Contact | — |
| 11 | `yourReference` | Your Reference | Your Reference | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 14 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 15 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 16 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 17 | `shipToCity` | Ship-to City | Ship-to City | — |
| 18 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 19 | `orderDate` | Order Date | Order Date | — |
| 20 | `postingDate` | Posting Date | Posting Date | — |
| 21 | `postingDescription` | Posting Description | Posting Description | — |
| 22 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 23 | `dueDate` | Due Date | Due Date | — |
| 24 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | — |
| 25 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 26 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | — |
| 27 | `locationCode` | Location Code | Location Code | — |
| 28 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 29 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 30 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | — |
| 31 | `currencyCode` | Currency Code | Currency Code | — |
| 32 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 33 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 34 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | — |
| 35 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | — |
| 36 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 37 | `languageCode` | Language Code | Language Code | — |
| 38 | `formatRegion` | Format Region | Format Region | — |
| 39 | `salespersonCode` | Salesperson Code | Salesperson Code | — |
| 40 | `orderNo` | Order No. | Order No. | — |
| 41 | `comment` | Comment | Comment | 🧮 computed |
| 42 | `noPrinted` | No. Printed | No. Printed | — |
| 43 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 44 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 45 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 46 | `amount` | Amount | Amount | 🧮 computed |
| 47 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 48 | `shippingNo` | Shipping No. | Shipping No. | — |
| 49 | `postingNo` | Posting No. | Posting No. | — |
| 50 | `lastShippingNo` | Last Shipping No. | Last Shipping No. | — |
| 51 | `lastPostingNo` | Last Posting No. | Last Posting No. | — |
| 52 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 53 | `reasonCode` | Reason Code | Reason Code | — |
| 54 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 55 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | — |
| 56 | `transactionType` | Transaction Type | Transaction Type | — |
| 57 | `transportMethod` | Transport Method | Transport Method | — |
| 58 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | — |
| 59 | `name` | Name | Name | — |
| 60 | `name2` | Name 2 | Name 2 | — |
| 61 | `address` | Address | Address | — |
| 62 | `address2` | Address 2 | Address 2 | — |
| 63 | `city` | City | City | — |
| 64 | `contactName` | Contact Name | Contact Name | — |
| 65 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | — |
| 66 | `billToCounty` | Bill-to County | Bill-to County | — |
| 67 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | — |
| 68 | `postCode` | Post Code | Post Code | — |
| 69 | `county` | County | County | — |
| 70 | `countryRegionCode` | Country/Region Code | Country/Region Code | — |
| 71 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 72 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 73 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 74 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 75 | `exitPoint` | Exit Point | Exit Point | — |
| 76 | `correction` | Correction | Correction | — |
| 77 | `documentDate` | Document Date | Document Date | — |
| 78 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 79 | `area` | Area | Area | — |
| 80 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 81 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 82 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | — |
| 83 | `preAssignedNoSeries` | Pre-Assigned No. Series | Pre-Assigned No. Series | — |
| 84 | `noSeries` | No. Series | No. Series | — |
| 85 | `shippingNoSeries` | Shipping No. Series | Shipping No. Series | — |
| 86 | `orderNoSeries` | Order No. Series | Order No. Series | — |
| 87 | `preAssignedNo` | Pre-Assigned No. | Pre-Assigned No. | — |
| 88 | `userId` | User ID | User ID | — |
| 89 | `sourceCode` | Source Code | Source Code | — |
| 90 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 91 | `taxLiable` | Tax Liable | Tax Liable | — |
| 92 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 93 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | — |
| 94 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | — |
| 95 | `vatReportingDate` | VAT Reporting Date | VAT Date | — |
| 96 | `paymentReference` | Payment Reference | Payment Reference | — |
| 97 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 98 | `documentExchangeIdentifier` | Document Exchange Identifier | Document Exchange Identifier | — |
| 99 | `documentExchangeStatus` | Document Exchange Status | Document Exchange Status | — |
| 100 | `docExchOriginalIdentifier` | Doc. Exch. Original Identifier | Doc. Exch. Original Identifier | — |
| 101 | `directDebitMandateId` | Direct Debit Mandate ID | Direct Debit Mandate ID | — |
| 102 | `contactNo` | Contact No. | Contact No. | — |
| 103 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | — |
| 104 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 105 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | — |
| 106 | `description` | Description | Description | — |
| 107 | `serviceOrderType` | Service Order Type | Service Order Type | — |
| 108 | `linkServiceToServiceItem` | Link Service to Service Item | Link Service to Service Item | — |
| 109 | `priority` | Priority | Priority | — |
| 110 | `allocatedHours` | Allocated Hours | Allocated Hours | 🧮 computed |
| 111 | `phoneNo` | Phone No. | Phone No. | — |
| 112 | `eMail` | E-Mail | Email | — |
| 113 | `phoneNo2` | Phone No. 2 | Phone No. 2 | — |
| 114 | `faxNo` | Fax No. | Fax No. | — |
| 115 | `noOfUnallocatedItems` | No. of Unallocated Items | No. of Unallocated Items | 🧮 computed |
| 116 | `orderTime` | Order Time | Order Time | — |
| 117 | `defaultResponseTimeHours` | Default Response Time (Hours) | Default Response Time (Hours) | — |
| 118 | `actualResponseTimeHours` | Actual Response Time (Hours) | Actual Response Time (Hours) | — |
| 119 | `serviceTimeHours` | Service Time (Hours) | Service Time (Hours) | — |
| 120 | `responseDate` | Response Date | Response Date | — |
| 121 | `responseTime` | Response Time | Response Time | — |
| 122 | `startingDate` | Starting Date | Starting Date | — |
| 123 | `startingTime` | Starting Time | Starting Time | — |
| 124 | `finishingDate` | Finishing Date | Finishing Date | — |
| 125 | `finishingTime` | Finishing Time | Finishing Time | — |
| 126 | `contractServHoursExist` | Contract Serv. Hours Exist | Contract Serv. Hours Exist | 🧮 computed |
| 127 | `reallocationNeeded` | Reallocation Needed | Reallocation Needed | 🧮 computed |
| 128 | `notifyCustomer` | Notify Customer | Notify Customer | — |
| 129 | `maxLaborUnitPrice` | Max. Labor Unit Price | Max. Labor Unit Price | — |
| 130 | `warningStatus` | Warning Status | Warning Status | — |
| 131 | `noOfAllocations` | No. of Allocations | No. of Allocations | 🧮 computed |
| 132 | `contractNo` | Contract No. | Contract No. | — |
| 133 | `typeFilter` | Type Filter | Type Filter | 🔍 filter |
| 134 | `customerFilter` | Customer Filter | Customer Filter | 🔍 filter |
| 135 | `resourceFilter` | Resource Filter | Resource Filter | 🔍 filter |
| 136 | `contractFilter` | Contract Filter | Contract Filter | 🔍 filter |
| 137 | `shipToFaxNo` | Ship-to Fax No. | Ship-to Fax No. | — |
| 138 | `shipToEMail` | Ship-to E-Mail | Ship-to Email | — |
| 139 | `resourceGroupFilter` | Resource Group Filter | Resource Group Filter | 🔍 filter |
| 140 | `shipToPhone` | Ship-to Phone | Ship-to Phone | — |
| 141 | `shipToPhone2` | Ship-to Phone 2 | Ship-to Phone 2 | — |
| 142 | `serviceZoneFilter` | Service Zone Filter | Service Zone Filter | 🔍 filter |
| 143 | `serviceZoneCode` | Service Zone Code | Service Zone Code | — |
| 144 | `expectedFinishingDate` | Expected Finishing Date | Expected Finishing Date | — |
| 145 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 146 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 147 | `quoteNo` | Quote No. | Quote No. | — |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceInvoiceLines

**Description:** Posted Service Invoice Lines — lines of posted service invoices. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Service Invoice Line |
| Page ID | 90997 |
| Page Name | `ocpfServiceInvoiceLines` |
| Entity Set Name | `ocpfServiceInvoiceLines` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 106 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `customerNo` | Customer No. | Customer No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `no` | No. | No. | — |
| 7 | `locationCode` | Location Code | Location Code | — |
| 8 | `postingGroup` | Posting Group | Posting Group | — |
| 9 | `description` | Description | Description | — |
| 10 | `description2` | Description 2 | Description 2 | — |
| 11 | `unitOfMeasure` | Unit of Measure | Unit of Measure | — |
| 12 | `quantity` | Quantity | Quantity | — |
| 13 | `unitPrice` | Unit Price | Unit Price | — |
| 14 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 15 | `vatPct` | VAT % | VAT % | — |
| 16 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 17 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | — |
| 18 | `amount` | Amount | Amount | — |
| 19 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | — |
| 20 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 21 | `grossWeight` | Gross Weight | Gross Weight | — |
| 22 | `netWeight` | Net Weight | Net Weight | — |
| 23 | `unitsPerParcel` | Units per Parcel | Units per Parcel | — |
| 24 | `unitVolume` | Unit Volume | Unit Volume | — |
| 25 | `applToItemEntry` | Appl.-to Item Entry | Appl.-to Item Entry | — |
| 26 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 27 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 28 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 29 | `jobNo` | Job No. | Project No. | — |
| 30 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 31 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 32 | `shipmentNo` | Shipment No. | Shipment No. | — |
| 33 | `shipmentLineNo` | Shipment Line No. | Shipment Line No. | — |
| 34 | `orderNo` | Order No. | Order No. | — |
| 35 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 36 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | — |
| 37 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 38 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 39 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 40 | `transactionType` | Transaction Type | Transaction Type | — |
| 41 | `transportMethod` | Transport Method | Transport Method | — |
| 42 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 43 | `exitPoint` | Exit Point | Exit Point | — |
| 44 | `area` | Area | Area | — |
| 45 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 46 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 47 | `taxLiable` | Tax Liable | Tax Liable | — |
| 48 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 49 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | — |
| 50 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 51 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 52 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | — |
| 53 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | — |
| 54 | `lineAmount` | Line Amount | Line Amount | — |
| 55 | `vatDifference` | VAT Difference | VAT Difference | — |
| 56 | `vatIdentifier` | VAT Identifier | VAT Identifier | — |
| 57 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | — |
| 58 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 59 | `jobPlanningLineNo` | Job Planning Line No. | Project Planning Line No. | — |
| 60 | `variantCode` | Variant Code | Variant Code | — |
| 61 | `binCode` | Bin Code | Bin Code | — |
| 62 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 63 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 64 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 65 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 66 | `substitutionAvailable` | Substitution Available | Substitution Available | — |
| 67 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 68 | `nonstock` | Nonstock | Catalog | — |
| 69 | `itemReferenceNo` | Item Reference No. | Item Reference No. | — |
| 70 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Unit of Measure (Item Ref.) | — |
| 71 | `itemReferenceType` | Item Reference Type | Item Reference Type | — |
| 72 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | — |
| 73 | `serviceItemNo` | Service Item No. | Service Item No. | — |
| 74 | `applToServiceEntry` | Appl.-to Service Entry | Appl.-to Service Entry | — |
| 75 | `serviceItemLineNo` | Service Item Line No. | Service Item Line No. | — |
| 76 | `serviceItemSerialNo` | Service Item Serial No. | Service Item Serial No. | — |
| 77 | `serviceItemLineDescription` | Service Item Line Description | Service Item Line Description | — |
| 78 | `servPriceAdjmtGrCode` | Serv. Price Adjmt. Gr. Code | Serv. Price Adjmt. Gr. Code | — |
| 79 | `postingDate` | Posting Date | Posting Date | — |
| 80 | `neededByDate` | Needed by Date | Needed by Date | — |
| 81 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 82 | `quantityConsumed` | Quantity Consumed | Quantity Consumed | — |
| 83 | `qtyConsumedBase` | Qty. Consumed (Base) | Qty. Consumed (Base) | — |
| 84 | `servicePriceGroupCode` | Service Price Group Code | Service Price Group Code | — |
| 85 | `faultAreaCode` | Fault Area Code | Fault Area Code | — |
| 86 | `symptomCode` | Symptom Code | Symptom Code | — |
| 87 | `faultCode` | Fault Code | Fault Code | — |
| 88 | `resolutionCode` | Resolution Code | Resolution Code | — |
| 89 | `excludeWarranty` | Exclude Warranty | Exclude Warranty | — |
| 90 | `warranty` | Warranty | Warranty | — |
| 91 | `contractNo` | Contract No. | Contract No. | — |
| 92 | `contractDiscPct` | Contract Disc. % | Contract Disc. % | — |
| 93 | `warrantyDiscPct` | Warranty Disc. % | Warranty Disc. % | — |
| 94 | `componentLineNo` | Component Line No. | Component Line No. | — |
| 95 | `sparePartAction` | Spare Part Action | Spare Part Action | — |
| 96 | `faultReasonCode` | Fault Reason Code | Fault Reason Code | — |
| 97 | `replacedItemNo` | Replaced Item No. | Replaced Item No. | — |
| 98 | `excludeContractDiscount` | Exclude Contract Discount | Exclude Contract Discount | — |
| 99 | `replacedItemType` | Replaced Item Type | Replaced Item Type | — |
| 100 | `priceAdjmtStatus` | Price Adjmt. Status | Price Adjmt. Status | — |
| 101 | `lineDiscountType` | Line Discount Type | Line Discount Type | — |
| 102 | `copyComponentsFrom` | Copy Components From | Copy Components From | — |
| 103 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 104 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 105 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 106 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceCrMemoHeaders

**Description:** Posted Service Credit Memos — headers of posted service credit memos. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Service Cr.Memo Header |
| Page ID | 90998 |
| Page Name | `ocpfServiceCrMemoHeaders` |
| Entity Set Name | `ocpfServiceCrMemoHeaders` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 137 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `customerNo` | Customer No. | Customer No. | — |
| 3 | `no` | No. | No. | — |
| 4 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 5 | `billToName` | Bill-to Name | Bill-to Name | — |
| 6 | `billToName2` | Bill-to Name 2 | Bill-to Name 2 | — |
| 7 | `billToAddress` | Bill-to Address | Bill-to Address | — |
| 8 | `billToAddress2` | Bill-to Address 2 | Bill-to Address 2 | — |
| 9 | `billToCity` | Bill-to City | Bill-to City | — |
| 10 | `billToContact` | Bill-to Contact | Bill-to Contact | — |
| 11 | `yourReference` | Your Reference | Your Reference | — |
| 12 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 13 | `shipToName` | Ship-to Name | Ship-to Name | — |
| 14 | `shipToName2` | Ship-to Name 2 | Ship-to Name 2 | — |
| 15 | `shipToAddress` | Ship-to Address | Ship-to Address | — |
| 16 | `shipToAddress2` | Ship-to Address 2 | Ship-to Address 2 | — |
| 17 | `shipToCity` | Ship-to City | Ship-to City | — |
| 18 | `shipToContact` | Ship-to Contact | Ship-to Contact | — |
| 19 | `postingDate` | Posting Date | Posting Date | — |
| 20 | `postingDescription` | Posting Description | Posting Description | — |
| 21 | `paymentTermsCode` | Payment Terms Code | Payment Terms Code | — |
| 22 | `dueDate` | Due Date | Due Date | — |
| 23 | `paymentDiscountPct` | Payment Discount % | Payment Discount % | — |
| 24 | `pmtDiscountDate` | Pmt. Discount Date | Pmt. Discount Date | — |
| 25 | `shipmentMethodCode` | Shipment Method Code | Shipment Method Code | — |
| 26 | `locationCode` | Location Code | Location Code | — |
| 27 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 28 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 29 | `customerPostingGroup` | Customer Posting Group | Customer Posting Group | — |
| 30 | `currencyCode` | Currency Code | Currency Code | — |
| 31 | `currencyFactor` | Currency Factor | Currency Factor | — |
| 32 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 33 | `pricesIncludingVat` | Prices Including VAT | Prices Including VAT | — |
| 34 | `invoiceDiscCode` | Invoice Disc. Code | Invoice Disc. Code | — |
| 35 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |
| 36 | `languageCode` | Language Code | Language Code | — |
| 37 | `formatRegion` | Format Region | Format Region | — |
| 38 | `salespersonCode` | Salesperson Code | Salesperson Code | — |
| 39 | `comment` | Comment | Comment | 🧮 computed |
| 40 | `noPrinted` | No. Printed | No. Printed | — |
| 41 | `appliesToDocType` | Applies-to Doc. Type | Applies-to Doc. Type | — |
| 42 | `appliesToDocNo` | Applies-to Doc. No. | Applies-to Doc. No. | — |
| 43 | `balAccountNo` | Bal. Account No. | Bal. Account No. | — |
| 44 | `amount` | Amount | Amount | 🧮 computed |
| 45 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | 🧮 computed |
| 46 | `vatRegistrationNo` | VAT Registration No. | VAT Registration No. | — |
| 47 | `reasonCode` | Reason Code | Reason Code | — |
| 48 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 49 | `eu3PartyTrade` | EU 3-Party Trade | EU 3-Party Trade | — |
| 50 | `transactionType` | Transaction Type | Transaction Type | — |
| 51 | `transportMethod` | Transport Method | Transport Method | — |
| 52 | `vatCountryRegionCode` | VAT Country/Region Code | VAT Country/Region Code | — |
| 53 | `name` | Name | Name | — |
| 54 | `name2` | Name 2 | Name 2 | — |
| 55 | `address` | Address | Address | — |
| 56 | `address2` | Address 2 | Address 2 | — |
| 57 | `city` | City | City | — |
| 58 | `contactName` | Contact Name | Contact Name | — |
| 59 | `billToPostCode` | Bill-to Post Code | Bill-to Post Code | — |
| 60 | `billToCounty` | Bill-to County | Bill-to County | — |
| 61 | `billToCountryRegionCode` | Bill-to Country/Region Code | Bill-to Country/Region Code | — |
| 62 | `postCode` | Post Code | Post Code | — |
| 63 | `county` | County | County | — |
| 64 | `countryRegionCode` | Country/Region Code | Country/Region Code | — |
| 65 | `shipToPostCode` | Ship-to Post Code | Ship-to Post Code | — |
| 66 | `shipToCounty` | Ship-to County | Ship-to County | — |
| 67 | `shipToCountryRegionCode` | Ship-to Country/Region Code | Ship-to Country/Region Code | — |
| 68 | `balAccountType` | Bal. Account Type | Bal. Account Type | — |
| 69 | `exitPoint` | Exit Point | Exit Point | — |
| 70 | `correction` | Correction | Correction | — |
| 71 | `documentDate` | Document Date | Document Date | — |
| 72 | `externalDocumentNo` | External Document No. | External Document No. | — |
| 73 | `area` | Area | Area | — |
| 74 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 75 | `paymentMethodCode` | Payment Method Code | Payment Method Code | — |
| 76 | `shippingAgentCode` | Shipping Agent Code | Shipping Agent Code | — |
| 77 | `preAssignedNoSeries` | Pre-Assigned No. Series | Pre-Assigned No. Series | — |
| 78 | `noSeries` | No. Series | No. Series | — |
| 79 | `preAssignedNo` | Pre-Assigned No. | Pre-Assigned No. | — |
| 80 | `userId` | User ID | User ID | — |
| 81 | `sourceCode` | Source Code | Source Code | — |
| 82 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 83 | `taxLiable` | Tax Liable | Tax Liable | — |
| 84 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 85 | `vatBaseDiscountPct` | VAT Base Discount % | VAT Base Discount % | — |
| 86 | `companyBankAccountCode` | Company Bank Account Code | Company Bank Account Code | — |
| 87 | `vatReportingDate` | VAT Reporting Date | VAT Date | — |
| 88 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 89 | `documentExchangeIdentifier` | Document Exchange Identifier | Document Exchange Identifier | — |
| 90 | `documentExchangeStatus` | Document Exchange Status | Document Exchange Status | — |
| 91 | `docExchOriginalIdentifier` | Doc. Exch. Original Identifier | Doc. Exch. Original Identifier | — |
| 92 | `contactNo` | Contact No. | Contact No. | — |
| 93 | `billToContactNo` | Bill-to Contact No. | Bill-to Contact No. | — |
| 94 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 95 | `shippingAgentServiceCode` | Shipping Agent Service Code | Shipping Agent Service Code | — |
| 96 | `description` | Description | Description | — |
| 97 | `serviceOrderType` | Service Order Type | Service Order Type | — |
| 98 | `linkServiceToServiceItem` | Link Service to Service Item | Link Service to Service Item | — |
| 99 | `priority` | Priority | Priority | — |
| 100 | `allocatedHours` | Allocated Hours | Allocated Hours | 🧮 computed |
| 101 | `phoneNo` | Phone No. | Phone No. | — |
| 102 | `eMail` | E-Mail | Email | — |
| 103 | `phoneNo2` | Phone No. 2 | Phone No. 2 | — |
| 104 | `faxNo` | Fax No. | Fax No. | — |
| 105 | `noOfUnallocatedItems` | No. of Unallocated Items | No. of Unallocated Items | 🧮 computed |
| 106 | `orderTime` | Order Time | Order Time | — |
| 107 | `defaultResponseTimeHours` | Default Response Time (Hours) | Default Response Time (Hours) | — |
| 108 | `actualResponseTimeHours` | Actual Response Time (Hours) | Actual Response Time (Hours) | — |
| 109 | `serviceTimeHours` | Service Time (Hours) | Service Time (Hours) | — |
| 110 | `responseDate` | Response Date | Response Date | — |
| 111 | `responseTime` | Response Time | Response Time | — |
| 112 | `startingDate` | Starting Date | Starting Date | — |
| 113 | `startingTime` | Starting Time | Starting Time | — |
| 114 | `finishingDate` | Finishing Date | Finishing Date | — |
| 115 | `finishingTime` | Finishing Time | Finishing Time | — |
| 116 | `contractServHoursExist` | Contract Serv. Hours Exist | Contract Serv. Hours Exist | 🧮 computed |
| 117 | `reallocationNeeded` | Reallocation Needed | Reallocation Needed | 🧮 computed |
| 118 | `notifyCustomer` | Notify Customer | Notify Customer | — |
| 119 | `maxLaborUnitPrice` | Max. Labor Unit Price | Max. Labor Unit Price | — |
| 120 | `warningStatus` | Warning Status | Warning Status | — |
| 121 | `noOfAllocations` | No. of Allocations | No. of Allocations | 🧮 computed |
| 122 | `contractNo` | Contract No. | Contract No. | — |
| 123 | `typeFilter` | Type Filter | Type Filter | 🔍 filter |
| 124 | `customerFilter` | Customer Filter | Customer Filter | 🔍 filter |
| 125 | `resourceFilter` | Resource Filter | Resource Filter | 🔍 filter |
| 126 | `contractFilter` | Contract Filter | Contract Filter | 🔍 filter |
| 127 | `shipToFaxNo` | Ship-to Fax No. | Ship-to Fax No. | — |
| 128 | `shipToEMail` | Ship-to E-Mail | Ship-to Email | — |
| 129 | `resourceGroupFilter` | Resource Group Filter | Resource Group Filter | 🔍 filter |
| 130 | `shipToPhone` | Ship-to Phone | Ship-to Phone | — |
| 131 | `shipToPhone2` | Ship-to Phone 2 | Ship-to Phone 2 | — |
| 132 | `serviceZoneFilter` | Service Zone Filter | Service Zone Filter | 🔍 filter |
| 133 | `serviceZoneCode` | Service Zone Code | Service Zone Code | — |
| 134 | `expectedFinishingDate` | Expected Finishing Date | Expected Finishing Date | — |
| 135 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 136 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 137 | `quoteNo` | Quote No. | Quote No. | — |


[↑ Back to top](#table-of-contents)

---

### ocpfServiceCrMemoLines

**Description:** Posted Service Credit Memo Lines — lines of posted service credit memos. Read-only.

| Property | Value |
|---|---|
| **Source Table** | Service Cr.Memo Line |
| Page ID | 90999 |
| Page Name | `ocpfServiceCrMemoLines` |
| Entity Set Name | `ocpfServiceCrMemoLines` |
| API Group | `ocpf_serviceManagement` |
| API Version | v3.1 only (new in v3.1) |
| Editable | ❌ No (GET only) |
| Field Count | 99 |

| # | Identifier | BC Field Name | Caption | Editable |
|---|---|---|---|---|
| 1 | `systemId` | SystemId | System ID | 🔑 Key |
| 2 | `customerNo` | Customer No. | Customer No. | — |
| 3 | `documentNo` | Document No. | Document No. | — |
| 4 | `lineNo` | Line No. | Line No. | — |
| 5 | `type` | Type | Type | — |
| 6 | `no` | No. | No. | — |
| 7 | `locationCode` | Location Code | Location Code | — |
| 8 | `postingGroup` | Posting Group | Posting Group | — |
| 9 | `description` | Description | Description | — |
| 10 | `description2` | Description 2 | Description 2 | — |
| 11 | `unitOfMeasure` | Unit of Measure | Unit of Measure | — |
| 12 | `quantity` | Quantity | Quantity | — |
| 13 | `unitPrice` | Unit Price | Unit Price | — |
| 14 | `unitCostLcy` | Unit Cost (LCY) | Unit Cost (LCY) | — |
| 15 | `vatPct` | VAT % | VAT % | — |
| 16 | `lineDiscountPct` | Line Discount % | Line Discount % | — |
| 17 | `lineDiscountAmount` | Line Discount Amount | Line Discount Amount | — |
| 18 | `amount` | Amount | Amount | — |
| 19 | `amountIncludingVat` | Amount Including VAT | Amount Including VAT | — |
| 20 | `allowInvoiceDisc` | Allow Invoice Disc. | Allow Invoice Disc. | — |
| 21 | `grossWeight` | Gross Weight | Gross Weight | — |
| 22 | `netWeight` | Net Weight | Net Weight | — |
| 23 | `unitsPerParcel` | Units per Parcel | Units per Parcel | — |
| 24 | `unitVolume` | Unit Volume | Unit Volume | — |
| 25 | `shortcutDimension1Code` | Shortcut Dimension 1 Code | Shortcut Dimension 1 Code | — |
| 26 | `shortcutDimension2Code` | Shortcut Dimension 2 Code | Shortcut Dimension 2 Code | — |
| 27 | `customerPriceGroup` | Customer Price Group | Customer Price Group | — |
| 28 | `jobNo` | Job No. | Project No. | — |
| 29 | `jobTaskNo` | Job Task No. | Project Task No. | — |
| 30 | `workTypeCode` | Work Type Code | Work Type Code | — |
| 31 | `shipmentNo` | Shipment No. | Shipment No. | — |
| 32 | `billToCustomerNo` | Bill-to Customer No. | Bill-to Customer No. | — |
| 33 | `invDiscountAmount` | Inv. Discount Amount | Inv. Discount Amount | — |
| 34 | `genBusPostingGroup` | Gen. Bus. Posting Group | Gen. Bus. Posting Group | — |
| 35 | `genProdPostingGroup` | Gen. Prod. Posting Group | Gen. Prod. Posting Group | — |
| 36 | `vatCalculationType` | VAT Calculation Type | VAT Calculation Type | — |
| 37 | `transactionType` | Transaction Type | Transaction Type | — |
| 38 | `transportMethod` | Transport Method | Transport Method | — |
| 39 | `attachedToLineNo` | Attached to Line No. | Attached to Line No. | — |
| 40 | `exitPoint` | Exit Point | Exit Point | — |
| 41 | `area` | Area | Area | — |
| 42 | `transactionSpecification` | Transaction Specification | Transaction Specification | — |
| 43 | `taxAreaCode` | Tax Area Code | Tax Area Code | — |
| 44 | `taxLiable` | Tax Liable | Tax Liable | — |
| 45 | `taxGroupCode` | Tax Group Code | Tax Group Code | — |
| 46 | `vatClauseCode` | VAT Clause Code | VAT Clause Code | — |
| 47 | `vatBusPostingGroup` | VAT Bus. Posting Group | VAT Bus. Posting Group | — |
| 48 | `vatProdPostingGroup` | VAT Prod. Posting Group | VAT Prod. Posting Group | — |
| 49 | `vatBaseAmount` | VAT Base Amount | VAT Base Amount | — |
| 50 | `unitCost` | Unit Cost | Unit Cost | — |
| 51 | `systemCreatedEntry` | System-Created Entry | System-Created Entry | — |
| 52 | `lineAmount` | Line Amount | Line Amount | — |
| 53 | `vatDifference` | VAT Difference | VAT Difference | — |
| 54 | `vatIdentifier` | VAT Identifier | VAT Identifier | — |
| 55 | `pmtDiscountAmount` | Pmt. Discount Amount | Pmt. Discount Amount | — |
| 56 | `dimensionSetId` | Dimension Set ID | Dimension Set ID | — |
| 57 | `jobPlanningLineNo` | Job Planning Line No. | Project Planning Line No. | — |
| 58 | `variantCode` | Variant Code | Variant Code | — |
| 59 | `binCode` | Bin Code | Bin Code | — |
| 60 | `qtyPerUnitOfMeasure` | Qty. per Unit of Measure | Qty. per Unit of Measure | — |
| 61 | `unitOfMeasureCode` | Unit of Measure Code | Unit of Measure Code | — |
| 62 | `quantityBase` | Quantity (Base) | Quantity (Base) | — |
| 63 | `responsibilityCenter` | Responsibility Center | Responsibility Center | — |
| 64 | `itemCategoryCode` | Item Category Code | Item Category Code | — |
| 65 | `nonstock` | Nonstock | Catalog | — |
| 66 | `itemReferenceNo` | Item Reference No. | Item Reference No. | — |
| 67 | `itemReferenceUnitOfMeasure` | Item Reference Unit of Measure | Unit of Measure (Item Ref.) | — |
| 68 | `itemReferenceType` | Item Reference Type | Item Reference Type | — |
| 69 | `itemReferenceTypeNo` | Item Reference Type No. | Item Reference Type No. | — |
| 70 | `applFromItemEntry` | Appl.-from Item Entry | Appl.-from Item Entry | — |
| 71 | `serviceItemNo` | Service Item No. | Service Item No. | — |
| 72 | `applToServiceEntry` | Appl.-to Service Entry | Appl.-to Service Entry | — |
| 73 | `serviceItemSerialNo` | Service Item Serial No. | Service Item Serial No. | — |
| 74 | `serviceItemLineDescription` | Service Item Line Description | Service Item Line Description | — |
| 75 | `postingDate` | Posting Date | Posting Date | — |
| 76 | `neededByDate` | Needed by Date | Needed by Date | — |
| 77 | `shipToCode` | Ship-to Code | Ship-to Code | — |
| 78 | `servicePriceGroupCode` | Service Price Group Code | Service Price Group Code | — |
| 79 | `faultAreaCode` | Fault Area Code | Fault Area Code | — |
| 80 | `symptomCode` | Symptom Code | Symptom Code | — |
| 81 | `faultCode` | Fault Code | Fault Code | — |
| 82 | `resolutionCode` | Resolution Code | Resolution Code | — |
| 83 | `excludeWarranty` | Exclude Warranty | Exclude Warranty | — |
| 84 | `warranty` | Warranty | Warranty | — |
| 85 | `contractNo` | Contract No. | Contract No. | — |
| 86 | `contractDiscPct` | Contract Disc. % | Contract Disc. % | — |
| 87 | `warrantyDiscPct` | Warranty Disc. % | Warranty Disc. % | — |
| 88 | `componentLineNo` | Component Line No. | Component Line No. | — |
| 89 | `sparePartAction` | Spare Part Action | Spare Part Action | — |
| 90 | `faultReasonCode` | Fault Reason Code | Fault Reason Code | — |
| 91 | `replacedItemNo` | Replaced Item No. | Replaced Item No. | — |
| 92 | `excludeContractDiscount` | Exclude Contract Discount | Exclude Contract Discount | — |
| 93 | `priceAdjmtStatus` | Price Adjmt. Status | Price Adjmt. Status | — |
| 94 | `lineDiscountType` | Line Discount Type | Line Discount Type | — |
| 95 | `copyComponentsFrom` | Copy Components From | Copy Components From | — |
| 96 | `returnReasonCode` | Return Reason Code | Return Reason Code | — |
| 97 | `priceCalculationMethod` | Price Calculation Method | Price Calculation Method | — |
| 98 | `allowLineDisc` | Allow Line Disc. | Allow Line Disc. | — |
| 99 | `customerDiscGroup` | Customer Disc. Group | Customer Disc. Group | — |


[↑ Back to top](#table-of-contents)

---
