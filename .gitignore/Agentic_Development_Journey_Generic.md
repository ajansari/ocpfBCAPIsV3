# Agentic Development for Functional Consultants
## A Repeatable Framework for Building Software with AI Tooling

---

> **Premise:** A functional consultant who deeply understands a business domain is one of the most valuable people in the room when designing a software system — not despite their lack of coding experience, but because of their domain knowledge. This guide shows how that expertise, combined with agentic AI tooling, produces better technical outcomes than a developer working alone.

---

## What This Guide Is

This document captures a repeatable, stage-by-stage framework for building software systems using agentic AI coding tools. It was distilled from a real project — designing and generating a large API library from scratch — and covers every stage from the first business conversation to completed, tested, documented deliverables.

It is written for functional consultants, business analysts, and domain experts who want to participate meaningfully in agentic development projects, not just observe them.

---

## Stage 1 — Define the Problem Space

**The starting point is a business need, not a technical spec.**

The most common mistake in any development project is jumping to technical decisions before the business need is clearly defined. Agentic tooling makes this worse — the AI can generate code instantly, creating the illusion that you are making progress while the requirements are still unclear.

### What the functional consultant brings at this stage:
- Knowledge of which business domains and entities actually matter to users
- An initial list of objects drawn from real-world experience with the system
- Domain vocabulary that the AI can anchor to (names, categories, known problem areas)

### What the AI does at this stage:
- Identifies duplicates and ambiguities in the initial list
- Flags outdated terminology or naming inconsistencies
- Asks clarifying questions about scope and consumer use cases

### Lesson:
> Start with what you know. Imperfect domain knowledge is better than a blank page. The AI's job at this stage is to sharpen, not replace, your thinking.

---

## Stage 2 — Expand and Validate the Scope

**The first list is never the complete list.**

Once you have an initial draft, structured gap analysis consistently reveals 30–50% more objects that should be included. These are not things the business stakeholder forgot — they are things that are easy to take for granted when you live inside the system every day.

### Gap analysis categories to check:

| Category | What to look for |
|---|---|
| **Analytical** | Supporting detail tables that make transactional data meaningful (e.g., detailed sub-ledgers, register entries, audit trails) |
| **Reference/Lookup** | Code tables and lookup values that every integration needs to interpret transactional data |
| **Tax / Compliance** | Tax framework tables — confirm which are global vs. jurisdiction-specific |
| **Secondary entities** | Supporting entities that are often missed when the primary entity is obvious (e.g., including invoices but forgetting credit memos) |
| **Traceability** | Posted/archived versions of documents for order-to-cash and procure-to-pay completeness |
| **Pricing** | Modern pricing models may have replaced legacy tables in recent platform versions |

### Key decision at this stage: global vs. localized scope
If your system will be used across geographies, define the baseline explicitly. Determine which objects are truly global and which are jurisdiction-specific — before any technical work begins.

### Lesson:
> A gap analysis against standard system modules catches what domain knowledge alone misses. The two most commonly forgotten entity categories are: (1) analytical sub-detail tables that make the primary data useful, and (2) lookup/reference tables that every consumer of the data will need.

---

## Stage 3 — Organize the Scope into a Logical Architecture

**Dozens or hundreds of objects need a structure. Structure drives everything downstream.**

Before writing a single line of code, decide how the objects will be grouped, named, and identified. These decisions are cheap to make now and expensive to change later.

### Decisions to make at this stage:

#### 1. Grouping / Module Organization
Cluster objects into logical groups based on domain area. Groups should be cohesive enough that a consumer who only needs one domain can connect to just that group.

#### 2. ID / Key Allocation with Buffers
Assign ID ranges to each group with deliberate gaps between them for future additions. Reserve capacity — new requirements always appear.

#### 3. Read vs. Read/Write
Determine which objects are read-only (historical data, posted records, system tables) and which are read/write (master data, configuration, open documents). This decision has security, performance, and API design implications. Make it explicitly.

#### 4. Naming Conventions
Establish naming conventions before any object is created:
- Object prefix/suffix pattern
- Singular vs. plural for collection names
- Abbreviation rules for names that exceed length limits
- File/folder naming pattern

### Lesson:
> Naming conventions and grouping decisions look trivial but have long-term consequences. Establishing them before writing a single line of code prevents costly refactoring later. Every downstream artifact — code, tests, documentation, integration guides — inherits whatever naming convention you choose here.

---

