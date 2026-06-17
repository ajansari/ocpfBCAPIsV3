# User Test Script
## OCPFAPIs v3.0 — Functional Testing Guide

**Version:** 1.0  
**Date:** 2026-06-09  
**Audience:** Functional consultants, BC administrators, QA testers  
**Prerequisite reading:** PostDevTDD.md (for API group URLs and entity names)

---

## Before You Start

### Environment Setup

| Item | Value |
|---|---|
| BC Environment | BC v27.5+ SaaS tenant |
| Extension | OCPFAPIs v3.0 installed (check **Extension Management**) |
| Permission Set | Your user assigned `OCPF - READ` or `OCPF - READ/WRITE` |
| Tool | Any OData client: Postman, Insomnia, browser, Power BI, curl |
| Base URL | `https://<your-tenant>.api.businesscentral.dynamics.com/v2.0/<tenant-id>/<environment>/api/OnlyCopilotFans` |

### Authentication
BC Online uses OAuth 2.0. Obtain a bearer token via your Azure AD app registration with `Financials.ReadWrite.All` or `API.ReadWrite.All` scope, or use Basic Auth with a BC web service access key for quick testing.

### URL Pattern
```
GET {baseUrl}/ocpf_{group}/v3.0/{entitySetName}
GET {baseUrl}/ocpf_{group}/v3.0/{entitySetName}({id})
POST {baseUrl}/ocpf_{group}/v3.0/{entitySetName}
PATCH {baseUrl}/ocpf_{group}/v3.0/{entitySetName}({id})
DELETE {baseUrl}/ocpf_{group}/v3.0/{entitySetName}({id})
GET {baseUrl}/ocpf_{group}/v3.0/$metadata
```

---

## Part 1 — Green Team Tests (Happy Path)

### GT-01 — Extension Installed and Accessible

**Goal:** Confirm the extension is installed and all six $metadata endpoints respond.

| Step | Action | Expected Result |
|---|---|---|
| 1 | Open BC → Extension Management | OCPFAPIs v3.0 shows as **Installed** |
| 2 | GET `.../ocpf_coreFinancial/v3.0/$metadata` | HTTP 200, XML CSDL document returned |
| 3 | GET `.../ocpf_masterData/v3.0/$metadata` | HTTP 200 |
| 4 | GET `.../ocpf_sales/v3.0/$metadata` | HTTP 200 |
| 5 | GET `.../ocpf_purchasing/v3.0/$metadata` | HTTP 200 |
| 6 | GET `.../ocpf_projectsAndAssets/v3.0/$metadata` | HTTP 200 |
| 7 | GET `.../ocpf_systemAndSetup/v3.0/$metadata` | HTTP 200 |
| 8 | Inspect any $metadata response | `EntityType` entries include `Org.OData.Core.V1.Description` annotations from Captions and ToolTips |

✅ **Pass criteria:** All 6 endpoints return HTTP 200 with valid CSDL XML containing entity type and property descriptions.

---

### GT-02 — Core Financial: Read GL Accounts

**Goal:** Confirm Chart of Accounts is readable and well-structured.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_coreFinancial/v3.0/ocpfChartOfAccounts` | HTTP 200, JSON array of G/L accounts |
| 2 | Note the `id` of any account | 36-character GUID (e.g., `"12345678-..."`) |
| 3 | GET `.../ocpfChartOfAccounts({id})` | HTTP 200, single account record |
| 4 | Confirm `no` field matches the G/L account number in BC | Values match |
| 5 | GET `.../ocpfChartOfAccounts?$select=no,name,accountType&$top=10` | HTTP 200, only 3 fields returned, max 10 records |
| 6 | GET `.../ocpfChartOfAccounts?$filter=accountType eq 'Posting'` | HTTP 200, only posting-type accounts returned |
| 7 | GET `.../ocpfGeneralLedgerEntries?$top=5&$orderby=postingDate desc` | HTTP 200, 5 most recent GL entries |

✅ **Pass criteria:** Reads succeed, OData query parameters work, data matches BC UI values.

---

### GT-03 — Core Financial: Dimension Set Entries

**Goal:** Confirm dimension data is accessible.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_coreFinancial/v3.0/ocpfDimensionSetEntries?$top=5` | HTTP 200, dimension set entries returned |
| 2 | Note a `dimensionSetId` value | Integer |
| 3 | GET `.../ocpfDimensionSetEntries?$filter=dimensionSetId eq {value}` | HTTP 200, all entries for that dimension set |
| 4 | Cross-reference with a GL entry in BC UI | Dimension values match |

