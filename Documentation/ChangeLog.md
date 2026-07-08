# Build Change Log

## v3.1.1 — Discount API pages note (2026-07-08)

The new Sales Line Discount and Purchase Line Discount API pages are included in this release. Although the underlying Business Central tables are currently marked for deprecation, these API pages remain maintained for now because the V16 pricing model is still an opt-in feature in BC. We will revisit and adjust this in the future once Microsoft enables the new pricing tables by default.

---

## Documentation correction — per-field Editable column (2026-07-08)

The Editable column in Documentation.md previously reflected only page-level access (✅ on every
field of an editable page), overstating writability: FlowFields such as Customer `Credit Amount`
are computed and can never be written via the API. The column is now derived from the BC 27.5
symbol field classes for all 178 entities: 🔑 key · ✅ writable stored field · 🧮 computed
(FlowField) · 🔍 filter (FlowFilter) · — stored field on a read-only page.
Result across 11,397 field rows: 5,960 writable · 1,036 computed · 190 filters · 4,033 read-only ·
178 keys. API behavior is unchanged — this was a documentation error only.

---

## v3.1 — New Entities: Ship-to Addresses, Manufacturing, Assembly, Service Management (2026-07-07)

**65 new API pages**, published as **v3.1-only** (`APIVersion = 'v3.1';`) — they do not exist on
v3.0 endpoints. This is the reason new integrations should use the `/v3.1/` base URL.

- `MasterData` (+1): Ship-to Address → `ocpfShipToAddresses` (Page 90859)
- New category `Manufacturing` / API group `ocpf_manufacturing` (+34): pages 90939–90972 —
  manufacturing setup, work/machine centers, shop calendars, capacities, routings, production BOMs,
  families, production orders (incl. components, routing lines, capacity needs), capacity ledger,
  and assembly (setup, BOM components, open + posted assembly orders)
- New category `ServiceManagement` / API group `ocpf_serviceManagement` (+30): pages 90924–90926 & 90973–90999 —
  service setup and code tables, service items/components, service documents (headers, item lines, lines),
  contracts, loaners, service/warranty ledgers, registers, and posted service documents

Field selection follows the catalog rules: all standard fields except localization ranges (10000–29999),
obsolete fields, and Blob/Media fields. JSON names use the title-case convention (`amountLcy` style).
Editability: masters, setups, code tables, and open documents are editable; ledgers, registers, calendar
entries, capacity needs, and posted documents are read-only.

Permission sets updated: `OCPF - READ` now covers 178 pages; `OCPF - READ/WRITE` grants write on 111.