## Stage 4 — Write the Functional Requirements Document (FRD)

**The FRD is the contract between what the business needs and what the developer builds.**

The FRD is written by the functional consultant — or with heavy input from them — and validated against technical feasibility by the AI. It is not a technical document. It describes *what* and *why*.

### What the FRD must capture:
- **Purpose and scope** — what this system is for and what is explicitly out of scope
- **Business objectives** — why this exists and what business value it delivers
- **Target consumers** — who or what will use this (users, other systems, AI tools, reports)
- **Platform requirements** — version, compatibility constraints, deployment model
- **Design rules** — the non-negotiable constraints that govern every object in the system
- **Entity/object inventory** — every object with source, type, and R/W designation
- **Non-functional requirements** — compilation, performance, compliance, deployment

### What makes a good FRD different from a typical spec:
Technical constraints are explicitly validated — not assumed. For every design rule, ask: *Can the platform actually do this?* Do not write requirements based on how you think the platform works. Verify first.

### Lesson:
> Functional consultants are uniquely positioned to write the *what* and *why* of an FRD. The AI fills in *how it maps to the underlying platform* and flags technical constraints. The result is an FRD that a developer can act on without constant back-and-forth.

---

## Stage 5 — Write the Technical Design Document (TDD)

**The TDD is the blueprint the developer (or AI generator) follows.**

The TDD translates the FRD's *what* into a precise *how*. Every design decision that affects code generation must be captured here, because the AI generator will follow the TDD literally.

### What the TDD must capture:
- **System identity** — identifiers, version, namespace, runtime, object ranges
- **Object naming conventions** — exactly how every property on every object is named
- **Standard object template** — the exact pattern every generated object must follow
- **Field/property rules** — identifier naming, required metadata, what to include and exclude
- **Filter patterns** — any server-side filters or views applied to objects
- **Special design notes** — singleton objects, composite keys, high-volume tables, naming conflicts

### Critical: the TDD must be complete enough to generate from
If a rule is not in the TDD, the generator will invent one. Generators always fill gaps — and they fill them consistently, which means a wrong gap-fill appears in every generated object.

Ask yourself before finalizing: *If I handed this TDD to someone who has never seen this project, could they generate every object correctly from it alone?* If the answer is no, the TDD is incomplete.

### Lesson:
> A good TDD eliminates judgment calls on the easy stuff (naming, structure, patterns) so developer judgment is spent on the hard stuff (edge cases, performance, correctness). Incomplete TDDs create inconsistencies that are discovered during generation — at the worst possible time.

---

## Stage 5a — Namespace and Scope Design

**Namespace and scope decisions are professional hygiene decisions with real consequences.**

In any system that uses namespaces, explicit scoping, or module isolation mechanisms, the decisions made here affect every object in the extension and every consumer of it.

### Key questions to answer:

**One namespace or many?**
A flat, single namespace is correct when:
- Objects in the system have no cross-object dependencies at the AL/code layer
- The grouping mechanism provided by the platform (e.g., API groups, modules) already provides the logical separation consumers care about
- Sub-namespacing would create friction for any future shared utilities

**What is the scope of each import/reference?**
In systems that require explicit imports (e.g., `using` directives, `import` statements), confirm exactly what each generated file must import. Missing an import causes the entire file to fail — and if the generator does not include it, every generated file fails.

**What explicit reference style is required?**
Modern platform standards typically require explicit references (`Rec.FieldName`, `this.property`, etc.) rather than implicit scoping. Enabling the "explicit only" mode and enforcing it in every generated file prevents a class of hard-to-diagnose bugs at scale.

### Lesson:
> Namespace and explicit-reference settings are not advanced topics — they are entry-level expectations for any new extension in a mature ecosystem. A functional consultant does not write them but should ask for them: they are the difference between a system that is maintainable for years and one that creates conflicts the moment another extension enters the same environment.

---

## Stage 6 — Design for Machine Readability (AI / Automation Tooling)

**A system used by AI tools needs to be self-describing.**

If AI tools, automation platforms, or other consumers will interact with your system without a human translator, the system must describe itself. This is not a separate design track — it is a field-level discipline applied during normal design.

### The principle:
Every object and every property should carry enough human-readable metadata that a tool encountering it for the first time can understand what it is and what it contains. For API-based systems, this metadata is typically exposed through schema discovery endpoints (e.g., OData `$metadata`, OpenAPI/Swagger, GraphQL introspection).

