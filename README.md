# OnlyCopilotFans Business Central API Catalog v3.1

**Publisher:** OnlyCopilotFans  
**API Version:** v3.1 (all endpoints also served at v3.0 for existing integrations)  
**BC Version:** Business Central 2025 Wave 2 (v27.5+)  
**Date:** June 9, 2026 (v3.0) — updated July 7, 2026 (v3.1)
**Created by:** AJ Ansari ( [Email](mailto:aj@onlycopilotfans.com) | [LinkedIn](https://linkedin.com/in/ajansari) )

## Overview

**OCPF APIs** is a Microsoft Dynamics 365 Business Central extension that exposes over 175 of the most commonly used standard BC tables as OData v4 API endpoints. It is designed to be a comprehensive, ready-to-use API layer for integrations, reporting tools, and external applications that need reliable, structured access to Business Central data without requiring custom development per table.

Each API page maps directly to a standard BC source table and exposes every standard field from that table, with the deliberate exception of fields that are specific to country/region localizations. This keeps the API surface globally portable — the same endpoints and field set work consistently across any BC environment regardless of the localization installed.

## For full documentation, view Documentation.md in the [Documentation](https://github.com/ajansari/ocpfBCAPIsV3/blob/main/Documentation/Documentation.md) folder.

## What changed between v3.0 and v3.1

v3.1 (July 2026) is an **additive, non-breaking** release — all v3.0 endpoints keep working unchanged.

- **Dual-versioned endpoints** — every existing API page is served at both `/v3.0/` and `/v3.1/` base URLs. New entities are published at v3.1 only, so **new integrations should use `/v3.1/`**.
- **170 missing standard fields restored on 22 existing entities** — v3.0's generator had skipped every field with parentheses in its name (e.g. `Credit Limit (LCY)` on Customer, `Cost Amount (Actual)` on Value Entry, and the `(LCY)`/`(Qty.)` flow fields on Customer, Vendor, Item, and ledger entities). These appear on both versions, which is additive and safe for existing OData clients.
- **65 new entities (v3.1 only)** — Ship-to Addresses, a new **Manufacturing** category (34 entities: work/machine centers, routings, production BOMs, production orders, capacity, and assembly management), and a new **Service Management** category (30 entities: service items, service documents, contracts, loaners, ledgers, and posted service documents).
- **Fixes & housekeeping** — corrected tooltips that had shifted onto neighboring fields, expanded permission sets (READ: 178 pages, READ/WRITE: 111), app version 3.1.0.0, and git tags `v3.0.0.0` / `v3.1.0.0` (diff them for the full contract delta).

The complete field-by-field delta is in [ChangeLog.md](https://github.com/ajansari/ocpfBCAPIsV3/blob/main/Documentation/ChangeLog.md).

## Roadmap

- ~~Service Management~~ — ✅ shipped in v3.1
- ~~Manufacturing (Production)~~ — ✅ shipped in v3.1 (including Assembly)


