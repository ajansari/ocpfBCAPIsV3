# Agentic BC Development for Functional Consultants
## The Journey: Designing OCPFAPIs v3.0 — From Idea to Blueprint

---

> **Session premise:** A functional consultant who understands BC business processes is one of the most valuable people in the room when designing an API library — not despite their lack of AL coding experience, but because of their domain knowledge. This session shows how that expertise, combined with agentic AI tooling, produces better technical outcomes than a developer working alone.

---

## Stage 1 — Define the Problem Space

**The starting point is a business need, not a technical spec.**

The goal was clear: expose Business Central financial, sales, and purchasing data through a versioned API library that AI copilots, BI tools, and integrations could consume reliably.

### What the functional consultant brought:
- Knowledge of which BC modules matter (Finance, Sales, Purchasing, Projects, Fixed Assets)
- An initial list of ~55 entities drawn from real-world BC usage
- Domain vocabulary: "GL Entries," "Cust. Ledger Entries," "Jobs," "Item Vendor Catalog"

### What the AI validated and challenged:
- Identified duplicate entries in the initial list (e.g., "Purchase Invoice Lines" listed twice)
- Identified ambiguous entries (e.g., "Posted Credit Memo Lines" — purchase or sales?)
- Flagged outdated terminology ("Jobs" → "Projects" since BC 2024)

### Lesson:
> Start with what you know. Imperfect domain knowledge is better than a blank page. The AI's job at this stage is to sharpen, not replace, your thinking.

---

## Stage 2 — Expand and Validate the Scope

**The first list is never the complete list.**

After the initial 55-entity draft, a structured gap analysis produced 30+ additional entities across six categories:

### Additions by category:

| Category | Key Additions | Why They Matter |
|---|---|---|
| **Analytical** | Detailed Cust/Vend Ledger Entries, Value Entries, G/L Register | AR/AP aging, inventory cost, audit trail |
| **Dimensions** | Dimensions, Dimension Values, Default Dimensions, Dimension Set Entries | GL entries without dimensions are nearly useless for financial analysis |
| **Reference Data** | Currencies, Countries/Regions, Units of Measure, Payment Terms, Locations | Every integration needs these to interpret transactional data |
| **Tax (W1)** | VAT Business/Product Posting Groups, VAT Posting Setup | Core tax framework — confirmed W1, not localization-specific |
| **Fixed Assets** | Fixed Assets, FA Ledger Entries, FA Posting Groups, Depreciation Books | Major balance sheet category frequently missed |
| **Traceability** | Posted Shipments, Posted Receipts, Return Documents | Order-to-cash and procure-to-pay completeness |
| **Pricing** | Price List Headers, Price List Lines | Modern BC pricing model (replaces legacy Sales Price tables) |

### Key decision: W1 baseline
The library must work on the worldwide (W1) BC baseline — no localization dependencies. This ruled out US Sales Tax tables (Tax Area, Tax Jurisdiction) while confirming VAT tables are safe W1 inclusions.

### Lesson:
> A gap analysis against standard BC modules catches what domain knowledge alone misses. Dimensions and Detailed Ledger Entries are the two most commonly forgotten — and the two most valuable for analytics.

---

## Stage 3 — Organize the Scope into a Logical Architecture

**106 objects need a structure. Structure drives everything downstream.**

### Decisions made:

#### 1. Batch / API Group Organization
Objects were grouped into six logical batches, each with its own `APIGroup` name:

| Batch | API Group | Contents |
|---|---|---|
| 1 | `ocpf_coreFinancial` | GL, ledger entries, posting setup, VAT, dimensions |
| 2 | `ocpf_masterData` | Banking, reference data, all master records |
| 3 | `ocpf_sales` | All sales documents (open and posted) |
| 4 | `ocpf_purchasing` | All purchase documents (open and posted) |
| 5 | `ocpf_projectsAndAssets` | Projects, fixed assets, journals, pricing |
| 6 | `ocpf_systemAndSetup` | Attachments, company info, warehouse, collections, workflow |

**Why separate API groups matter:** Consumers (Power BI, MCP servers, integrations) can connect to only the group they need. The `$metadata` endpoint per group is smaller and more focused.

#### 2. Object ID Allocation with Buffers
Range 90800–90999 (200 slots) allocated in blocks with deliberate gaps between batches for future additions. 94 IDs reserved for growth.

#### 3. Read vs. Read/Write
Most objects are read-only. Write access is granted only to unposted documents and general journal lines — the same set BC's own standard API library exposes as writable.

#### 4. Naming Conventions
- Entity names: `ocpf` prefix + PascalCase (singular for `EntityName`, plural for `EntitySetName`)
- API group names: `ocpf_` prefix + camelCase
- File names: `API.<EntitySetNameWithoutPrefix>.al`
- AL field identifiers: camelCase matching BC field names

### Lesson:
> Naming conventions and grouping decisions look trivial but have long-term consequences. Establishing them before writing a single line of code prevents costly refactoring later.

---

## Stage 4 — Write the Functional Requirements Document (FRD)

**The FRD is the contract between what the business needs and what the developer builds.**

### What the FRD captures:
- **Purpose and scope** — what this library is for and what is explicitly out of scope
- **Business objectives** — why this exists (AI copilot data layer, BI, integrations, reusable foundation)
- **Target consumers** — AI copilot features, Power BI, third-party integrations, custom portals, Power Automate
- **Platform requirements** — BC v27.3+, W1, SaaS, Runtime 16.0
- **API design rules** — OData key fields, SystemId, field coverage, ApplicationArea, read vs. read/write
- **Entity tables by batch** — every entity with source table number and R/W designation
- **Non-functional requirements** — compilation, no localization dependencies, PTE deployment

### What makes this FRD different from a typical spec:
The FRD was written with technical constraints explicitly validated — not assumed. For example:
- VAT tables confirmed W1 before being included
- BLOB vs. Media field policy defined before any field lists were written
- "All fields including non-UI fields" stated explicitly to prevent developers from defaulting to Card page field sets

### Lesson:
> Functional consultants are uniquely positioned to write the *what* and *why* of an FRD. The AI fills in the *how it maps to BC tables* and flags technical constraints. The result is an FRD that a developer can act on without constant back-and-forth.

---

## Stage 5 — Write the Technical Design Document (TDD)

**The TDD is the blueprint the developer follows.**