### The mechanism:
Most platforms map object-level and field-level descriptions (Captions, ToolTips, descriptions, doc comments) to their schema discovery format. Confirm exactly which metadata properties flow through to the schema, and make them required on every object.

### What does NOT work:
UI-only metadata properties (help links, contextual tooltips, wizard text) typically do not flow to machine-readable schemas. Identify the correct metadata properties early — do not discover that your carefully written help text is invisible to the AI consumer after all 200 objects are generated.

### Lesson:
> Designing for AI consumption is not a separate track — it is done at the field level, one description at a time. The investment is in the design document; the execution is repetitive but mechanical. The payoff is a system that AI tools can use without a human translator.

---

## Stage 7 — Validate the Design (Sanity Check)

**Before writing code, validate that the design is technically sound.**

A sanity check is a structured review of the FRD and TDD against two questions:
- **(A)** Can the platform actually do everything the FRD asks?
- **(B)** Does the TDD fully and correctly implement what the FRD requires?

Run this check as a formal exercise — not as a casual read-through. Produce a document that records each check, the finding, and any resolution.

### What to check:
- Every platform capability assumed in the FRD — is it real?
- Every field rule in the TDD — is it enforceable and unambiguous?
- Every naming decision — does it fit within platform limits?
- Every R/W designation — is it correct for the underlying object's nature?
- Any composite key, singleton, or special-case object — is it handled explicitly?

### Lesson:
> A sanity check is not about finding reasons not to build — it is about finding the cheap fixes before the expensive ones. One session of structured review saves potentially dozens of back-and-forth corrections during development. Issues found here cost hours. The same issues found during generation cost days.

---

## Stage 8 — Build Batch 1, Then Test Early and Fix Forward

**The first batch of generated code is not the finish line. It is the first real test of every assumption made in Stages 1–7.**

The moment code exists and can be compiled or run, the platform becomes the most honest reviewer in the room. It has no opinion about your design philosophy — it only tells you whether the code is correct. This is exactly when to test, triage, and fix — before generating five more batches on the same broken foundation.

### What "test early" means in agentic development

In traditional development, "test early" means write unit tests before features. In agentic development — where an AI generates dozens or hundreds of files in a single pass — it means:

1. **Build the first batch, validate it, and read every error and warning before moving on.**
2. **Treat each error as a signal about a systemic flaw**, not just a one-off typo. If one file has the problem, all 100 files likely have it.
3. **Fix the root cause in the generator, not just the output.** Patching individual files is not a fix — it is hiding a problem that will reappear in the next batch.
4. **Update the TDD and the ChangeLog** before generating the next batch, so the fix is baked in permanently.

This is the agentic equivalent of fixing a broken mold before casting more parts.

---

### Common systemic issues in Batch 1

Every project is different, but these classes of issues appear in almost every first batch:

#### Missing imports or scope declarations
If the platform requires explicit imports (namespaces, `using` directives, module references), the generator template must include them. This issue is invisible in the TDD — everything looks fine in the design — and produces errors on every single generated file. Check for it first.

#### Identifier length or character restrictions
Most platforms impose limits on identifier lengths and allowed characters. The TDD should include a pre-generation validation step that catches names exceeding these limits. Better to catch a 31-character name before generating 50 files that all reference it.

#### Scope contamination (global vs. localized content)
If the source data (symbol files, schema exports, database snapshots) bundles global and localized content together, the generator will include localized content unless it is explicitly filtered out. The platform will not warn you. Design the filter before generation; do not trust post-generation discovery.

#### Deprecated / obsolete content in source data
Source schemas from mature platforms always include deprecated fields, removed objects, and content scheduled for removal. The generator has no opinion about ObsoleteState — it includes everything unless told not to. Set the obsolescence filter to unconditional exclusion before the first batch runs.

---

### The troubleshooting mindset for agentic development

```
OBSERVATION          ROOT CAUSE QUESTION        SYSTEMIC FIX
─────────────        ──────────────────────     ──────────────────────
"This file           "Why does every file        Fix the generator/
 has an error"    →   have this class of      →  template, not the
                      problem?"                   individual file

"This field has      "What rule was              Update the extraction
 a warning"       →   supposed to catch        →  rule and audit all
                      this?"                      existing output

"It works when I     "What is the platform       Document the build
 trigger a build"  →  doing on build that     →  trigger requirement
                      normal save doesn't?"       in the project
```