✅ **Pass criteria:** Dimension set entries readable and filterable by set ID.

---

### GT-04 — Master Data: Read and Update a Customer

**Goal:** Confirm Customers endpoint is readable and writable.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_masterData/v3.0/ocpfCustomers?$top=1` | HTTP 200, one customer record |
| 2 | Note the `id` and current `paymentTermsCode` | Record values noted |
| 3 | PATCH `.../ocpfCustomers({id})` with body `{"paymentTermsCode": "10 DAYS"}` | HTTP 200, record updated |
| 4 | GET `.../ocpfCustomers({id})` | Updated `paymentTermsCode` returned |
| 5 | Revert: PATCH back to original value | HTTP 200, reverted |
| 6 | Open Customer Card in BC UI | Value matches what was set via API |

✅ **Pass criteria:** Customer readable and patchable; changes visible in BC UI.

---

### GT-05 — Master Data: Read Items with Filtering

**Goal:** Confirm Items endpoint handles common BI query patterns.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_masterData/v3.0/ocpfItems?$select=no,description,unitPrice,inventory&$top=20` | HTTP 200, 20 items with 4 fields |
| 2 | GET `.../ocpfItems?$filter=blocked eq false&$orderby=no` | HTTP 200, unblocked items ordered by No. |
| 3 | GET `.../ocpfItems?$filter=inventory gt 0` | HTTP 200, items with stock |
| 4 | Spot-check one item's `inventory` against BC Item Card | Values match |

✅ **Pass criteria:** FlowField `inventory` returns correctly via OData; filtering and ordering work.

---

### GT-06 — Sales: Create, Read, and Delete a Sales Order

**Goal:** Confirm open document endpoints support full CRUD.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_sales/v3.0/ocpfSalesOrders?$top=3` | HTTP 200, open sales orders |
| 2 | POST `.../ocpfSalesOrders` with body: `{"sellToCustomerNo": "<valid customer no>"}` | HTTP 201, new order created, `id` returned |
| 3 | Note the new order's `id` | GUID returned in response |
| 4 | GET `.../ocpfSalesOrders({id})` | HTTP 200, new order returned |
| 5 | PATCH the order with `{"yourReference": "TEST-API-001"}` | HTTP 200 |
| 6 | Verify order appears in BC → Sales Orders list | Order visible with correct reference |
| 7 | DELETE `.../ocpfSalesOrders({id})` | HTTP 204, no content |
| 8 | GET `.../ocpfSalesOrders({id})` | HTTP 404, order not found |

✅ **Pass criteria:** Full CRUD on open Sales Orders; changes visible in BC UI.

---

### GT-07 — Sales: Document Type Filtering Works Correctly

**Goal:** Confirm each Sales document type endpoint returns only the correct document type.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_sales/v3.0/ocpfSalesQuotes?$top=5` | HTTP 200, all records have Document Type = Quote |
| 2 | GET `.../ocpf_sales/v3.0/ocpfSalesOrders?$top=5` | All records have Document Type = Order |
| 3 | GET `.../ocpf_sales/v3.0/ocpfSalesInvoices?$top=5` | All records have Document Type = Invoice |
| 4 | GET `.../ocpf_sales/v3.0/ocpfSalesCreditMemos?$top=5` | All records have Document Type = Credit Memo |
| 5 | GET `.../ocpf_sales/v3.0/ocpfSalesBlanketOrders?$top=5` | All records have Document Type = Blanket Order |

✅ **Pass criteria:** Each endpoint returns only its designated document type; no cross-contamination.

---

### GT-08 — Posted Documents: Read-Only Confirmation