### What the TDD captures:
- **Extension identity** — app ID, publisher, version, namespace, runtime, object range
- **API identity convention** — how every property on every page is named and why
- **Namespace design** — single namespace for all 106 objects
- **File and folder structure** — one folder per batch, one file per API page
- **Object ID allocation table** — every ID assigned before code is written
- **Standard AL page template** — the exact pattern every developer must follow
- **Field rules** — camelCase identifiers, all fields included, ToolTip on every field, Caption on every page
- **Document-type filter pattern** — `SourceTableView` for Sales Header and Purchase Header
- **Special design notes** — singleton tables, composite keys, Projects/Job naming split, high-volume tables

### Key technical patterns documented:

#### The standard template
```al
page 90800 "ocpfChartOfAccounts"
{
    PageType = API;
    Caption = 'Plain-English description of what this entity is.';
    APIPublisher = 'OnlyCopilotFans';
    APIGroup = 'ocpf_coreFinancial';
    APIVersion = 'v3.0';
    EntityName = 'ocpfChartOfAccount';
    EntitySetName = 'ocpfChartOfAccounts';
    SourceTable = "G/L Account";
    ODataKeyFields = SystemId;
    Editable = false;
    ...
}
```

#### Document type filtering
```al
SourceTable = "Sales Header";
SourceTableView = where("Document Type" = const(Order));
```

#### Read/Write pages
Only unposted document pages set `Editable = true` plus all three sub-properties. Read-only pages set only `Editable = false` — the three sub-properties are redundant when `Editable = false`.

### Lesson:
> A good TDD eliminates developer judgment calls on the easy stuff (naming, structure, patterns) so developer judgment is spent on the hard stuff (field selection, edge cases, performance).

---

## Stage 5a — Namespaces: Why They Matter and How We Used Them

**Namespaces are not just a developer housekeeping detail — they are a professional hygiene decision with real consequences.**

### What is an AL namespace?

A namespace is a logical container that scopes all AL objects in an extension under a unique name. It prevents name collisions between objects from different publishers that happen to share the same name. Without namespaces, two extensions that both define a codeunit called `Helper` would conflict at compile or runtime. With namespaces, one is `PublisherA.ExtensionX.Helper` and the other is `PublisherB.ExtensionY.Helper` — they never collide.