| Page ID | Entity Set | Source Table | Editable | Fields |
|---|---|---|---|---|
| 90859 | ocpfShipToAddresses | Ship-to Address (222) | ✅ | 28 |
| 90924 | ocpfServiceMgtSetup | Service Mgt. Setup (5911) | ✅ | 71 |
| 90925 | ocpfServiceOrderTypes | Service Order Type (5903) | ✅ | 3 |
| 90926 | ocpfServiceCosts | Service Cost (5905) | ✅ | 10 |
| 90939 | ocpfManufacturingSetup | Manufacturing Setup (99000765) | ✅ | 27 |
| 90940 | ocpfWorkShifts | Work Shift (99000750) | ✅ | 3 |
| 90941 | ocpfShopCalendars | Shop Calendar (99000751) | ✅ | 3 |
| 90942 | ocpfShopCalendarWorkingDays | Shop Calendar Working Days (99000752) | ✅ | 6 |
| 90943 | ocpfWorkCenterGroups | Work Center Group (99000756) | ✅ | 9 |
| 90944 | ocpfWorkCenters | Work Center (99000754) | ✅ | 50 |
| 90945 | ocpfMachineCenters | Machine Center (99000758) | ✅ | 54 |
| 90946 | ocpfCapacityUnitsOfMeasure | Capacity Unit of Measure (99000780) | ✅ | 4 |
| 90947 | ocpfCalendarEntries | Calendar Entry (99000757) | — | 17 |
| 90948 | ocpfCalendarAbsenceEntries | Calendar Absence Entry (99000760) | — | 13 |
| 90949 | ocpfStops | Stop (99000761) | ✅ | 3 |
| 90950 | ocpfScraps | Scrap (99000762) | ✅ | 3 |
| 90951 | ocpfRoutingLinks | Routing Link (99000777) | ✅ | 3 |
| 90952 | ocpfStandardTasks | Standard Task (99000778) | ✅ | 3 |
| 90953 | ocpfRoutingHeaders | Routing Header (99000763) | ✅ | 11 |
| 90954 | ocpfRoutingLines | Routing Line (99000764) | ✅ | 35 |
| 90955 | ocpfRoutingVersions | Routing Version (99000786) | ✅ | 9 |
| 90956 | ocpfProductionBomHeaders | Production BOM Header (99000771) | ✅ | 13 |
| 90957 | ocpfProductionBomLines | Production BOM Line (99000772) | ✅ | 25 |
| 90958 | ocpfProductionBomVersions | Production BOM Version (99000779) | ✅ | 9 |
| 90959 | ocpfFamilies | Family (99000773) | ✅ | 8 |
| 90960 | ocpfFamilyLines | Family Line (99000774) | ✅ | 9 |
| 90961 | ocpfProductionOrders | Production Order (5405) | ✅ | 56 |
| 90962 | ocpfProdOrderLines | Prod. Order Line (5406) | ✅ | 65 |
| 90963 | ocpfProdOrderComponents | Prod. Order Component (5407) | ✅ | 60 |
| 90964 | ocpfProdOrderRoutingLines | Prod. Order Routing Line (5409) | ✅ | 63 |
| 90965 | ocpfProdOrderCapacityNeeds | Prod. Order Capacity Need (5410) | — | 29 |
| 90966 | ocpfCapacityLedgerEntries | Capacity Ledger Entry (5832) | — | 40 |
| 90967 | ocpfAssemblySetup | Assembly Setup (905) | ✅ | 12 |
| 90968 | ocpfBomComponents | BOM Component (90) | ✅ | 19 |
| 90969 | ocpfAssemblyHeaders | Assembly Header (900) | ✅ | 50 |
| 90970 | ocpfAssemblyLines | Assembly Line (901) | ✅ | 50 |
| 90971 | ocpfPostedAssemblyHeaders | Posted Assembly Header (910) | — | 37 |
| 90972 | ocpfPostedAssemblyLines | Posted Assembly Line (911) | — | 32 |
| 90973 | ocpfServiceZones | Service Zone (5957) | ✅ | 3 |
| 90974 | ocpfServiceItemGroups | Service Item Group (5904) | ✅ | 7 |
| 90975 | ocpfRepairStatuses | Repair Status (5927) | ✅ | 19 |
| 90976 | ocpfFaultAreas | Fault Area (5915) | ✅ | 3 |
| 90977 | ocpfSymptomCodes | Symptom Code (5916) | ✅ | 3 |
| 90978 | ocpfFaultCodes | Fault Code (5918) | ✅ | 5 |
| 90979 | ocpfFaultReasonCodes | Fault Reason Code (5917) | ✅ | 5 |
| 90980 | ocpfResolutionCodes | Resolution Code (5919) | ✅ | 3 |
| 90981 | ocpfLoaners | Loaner (5913) | ✅ | 14 |
| 90982 | ocpfLoanerEntries | Loaner Entry (5914) | — | 14 |
| 90983 | ocpfServiceItems | Service Item (5940) | ✅ | 82 |
| 90984 | ocpfServiceItemComponents | Service Item Component (5941) | ✅ | 14 |
| 90985 | ocpfServiceHeaders | Service Header (5900) | ✅ | 156 |
| 90986 | ocpfServiceItemLines | Service Item Line (5901) | ✅ | 64 |
| 90987 | ocpfServiceLines | Service Line (5902) | ✅ | 157 |
| 90988 | ocpfServiceLedgerEntries | Service Ledger Entry (5907) | — | 64 |
| 90989 | ocpfWarrantyLedgerEntries | Warranty Ledger Entry (5908) | — | 42 |
| 90990 | ocpfServiceRegisters | Service Register (5934) | — | 10 |
| 90991 | ocpfServiceContractHeaders | Service Contract Header (5965) | ✅ | 107 |
| 90992 | ocpfServiceContractLines | Service Contract Line (5964) | ✅ | 32 |
| 90993 | ocpfContractGroups | Contract Group (5966) | ✅ | 6 |
| 90994 | ocpfServiceShipmentHeaders | Service Shipment Header (5990) | — | 133 |
| 90995 | ocpfServiceShipmentLines | Service Shipment Line (5991) | — | 102 |
| 90996 | ocpfServiceInvoiceHeaders | Service Invoice Header (5992) | — | 147 |
| 90997 | ocpfServiceInvoiceLines | Service Invoice Line (5993) | — | 106 |
| 90998 | ocpfServiceCrMemoHeaders | Service Cr.Memo Header (5994) | — | 137 |
| 90999 | ocpfServiceCrMemoLines | Service Cr.Memo Line (5995) | — | 99 |

---

## v3.1 — Missing Standard Fields (2026-07-07)

**Root cause fixed:** the v3.0 generator silently skipped every table field whose name contains
parentheses — e.g. `Credit Limit (LCY)`, `Cost Amount (Actual)`, all `(LCY)`/`(Qty.)` FlowFields.
This contradicted the documented contract ("every non-localization field ... including flow fields").
Localization-specific fields (IDs 10000–29999) remain excluded by design. Obsolete fields are not added.

**Versioning:** all API pages are now dual-versioned — `APIVersion = 'v3.0', 'v3.1';`.
Existing v3.0 endpoints keep working unchanged (the added fields appear there too, which is additive and
non-breaking for OData clients). New entities introduced from now on will be published as v3.1-only,
so new integrations should use the `/v3.1/` base URL. `app.json` version: 3.0.0.0 → 3.1.0.0.

**Fields added: 170 across 22 pages.**