**Goal:** Confirm posted document endpoints return data but reject writes.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_sales/v3.0/ocpfPostedSalesInvoices?$top=3` | HTTP 200, posted invoices returned |
| 2 | Note a `id` | GUID noted |
| 3 | PATCH `.../ocpfPostedSalesInvoices({id})` with any body | HTTP 405 Method Not Allowed (or 400) |
| 4 | POST `.../ocpfPostedSalesInvoices` with any body | HTTP 405 Method Not Allowed |
| 5 | DELETE `.../ocpfPostedSalesInvoices({id})` | HTTP 405 Method Not Allowed |

✅ **Pass criteria:** Reads succeed; all writes rejected with appropriate HTTP error.

---

### GT-09 — Purchasing: Full Batch Read

**Goal:** Confirm all purchasing endpoints are accessible.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_purchasing/v3.0/ocpfPurchaseOrders?$top=3` | HTTP 200 |
| 2 | GET `.../ocpfPurchaseQuotes?$top=3` | HTTP 200 |
| 3 | GET `.../ocpfPurchaseBlanketOrders?$top=3` | HTTP 200 |
| 4 | GET `.../ocpfPostedPurchaseInvoices?$top=3` | HTTP 200 |
| 5 | GET `.../ocpfPostedPurchaseReceipts?$top=3` | HTTP 200 |

✅ **Pass criteria:** All purchasing endpoints respond with HTTP 200.

---

### GT-10 — Projects and Assets: Read

**Goal:** Confirm project and fixed asset data is accessible.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_projectsAndAssets/v3.0/ocpfProjects?$top=3` | HTTP 200, project (Job) records |
| 2 | GET `.../ocpfProjectTasks?$top=5` | HTTP 200, project task records |
| 3 | GET `.../ocpfFixedAssets?$top=5` | HTTP 200, fixed asset records |
| 4 | GET `.../ocpfGeneralJournalLines?$top=5` | HTTP 200 |
| 5 | GET `.../ocpfPriceListHeaders?$top=5` | HTTP 200 |

✅ **Pass criteria:** All endpoints respond; `ocpfProjects` returns Job table data.

---

### GT-11 — General Journal Lines: Write Test

**Goal:** Confirm General Journal Lines supports insert.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_projectsAndAssets/v3.0/ocpfGeneralJournalLines?$top=1` | Note an existing `journalTemplateName` and `journalBatchName` |
| 2 | POST `.../ocpfGeneralJournalLines` with template, batch, account, amount | HTTP 201, line created |
| 3 | Verify line appears in BC → General Journals | Line visible |
| 4 | DELETE the line via API | HTTP 204 |

✅ **Pass criteria:** Journal lines insertable and deletable via API.

---

### GT-12 — System & Setup: Company Information

**Goal:** Confirm singleton table returns exactly one record.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_systemAndSetup/v3.0/ocpfCompanyInformation` | HTTP 200, array with exactly **1 record** |
| 2 | Confirm `name` matches the company name in BC | Values match |
| 3 | GET with `$top=2` | Still returns 1 record (only one exists) |

✅ **Pass criteria:** Exactly one record returned; values match BC company setup.

---

### GT-13 — Permission Set: Read-Only User Cannot Write

**Goal:** Confirm `OCPF - READ` prevents insert/modify/delete.

| Step | Action | Expected Result |
|---|---|---|
| 1 | Sign in as a user with **only** `OCPF - READ` assigned | Session established |
| 2 | GET `.../ocpf_masterData/v3.0/ocpfCustomers?$top=1` | HTTP 200 — read succeeds |
| 3 | PATCH a customer field | HTTP 403 Forbidden |
| 4 | POST a new customer | HTTP 403 Forbidden |

✅ **Pass criteria:** Reads succeed; writes blocked with HTTP 403.

---

### GT-14 — $metadata Schema Quality Check

**Goal:** Confirm AI-readability of the $metadata document.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpf_coreFinancial/v3.0/$metadata` | HTTP 200, CSDL XML |
| 2 | Search XML for `Org.OData.Core.V1.Description` | Found on EntityType elements (from page Caption) |
| 3 | Check a property element | `Org.OData.Core.V1.Description` annotation present (from field ToolTip) |
| 4 | Feed $metadata to an AI tool (e.g., Claude, GPT-4) | AI can describe what each entity and field represents without prior knowledge |

✅ **Pass criteria:** Every entity type and property has a human-readable description annotation.

---

## Part 2 — Red Team Tests (Adversarial / Boundary)

### RT-01 — Invalid SystemId Key