**The three questions to ask for every error in agentic output:**

1. **Is this a one-off, or a pattern?** Before fixing a single instance, search all generated files for the same class of issue.
2. **Where did this come from?** An error traces back to either the generator script, the TDD template, or the source data. Find which one.
3. **What rule should have caught this?** If the FRD or TDD had a rule that should have prevented this, either the rule was wrong or the generator did not enforce it. Fix the rule or the enforcer — then regenerate.

### The ChangeLog as a living contract

Every issue found in Batch 1 should be logged with:
- What the TDD said
- What reality said
- What was changed and why
- What rule was updated for all future batches

This is not bureaucracy. It is the mechanism by which a mistake made in Batch 1 cannot be made in Batch 2 through Batch 6. The ChangeLog is the institutional memory of the build.

### Lesson:
> In agentic development, the cost of a systematic error scales with the number of objects generated. Catching a wrong rule after 24 files is cheap. Catching it after 100 is expensive. The first batch is not just a deliverable — it is a proof of the generator. Test it hard before trusting it at scale.

---

## Stage 9 — Build Remaining Batches

**With the generator proven on Batch 1, the remaining batches execute the same cycle: extract → validate → generate → pre-flight → fix → log.**

Each batch follows the same discipline established in Stage 8:

- Pre-flight validation runs before any file is delivered
- Issues are root-caused and fixed in the generator, not patched in individual files
- The ChangeLog is updated before the next batch starts
- The TDD is updated whenever a rule changes

### The cycle per batch:
```
1. Extract source data for this batch's objects
2. Run pre-flight validation (name length, field filters, pattern checks)
3. Generate files
4. Compile / lint / test
5. Identify any errors — root-cause each one
6. Fix the generator (not the files)
7. Regenerate
8. Log all issues and resolutions in ChangeLog
9. Update TDD if any rule changed
10. Deliver batch
```

### Lesson:
> The discipline established in Stage 8 pays compounding dividends. Each batch is faster and cleaner than the one before because the generator is more correct. By the final batch, the pre-flight validator should run clean on the first attempt.

---

## Stage 10 — Realities of Agentic Development: What Nobody Tells You

**Agentic coding is a force multiplier, not an autopilot.**

After completing all batches, several patterns emerge that are worth naming explicitly. These are the things that surprise people the first time they work with agentic coding tools, and the things that separate productive sessions from frustrating ones.

---

### 10.1 — Check for Deprecation and Obsolescence Before You Trust Any Source Data

Every mature platform has deprecated fields, obsolete objects, and content scheduled for removal. The source schema or symbol file you extract data from is a snapshot of everything that exists in the compiled system — including content the platform vendor has already marked for removal.

In agentic development, the generator operates on data. If the data includes deprecated content, the generator includes it without complaint. The compiler may not catch it either. **Silence is not an endorsement.**

**The lesson:** Your obsolescence filter must be unconditional. Any field or object marked for deprecation or removal is excluded — regardless of whether a removal version is specified, regardless of what version you are targeting. If the platform vendor has marked it for removal, your new system should not expose it.

Additionally, watch for:
- Conditional compilation blocks that present different deprecation states depending on feature flags — read the "true" branch, not just the default
- Deprecation notes referencing migration to a separate app or module — content moved elsewhere has no future in the base system regardless of its current state

**Practical rule:** After every batch generation, search the output for any reference to deprecation markers. If you find one, the filter is leaking.

---

### 10.2 — Global vs. Localized Content: Trust Explicit Rules, Not the Compiler

Many platforms bundle global and jurisdiction-specific content in the same schema or symbol file. The compiler or linter does not know or care whether a field belongs to a specific localization. It will compile jurisdiction-specific content in your "global" library without a single warning.

**The only reliable filter is an explicit rule applied before generation:**

Identify the mechanism by which your platform distinguishes global from localized content (field ID ranges, namespace patterns, table prefixes, tags) and enforce it as a hard filter in the generator. Do not trust discovery after the fact. Do not trust the compiler. Do not trust that "it looks fine."

A jurisdiction-specific field in your global API just looks like an extra field until a customer in another region asks what it means.

---

### 10.3 — Small Batches Beat Big Bangs

The temptation in agentic development is to generate everything at once. The tooling makes it feel possible — why not generate all 100 files in one pass and be done?

Because the first file is always a proof of the generator. And the generator always has at least one wrong assumption.