| Entity | File | Fields added (JSON name — BC field) |
|---|---|---|
| ocpfCustLedgerEntries | CoreFinancial/API.CustLedgerEntries.al | `originalAmtLcy` — Original Amt. (LCY)<br>`remainingAmtLcy` — Remaining Amt. (LCY)<br>`amountLcy` — Amount (LCY)<br>`salesLcy` — Sales (LCY)<br>`profitLcy` — Profit (LCY)<br>`invDiscountLcy` — Inv. Discount (LCY)<br>`pmtDiscGivenLcy` — Pmt. Disc. Given (LCY)<br>`origPmtDiscPossibleLcy` — Orig. Pmt. Disc. Possible(LCY)<br>`closedByAmountLcy` — Closed by Amount (LCY)<br>`debitAmountLcy` — Debit Amount (LCY)<br>`creditAmountLcy` — Credit Amount (LCY)<br>`pmtToleranceLcy` — Pmt. Tolerance (LCY) |
| ocpfDetailedCustLedgerEntries | CoreFinancial/API.DetailedCustLedgerEntries.al | `amountLcy` — Amount (LCY)<br>`debitAmountLcy` — Debit Amount (LCY)<br>`creditAmountLcy` — Credit Amount (LCY) |
| ocpfDtldVendorLedgEntries | CoreFinancial/API.DetailedVendorLedgerEntries.al | `amountLcy` — Amount (LCY)<br>`debitAmountLcy` — Debit Amount (LCY)<br>`creditAmountLcy` — Credit Amount (LCY) |
| ocpfEmployeeLedgerEntries | CoreFinancial/API.EmployeeLedgerEntries.al | `originalAmtLcy` — Original Amt. (LCY)<br>`remainingAmtLcy` — Remaining Amt. (LCY)<br>`amountLcy` — Amount (LCY)<br>`closedByAmountLcy` — Closed by Amount (LCY)<br>`debitAmountLcy` — Debit Amount (LCY)<br>`creditAmountLcy` — Credit Amount (LCY) |
| ocpfGeneralLedgerSetup | CoreFinancial/API.GeneralLedgerSetup.al | `invRoundingPrecisionLcy` — Inv. Rounding Precision (LCY)<br>`invRoundingTypeLcy` — Inv. Rounding Type (LCY) |
| ocpfGeneralPostingSetup | CoreFinancial/API.GeneralPostingSetup.al | `invtAccrualAccInterim` — Invt. Accrual Acc. (Interim)<br>`cogsAccountInterim` — COGS Account (Interim) |
| ocpfVendorLedgerEntries | CoreFinancial/API.VendorLedgerEntries.al | `originalAmtLcy` — Original Amt. (LCY)<br>`remainingAmtLcy` — Remaining Amt. (LCY)<br>`amountLcy` — Amount (LCY)<br>`purchaseLcy` — Purchase (LCY)<br>`invDiscountLcy` — Inv. Discount (LCY)<br>`pmtDiscRcdLcy` — Pmt. Disc. Rcd.(LCY)<br>`origPmtDiscPossibleLcy` — Orig. Pmt. Disc. Possible(LCY)<br>`closedByAmountLcy` — Closed by Amount (LCY)<br>`debitAmountLcy` — Debit Amount (LCY)<br>`creditAmountLcy` — Credit Amount (LCY)<br>`pmtToleranceLcy` — Pmt. Tolerance (LCY) |
| ocpfBankAccountLedgerEntries | MasterData/API.BankAccountLedgerEntries.al | `amountLcy` — Amount (LCY)<br>`debitAmountLcy` — Debit Amount (LCY)<br>`creditAmountLcy` — Credit Amount (LCY) |
| ocpfBankAccounts | MasterData/API.BankAccounts.al | `balanceLcy` — Balance (LCY)<br>`netChangeLcy` — Net Change (LCY)<br>`balanceAtDateLcy` — Balance at Date (LCY)<br>`debitAmountLcy` — Debit Amount (LCY)<br>`creditAmountLcy` — Credit Amount (LCY) |
| ocpfContacts | MasterData/API.Contacts.al | `costLcy` — Cost (LCY)<br>`durationMin` — Duration (Min.)<br>`estimatedValueLcy` — Estimated Value (LCY)<br>`calcdCurrentValueLcy` — Calcd. Current Value (LCY) |
| ocpfCurrencies | MasterData/API.Currencies.al | `customerBalanceLcy` — Customer Balance (LCY)<br>`vendorBalanceLcy` — Vendor Balance (LCY) |
| ocpfCustomers | MasterData/API.Customers.al | `creditLimitLcy` — Credit Limit (LCY)<br>`balanceLcy` — Balance (LCY)<br>`netChangeLcy` — Net Change (LCY)<br>`salesLcy` — Sales (LCY)<br>`profitLcy` — Profit (LCY)<br>`invDiscountsLcy` — Inv. Discounts (LCY)<br>`pmtDiscountsLcy` — Pmt. Discounts (LCY)<br>`balanceDueLcy` — Balance Due (LCY)<br>`paymentsLcy` — Payments (LCY)<br>`invAmountsLcy` — Inv. Amounts (LCY)<br>`crMemoAmountsLcy` — Cr. Memo Amounts (LCY)<br>`finChargeMemoAmountsLcy` — Fin. Charge Memo Amounts (LCY)<br>`debitAmountLcy` — Debit Amount (LCY)<br>`creditAmountLcy` — Credit Amount (LCY)<br>`reminderAmountsLcy` — Reminder Amounts (LCY)<br>`outstandingOrdersLcy` — Outstanding Orders (LCY)<br>`shippedNotInvoicedLcy` — Shipped Not Invoiced (LCY)<br>`pmtDiscToleranceLcy` — Pmt. Disc. Tolerance (LCY)<br>`pmtToleranceLcy` — Pmt. Tolerance (LCY)<br>`refundsLcy` — Refunds (LCY)<br>`otherAmountsLcy` — Other Amounts (LCY)<br>`outstandingInvoicesLcy` — Outstanding Invoices (LCY) |
| ocpfEmployees | MasterData/API.Employees.al | `totalAbsenceBase` — Total Absence (Base)<br>`balanceLcy` — Balance (LCY)<br>`payrollLcy` — Payroll (LCY) |
| ocpfItemLedgerEntries | MasterData/API.ItemLedgerEntries.al | `costAmountExpected` — Cost Amount (Expected)<br>`costAmountActual` — Cost Amount (Actual)<br>`costAmountNonInvtbl` — Cost Amount (Non-Invtbl.)<br>`costAmountExpectedAcy` — Cost Amount (Expected) (ACY)<br>`costAmountActualAcy` — Cost Amount (Actual) (ACY)<br>`costAmountNonInvtblAcy` — Cost Amount (Non-Invtbl.)(ACY)<br>`purchaseAmountExpected` — Purchase Amount (Expected)<br>`purchaseAmountActual` — Purchase Amount (Actual)<br>`salesAmountExpected` — Sales Amount (Expected)<br>`salesAmountActual` — Sales Amount (Actual) |
| ocpfItems | MasterData/API.Items.al | `purchasesQty` — Purchases (Qty.)<br>`salesQty` — Sales (Qty.)<br>`positiveAdjmtQty` — Positive Adjmt. (Qty.)<br>`negativeAdjmtQty` — Negative Adjmt. (Qty.)<br>`purchasesLcy` — Purchases (LCY)<br>`salesLcy` — Sales (LCY)<br>`positiveAdjmtLcy` — Positive Adjmt. (LCY)<br>`negativeAdjmtLcy` — Negative Adjmt. (LCY)<br>`cogsLcy` — COGS (LCY)<br>`vatBusPostingGrPrice` — VAT Bus. Posting Gr. (Price)<br>`transferredQty` — Transferred (Qty.)<br>`transferredLcy` — Transferred (LCY)<br>`planningTransferShipQty` — Planning Transfer Ship. (Qty).<br>`planningWorksheetQty` — Planning Worksheet (Qty.)<br>`transOrdReceiptQty` — Trans. Ord. Receipt (Qty.)<br>`transOrdShipmentQty` — Trans. Ord. Shipment (Qty.)<br>`planningIssuesQty` — Planning Issues (Qty.)<br>`planningReceiptQty` — Planning Receipt (Qty.)<br>`planningReleaseQty` — Planning Release (Qty.)<br>`purchReqReceiptQty` — Purch. Req. Receipt (Qty.)<br>`purchReqReleaseQty` — Purch. Req. Release (Qty.)<br>`prodForecastQuantityBase` — Prod. Forecast Quantity (Base) |
| ocpfResourceGroups | MasterData/API.ResourceGroups.al | `qtyOnOrderJob` — Qty. on Order (Job)<br>`qtyQuotedJob` — Qty. Quoted (Job)<br>`usageQty` — Usage (Qty.)<br>`usageCost` — Usage (Cost)<br>`usagePrice` — Usage (Price)<br>`salesQty` — Sales (Qty.)<br>`salesCost` — Sales (Cost)<br>`salesPrice` — Sales (Price) |
| ocpfResourceLedgerEntries | MasterData/API.ResourceLedgerEntries.al | `quantityBase` — Quantity (Base) |
| ocpfResources | MasterData/API.Resources.al | `qtyOnOrderJob` — Qty. on Order (Job)<br>`qtyQuotedJob` — Qty. Quoted (Job)<br>`usageQty` — Usage (Qty.)<br>`usageCost` — Usage (Cost)<br>`usagePrice` — Usage (Price)<br>`salesQty` — Sales (Qty.)<br>`salesCost` — Sales (Cost)<br>`salesPrice` — Sales (Price) |
| ocpfSalespeople | MasterData/API.Salespeople.al | `estimatedValueLcy` — Estimated Value (LCY)<br>`calcdCurrentValueLcy` — Calcd. Current Value (LCY)<br>`costLcy` — Cost (LCY)<br>`durationMin` — Duration (Min.)<br>`avgEstimatedValueLcy` — Avg. Estimated Value (LCY)<br>`avgCalcdCurrentValueLcy` — Avg.Calcd. Current Value (LCY) |
| ocpfStockkeepingUnits | MasterData/API.StockkeepingUnits.al | `transOrdReceiptQty` — Trans. Ord. Receipt (Qty.)<br>`transOrdShipmentQty` — Trans. Ord. Shipment (Qty.)<br>`purchReqReceiptQty` — Purch. Req. Receipt (Qty.)<br>`purchReqReleaseQty` — Purch. Req. Release (Qty.) |
| ocpfValueEntries | MasterData/API.ValueEntries.al | `salesAmountActual` — Sales Amount (Actual)<br>`costAmountActual` — Cost Amount (Actual)<br>`costAmountActualAcy` — Cost Amount (Actual) (ACY)<br>`costPostedToGLAcy` — Cost Posted to G/L (ACY)<br>`costPerUnitAcy` — Cost per Unit (ACY)<br>`purchaseAmountActual` — Purchase Amount (Actual)<br>`purchaseAmountExpected` — Purchase Amount (Expected)<br>`salesAmountExpected` — Sales Amount (Expected)<br>`costAmountExpected` — Cost Amount (Expected)<br>`costAmountNonInvtbl` — Cost Amount (Non-Invtbl.)<br>`costAmountExpectedAcy` — Cost Amount (Expected) (ACY)<br>`costAmountNonInvtblAcy` — Cost Amount (Non-Invtbl.)(ACY)<br>`expCostPostedToGLAcy` — Exp. Cost Posted to G/L (ACY) |
| ocpfVendors | MasterData/API.Vendors.al | `balanceLcy` — Balance (LCY)<br>`netChangeLcy` — Net Change (LCY)<br>`purchasesLcy` — Purchases (LCY)<br>`invDiscountsLcy` — Inv. Discounts (LCY)<br>`pmtDiscountsLcy` — Pmt. Discounts (LCY)<br>`balanceDueLcy` — Balance Due (LCY)<br>`paymentsLcy` — Payments (LCY)<br>`invAmountsLcy` — Inv. Amounts (LCY)<br>`crMemoAmountsLcy` — Cr. Memo Amounts (LCY)<br>`finChargeMemoAmountsLcy` — Fin. Charge Memo Amounts (LCY)<br>`debitAmountLcy` — Debit Amount (LCY)<br>`creditAmountLcy` — Credit Amount (LCY)<br>`reminderAmountsLcy` — Reminder Amounts (LCY)<br>`outstandingOrdersLcy` — Outstanding Orders (LCY)<br>`amtRcdNotInvoicedLcy` — Amt. Rcd. Not Invoiced (LCY)<br>`pmtDiscToleranceLcy` — Pmt. Disc. Tolerance (LCY)<br>`pmtToleranceLcy` — Pmt. Tolerance (LCY)<br>`refundsLcy` — Refunds (LCY)<br>`otherAmountsLcy` — Other Amounts (LCY)<br>`outstandingInvoicesLcy` — Outstanding Invoices (LCY) |