**Goal:** Confirm graceful handling of a malformed or nonexistent key.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpfCustomers(00000000-0000-0000-0000-000000000000)` | HTTP 404 Not Found, clean error body |
| 2 | GET `.../ocpfCustomers(not-a-guid)` | HTTP 400 Bad Request |
| 3 | GET `.../ocpfCustomers(99999999-9999-9999-9999-999999999999)` | HTTP 404 Not Found |

✅ **Pass criteria:** No 500 errors; responses are clean HTTP 4xx with a message.

---

### RT-02 — Write to a Read-Only Endpoint

**Goal:** Confirm posted documents and ledger entries firmly reject all write operations.

| Step | Action | Expected Result |
|---|---|---|
| 1 | POST `.../ocpfPostedSalesInvoices` | HTTP 405 |
| 2 | PATCH `.../ocpfGeneralLedgerEntries({any valid id})` | HTTP 405 |
| 3 | DELETE `.../ocpfCustLedgerEntries({any valid id})` | HTTP 405 |
| 4 | POST `.../ocpfDimensionSetEntries` | HTTP 405 |
| 5 | POST `.../ocpfWarehouseEntries` | HTTP 405 |

✅ **Pass criteria:** All return 405; no modifications made in BC.

---

### RT-03 — Field That Doesn't Exist

**Goal:** Confirm OData rejects requests referencing non-existent fields.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpfCustomers?$select=no,nonExistentField` | HTTP 400 Bad Request |
| 2 | GET `.../ocpfCustomers?$filter=nonExistentField eq 'x'` | HTTP 400 Bad Request |
| 3 | PATCH `.../ocpfCustomers({id})` with `{"nonExistentField": "value"}` | HTTP 400 Bad Request |

✅ **Pass criteria:** BC OData rejects unknown field references cleanly.

---

### RT-04 — Cross-Document-Type Contamination