**Every batch is a live test of the generator rules.** The smaller the batch, the cheaper the test. Fix everything before the next batch. Update the TDD and ChangeLog before generating. Then generate the next batch knowing the generator is more correct than it was.

This is the same reasoning behind shipping software incrementally — not because you can't build it all at once, but because you want feedback before you're 100 files deep.

---

### 10.4 — Agentic Tools Work Across Many Files at Once. Chat Tools Don't.

This is worth stating explicitly because the difference is enormous in practice.

A conversational AI (chat-based interfaces) operates on what fits in a chat window. When asked to "generate an API page for Entity X," it produces one file. You paste it into your editor, find an error, paste the error back, get a corrected file. Then you start on the next entity. This is not agentic development — it is a code generation assistant that requires you to do all the orchestration manually.

**Agentic coding tools** (tools that operate directly on the file system and run scripts) can:
- Read a source schema, parse all fields of an entity, and write the correct output file
- Then immediately move to the next entity without you pasting anything
- Then check all generated files against a validation script
- Then write the results, report issues, and wait for confirmation before continuing

The difference is not just speed. It is the ability to **maintain consistency across many files simultaneously** — every file gets the same namespace, the same field filter logic, the same identifier naming rules. A chat tool generates one file at a time and relies on you to remember to apply the same rules to the next file. Humans are not good at that at scale.

---

### 10.5 — "Prompt and Walk Away" Is a Myth. Human-in-the-Loop Is a Feature.

There is a popular mental model of agentic AI: you type a big prompt, walk away, come back in 20 minutes, and everything is done. This is mostly fiction — and the part that isn't fiction is arguably the less desirable outcome.

**The reality of agentic development:**

Every meaningful action requires a human approval:
- Before writing any file: confirm extraction looks right
- Before applying a fix: confirm the root cause diagnosis
- Before generating a new batch: confirm the previous batch passed validation
- Before updating design documents: review what is being documented

This is not a limitation of the tooling. It is a deliberate design. **Human-in-the-loop is a safety mechanism, not a bottleneck.**

Here is why you want it:

1. **You are the domain expert.** The AI does not know whether a deprecated field is still used by your customers. You do. When the AI flags it, the decision of whether to include, defer, or drop it is yours to make. The AI cannot make it.

2. **Mistakes at the generator level multiply.** If the AI generates 20 files with a wrong assumption and you approve each step without review, you own 20 files with a wrong assumption. Checkpoints are where you catch that.

3. **You cannot recover time lost to a runaway agent.** If you "walk away" while an agent is generating files and the agent makes a wrong assumption at file 3, files 4 through 100 are all potentially wrong. Walking back in at file 100 to discover the problem is far more expensive than catching it at file 3.

4. **The pause is when you learn.** The moments where the AI stops and explains what it is doing are the moments where a functional consultant gains technical understanding that makes them more valuable in the next project.

**The productive posture:** Stay present. Review each approval prompt. Ask "why" when something is flagged. The AI handles the mechanical work at scale; you handle the judgment calls. The combination is what makes agentic development effective. Neither alone produces the same result.

---

### 10.6 — Scan for Dead Code After Every Test Pass

After any round of fixes — or after a batch compiles cleanly for the first time — run a dead code scan before moving on.

In agentic generation, dead code typically appears as:

| Pattern | How it gets there |
|---|---|
| Empty boilerplate blocks | Generator scaffold left over from a template |
| Commented-out blocks | A failed rename or exclusion attempt that left a comment behind |
| Duplicate identifiers | Two source fields mapping to the same generated identifier |
| Duplicate imports | A copy-paste or merge artifact |
| Required metadata missing | Extraction failure silently produced an empty string |

None of these always cause compilation errors — some are valid syntax, some are warnings, some are noise that accumulates over time. The time to catch them is right after a test pass, not several batches later when the codebase is three times larger.

A script that checks all generated files for common dead-code patterns takes seconds to run. Build it into your post-generation checklist.

**Also: fix the generator, not just the files.** If a dead code scan finds the same pattern in multiple files, that is a generator bug — not multiple individual bugs. Patch the generation rule, note it in the ChangeLog, and verify the fix holds before the next batch.

---

### 10.7 — Use the Right Level of Thinking for the Task

Not every step in an agentic project requires maximum reasoning effort. Calibrating where to invest analytical depth — and where to move fast — is a skill worth developing.