**Tooltip corrections:** the same generator bug shifted some tooltips onto neighboring fields
(a skipped field's tooltip landed on the next emitted field). Fixed:

- `MasterData/API.Customers.al`: **Budgeted Amount** carried the tooltip of *Credit Limit (LCY)* (fixed in the same pass)

Tooltips for the newly added fields are sourced from BC 27.5 Base Application symbols (table-level
tooltips, falling back to standard page-control tooltips, falling back to generic text).

---
## OCPFAPIs v3.0 — Deviations from TDD

This log records every case where the actual generated AL code deviated from the TDD specification, along with the reason. It is maintained per batch and serves as an audit trail for design decisions made during implementation.

---

## Gap Fill — Post-Review Additions (7 pages)

Following gap analysis comparing FRD, TDD, and as-built implementation, three entities previously marked "out of scope for v3.0" were added. IDs allocated from reserved growth slots per batch.

| ID | File | Batch | Entity | Reason Added |
|---|---|---|---|---|
| 90824 | API.InventoryPostingSetup.al | CoreFinancial | Inventory Posting Setup (Table 5813) | GAP-06: maps posting groups to locations for G/L resolution |
| 90886 | API.SalesBlanketOrders.al | Sales | Sales Header / Blanket Order filter | GAP-07: long-term customer agreements |
| 90887 | API.SalesBlanketOrderLines.al | Sales | Sales Line / Blanket Order filter | GAP-07 |
| 90904 | API.PurchaseQuotes.al | Purchasing | Purchase Header / Quote filter | GAP-05: vendor pricing requests |
| 90905 | API.PurchaseQuoteLines.al | Purchasing | Purchase Line / Quote filter | GAP-05 |
| 90906 | API.PurchaseBlanketOrders.al | Purchasing | Purchase Header / Blanket Order filter | GAP-07: long-term vendor agreements |
| 90907 | API.PurchaseBlanketOrderLines.al | Purchasing | Purchase Line / Blanket Order filter | GAP-07 |

**Notes:**
- Inventory Posting Setup table is **5813**, not 457 (which is "Posted Approval Comment Line"). Correct ID sourced from BC v27.5 symbols.
- Sales blanket order files required `%→Pct` fix (same as Batch 3 CR — cached field JSON predated the fix).
- `"Blanket Order"` is a multi-word enum value — correctly quoted in `const()`.
- Permission sets regenerated: now cover **113 pages** (62 editable, 51 read-only).
- Library total: **113 API pages** across 6 API groups.

---

## Batch 6 — SystemAndSetup

No corrections. All 9 pages passed pre-flight validation on first run.

**Notes:**
- `Approval Entry` and `Workflow Step Instance` source from `System.Automation` namespace (not a `Microsoft.*` namespace) — this is correct for BC system automation tables.
- All 9 pages are read-only (`Editable = false`) — document attachments, company information, warehouse entries, reminders, finance charges, approvals, and workflow instances are all consumed read-only by API clients in standard integration scenarios.

---

## Batch 5 — ProjectsAndAssets

### CORRECTION B5-01 — Table Index Pattern Updated to Handle Unquoted Single-Word Table Names

**Problem:** Table 167 (`Job`) and Table 81 (`Gen. Journal Line`) initially extracted 0 fields. Root cause was two distinct issues:

1. **Wrong file matched (Tables 1001 and 81):** The original search pattern `\btable\s+{id}\b` matched table *references* inside codeunit files (e.g., a codeunit that manipulates Job Task records) before finding the actual table definition file. Fixed by searching for `^table\s+{id}\s+` anchored to the start of a line — a table *declaration* pattern, not a reference.

2. **Unquoted table name (Table 167):** The declaration in `Job.Table.al` is `table 167 Job` — no double-quotes around the name. BC convention for single-word table names in older base tables omits quotes. The index builder pattern `table\s+(\d+)\s+"` required a quote and therefore never matched. Fixed by accepting both `table 167 "Job"` and `table 167 Job`.

**Generator rule updated:** Table definition index now uses `^table\s+(\d+)\s+(?:"([^"]+)"|(\w+))` to handle both quoted and unquoted table names, anchored to line start to avoid codeunit reference matches.

**No AL output files were affected** — the fix was caught during field extraction before any files were written.

---

## Batch 4 — Purchasing

### CORRECTION B4-01 — `ocpfPostedPurchaseCreditMemoLines` Exceeded 30-Character Limit

**Names affected:**

| Original | Length | Shortened | Length |
|---|---|---|---|
| `ocpfPostedPurchaseCreditMemoLines` | 33 | `ocpfPostedPurchCrMemoLines` | 26 |
| `ocpfPostedPurchaseCreditMemoLine` | 32 | `ocpfPostedPurchCrMemoLine` | 25 |

**Abbreviation applied:** `Purchase` → `Purch`, `CreditMemo` → `CrMemo` — both are standard BC naming conventions.

**File affected:** `API.PostedPurchaseCreditMemoLines.al`

**Pre-flight check:** Caught by validation script before any compiler involvement. All other 13 Purchasing pages were within the 30-character limit.

---

## Batch 2 — MasterData

### CORRECTION B1-B3 (RETROACTIVE) — All Pages Incorrectly Set to `Editable = false`; Missing `DelayedInsert = true`

**Root cause:** The generator template set `Editable = false` on every API page unconditionally. This was incorrect — master data and setup tables should be writable via the API. The error was masked in Batches 1 and 2 because `Editable = false` suppresses the AL compiler requirement for `DelayedInsert = true`. It only surfaced in Batch 3 when the 8 open-document Sales pages were correctly left without `Editable = false`.

**Rule:** In BC AL, any API page that is editable (explicitly or by default) **must** declare `DelayedInsert = true`. This tells the framework to buffer the inserted record until the client explicitly commits it, which is required for the transactional semantics of the OData API.

**Correct pattern:**
```al
// Editable page (master data, setup, open documents)
ODataKeyFields = SystemId;
DelayedInsert = true;

// Read-only page (posted ledger entries, audit tables, system tables)
ODataKeyFields = SystemId;
Editable = false;
```

**Classification applied across all 69 pages:**

| Category | Editable | Examples |
|---|---|---|
| Master data | ✅ Yes | Customers, Vendors, Items, Employees, Bank Accounts |
| Setup/config | ✅ Yes | GL Setup, Posting Groups, VAT Setup, Payment Terms |
| Open documents | ✅ Yes | Sales Orders/Lines, Quotes/Lines, Invoices/Lines, Credit Memos/Lines |
| Posted ledger entries | ❌ No | GL Entries, Cust/Vend Ledger Entries, Item Ledger Entries |
| Posted documents | ❌ No | Posted Invoices, Shipments, Credit Memos, Return Receipts |
| System/audit tables | ❌ No | GL Registers, Dimension Set Entries, Item Application Entries |

**Pages changed:** 48 pages updated to `DelayedInsert = true` (Editable=false removed); 21 pages confirmed `Editable = false` (no DelayedInsert). All 69 files affected.

**Going forward:** Generator template updated — editable determination is made per page before writing, not defaulted to read-only.

---

### CORRECTION B3-02 — `SourceTableView const()` Syntax: Single-Word Enum Values Must Not Be Quoted

**Symptom:** Red squiggly error on `PageType = API` for all 6 open-document pages using single-word Document Type values (Quote, Order, Invoice). VS Code showed the error at the page declaration because the AL parser failed parsing the `SourceTableView` property and surfaced the error at the start of the page block.

**Root cause:** In AL, `SourceTableView = where(field = const(value))` takes an **enum value identifier**, not a string. Single-word enum values must appear without double-quotes. Multi-word enum identifiers (e.g., `"Credit Memo"`) must keep double-quotes because the space requires quoting in AL. The generator wrapped all values in double-quotes uniformly, which is wrong for single-word values.

| Value | Wrong | Correct |
|---|---|---|
| Quote | `const("Quote")` | `const(Quote)` |
| Order | `const("Order")` | `const(Order)` |
| Invoice | `const("Invoice")` | `const(Invoice)` |
| Credit Memo | `const("Credit Memo")` | `const("Credit Memo")` ✓ (unchanged) |

**Files fixed:** API.SalesQuotes.al, API.SalesQuoteLines.al, API.SalesOrders.al, API.SalesOrderLines.al, API.SalesInvoices.al, API.SalesInvoiceLines.al

**Generator rule added:** When writing `const()` values for enum/option fields in `SourceTableView`, quote only if the value contains spaces.

---

### CORRECTION B3-01 — `%` Character in Field Identifiers (All 16 Sales Files)

**Fields affected:** Any BC field whose name ends with `%` (e.g., `Payment Discount %`, `VAT %`, `Prepayment %`, `Line Discount %`, `Profit %`, `VAT Base Discount %`, `Prepmt. Payment Discount %`, `Prepayment VAT %`)

**Problem:** The `to_camel()` generator function did not strip the `%` character. AL identifiers may only contain letters, digits, and underscores — `%` is illegal and causes a compiler error.

**Fix:** Appended `Pct` suffix to replace the trailing `%` in the identifier. Source field reference remains unchanged (still quotes the `%` in the BC field name).

| Before | After |
|---|---|
| `field(paymentDiscount%; Rec."Payment Discount %")` | `field(paymentDiscountPct; Rec."Payment Discount %")` |
| `field(vat%; Rec."VAT %")` | `field(vatPct; Rec."VAT %")` |
| `field(lineDiscount%; Rec."Line Discount %")` | `field(lineDiscountPct; Rec."Line Discount %")` |

**Files affected:** All 16 Sales API pages

**Generator rule added:** Strip all non-alphanumeric characters from camelCase identifiers. Specifically: `%` → `Pct`; apply before the reserved-keyword check.

---

### CORRECTION B2-01 — `Invoice Copies` Field Not Excluded by Existing Obsolete Filter

**Field removed:** `Invoice Copies` (field 40) from Table 18 `Customer`

**Why it slipped through:** The field uses the `#if not CLEAN27` conditional compilation pattern:
- Under `CLEAN27` = not set (default in v27.5 symbol file): `ObsoleteState = Pending`, `ObsoleteTag = '27.0'`
- Under `CLEAN27` = set: `ObsoleteState = Removed`, `ObsoleteTag = '30.0'`

The existing filter excluded `Pending` fields only when `ObsoleteRemovalVersion` was explicitly set and ≤ 28.0. This field has no `ObsoleteRemovalVersion` property — only `ObsoleteTag`, which the filter did not check.

**Policy change:** Exclude **all** `ObsoleteState = Pending` fields regardless of whether `ObsoleteRemovalVersion` is set. A deprecated field has no place in a new API library irrespective of its scheduled removal version.

**Going forward:** The generator for Batches 3–6 treats any `Pending` state as an immediate exclusion, no version check required.

**File affected:** `API.Customers.al`

---

### CORRECTION B2-02 — `Area` Field Identifier Conflicts with AL Page Layout Keyword

**Field fixed:** `Area` (field 62) on Table 32 `Item Ledger Entry`

**Problem:** The `to_camel()` generator function produced `area` as the AL identifier for this field. In BC AL page syntax, `area` is a layout section keyword (`area(content)`, `area(actions)`, `area(factboxes)`). Using it as a `field()` identifier inside a repeater causes a compiler error.

**How identified:** User reported compiler error on the field. Diagnosis confirmed `area` is an AL page-context reserved word. Audit of all 53 Batch 1+2 source tables found this as the only occurrence.

**Fix:** Identifier renamed from `area` to `areaCode` in `API.ItemLedgerEntries.al`.

**Generator rule added:** The following identifiers are treated as reserved page-layout keywords and will be suffixed with their field type (e.g., `Code`, `Option`, `Boolean`) if produced by `to_camel()`:

| Reserved identifier | AL usage context |
|---|---|
| `area` | `area(content)`, `area(actions)` etc. |
| `group` | `group(name)` in page layout |
| `value` | `value(option)` in option definitions |
| `key` | `key(name; fields)` in keys section |
| `label` | `label` keyword |
| `index` | key index definitions |
| `trigger` | `trigger OnXxx()` |
| `field` | `field(id; source)` — the declaration keyword itself |

**File affected:** `API.ItemLedgerEntries.al`

---

## Batch 1 — CoreFinancial

### CORRECTION B1-01 — VAT Business Posting Group: Wrong Table Number in TDD

**TDD stated:** `VAT Business Posting Group (320)`  
**Actual BC v27 table:** `VAT Business Posting Group` = **Table 323**  
**Table 320 in BC v27:** `Tax Jurisdiction` — a US Sales Tax localization table, explicitly out of scope per FRD Section 1.1

**How discovered:** Direct inspection of the BC Base Application v27.5 AL source extracted from the `.alpackages` symbol file. The `TaxJurisdiction.Table.al` file declared `table 320`, not a VAT table.

**Impact:** Object 90817 (`ocpfVatBusinessPostingGroups`) correctly sources from Table 323. Had the TDD number been used, the page would have exposed US localization data in violation of the W1 compatibility requirement.

**TDD/FRD updated:** Yes — both documents corrected from `(320)` to `(323)`.

---

### CORRECTION B1-02 — VAT Product Posting Group: Wrong Table Number in TDD

**TDD stated:** `VAT Product Posting Group (321)`  
**Actual BC v27 table:** `VAT Product Posting Group` = **Table 324**  
**Table 321 in BC v27:** `Tax Group` — a US Sales Tax localization table, explicitly out of scope per FRD Section 1.1

**How discovered:** Same symbol file inspection as B1-01. The `TaxGroup.Table.al` file declared `table 321`.

**Impact:** Object 90818 (`ocpfVatProductPostingGroups`) correctly sources from Table 324.

**TDD/FRD updated:** Yes — both documents corrected from `(321)` to `(324)`.

---

### NOTES (not deviations — confirmed design decisions)

- **FlowFilter fields excluded:** All 24 source tables were scanned. Any field with type `FlowFilter` was excluded from the API pages. FlowFilter fields are virtual filter fields, not real data fields — they cannot be meaningfully returned in an OData response and are not part of the table's stored data.

- **BLOB fields excluded:** No raw BLOB fields were present in any Batch 1 source table. Policy applied cleanly with nothing to exclude.

- **Obsolete fields:** Several fields across Batch 1 tables carried `ObsoleteState = Pending` with removal versions ≤ 28.0 and were excluded per TDD Section 7.6 policy. No `ObsoleteState = Removed` fields were encountered (they no longer exist in the compiled table and cannot be referenced).

- **ToolTip sourcing:** Where the BC source table defined a `ToolTip` on a field, that tooltip was used directly. Where none was defined, a generic description was generated in the form *"Specifies the [field name] for this [table name] record."* This is consistent with BC's own API library convention.

### CORRECTION B1-05 — 44 Localization-Specific Fields Removed Across 5 Files

**Root cause:** The field extraction script filtered on `ObsoleteState` and field type but did not filter on field ID range. In BC, fields with IDs 10000–29999 are reserved for localization-specific content. These fields are physically present in the Base Application `.app` symbol file (which bundles W1 + NA + MX content) and were extracted alongside W1 fields.

**Localizations affected and fields removed:**

| Localization | Tables Affected | Example Fields Removed |
|---|---|---|
| CA (Canada) | G/L Account, G/L Entry, Cust. Ledger Entry | GIFI Code, STE Transaction ID, GST/HST |
| MX (Mexico — CFDI e-invoicing) | G/L Account, Cust. Ledger Entry, GL Setup, VAT Posting Setup | SAT Account Code, CFDI Enabled, PAC Code, CFDI VAT Exemption |
| NA/US | Cust. Ledger Entry, GL Setup, Vendor Ledger Entry | Tax Exemption No., Bank Rec. Adj. Doc. Nos., Deposit Nos. |

**Total removed:** 44 fields across 5 files (`API.ChartOfAccounts.al`, `API.CustLedgerEntries.al`, `API.GeneralLedgerEntries.al`, `API.GeneralLedgerSetup.al`, `API.VatPostingSetup.al`)

**Fields retained from the 10000+ range:** Fields 99000752–99000754 on `General Posting Setup` (Direct Cost Applied Account, Overhead Applied Account, Purchase Variance Account) are W1 Manufacturing module fields, not localization fields, and were correctly retained.

**Going forward:** All future batch generators will exclude fields with IDs 10000–89999 by default, retaining only the 99000000+ range for W1 Manufacturing fields on a case-by-case basis.

---

### CORRECTION B1-06 — IRS 1099 Fields (Vendor Ledger Entry) — Separate Entry

*(These two fields were caught and removed in the same pass as B1-05 above. Documented separately as they were the trigger for the broader audit.)*

**Fields removed:** `IRS 1099 Code` (field 10020), `IRS 1099 Amount` (field 10021) from Table 25.  
See B1-05 for full context.

---

### CORRECTION B1-05 (original) — IRS 1099 Fields Removed from Vendor Ledger Entries

**Fields removed:** `IRS 1099 Code` (field 10020), `IRS 1099 Amount` (field 10021) from Table 25 `Vendor Ledger Entry`

**Why:** Both fields carry `ObsoleteState = Pending` with `ObsoleteTag = '25.0'` and `ObsoleteRemovalVersion = '28.0'`, placing them squarely within the TDD Section 7.6 exclusion rule (`Pending` with removal ≤ 28.0 → exclude). They were included by the initial field extraction script because the conditional compilation block (`#if not CLEAN25`) presented them as Pending rather than Removed in the v27.5 symbol file.

**Additional context:** These are US localization fields (IRS = Internal Revenue Service) that Microsoft has moved to the separate **IRS Forms** app. They were never populated on W1 tenants. On US tenants, Microsoft is actively migrating data to the IRS Forms app. At v28 these fields will be physically removed from the table — keeping them would cause a compile failure at the next major upgrade.

**Decision:** Excluded permanently. US customers needing IRS 1099 data should consume it from the IRS Forms app, not from these deprecated columns. No v3.1 deferral warranted.

**File affected:** `API.VendorLedgerEntries.al`

---

### CORRECTION B1-03 — Four Entity Names Exceeded the 30-Character AL Identifier Limit

**AL rule:** Object names and identifiers must not exceed 30 characters.

The following names from the TDD exceeded this limit and were shortened using standard BC abbreviations (Gen = General, Bus = Business, Prod = Product, Dtld = Detailed, Ledg = Ledger):

| Original (TDD) | Length | Shortened | Length | Used in |
|---|---|---|---|---|
| `ocpfGeneralBusinessPostingGroups` | 32 | `ocpfGenBusPostingGroups` | 24 | Page name, EntitySetName |
| `ocpfGeneralBusinessPostingGroup` | 31 | `ocpfGenBusPostingGroup` | 23 | EntityName |
| `ocpfGeneralProductPostingGroups` | 31 | `ocpfGenProdPostingGroups` | 25 | Page name, EntitySetName |
| `ocpfDetailedVendorLedgerEntries` | 31 | `ocpfDtldVendorLedgEntries` | 25 | Page name, EntitySetName |

`ocpfGeneralProductPostingGroup` (EntityName, 30 chars) and `ocpfDetailedVendorLedgerEntry` (EntityName, 29 chars) were within the limit and unchanged.

**Impact:** The OData API URLs for these three endpoints change to use the shortened names. Since this library had no deployed consumers at time of fix, there is no breaking change.

**Files affected:** `API.GeneralBusinessPostingGroups.al`, `API.GeneralProductPostingGroups.al`, `API.DetailedVendorLedgerEntries.al`

**Going forward:** All entity names for future batches will be pre-checked against the 30-character limit before code generation.

---

### CORRECTION B1-04 — Missing `using` Directives Caused "Source Table Not Found" Errors

- **`using` directives required:** The TDD template did not include `using` directives. Because every AL file declares `namespace OnlyCopilotFans.OCPFAPIsv3;`, the compiler cannot resolve table names from other namespaces (all Microsoft base app tables) without an explicit `using` statement. Every generated file now includes one `using <Microsoft.Namespace>;` line immediately after the namespace declaration, sourced directly from the BC v27.5 symbol files. This is a mandatory AL requirement when namespaces are in use and will apply to all batches. The TDD template has been noted as incomplete in this regard.

- **Folder naming:** TDD Section 5 specified folder name `Batch1_CoreFinancial`. Changed to `CoreFinancial` per project owner instruction. All future batch folders will follow the pattern `<BatchName>` without a numeric prefix.

---