**Goal:** Confirm `SourceTableView` filters are enforced and cannot be bypassed via OData.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpfSalesOrders?$filter=documentType eq 'Quote'` | HTTP 200, **empty array** (no results — the filter is AND'd with the page filter) |
| 2 | GET `.../ocpfSalesQuotes?$filter=documentType eq 'Order'` | HTTP 200, empty array |
| 3 | POST `.../ocpfSalesOrders` with `{"documentType": "Quote", ...}` | Either HTTP 400, or record created as Order (BC overrides the filter) — document this behavior |

✅ **Pass criteria:** Server-side `SourceTableView` filter cannot be bypassed by OData `$filter`.

---

### RT-05 — Malformed Request Bodies

**Goal:** Confirm the API handles bad JSON gracefully.

| Step | Action | Expected Result |
|---|---|---|
| 1 | POST `.../ocpfSalesOrders` with body `{invalid json` | HTTP 400 Bad Request |
| 2 | POST `.../ocpfSalesOrders` with empty body `{}` | HTTP 400 or 201 with defaults applied — document actual behavior |
| 3 | PATCH `.../ocpfCustomers({id})` with `{"no": "INVALID_NO_THAT_DOES_NOT_EXIST"}` | BC validation error, HTTP 400 |
| 4 | POST `.../ocpfSalesOrders` with `{"sellToCustomerNo": "CUSTOMER_THAT_DOES_NOT_EXIST"}` | HTTP 400, BC validation error referencing the customer |

✅ **Pass criteria:** No 500 server errors; validation errors return 400 with meaningful messages.

---

### RT-06 — No Permissions

**Goal:** Confirm appropriate rejection when no permission set is assigned.

| Step | Action | Expected Result |
|---|---|---|
| 1 | Sign in as a user with **no OCPF permission sets** | Session established |
| 2 | GET `.../ocpfCustomers` | HTTP 403 Forbidden |
| 3 | Confirm error message references permissions | Error is actionable |

✅ **Pass criteria:** Clean 403 with no data leakage.

---

### RT-07 — OData Injection Attempt

**Goal:** Confirm $filter does not allow injection or schema disclosure.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpfCustomers?$filter=no eq '' or 1 eq 1` | HTTP 200 with filtered results, OR HTTP 400 — either is acceptable; should NOT return all records if the filter syntax is invalid |
| 2 | GET `.../ocpfCustomers?$filter=id ne null` | HTTP 200, standard filter behavior |
| 3 | GET `../$metadata?$filter=anything` | HTTP 400 (metadata does not support OData query params) |

✅ **Pass criteria:** No unexpected data disclosure; standard OData filter rules enforced.

---

### RT-08 — Large Result Set Handling

**Goal:** Confirm pagination works for high-volume tables.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpfGeneralLedgerEntries` (no $top) | HTTP 200, default page size returned (typically 100 records), `@odata.nextLink` present if more records exist |
| 2 | Follow `@odata.nextLink` | HTTP 200, next page of results |
| 3 | GET `.../ocpfGeneralLedgerEntries?$top=5000` | HTTP 200, BC may cap at its own max (typically 20,000) |
| 4 | GET `.../ocpfWarehouseEntries?$top=10` | HTTP 200, respects $top |

✅ **Pass criteria:** Pagination works; `@odata.nextLink` present when applicable; no timeouts on reasonable result sets.

---

### RT-09 — Concurrent Modification (Optimistic Concurrency)

**Goal:** Confirm PATCH uses ETag correctly to prevent overwriting concurrent changes.

| Step | Action | Expected Result |
|---|---|---|
| 1 | GET `.../ocpfCustomers({id})` | Note the `ETag` header value |
| 2 | PATCH with `If-Match: {etag}` header and a field change | HTTP 200, update succeeds |
| 3 | PATCH again using the **old** (stale) ETag | HTTP 412 Precondition Failed |
| 4 | PATCH without `If-Match` header | HTTP 200 (BC allows unconditional PATCH by default) |

✅ **Pass criteria:** ETag validation enforced when `If-Match` supplied; stale ETag rejected.

---

### RT-10 — Delete a Record With Dependencies

**Goal:** Confirm BC business rules block deletion of records with open entries.

| Step | Action | Expected Result |
|---|---|---|
| 1 | Find a Customer with open ledger entries | Note id |
| 2 | DELETE `.../ocpfCustomers({id})` | HTTP 400, BC error: customer has open entries |
| 3 | Find a Customer with no entries or transactions | Note id |
| 4 | DELETE `.../ocpfCustomers({id})` | HTTP 204, deleted successfully |
| 5 | GET `.../ocpfCustomers({id})` | HTTP 404, confirmed deleted |

✅ **Pass criteria:** Business rules enforced via HTTP 400 with meaningful error; clean deletions return 204.

---

## Test Results Log

| Test | Result | Notes | Tester | Date |
|---|---|---|---|---|
| GT-01 | | | | |
| GT-02 | | | | |
| GT-03 | | | | |
| GT-04 | | | | |
| GT-05 | | | | |
| GT-06 | | | | |
| GT-07 | | | | |
| GT-08 | | | | |
| GT-09 | | | | |
| GT-10 | | | | |
| GT-11 | | | | |
| GT-12 | | | | |
| GT-13 | | | | |
| GT-14 | | | | |
| RT-01 | | | | |
| RT-02 | | | | |
| RT-03 | | | | |
| RT-04 | | | | |
| RT-05 | | | | |
| RT-06 | | | | |
| RT-07 | | | | |
| RT-08 | | | | |
| RT-09 | | | | |
| RT-10 | | | | |

---

## Known Behaviors to Document (Not Failures)

- **Company singleton (GT-12):** `ocpfCompanyInformation` always returns exactly one record. `$top=N` still returns 1.
- **FlowFields:** `balance`, `inventory`, `outstandingAmount` etc. are FlowFields — BC calculates them on read. They are slightly slower than stored fields on large result sets. Use `$select` to exclude them if not needed.
- **Document type filter + $filter AND:** OData `$filter` is applied *in addition to* the server-side `SourceTableView` filter. You cannot retrieve Orders from `ocpfSalesQuotes` regardless of what you put in `$filter`.
- **$expand not supported (v3.0):** Navigation properties between headers and lines are not configured. Use separate GET calls for header and line data.
- **ETag behavior:** BC returns ETags on GET responses. PATCH without `If-Match` succeeds (last-write-wins). Provide `If-Match` for optimistic concurrency control.
- **Deleted records:** Once a record is deleted, its `id` is gone permanently. There is no recycle bin in the API.