| Task | Right approach | Why |
|---|---|---|
| Extracting fields from source data | Systematic/mechanical | Rules-based; judgment not required |
| Writing pre-flight validation scripts | Systematic/mechanical | Deterministic checks |
| Generating boilerplate for a proven pattern | Mechanical with spot-check | Verify one, trust the rest |
| Diagnosing a new compiler or runtime error | Deliberate analysis | Root cause matters; rushing produces wrong fixes |
| Deciding deprecation/obsolescence policy | Deliberate reasoning | Has downstream consequences for all batches |
| Choosing naming conventions | Careful up-front | Hard to change later; worth the time in Stage 3 |
| Updating ChangeLog and TDD after a fix | Lightweight documentation | Just needs to be accurate, not brilliant |

**Invest depth in design, diagnosis, and policy decisions; move fast on generation and documentation of already-decided matters.** The expensive mistake is applying high analysis to low-stakes tasks (paralysis) or low analysis to high-stakes decisions (silent errors that multiply).

---

## Stage 11 — Post-Build Quality Process

**Shipping files is not the same as shipping a finished product.**

Once all batches are complete, a structured post-build quality process should be run before declaring the system ready for user testing.

---

### 11.1 — Permission Sets and Access Control

Define and ship access control objects as part of the extension or deployment package. Do not leave permission configuration to the customer or administrator.

Common pattern for a data-access library:
- **Read permission set** — for consumers that only query data (BI tools, read-only integrations, AI tools)
- **Read/Write permission set** — for consumers that create or update records (integration workflows, automation)

Make the read set a dependency of the read/write set (using inclusion mechanisms where available) so administrators assign one thing, not two.

**Important:** If your extension projects data from an underlying system that has its own access control, document that dependency explicitly. Your permission set may grant access to the extension's objects but not to the underlying data — consumers need both.

---

### 11.2 — Final Dead Code Scan (All Files)

After all additions and gap fills are complete, run the dead code scan from Stage 10.6 across the entire output — not just new additions. Check for:

- Obsolete patterns that survived from early batches
- Inconsistencies introduced by the gap-fill process (different generator version, cached source data from before a fix was applied)
- Any validation rule that was added mid-project but not retroactively applied to earlier batches

**Target: 100% clean.** A passing scan on every file means the output is consistent end-to-end, not just consistent within each batch.

---

### 11.3 — Post-Dev Technical Design Document

Produce an as-built reference document that supersedes the TDD. Call it the Post-Dev TDD or As-Built Reference.

The original TDD was written as a blueprint. By the time the final batch is built, the TDD has diverged from reality through accumulated design decisions, rule updates, and ChangeLog entries. The as-built document captures:
- Actual system identity and runtime details as deployed
- Final inventory of all objects with their properties
- Every naming convention and rule as actually implemented
- All abbreviations, special cases, and exceptions
- A deviation summary referencing the ChangeLog

The as-built document is what a new developer, a support engineer, or an AI tool should read to understand the system. The original TDD is now historical context; the ChangeLog is the bridge between them.

---

### 11.4 — Gap Analysis: Requirements vs. Design vs. As-Built

Run a formal three-way comparison between the FRD, the TDD, and what was actually built. Look for:

- Objects in the FRD that were not built (intentional or oversight?)
- Objects built that are not in the FRD (scope creep or gap fill?)
- Rules in the FRD that the TDD did not implement (TDD gap)
- Rules implemented differently from the TDD (ChangeLog entry?)
- Design decisions made during implementation that contradict the FRD (FRD update needed)

Document every gap found. For each gap, classify it:
- **Intentional:** decision was made deliberately; document the reasoning
- **Oversight:** something was missed; fix it or schedule it
- **FRD stale:** the code is right, the spec is wrong; update the FRD

**Key lesson:** The FRD is a living document. When implementation decisions diverge from it — even correctly — update the FRD. A stale FRD is a liability in future planning sessions.

---

### 11.5 — Code Review

Run a comprehensive code review covering all objects across multiple dimensions:
- **Structure:** does every object follow the standard template?
- **Best practices:** are platform best practices (explicit references, required metadata, correct property usage) applied consistently?
- **Capability:** does every object that should support read/write actually support it?
- **Complexity:** is any object more complex than it needs to be?
- **Consistency:** are naming, formatting, and structural conventions identical across all batches?
- **Standards compliance:** does every object comply with platform standards?

Pay special attention to consistency across batches — it is common for early batches and later batches to diverge subtly as the generator evolves. Find and normalize those inconsistencies.