Namespaces were introduced as a best practice in BC AL as the ecosystem matured and the number of PTEs in production grew. In BC 2025 Wave 2, `NoImplicitWith` (also enabled in this project's `app.json`) pairs with namespaces as the two markers of modern, professional AL code.

### How we applied them

Every AL file in OCPFAPIs v3.0 opens with the same single line:

```al
namespace OnlyCopilotFans.OCPFAPIsv3;
```

The structure follows the BC convention: `<Publisher>.<ExtensionName>`. This means:

- Every page, codeunit, table extension, or enum in this extension is unambiguously scoped to `OnlyCopilotFans.OCPFAPIsv3`
- If OnlyCopilotFans ships a second extension that also defines an object with the same name, the namespace prevents any conflict
- Other extensions that want to reference objects from this library use the fully qualified name

### Why a single namespace (not one per batch)?

The six batches are logically grouped by `APIGroup` — the grouping mechanism BC provides at the API layer. Using sub-namespaces per batch (e.g., `OnlyCopilotFans.OCPFAPIsv3.CoreFinancial`) would be over-engineering for this project because:

1. API pages in AL have no cross-object AL dependencies — they do not call each other
2. The `APIGroup` property already provides the logical separation consumers care about
3. Sub-namespaces would create unnecessary friction for any future shared utilities within the extension

One namespace. Clean, flat, consistent.

### The `NoImplicitWith` connection

`NoImplicitWith` is a feature flag in `app.json` that requires developers to explicitly reference `Rec.` when accessing record fields, rather than relying on an implicit `with` scope. Example:

```al
// Without NoImplicitWith (old style — implicit, ambiguous):
field(postingDate; "Posting Date") { ... }

// With NoImplicitWith (modern style — explicit, unambiguous):
field(postingDate; Rec."Posting Date") { ... }
```

This matters for the same reason namespaces matter: **explicitness prevents ambiguity at scale.** When a page has 80+ fields, implicit scoping makes it hard to reason about which table's field is being referenced. Combined with namespaces, `NoImplicitWith` ensures the codebase is readable, maintainable, and upgrade-safe.

Both are already configured in `app.json` for this project. Both must be applied consistently in every AL file.

### Lesson:
> Namespaces and `NoImplicitWith` are not advanced topics — they are entry-level expectations for any new AL extension in 2025. A functional consultant doesn't write them, but should ask for them and understand why they matter: they are the difference between a PTE that is maintainable for years and one that creates conflicts the moment another extension enters the same tenant.

---

## Stage 6 — Design for Machine Readability (MCP / AI Tooling)

**An API library used by AI tools needs to be self-describing.**

### The requirement:
Every API page should be understandable by an MCP server or AI copilot without prior knowledge of BC table structures.

### The BC mechanism:
BC's OData `$metadata` endpoint is the answer — it exposes a machine-readable CSDL schema for every API group:
```
GET .../api/OnlyCopilotFans/ocpf_coreFinancial/v3.0/$metadata
```

### How AL properties map to $metadata:

| AL Property | Appears in $metadata as |
|---|---|
| `page.Caption` | `Org.OData.Core.V1.Description` on `EntityType` |
| `field.ToolTip` | `Org.OData.Core.V1.Description` on `Property` |
| Field identifier | `Property Name` |
| Source field type | OData EDM type |
| `ODataKeyFields` | `Key` element |

### What this means in practice:
By setting a meaningful `Caption` on every API page and a meaningful `ToolTip` on every field, the OCPFAPIs v3.0 library becomes **fully self-describing via six `$metadata` calls** — one per API group. An MCP server or AI copilot can discover the entire schema programmatically without any hardcoded knowledge of BC field names or structures.

### What does NOT work on API pages:
`AboutTitle`, `AboutText`, `HelpLink` — these are UI-only properties and cause compile errors on `PageType = API`. The `ToolTip` + `Caption` combination is the correct and complete solution.

### Lesson:
> Designing for AI consumption is not a separate track — it is done at the field level, one `ToolTip` at a time. The investment is in the design document; the execution is repetitive but mechanical.

---

## Stage 7 — Validate the Design (Sanity Check)

**Before writing code, validate that the design is technically sound.**

### What was checked:
- **(A) FRD vs BC technical feasibility** — can BC actually do everything the FRD asks?
- **(B) TDD faithfulness to FRD** — does the TDD fully implement what the FRD requires?

### Results:
- **35 checks** across both documents
- **No blocking issues**
- **6 issues found** — all low-to-medium risk, all resolved or documented:

| Issue | Severity | Resolution |
|---|---|---|
| FlowField CalcFields nuance | Medium | Documented: safe because no triggers in design |
| Composite-key tables need natural key fields exposed | Low | Confirmed: natural key fields included as standard fields |
| Editable = false makes sub-properties redundant | Medium | Fixed in TDD template |
| Warehouse Entry is a high-volume table | Low | Design note added to TDD |
| "All fields" rule not explicit enough in TDD | Low | Clarifying sentence added to TDD Section 7.5 |
| Item Application Entry SystemId uncertainty | Low | Confirmed present since BC 15; note removed |

### Lesson:
> A sanity check is not about finding reasons not to build — it is about finding the cheap fixes before the expensive ones. One session of structured review saved potentially dozens of back-and-forth corrections during development.

---

## Stage 8 — Build Batch 1, Then Test Early and Fix Forward

**The first batch of generated code is not the finish line. It is the first real test of every assumption made in Stages 1–7.**

The moment code exists and a developer opens it in VS Code, the compiler becomes the most honest reviewer in the room. It has no opinion about your design philosophy — it only tells you whether the code is correct. This is exactly when to test, triage, and fix — before generating five more batches on the same broken foundation.

### What "test early" means in agentic development

In traditional development, "test early" means write unit tests before features. In agentic development — where an AI generates dozens or hundreds of files in a single pass — it means:

1. **Build the first batch, compile it, and read every error and warning before moving on.**
2. **Treat each error as a signal about a systemic flaw**, not just a one-off typo. If one file has the problem, all 100 files likely have it.
3. **Fix the root cause in the generator, not just the output.** Patching individual files is not a fix — it is hiding a problem that will reappear in the next batch.
4. **Update the TDD and the ChangeLog** before generating the next batch, so the fix is baked in permanently.

This is the agentic equivalent of fixing a broken mold before casting more parts.

---

### The four issues found in Batch 1 — and what each taught us

#### Issue 1: Missing `using` Directives → "Source Table Does Not Exist"

**Symptom:** Every single AL file showed errors in VS Code. The error appeared to say the source table could not be found.

**Root cause:** Our AL files declared `namespace OnlyCopilotFans.OCPFAPIsv3;`. When a file has a namespace declaration, the AL compiler no longer searches the global namespace for type names. Every reference to an external table — which live in Microsoft's namespaces like `Microsoft.Finance.GeneralLedger.Account` — becomes invisible unless explicitly imported with a `using` directive.

The TDD template never included a `using` line. This was a gap in the design document, not in the code generator.

**How we found the root cause:** The error message pointed to the `SourceTable` property. Cross-referencing with BC AL namespace documentation confirmed: namespace-scoped files require explicit `using` for all external references. The fix was confirmed by checking that opening a file in VS Code (which triggers the language server to fully evaluate it) cleared the error after the `using` was added.

**The fix:** Every generated file now opens with:
```al
namespace OnlyCopilotFans.OCPFAPIsv3;

using Microsoft.Finance.GeneralLedger.Account;
```
The correct namespace for each table was sourced directly from the BC v27.5 symbol files — not guessed.

**What this taught us:** The TDD template was incomplete. A `using` directive is not optional syntax sugar — it is mandatory for namespace-scoped AL files. The ChangeLog and TDD were updated before Batch 2 was generated.

---

#### Issue 2: Object Identifiers Exceeding 30 Characters

**Symptom:** AL compiler errors on specific page names and entity names.

**Root cause:** AL enforces a 30-character maximum on object identifiers. The TDD did not include a pre-generation character count check. Four names exceeded the limit:

| Name | Length | Problem |
|---|---|---|
| `ocpfGeneralBusinessPostingGroups` | 32 | Page name and EntitySetName |
| `ocpfGeneralBusinessPostingGroup` | 31 | EntityName |
| `ocpfGeneralProductPostingGroups` | 31 | Page name and EntitySetName |
| `ocpfDetailedVendorLedgerEntries` | 31 | Page name and EntitySetName |

**How we found the root cause:** Compiler error message explicitly stated the name and the limit. Cross-referenced with all page names, EntityNames, and EntitySetNames programmatically — not just the ones the compiler happened to flag first.

**The fix:** Applied BC-standard abbreviations (Gen, Bus, Prod, Dtld, Ledg) to bring all names within 30 characters. Abbreviations were chosen to match BC's own naming conventions for the same concepts.

**What this taught us:** Entity naming must be validated against the 30-character limit before any file is written. This check is now built into the Batch 2+ generator as a pre-flight step.

---

#### Issue 3: Localization-Specific Fields Included in W1 Library

**Symptom:** Compiler warnings on `IRS 1099 Code` and `IRS 1099 Amount` fields in the Vendor Ledger Entry page. User observation prompted a full audit.

**Root cause:** The BC Base Application `.app` symbol file bundles W1 fields alongside NA (US/Canada) and MX (Mexico) localization fields in the same table declarations. The field extraction script filtered on `ObsoleteState` and field type — but not on field ID range. In BC, fields with IDs 10000–29999 are reserved for localization content. These fields were extracted and included as if they were W1.

The IRS 1099 fields were caught because they had `ObsoleteState = Pending` and generated visible compiler warnings. The other 42 localization fields had no `ObsoleteState` and were completely silent — they would have compiled and deployed without any warning, silently polluting a W1 API with Canadian GIFI codes, Mexican CFDI e-invoicing fields, and US-specific bank reconciliation setup.

**How we found the root cause:** Started from the user's observation of a single warning. Rather than patching just those two fields, the question was asked: *"If these slipped through, what else did?"* A systematic audit of all fields with IDs ≥ 10000 across all 24 source tables was run. This revealed:

| Localization | Fields Found |
|---|---|
| MX (Mexico — CFDI/SAT/PAC e-invoicing) | 29 fields across 4 tables |
| CA (Canada — GIFI, STE, GST/HST) | 5 fields across 3 tables |
| NA/US (IRS, Tax Exemption, Bank Rec) | 10 fields across 2 tables |

**The fix:** All 44 localization fields removed from 5 files. The generator was updated to exclude field IDs 10000–89999 by default for all future batches. Fields 99000000+ (W1 Manufacturing module) are explicitly whitelisted.

**What this taught us:** Never trust a "works silently" result without validating the source. The absence of a compiler error is not evidence of correctness — it is only evidence that the compiler did not notice. The correct test is: *does this data belong in a W1 library?*

---

#### Issue 4: `#if` Preprocessor Blocks Hiding True ObsoleteState

**Symptom:** The IRS 1099 fields appeared as `ObsoleteState = Pending` in the extraction script but were actually `ObsoleteState = Removed` in practice.

**Root cause:** The BC source uses conditional compilation (`#if not CLEAN25 / #else`) to present different `ObsoleteState` values depending on whether a cleanup feature flag is active. When the flag is not set (the default in the symbol file), the field appears as `Pending`. When the flag is set, it appears as `Removed`. The extraction script read only the `Pending` branch and acted on it.

**How we found the root cause:** Read the raw AL source of the field declaration. The `#if / #else / #endif` block was clearly visible. `ObsoleteTag = '28.0'` and `ObsoleteReason = 'Moved to IRS Forms App.'` confirmed these fields are on a hard removal schedule.

**The fix:** The TDD obsolete field policy already covered this case (`Pending` with removal ≤ 28.0 → exclude). The extraction script was updated to also exclude fields inside `#if not CLEANxx` blocks where the `#else` branch shows `Removed`. The ChangeLog records this for future reference.

---

### The troubleshooting mindset for agentic development

These four issues share a common pattern that is worth internalising:

```
OBSERVATION          ROOT CAUSE QUESTION        SYSTEMIC FIX
─────────────        ──────────────────────     ──────────────────────
"This file           "Why does every file        Fix the generator/
 has an error"    →   have this class of      →  template, not the
                      problem?"                   individual file

"This field has      "What rule was              Update the extraction
 a warning"       →   supposed to catch        →  rule and audit all
                      this?"                      existing output

"It works when I     "What is the language       Document the build
 open the file"   →   server doing that       →  trigger (Cmd+Shift+B)
                      opening triggers?"          in the project
```

**The three questions to ask for every error in agentic output:**

1. **Is this a one-off, or a pattern?** Before fixing a single instance, search all generated files for the same class of issue.
2. **Where did this come from?** A compiler error traces back to either the generator script, the TDD template, or the source data (symbol files). Find which one.
3. **What rule should have caught this?** If the FRD or TDD had a rule that should have prevented this, either the rule was wrong or the generator did not enforce it. Fix the rule or the enforcer — then regenerate.

### The ChangeLog as a living contract

Every issue found in Batch 1 was logged in `ChangeLog.md` with:
- What the TDD said
- What reality said
- What was changed and why
- What rule was updated for all future batches

This is not bureaucracy. It is the mechanism by which a mistake made in Batch 1 cannot be made in Batch 2 through Batch 6. The ChangeLog is the institutional memory of the build — it answers the question "why does the code look different from the TDD?" for anyone who reads it later.

### Lesson:
> In agentic development, the cost of a systematic error scales with the number of objects generated. Catching a wrong rule after 24 files is cheap. Catching it after 106 is expensive. The first batch is not just a deliverable — it is a proof of the generator. Test it hard before trusting it at scale.

---

## The Full Journey at a Glance

```
FUNCTIONAL KNOWLEDGE          AGENTIC COLLABORATION          TECHNICAL OUTPUT
─────────────────────         ───────────────────────        ─────────────────
"Here are the BC tables  ──►  Gap analysis, naming,    ──►  106 entities
 I know we need"              de-duplication,                organized in 6
                              terminology corrections         API groups

"We need this to work    ──►  W1 validation, VAT vs    ──►  Zero localization
 globally"                    Sales Tax distinction           dependencies

"This needs to be        ──►  Namespace design,        ──►  Single namespace,
 professional and             NoImplicitWith                 NoImplicitWith,
 conflict-free"               explained and applied          Rec. prefix enforced

"AI tools need to        ──►  OData $metadata          ──►  Caption + ToolTip
 understand it"               research, ToolTip              on every object
                              mapping to CSDL                and field

"Let's document it       ──►  FRD written from         ──►  FRD.md + TDD.md
 properly"                    business objectives,           as living design
                              TDD from technical             documents
                              constraints

"Is this actually        ──►  35-point sanity check    ──►  SanityCheck.md
 buildable?"                  against BC feasibility         all clear, 6 minor
                              and FRD/TDD alignment          issues resolved

"Build it and           ──►  Compile Batch 1,          ──►  4 systemic issues
 see what breaks"             root-cause every error,        found and fixed;
                              fix the generator              generator rules
                              not the output files           updated for all
                                                             remaining batches
```

---

## Stage 9 — Build Remaining Batches (2–6)

**With the generator proven on Batch 1, the remaining five batches execute the same cycle: extract → validate → generate → pre-flight → fix → log.**

Each batch followed the same discipline established in Stage 8:

- Pre-flight validation ran before any file was delivered
- Issues were root-caused and fixed in the generator, not patched in individual files
- The ChangeLog was updated before the next batch started
- The TDD was updated whenever a rule changed

### Notable issues caught in Batches 2–6:

| Issue | Batch | Fix |
|---|---|---|
| `%` in camelCase identifiers (e.g., `paymentDiscount%`) | B3 | Replace `%` with `Pct` in generator; applied via regex to all 16 Sales files |
| `const("Order")` — single-word enum values incorrectly quoted | B3 | `const(Order)` for single-word; `const("Credit Memo")` for multi-word — fixed 6 files |
| `Editable = false` incorrectly set on all B1–B3 pages | B3 | Retroactive fix: 48 pages → `DelayedInsert = true`; 21 pages kept `Editable = false` |
| `ocpfPostedPurchaseCreditMemoLines` (33 chars) exceeded limit | B4 | Abbreviated to `ocpfPostedPurchCrMemoLines` (26 chars) |
| Table regex matched codeunit references before table declarations | B5 | Anchored regex to `^table\s+` (line start); unquoted table names also fixed |
| Field indentation inconsistency (20-space in B3–B6 vs 16-space in B1–B2) | Post-build | Normalized all 53 affected files via regex |

Each of these was a generator-level fix, not a file-by-file patch. The ChangeLog entry for each includes the old rule, the new rule, and the affected files.

### Lesson:
> The discipline established in Stage 8 pays compounding dividends. Each batch is faster and cleaner than the one before because the generator is more correct. By Batch 6, the pre-flight validator ran clean on first attempt.

---

## Stage 10 — Realities of Agentic Development: What Nobody Tells You

**Agentic coding is a force multiplier, not an autopilot.**

After building all six batches — 113 AL files across six API groups — several patterns have emerged that are worth naming explicitly. These are the things that surprise people the first time they work with agentic coding tools, and the things that separate productive sessions from frustrating ones.

---

### 10.1 — Check for Deprecation and Obsolescence Before You Trust Any Field

BC is a 30-year-old product. The Base Application symbol file you extract fields from is a snapshot of everything that exists in the compiled table — including fields the product team has already marked for removal.

In agentic development, the generator operates on data. If the data includes deprecated fields, the generator happily includes them without complaint. The compiler may not either. **Silence is not an endorsement.**

The pattern we encountered in this project:

- **IRS 1099 fields** (field IDs 10020–10021, Vendor Ledger Entry): marked `ObsoleteState = Pending`, wrapped in a `#if not CLEAN25` preprocessor block. The extraction script read the `Pending` branch and included them. They compiled. They would have shipped in a "W1" library that had no W1 business exposing US tax reporting fields.

- **Invoice Copies** (field 40, Customer): `ObsoleteState = Pending`, no `ObsoleteRemovalVersion` set. The existing filter excluded Pending fields only when a removal version was specified. This one had no version — so it slipped through.

**The lesson:** Your obsolescence filter must be unconditional. Any field with `ObsoleteState = Pending` is excluded, full stop — regardless of whether a removal version is attached, regardless of what version you are targeting. If Microsoft has marked it for removal, your new API library should not expose it.

Additionally, watch for:
- Fields inside `#if not CLEANxx` blocks — the "true" state may be `Removed` in the other branch
- Fields with `ObsoleteReason` strings referencing separate apps ("Moved to IRS Forms App") — these have no future in the base table regardless of tag

**Practical rule:** After every batch generation, search the output for `ObsoleteState` in any context. If you find one, the filter is leaking.

---

### 10.2 — W1 vs. Localization: Trust Field IDs, Not the Compiler

The BC Base Application `.app` symbol file is not a W1-only artifact. It bundles W1 fields alongside NA (US/Canada) and MX (Mexico CFDI) localization fields in the same table declarations. The compiler does not know or care whether a field belongs to a specific localization. It will compile Mexican SAT account codes and Canadian GIFI codes in your "global" library without a single warning.

**The only reliable filter is field ID range:**

| ID Range | Classification |
|---|---|
| 1 – 9,999 | W1 (always include) |
| 10,000 – 89,999 | Localization-specific (always exclude) |
| 90,000 – 99,000 | Reserved / partner range (exclude unless you own them) |
| 99,000,000+ | W1 Manufacturing module (include — these are W1, just high-numbered) |

Any automated field extraction must apply this filter **before** writing any code. It is not optional and it cannot be delegated to the compiler. 44 localization fields were silently included in Batch 1 before this filter was added. They had no ObsoleteState, no warnings, no errors. A Mexican e-invoicing field in your Finance API just looks like an extra field until the customer in Germany asks what "CFDI PAC Code" means.

---

### 10.3 — Small Batches Beat Big Bangs

The temptation in agentic development is to generate everything at once. The tooling makes it feel possible — why not generate all 106 files in one pass and be done?

Because the first file is always a proof of the generator. And the generator always has at least one wrong assumption.

In this project, generating Batch 1 first (24 files) before Batches 2–6 meant:
- The missing `using` directive problem was found in 24 files, not 106
- The localization field leak was caught before it affected Sales, Purchasing, Projects, and System setup
- The 30-character name limit was caught before it could affect entity names across 5 more batches
- The `area` reserved keyword conflict was caught in Batch 2 before it could appear in Batch 3's Sales Line pages (which have the same field)

**Every batch is a live test of the generator rules.** The smaller the batch, the cheaper the test. Fix everything before the next batch. Update the TDD and ChangeLog before generating. Then generate the next batch knowing the generator is more correct than it was.

This is the same reasoning behind shipping software incrementally — not because you can't build it all at once, but because you want feedback before you're 106 files deep.

---

### 10.4 — Agentic Tools Work Across Many Files at Once. Chat Tools Don't.

This is worth stating explicitly because the difference is enormous in practice.

A conversational AI (ChatGPT, Copilot, a browser-based Claude session) operates on what fits in a chat window. When asked to "generate an API page for Sales Header," it produces one file. You paste it into VS Code, find an error, paste the error back, get a corrected file. Then you start on the next table. This is not agentic development — it is a code generation assistant that requires you to do all the orchestration manually.

**Agentic coding tools** (Claude Code, GitHub Copilot Agent, Cursor Agent mode) operate on the file system directly. They can:
- Read the BC symbol file, parse all 181 fields of Sales Header, and write the correct AL file
- Then immediately move to Sales Line (193 fields) without you pasting anything
- Then check all 16 generated files against a validation script
- Then write the results, report issues, and wait for you to confirm before continuing

The difference is not just speed. It is the ability to **maintain consistency across many files simultaneously** — every file gets the same namespace, the same field filter logic, the same identifier naming rules. A chat tool generates one file at a time and relies on you to remember to apply the same rules to the next file. Humans are not good at that at scale.

In this project, 113 AL files were generated across six batches. Each file followed identical structural rules. No chat-based workflow could have produced that without substantial manual coordination effort.

---

### 10.5 — "Prompt and Walk Away" Is a Myth. Human-in-the-Loop Is a Feature.

There is a popular mental model of agentic AI: you type a big prompt, walk away, come back in 20 minutes, and everything is done. This is mostly fiction — and the part that isn't fiction is arguably the less desirable outcome.

**The reality of this project:**

Every meaningful action required a human approval:
- Before writing any file: confirm field extraction looks right
- Before applying a fix: confirm the root cause diagnosis
- Before generating a new batch: confirm the previous batch passed validation
- Before updating the TDD or ChangeLog: review what is being documented

This is not a limitation of the tooling. It is a deliberate design. **Human-in-the-loop is a safety mechanism, not a bottleneck.**

Here is why you want it:

1. **You are the domain expert.** The AI does not know whether "Invoice Copies" is a field BC customers use today. You do. When the AI flags it as deprecated, the question of whether to defer it to a v3.1 or drop it now is yours to answer. The AI cannot answer it.

2. **Mistakes at the generator level multiply.** If the AI generates 20 files with a wrong assumption and you approve each step without review, you own 20 files with a wrong assumption. Checkpoints are where you catch that.

3. **You cannot recover time lost to a runaway agent.** If you "walk away" while an agent is generating files and the agent makes a wrong assumption at file 3, files 4 through 106 are all potentially wrong. Walking back in at file 106 to discover the problem is far more expensive than catching it at file 3.

4. **The pause is when you learn.** The moments where the AI stops and explains what it is doing — *"I found 44 localization fields across 5 tables; here is my reasoning for removing them"* — are the moments where a functional consultant gains the technical understanding that makes them more valuable in the next project.

**The productive posture:** Stay present. Review each approval prompt. Ask "why" when something is flagged. The AI handles the mechanical work at scale; you handle the judgment calls. The combination is what makes agentic development effective. Neither alone produces the same result.

---

### 10.6 — Scan for Dead Code After Every Test Pass

After any round of fixes — or after a batch compiles cleanly for the first time — run a dead code scan before moving on.

In agentic AL generation, dead code typically appears as:

| Pattern | How it gets there |
|---|---|
| Empty trigger blocks (`begin end;`) | Generator scaffold left over from a template |
| Commented-out field blocks (`// field(...)`) | A failed rename or exclusion attempt that left a comment behind |
| Duplicate field identifiers | Two source fields mapping to the same camelCase identifier |
| Multiple `using` directives | A copy-paste or merge artifact |
| Fields missing `Caption` or `ToolTip` | Extraction failure silently produced an empty string |

None of these cause compiler errors in all cases — some are valid AL, some are warnings, some are just noise that accumulates over time. The time to catch them is right after a test pass, not three batches later when the codebase is three times larger.

A simple script that checks all generated files for these five patterns takes seconds to run and costs nothing. Build it into your post-generation checklist alongside the pre-flight validator.

**Also: fix the generator, not just the files.** If a dead code scan finds the same pattern in multiple files (e.g., `%` in identifiers across all 16 Sales pages), that is a generator bug — not 16 individual bugs. Patch the extraction rule, note it in the ChangeLog, and verify the fix holds before the next batch.

---

### 10.7 — Use the Right Level of Thinking for the Task

Not every step in an agentic project requires maximum reasoning effort. Calibrating where to invest analytical depth — and where to move fast — is a skill worth developing.

| Task | Right approach | Why |
|---|---|---|
| Field extraction across 193 fields | Systematic/mechanical | Rules-based; judgment not required |
| Pre-flight validation scripts | Systematic/mechanical | Deterministic checks |
| Writing boilerplate AL for 16 pages | Mechanical with spot-check | Pattern is established; verify one, trust the rest |
| Diagnosing a new compiler error | Deliberate analysis | Root cause matters; rushing produces wrong fixes |
| Deciding obsolete field policy | Deliberate reasoning | Has downstream consequences for all batches |
| Choosing entity naming conventions | Careful up-front | Hard to change later; worth the time at Stage 3 |
| Updating ChangeLog/TDD after a fix | Lightweight documentation | Just needs to be accurate, not brilliant |

In practice: **invest depth in design, diagnosis, and policy decisions; move fast on generation and documentation of already-decided matters.** The expensive mistake is applying high analysis to low-stakes tasks (paralysis) or low analysis to high-stakes decisions (silent errors that multiply).

---

## Stage 11 — Post-Build Quality Process

**Shipping 113 files is not the same as shipping a finished product.**

Once all six batches were complete, a structured post-build quality process was run before declaring the library ready for user testing. This stage covers what was done, why it matters, and what it caught.

---

### 11.1 — Permission Sets

Two AL `permissionset` objects were created and shipped inside the extension:

- **`OCPF - READ` (90950)** — grants `X` (execute) on all 113 API pages. Assign to any user or service account that needs read-only API access.
- **`OCPF - READ/WRITE` (90951)** — includes `OCPF - READ` via `IncludedPermissionSets`, plus `X` on all 62 editable pages. Assign to consumers that create or update master data or open documents.

**Important dependency:** Both permission sets require that the user also holds BC base application table permissions. Our PTE has no tables of its own — it projects data from base app tables. Assign alongside `D365 READ` (read consumers) or `D365 BUS FULL ACCESS` (write consumers), or a custom permission set covering the relevant base tables.

Shipping permission sets inside the PTE means a BC administrator can assign them immediately after installation — no manual permission configuration required.

---

### 11.2 — Final Dead Code Scan (All 113 Files)

After gap-fill additions were complete, a comprehensive automated scan was run across all 113 files checking for:

- Raw `%` characters in field identifiers
- Reserved AL keyword conflicts
- Entity names exceeding 30 characters
- Incorrectly quoted single-word `const()` values
- Duplicate field identifiers within a page
- Contradictory `Editable = false` + `DelayedInsert = true` combinations
- Pages with neither property set
- Non-standard field indentation

**Result: 113/113 clean.** No issues found.

This scan should be run after every code change, not just at the end. A passing scan before each batch was what allowed each batch to be delivered without carry-forward bugs.

---

### 11.3 — Post-Dev Technical Design Document

A new document, `PostDevTDD.md`, was produced to serve as the authoritative as-built reference. The original TDD was written as a blueprint — by the time 113 files are built across six batches, the TDD has diverged from reality in meaningful ways (table numbers, name abbreviations, editable policy, field rules, etc.).

The PostDevTDD captures:
- Actual extension identity and runtime details
- Final library summary (113 pages, 62 editable, ~8,750 fields exposed)
- Every naming convention and field rule as actually implemented
- The document-type filter pattern with correct `const()` syntax
- All $metadata endpoint URLs
- The full per-batch page inventory with field counts and R/W status
- All 11 known name abbreviations applied
- A deviation summary referencing the ChangeLog

The PostDevTDD is what a new developer, a support engineer, or an AI tool should read to understand this library. The TDD is now historical context; the ChangeLog is the bridge between them.

---

### 11.4 — Gap Analysis: FRD vs TDD vs As-Built

A formal three-way comparison was run between the FRD, the TDD, and what was actually built. Eight gaps were identified:

| Gap | Type | Finding |
|---|---|---|
| GAP-01 | FRD stale | FRD said setup/reference tables are read-only. As-built correctly made master data and setup editable. FRD needs updating. |
| GAP-02 | FRD error | Job Posting Group listed as Table 96 in FRD. Correct table is 208. Code was correct; FRD had a copy-paste error. |
| GAP-03 | Policy tightening | FRD allowed discretionary inclusion of Pending fields. As-built excludes all Pending unconditionally — correct and intentional. |
| GAP-04 | Missing deliverable | FRD did not specify permission set objects. Added as good practice. |
| GAP-05 | Scope gap | Purchase Quotes not included despite Sales Quotes being present. Added. |
| GAP-06 | Scope gap | Inventory Posting Setup (Table 5813) absent despite Inventory Posting Groups being present. Added. |
| GAP-07 | Scope gap | Sales and Purchase Blanket Orders missing. Added. |
| GAP-08 | FRD stale | FRD described the library as "read-focused." With 62 editable pages, it is a full read/write library. |

Three gaps (GAP-05, 06, 07) were intentional omissions at the time of design, included now. The others are FRD documentation issues — the code was right, the spec was stale.

**Key lesson:** The FRD is a living document. When implementation decisions diverge from it — even correctly — update the FRD. A stale FRD is a liability in future planning sessions because it will mislead whoever reads it next.

---

### 11.5 — Code Review

A comprehensive code review covered all 113 pages across six dimensions: structure, best practices, capability, complexity, consistency, and standards compliance.

**One issue found and fixed:**
- **CR-01 — Indentation inconsistency:** Batches 1–2 used 16-space field indentation (BC standard); Batches 3–6 used 20-space due to an extra level in the updated generator's string template. Normalized across all 113 files. Cosmetic only, but unprofessional in a library meant to be read by developers and tools.

**Everything else passed:**
- NoImplicitWith compliance on all files
- SystemId always first field
- Caption on every page, ToolTip on every field
- Correct Editable / DelayedInsert logic
- Correct `const()` syntax for all document type filters
- No hardcoded values, no triggers, no unnecessary code
- Consistent namespace and using pattern
- Full OData CRUD capability on editable endpoints

**Capability confirmed:** GET, POST, PATCH, DELETE on all 62 editable endpoints; GET on all 113. Full OData v4: `$filter`, `$select`, `$top`, `$skip`, `$orderby`, `$metadata`.

---

### 11.6 — Gap Fill: 7 Additional Pages

After the gap analysis, seven pages were added using reserved growth IDs:

| ID | Entity | Notes |
|---|---|---|
| 90824 | Inventory Posting Setup | Table 5813, `Microsoft.Inventory.Item` namespace |
| 90886/87 | Sales Blanket Orders + Lines | `const("Blanket Order")` — multi-word, correctly quoted |
| 90904/05 | Purchase Quotes + Lines | `const(Quote)` — single-word, unquoted |
| 90906/07 | Purchase Blanket Orders + Lines | `const("Blanket Order")` |

One minor issue caught during validation: the Sales blanket order files used cached field JSON from before the `%→Pct` fix was applied. The fix was applied immediately. Pre-flight validation caught it before any human saw the code.

**Final library count: 113 API pages, 62 editable, 51 read-only, 6 API groups.**

---

## Stage 12 — After the Code: User Testing and Documentation

**Shipping code is not the same as shipping a product.**

A completed extension — even a well-built one — is not ready for real users until it has permissions, test scripts, and documentation. These artifacts are not afterthoughts. They are what separates a developer's artifact from a customer-ready solution. And nearly all of them can be generated with the same agentic approach used to build the code.

---

### 12.1 — User-Testing Scripts: Green Team and Red Team

Write test scripts before users touch the system. Two types:

**Green-team tests (happy path):**
- Does the `$metadata` endpoint return the expected schema for each API group?
- Can you GET a list of customers? A single customer by SystemId?
- Can you POST a new sales order? Does it appear in BC?
- Can you PATCH a field on an open invoice?
- Does a read-only page correctly reject a POST with a 405?

**Red-team tests (adversarial/boundary):**
- What happens if you POST to a read-only page (posted invoice)?
- What happens if you send a field that doesn't exist?
- What happens if you send an invalid GUID as the OData key?
- What happens if you try to delete a record with open entries?
- What happens if permissions are missing — do you get a clean 403, or something worse?

Red-team tests are not about breaking things maliciously — they are about confirming that the system fails *gracefully and predictably*. An API that returns a clean error message is far more useful to a developer than one that returns an unhandled exception.

**The bonus:** a well-written test script is 70% of a user manual. The steps, the expected results — all of it becomes raw material for documentation. Write the test script first; the manual follows naturally.

For OCPFAPIs v3.0, a `UserTestScript.md` was produced covering 14 green-team tests and 10 red-team tests across all 6 API groups, with a test results log table and a "known behaviors" section for responses that look like failures but are expected.

---

### 12.2 — Generating Documentation with AI: The Complete API Reference

The most thorough documentation artifact is a complete API reference — every page, every field, every property. Produced for OCPFAPIs v3.0 by parsing all 113 AL files programmatically:

- A Python script read every `.al` file, extracted page metadata (ID, entity set name, source table, editability, source table view filter) and every field (identifier, BC field name, caption, field-level editability)
- The script generated a structured Markdown document: 113 page sections, each with a property summary table and a numbered field table
- **Result:** 698 KB, 8,751 fields documented, one entry per field with OData identifier, BC source field name, caption, and editability indicator

**This approach — generating documentation from the code, not from memory — guarantees accuracy.** A hand-written field reference invariably drifts from the actual code. A programmatically generated reference is always current as long as the generation script is re-run after each change.

The documentation also includes:
- Quick-start deployment guide
- Authentication and URL pattern reference
- OData query examples (`$filter`, `$select`, `$top`, `$orderby`, pagination)
- Write operation examples (POST, PATCH, DELETE)
- Boundaries and limitations (no `$expand`, no bound actions, SourceTableView immutability, FlowField performance, W1-only fields)
- Integration patterns (Power BI, Power Automate, AI/LLM, .NET/Python)
- Troubleshooting table

---

### 12.3 — Deployment Instructions

Write deployment instructions before you forget what you did. They should cover:

- BC version requirements
- How to install the PTE from AppSource or a direct `.app` file upload
- Which permission sets to assign to which user roles
- How to verify the installation (`$metadata` endpoint check, one sample OData call)
- Any post-install configuration steps
- How to uninstall cleanly

One page. Plain language. Assume the reader is a BC administrator, not a developer.

---

### 12.4 — The Screenshot-First Manual Workflow

For a user manual with visuals, the most efficient workflow is:

1. **Take screenshots in process order** — walk through every meaningful screen in sequence, one screenshot per meaningful step
2. **Name them numerically and sequentially** — `001.png`, `002.png`, `003.png` — in the exact order a user would encounter them
3. **Write a short narrative for each** — one or two sentences: what is on this screen, what the user should do, what happens next
4. **Upload everything to an AI tool** — the numbered screenshots, the narratives, the test scripts, the API reference
5. **Ask the AI to assemble the manual** — it can organize sections, write transitions, add introductory text, and produce a complete draft

The numbered naming convention matters. The AI processes images in the order you provide them, but explicitly numbered filenames make the sequence unambiguous across any tool that may reorder attachments alphabetically.

---

### 12.5 — HTML vs. Markdown: Choosing Your Manual Format

**Markdown** is the right choice when:
- The audience is technical (developers, administrators)
- The manual will live in a GitHub repo or documentation site
- Maintenance velocity matters more than visual polish
- You want the AI to be able to update it easily in future sessions

**HTML** is the right choice when:
- The manual has a brand guide (colors, fonts, logo)
- It needs to be print-friendly (customer handouts, formal deliverables)
- You want precise control over layout and page breaks

For HTML, ask the AI to:
- Apply your brand colors and logo in a `<style>` block or linked CSS
- Add `@media print` rules so it renders cleanly on paper
- Mark where page breaks should fall (`page-break-before: always` on major section headings)
- Specify the paper size in the print styles (`@page { size: Letter; }` or `A4`)

This last point is often overlooked: if you do not specify page break guidance in the HTML, every future revision risks reflowing content across page breaks in unpredictable ways. Explicit `page-break-before` on section headings means updates to section 3 never accidentally split the table in section 4.

---

## Key Takeaways for Functional Consultants

1. **Your domain knowledge is the most valuable input.** An AI cannot know that Dimension Set Entries are required to make GL entries useful for analytics — but a BC functional consultant does.

2. **Terminology matters more than you think.** "Jobs vs. Projects," "Posted Credit Memo Lines (purchase or sales?)," "VAT vs. Sales Tax" — these are not developer questions. They are functional questions that determine the correctness of the entire design.

3. **The FRD is yours to own.** The TDD translates it into AL. If the FRD is vague or wrong, no amount of technical skill in the TDD fixes it.

4. **Design for the consumer, not the table.** The question is not "what fields does this table have?" — it is "what does a Power BI report, an AI copilot, or an integration actually need?" Functional consultants answer this; developers implement it.

5. **Validate before you build.** A sanity check against technical constraints before development starts costs hours. Discovering the same issues during development costs days.

6. **Self-describing APIs are not extra work — they are good design.** A `ToolTip` on every field takes discipline, not skill. The payoff is an API that AI tools can use without a human translator.

7. **The first batch is a proof of the generator, not just a deliverable.** Test it hard, fix everything, update the rules before generating the next batch. A mistake in the generator at Batch 1 that is not caught until Batch 4 means retrofitting fixes across hundreds of files.

8. **Silence is not correctness.** A field that compiles without warnings is not necessarily a W1 field — it might be a Mexican e-invoicing field that the compiler has no opinion about. The correct test is always: *does this belong here?* Domain knowledge answers that question. The compiler cannot.

9. **Root-cause analysis before fixing.** When an agentic build produces errors, the instinct is to fix the files. Resist it. Fix the rule, the template, or the source filter — then regenerate. Patching individual files is expensive at scale and leaves the next batch exposed to the same problem.

10. **The ChangeLog is the institutional memory of the build.** Every deviation from the TDD, every systemic fix, every rule update goes in the ChangeLog. It is what prevents the same mistake from appearing in Batch 2 through Batch 6 — and what lets a new developer understand why the code looks different from the design document.

11. **Filter for deprecation and obsolescence unconditionally.** Any field with `ObsoleteState = Pending` is out — no version check, no exception. Microsoft has flagged it for removal; your new API library should not expose it. Also watch for `#if not CLEANxx` preprocessor blocks that hide the true `ObsoleteState` of a field.

12. **Filter for localization by field ID, not by compiler behavior.** The BC Base Application bundles W1 and localization fields together. The compiler will not warn you about a Mexican CFDI field in a W1 library. The only reliable gate is field ID: exclude 10,000–89,999 in every generator, for every batch, without exception.

13. **Small batches protect you at scale.** Generate one batch, validate it fully, fix everything, update the rules — then generate the next. An error caught in 24 files is cheap. The same error caught in 106 files is a retrofit project.

14. **Agentic tools work across many files simultaneously. Chat tools don't.** A chat-based AI generates one file at a time and relies on you to maintain consistency across all of them. Agentic coding tools enforce the same rules across every file in the same pass. At 100+ files, this distinction is the entire difference between a manageable project and a manual slog.

15. **Human-in-the-loop is a feature, not a limitation.** The approval prompts are not interruptions — they are checkpoints. The AI handles mechanical scale; you handle judgment calls. Staying present and reviewing approvals is how you catch the AI's wrong assumptions before they multiply across an entire batch. The "prompt and walk away" model is a fantasy, and a dangerous one.

16. **Match thinking effort to decision stakes.** Move fast on mechanical generation and boilerplate documentation. Invest deliberate analysis in design decisions, root cause diagnosis, and policy choices. Applying maximum reasoning to every step is paralysis; applying minimum reasoning to everything is how silent errors go undetected.

17. **Generate documentation from the code, not from memory.** A hand-written field reference will drift from the actual code. Parse the source files programmatically and generate the reference from what was actually built. It is always accurate and can be regenerated after any change in seconds.

18. **The FRD is a living document — update it when reality diverges.** Implementation decisions made during development may be better than what the FRD specified. When that happens, update the FRD to match reality. A stale FRD is a liability in future planning because it will mislead whoever reads it next.

---

## Artifacts Produced in This Session

| Artifact | Purpose |
|---|---|
| `FRD.md` | Functional contract — what the library does and why |
| `TDD.md` | Technical blueprint — how every object is built |
| `Research_APIDescriptions.md` | Research findings on BC 2025 Wave 2 API capabilities |
| `SanityCheck.md` | Pre-build validation of FRD and TDD |
| `ChangeLog.md` | Deviations from TDD found during build — the institutional memory |
| `CoreFinancial/` | 25 AL API pages, `ocpf_coreFinancial`, IDs 90800–90824 |
| `MasterData/` | 29 AL API pages, `ocpf_masterData`, IDs 90830–90858 |
| `Sales/` | 18 AL API pages, `ocpf_sales`, IDs 90870–90887 |
| `Purchasing/` | 18 AL API pages, `ocpf_purchasing`, IDs 90890–90907 |
| `ProjectsAndAssets/` | 14 AL API pages, `ocpf_projectsAndAssets`, IDs 90910–90923 |
| `SystemAndSetup/` | 9 AL API pages, `ocpf_systemAndSetup`, IDs 90930–90938 |
| `PermSet.OCPFRead.al` | Permission set 90950 — read access to all 113 pages |
| `PermSet.OCPFReadWrite.al` | Permission set 90951 — read/write access to 62 editable pages |
| `PostDevTDD.md` | As-built technical reference — supersedes TDD as authoritative spec |
| `GapAnalysis_CodeReview.md` | Post-build gap analysis and comprehensive code review |
| `UserTestScript.md` | Functional test script — 14 green-team + 10 red-team tests across all 6 groups |
| `Documentation.md` | Complete API reference — all 113 pages, all 8,751 fields, deployment and integration guide |
| `Session_AgenticBCDevelopment_Journey.md` | This document |

**Status: COMPLETE — 113 API pages across 6 API groups, 2 permission sets, full post-build quality review, user test script, and complete API reference documentation.**

---

## One Remaining Optional Item

The gap analysis identified four FRD entries that are now stale (GAP-01, GAP-02, GAP-03, GAP-08). The code is correct in all cases — the FRD documentation simply did not get updated to match the implementation decisions made during the build. Updating `FRD.md` to reflect the as-built reality is a housekeeping task, not a code change, and can be done at any time before the next planning session.