---

### 11.6 — Gap Fill

After the gap analysis, add any missing objects using the same discipline as the main batches. Use reserved growth IDs from the original ID allocation. Run the same pre-flight validation before delivering.

Watch for one specific pitfall: gap-fill objects generated later may use cached source data from before fixes were applied. Always validate gap-fill objects against the same rules as the final batch, not the original batch they logically belong to.

---

## Stage 12 — After the Code: Testing and Documentation

**Shipping code is not the same as shipping a product.**

---

### 12.1 — User-Testing Scripts: Green Team and Red Team

Write test scripts before users touch the system. Two types:

**Green-team tests (happy path):**
- Does the schema discovery endpoint return the expected structure?
- Can you successfully read a list of records? A single record by key?
- Can you create a new record through the API?
- Can you update a field?
- Does a read-only endpoint correctly reject write operations?

**Red-team tests (adversarial/boundary):**
- What happens when you attempt a write on a read-only endpoint?
- What happens when you send a field that does not exist?
- What happens when you send an invalid key?
- What happens when you try to delete a record with dependencies?
- What happens when permissions are missing — do you get a clean error, or something worse?

Red-team tests confirm that the system fails *gracefully and predictably*. An API that returns a clean, actionable error message is far more useful to a developer than one that returns an unhandled exception.

**The bonus:** a well-written test script is 70% of a user manual. Write the test script first; the manual follows naturally.

---

### 12.2 — Generating Documentation from the Code

The most accurate documentation is generated from the code itself, not written from memory.

For any system where the objects are machine-parseable (API pages, schema files, OpenAPI specs, database definitions), write a script that:
1. Reads every object definition
2. Extracts all metadata: identifiers, descriptions, properties, R/W status
3. Generates a structured reference document — one section per object, one row per field

**This approach guarantees accuracy.** A hand-written reference invariably drifts from the actual code. A programmatically generated reference is always current as long as the generation script is re-run after each change.

The complete reference should include:
- Per-object property summary (ID, source, editability, any filters)
- Per-field table (identifier, source field name, description, editability)
- Quick-start deployment guide
- Authentication and URL/access pattern reference
- Query/filter examples
- Write operation examples (create, update, delete)
- Explicit boundaries and limitations
- Integration patterns for common consumers
- Troubleshooting table

---

### 12.3 — Deployment Instructions

Write deployment instructions before you forget what you did. They should cover:

- System version requirements
- Installation procedure
- Access control setup (which permission sets to assign to which roles)
- Verification steps (how to confirm the installation worked)
- Any post-install configuration
- Uninstall procedure

One page. Plain language. Assume the reader is an administrator, not a developer.

---

### 12.4 — The Screenshot-First Manual Workflow

For a user manual with visuals, the most efficient workflow is:

1. **Take screenshots in process order** — walk through every meaningful screen in sequence
2. **Name them numerically** — `001.png`, `002.png`, `003.png` — in the exact order a user would encounter them
3. **Write a short narrative for each** — one or two sentences: what is on this screen, what the user should do, what happens next
4. **Upload everything to an AI tool** along with the test scripts and reference documentation
5. **Ask the AI to assemble the manual** — it organizes sections, writes transitions, and produces a draft

The numbered naming convention is important: explicitly numbered filenames make the sequence unambiguous regardless of how the AI tool processes attachments.

---

### 12.5 — HTML vs. Markdown: Choosing Your Manual Format

**Markdown** is the right choice when:
- The audience is technical (developers, administrators)
- The manual will live in a source code repository or documentation site
- Maintenance velocity matters more than visual polish
- You want the AI to be able to update it easily in future sessions

**HTML** is the right choice when:
- The manual has a brand guide (colors, fonts, logo)
- It needs to be print-friendly (customer handouts, formal deliverables)
- You want precise control over layout and page breaks

For HTML manuals, always specify:
- `@media print` rules for clean paper rendering
- Explicit page break guidance (`page-break-before: always` on major section headings)
- Paper size in print styles (`@page { size: Letter; }` or `A4`)

Without explicit page break guidance, every future revision risks reflowing content across page breaks in unpredictable ways.

---

## Key Takeaways

1. **Domain knowledge is the most valuable input.** An AI cannot know which entities are required for meaningful analysis — but a domain expert does. That knowledge shapes the entire design.

2. **Terminology matters more than you think.** Naming ambiguities and outdated terms are not cosmetic — they determine whether the design is correct. Resolve them in Stage 1 before they propagate.

3. **The requirements document is yours to own.** The technical design translates it into implementation. If the requirements are vague or wrong, no amount of technical skill in the design document fixes it.

4. **Design for the consumer, not the schema.** The question is not "what fields does this object have?" — it is "what does the consumer of this data actually need?" Domain experts answer this; developers implement it.

5. **Validate before you build.** A sanity check against technical constraints before development starts costs hours. Discovering the same issues during development costs days.

6. **Self-describing systems are not extra work — they are good design.** A description on every field takes discipline, not skill. The payoff is a system that AI tools, documentation generators, and new developers can use without a human translator.

7. **The first batch is a proof of the generator, not just a deliverable.** Test it hard, fix everything, update the rules before generating the next batch. A mistake in the generator at Batch 1 that is not caught until Batch 4 means retrofitting fixes across hundreds of files.

8. **Silence is not correctness.** Content that compiles or validates without warnings is not necessarily correct — it might contain jurisdiction-specific data, deprecated fields, or scope contamination that the platform has no opinion about. The correct test is always: *does this belong here?*

9. **Root-cause analysis before fixing.** When an agentic build produces errors, the instinct is to fix the files. Resist it. Fix the rule, the template, or the source filter — then regenerate. Patching individual files is expensive at scale and leaves the next batch exposed to the same problem.

10. **The ChangeLog is the institutional memory of the build.** Every deviation from the design, every systemic fix, every rule update goes in the ChangeLog. It prevents the same mistake from appearing in Batch 2 through Batch 6, and lets a new developer understand why the code looks different from the design document.

11. **Filter for deprecation and obsolescence unconditionally.** Any content marked for deprecation or removal is excluded — no version check, no exception. If the platform vendor has marked it for removal, your new system should not expose it.

12. **Filter for scope contamination explicitly.** The source schema may bundle global and localized or domain-specific content together. The compiler will not warn you. The only reliable gate is an explicit filter rule applied before generation, every time.

13. **Small batches protect you at scale.** Generate one batch, validate it fully, fix everything, update the rules — then generate the next. An error caught in 24 files is cheap. The same error caught in 100 files is a retrofit project.

14. **Agentic tools work across many files simultaneously. Chat tools don't.** A chat-based AI generates one file at a time and relies on you to maintain consistency. Agentic coding tools enforce the same rules across every file in the same pass. At 100+ files, this distinction is the entire difference between a manageable project and a manual slog.

15. **Human-in-the-loop is a feature, not a limitation.** The approval prompts are checkpoints, not interruptions. The AI handles mechanical scale; you handle judgment calls. Staying present is how you catch the AI's wrong assumptions before they multiply. The "prompt and walk away" model is a fantasy, and a dangerous one.

16. **Match thinking effort to decision stakes.** Move fast on mechanical generation and boilerplate documentation. Invest deliberate analysis in design decisions, root cause diagnosis, and policy choices. Maximum reasoning applied to every step is paralysis; minimum reasoning everywhere is how silent errors go undetected.

17. **Generate documentation from the code, not from memory.** A hand-written reference will drift from the actual code. Parse the source programmatically and generate the reference from what was actually built. It is always accurate and can be regenerated after any change.

18. **Update requirements documents when implementation diverges — even when the implementation is better.** A stale requirements document is a liability in future planning because it will mislead whoever reads it next.

---

## Summary: The Full Stage Map

| Stage | Name | Key Output |
|---|---|---|
| 1 | Define the Problem Space | Initial entity/object list |
| 2 | Expand and Validate the Scope | Complete scope with gap analysis |
| 3 | Organize into a Logical Architecture | Grouping, naming conventions, ID allocation |
| 4 | Write the FRD | Functional contract |
| 5 | Write the TDD | Technical blueprint |
| 5a | Namespace and Scope Design | Namespace/module decisions, import rules |
| 6 | Design for Machine Readability | Metadata strategy |
| 7 | Validate the Design | Sanity check document |
| 8 | Build Batch 1 and Test | Proven generator + ChangeLog started |
| 9 | Build Remaining Batches | All objects generated and validated |
| 10 | Realities of Agentic Development | (Lessons, not a deliverable) |
| 11 | Post-Build Quality Process | Dead code scan, as-built TDD, gap analysis, code review, gap fill |
| 12 | Testing and Documentation | Test scripts, complete reference docs, deployment guide |
