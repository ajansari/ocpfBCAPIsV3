#!/usr/bin/env python3
"""Builds docs/index.html (the bcapi.ai site: landing page + documentation view) from this repository:
app.json, Documentation/Documentation.md, Documentation/ChangeLog.md, Documentation/BC_Table_Relationship_Schema.md,
the template docs/template.html and the images in docs/assets/ (inlined, so index.html is a single file).
Needs Node (npx fetches marked 12.0.2 for the Markdown sections). Run from anywhere: python3 docs/build.py"""
import re, subprocess, html, pathlib, json, base64

HERE = pathlib.Path(__file__).resolve().parent
ROOT = HERE.parent
DOCS = ROOT / "Documentation"
app = json.loads((ROOT / "app.json").read_text())
APP_VERSION = app["version"]
API_VERSION = "3.1"
BC_VERSION = "2025 Wave 2 (v27.5)"
REPO = "https://github.com/ajansari/ocpfBCAPIsV3"
appfile = f'{app["publisher"]}_{app["name"]}_{APP_VERSION}.app'
assert (ROOT / appfile).exists(), f"package not found: {appfile}"
DOWNLOAD_URL = f"{REPO}/raw/main/{appfile.replace(' ', '%20')}"

def md(text):
    return subprocess.run(["npx", "--yes", "marked@12.0.2", "--gfm"], input=text, capture_output=True, text=True, check=True).stdout

def inline(text):
    """Tiny inline Markdown for entity notes: code, bold, italic."""
    t = html.escape(text)
    t = re.sub(r"`([^`]+)`", r"<code>\1</code>", t)
    t = re.sub(r"\*\*([^*]+)\*\*", r"<b>\1</b>", t)
    t = re.sub(r"(?<![\w*])\*([^*\n]+)\*(?!\w)", r"<i>\1</i>", t)
    return t

def data_uri(name):
    p = HERE / "assets" / name
    return "data:image/png;base64," + base64.b64encode(p.read_bytes()).decode()

# ─────────────────────────── parse Documentation.md ───────────────────────────
doc = (DOCS / "Documentation.md").read_text()
date_line = re.search(r"^\*\*Date:\*\*(.*)$", doc, re.M).group(1)
DATE = re.findall(r"([A-Z][a-z]+ \d{1,2}, \d{4})", date_line)[-1]

GLYPH = {"🔑": "key", "✅": "rw", "🧮": "calc", "🔍": "filter", "—": "ro"}
def slug(s): return re.sub(r"[^a-z0-9]+", "-", s.lower()).strip("-")

categories, cat = [], None
lines = doc.split("\n")
i, body_start = 0, doc.index("\n## Core Financial")
lines = doc[body_start:].split("\n")
ent = None
while i < len(lines):
    ln = lines[i]
    if ln.startswith("## "):
        cat = {"name": ln[3:].strip(), "group": "", "entities": [], "slug": slug(ln[3:])}
        categories.append(cat)
    elif cat is not None and not cat["group"] and "`ocpf_" in ln and ent is None:
        cat["group"] = re.search(r"`(ocpf_[A-Za-z]+)`", ln).group(1)
    elif ln.startswith("### ocpf"):
        ent = {"name": ln[4:].strip(), "desc": "", "table": "", "id": 0, "editable": False, "v31only": False,
               "replica": False, "key": "", "fields": [], "notes": []}
        cat["entities"].append(ent)
    elif ent is not None:
        if ln.startswith("**Description:**"):
            ent["desc"] = ln[len("**Description:**"):].strip().replace("**", "")
        elif ln.startswith("| **Source Table** |"):
            ent["table"] = ln.split("|")[2].strip()
        elif ln.startswith("| Page ID |"):
            ent["id"] = int(ln.split("|")[2].strip())
        elif ln.startswith("| Editable |"):
            ent["editable"] = "✅" in ln
        elif ln.startswith("| API Version |"):
            ent["v31only"] = "only" in ln
        elif ln.startswith("| Data Access Intent |"):
            ent["replica"] = True
        elif ln.startswith("| OData Key |"):
            ent["key"] = ", ".join(f"<code>{html.escape(k.strip('` '))}</code>" for k in ln.split("|")[2].split(","))
        elif re.match(r"^\| \d+ \| `", ln):
            c = [x.strip() for x in ln.strip().strip("|").split("|")]
            g = next((v for k, v in GLYPH.items() if c[4].startswith(k)), "ro")
            ent["fields"].append([c[1].strip("`"), c[2], c[3], g])
        elif ln.startswith("> ") or (ln.startswith("*") and not ln.startswith("**")):
            ent["notes"].append(inline(ln.lstrip("> ").strip()))
        elif ln.startswith("[↑ Back to top]"):
            ent = None
    i += 1

total = sum(len(c["entities"]) for c in categories)
for c in categories:
    c["editable"] = sum(1 for e in c["entities"] if e["editable"])
    c["readonly"] = len(c["entities"]) - c["editable"]
editable = sum(c["editable"] for c in categories)
readonly = total - editable
assert total == 187 and len(categories) == 9, (total, len(categories))
catalog = {"total": total, "editable": editable, "readonly": readonly, "appVersion": APP_VERSION, "categories": categories}
CATALOG_JSON = json.dumps(catalog, ensure_ascii=False, separators=(",", ":")).replace("</", "<\\/")

# ─────────────────────────── landing: category bars ───────────────────────────
COLORS = ["#0F6CBD", "#0A7C85", "#6B4FC4", "#C10E72"]
bars = ""
for n, c in enumerate(categories):
    cells = "".join('<i class="ro"></i>' if not e["editable"] else "<i></i>" for e in c["entities"])
    new = ' <small>new</small>' if all(e["v31only"] for e in c["entities"]) else ""
    bars += (f'<a href="#docs/reference/{c["slug"]}" style="--cc:{COLORS[n % 4]}"><span class="cn">{html.escape(c["name"])}{new}</span>'
             f'<span class="cells">{cells}</span><span class="ct"><b>{len(c["entities"])}</b> · {c["editable"]} rw</span></a>')

# ─────────────────────────── documentation tabs ───────────────────────────
def fix_links(h):
    h = h.replace('href="ChangeLog.md"', 'href="#docs/changelog"').replace('href="Documentation.md"', 'href="#docs/reference"')
    h = re.sub(r'href="#(ocpf[a-z0-9]+)"', r'href="#docs/reference/\1"', h)
    h = re.sub(r'href="#table-of-contents"', 'href="#docs/reference"', h)
    return h

def post(h, key):
    h = re.sub(r'<pre><code class="language-mermaid">(.*?)</code></pre>', lambda m: '<pre class="mermaid">' + html.unescape(m.group(1)) + "</pre>", h, flags=re.S)
    h = re.sub(r"<table>", '<div class="table-wrap"><table>', h).replace("</table>", "</table></div>")
    h = re.sub(r'<h([23]) id="([^"]+)">', lambda m: f'<h{m.group(1)} id="{key}-{m.group(2)}">', h)
    return fix_links(h)

GETTING_STARTED = f"""
## Install

1. Download **{appfile}** with the button above, or build it from the [source on GitHub]({REPO}).
2. In Business Central, search for **Extension Management**, choose **Manage → Upload Extension**, pick the .app file, accept the terms and choose **Deploy**. Installation takes a few minutes; refresh the page until the extension shows as *Installed*.
3. Assign a permission set to the user or service principal that will call the API (next section).

The extension has no dependencies, no setup page and no data of its own: it only publishes API pages over standard Business Central tables. It installs and behaves identically in every localization because every country-specific field is deliberately left out.

Minimum platform: Business Central {BC_VERSION} or later, SaaS or on-premises.

## Permissions

| Permission set | Grants |
|---|---|
| `OCPF - READ` | GET on all {total} endpoints |
| `OCPF - READ/WRITE` | GET, POST, PATCH and DELETE on the {editable} editable endpoints |

Business Central checks the permission set *and* the caller's permissions on the underlying base tables, so an integration user needs both (for example `D365 BUS FULL ACCESS` or a narrower set covering the tables you read). The Access Control endpoints are special: assigning a permission set through `ocpfPermissionSetAssignments` requires `SUPER` or the `SECURITY` permission set.

## Authentication

Business Central online uses OAuth 2.0. Register an application in Microsoft Entra ID with the `Financials.ReadWrite.All` (delegated) or `API.ReadWrite.All` (application) permission for Dynamics 365 Business Central, add it in BC under **Microsoft Entra Applications** with a permission set, and request a token for the `https://api.businesscentral.dynamics.com/.default` scope. Send it as a `Bearer` token.

For a quick test from Postman or a browser you can also use Basic authentication with a **web service access key** on the user card, where your environment still allows it.

## URL pattern

```
https://api.businesscentral.dynamics.com/v2.0/{{tenantId}}/{{environment}}/api/OnlyCopilotFans/{{apiGroup}}/v{API_VERSION}/companies({{companyId}})/{{entitySetName}}
```

| Part | Value |
|---|---|
| `{{apiGroup}}` | One of {", ".join("`" + c["group"] + "`" for c in categories)} |
| `v{API_VERSION}` | The API version. Entities that existed in v3.0 are also served at `/v3.0/`; use `/v{API_VERSION}/` for new integrations |
| `{{companyId}}` | From `GET .../api/v2.0/companies`, or use `companies({{id}})` with the company's SystemId |
| `{{entitySetName}}` | The entity name from the [Reference](#docs/reference), for example `ocpfCustomers` |

Every API group also serves `$metadata`, an OData CSDL document that lists each entity and field with its caption and tooltip as descriptions. Tools such as Power BI, Power Query, Power Automate and MCP servers read it to discover the schema.

## Reading data

```
GET {{base}}/ocpfCustomers
GET {{base}}/ocpfCustomers({{systemId}})
GET {{base}}/ocpfItems?$filter=inventory gt 0&$select=no,description,inventory&$orderby=no&$top=100
GET {{base}}/ocpfGeneralLedgerEntries?$filter=postingDate ge 2026-01-01&$count=true
```

All standard OData v4 query options work: `$filter`, `$select`, `$orderby`, `$top`, `$skip`, `$count`. Pages are keyed on `systemId` (the four Access Control pages use natural composite keys). Responses include `@odata.etag`, which PATCH and DELETE require in the `If-Match` header.

## Writing data

```
POST {{base}}/ocpfCustomers
Content-Type: application/json

{{ "no": "C-1001", "name": "Contoso Ltd.", "customerPostingGroup": "DOMESTIC" }}

PATCH {{base}}/ocpfCustomers({{systemId}})
If-Match: *

{{ "phoneNo": "+1 555 0100" }}

DELETE {{base}}/ocpfCustomers({{systemId}})
If-Match: *
```

Writes go through the normal Business Central validation, so field triggers, number series and posting-group checks all apply. In each entity's field table, ✅ marks a writable stored field, 🧮 a computed FlowField (read-only), 🔍 a FlowFilter (used only to parameterize computed fields) and 🔑 the key.

## Read-only entities and the read replica

The {readonly} read-only endpoints are ledger entries, registers, posted documents and other data that Business Central never lets you edit. {sum(1 for c in categories for e in c["entities"] if e["replica"])} of them set `DataAccessIntent = ReadOnly`, so their GET requests are served from the Azure SQL read replica. The only visible effect is a few seconds of replication lag: a record you just posted may take a moment to appear. Re-read after a short delay when you need read-your-own-write behaviour.

## Versioning

Every endpoint that existed in v3.0 is served unchanged at both `/v3.0/` and `/v3.1/`; the entities added in v3.1 exist at `/v3.1/` only. Releases are additive: fields are added, never removed or renamed. The [Changelog](#docs/changelog) lists every change by version, and the git tags `v3.0.0.0` and `v3.1.0.0` in the repository let you diff the full contract.
"""

FAQ = f"""
### Is it really free?

Yes. The extension and its source are published under the MIT License. Use it in personal and commercial projects, modify it, ship it inside your own solutions; keep the copyright notice. There is no warranty.

### Does it work in my country's Business Central?

Yes. The API pages expose every W1 (worldwide) field of each table and deliberately skip the fields that a localization adds, so the same package installs and returns the same shape in every country version.

### How is this different from the standard Business Central APIs?

Microsoft's `v2.0` APIs cover a curated set of entities with simplified, renamed fields. This catalog exposes {total} standard tables one-to-one, with every field under its own name, including FlowFields and FlowFilters. Use Microsoft's APIs where they fit; use these when you need a table they do not cover or a field they leave out.

### Which version should I call, v3.0 or v3.1?

Call `/v{API_VERSION}/`. Existing v3.0 integrations keep working unchanged; the newer entities (Manufacturing, Service Management, Access Control and a few master-data tables) exist only at v3.1.

### Can I write to every entity?

{editable} entities accept POST, PATCH and DELETE; {readonly} are GET only because the underlying data (ledgers, registers, posted documents, system-calculated tables) is immutable in Business Central itself. Within an editable entity, FlowFields and FlowFilters are still read-only. The reference marks each field.

### Why does a record I just posted not show up?

The read-only entities are served from the SQL read replica, which lags the primary by a few seconds. Wait a moment and read again.

### Can I create permission sets or assign them to security groups through the Access Control endpoints?

No. You can list permission sets and their permissions, look up users, and assign or revoke an *existing* set for an *individual user*. Creating or editing permission sets and assigning sets to security groups stay in the Business Central UI. See the [Access Control](#docs/access-control) section.

### How do I discover fields without reading this site?

Request `$metadata` on any API group. The CSDL document carries each page's and field's caption and tooltip as `Org.OData.Core.V1.Description` annotations, which is what Power Query, Power Automate and AI tools read.

### What object IDs does the extension use?

Pages 90800 to 91003 and two permission sets, inside the reserved range 90800 to 91099. No tables, codeunits or other objects, so it cannot collide with your business logic.

### Where do I report a problem or ask for a table?

Open an issue on the [GitHub repository]({REPO}/issues). Pull requests are welcome.
"""

# Access Control tab: the "what's possible" section from Documentation.md plus the four entities' summary
ac = re.search(r"#### Access control endpoints — what's possible and what isn't\n(.*?)\n---", doc, re.S).group(1)
ac_tab = "## What you can and cannot do\n" + ac + f"""

## The four endpoints

| Entity | Source table | Page ID | Access |
|---|---|---|---|
""" + "".join(f'| [{e["name"]}](#docs/reference/{e["name"].lower()}) | {e["table"]} | {e["id"]} | {"GET · POST · DELETE" if e["editable"] else "GET"} |\n' for e in categories[-1]["entities"]) + """
All four are served at `/v3.1/` under the `ocpf_accessControl` API group and are keyed on natural composite keys rather than `systemId`.

## Assigning a permission set to a user

1. `GET .../ocpf_accessControl/v3.1/ocpfUsers` and note the user's `userSecurityId` (rows whose `licenseType` is `AAD Group` or `Windows Group` are security groups and cannot be assigned here).
2. `GET .../ocpf_accessControl/v3.1/ocpfPermissionSets?$filter=roleId eq 'D365 BASIC'` and copy `roleId`, `appId` and `scope`.
3. `POST .../ocpf_accessControl/v3.1/ocpfPermissionSetAssignments` with the body below. Leave `companyName` empty to assign in every company.

```
{ "userSecurityId": "...", "roleId": "D365 BASIC", "appId": "...", "scope": "System", "companyName": "" }
```

To revoke, `DELETE` the same record by its key. The caller needs `SUPER` or the `SECURITY` permission set.
"""

schema_md = (DOCS / "BC_Table_Relationship_Schema.md").read_text()
schema_md = re.sub(r"\A# .*\n", "", schema_md)
changelog_md = re.sub(r"\A# .*\n", "", (DOCS / "ChangeLog.md").read_text())

sections = {
    "getting-started": ("Getting Started", post(md(GETTING_STARTED), "getting-started")),
    "reference": ("Reference", None),
    "access-control": ("Access Control", post(md(ac_tab), "access-control")),
    "schema": ("Schema", post(md(schema_md), "schema")),
    "changelog": ("Changelog", post(md(changelog_md), "changelog")),
    "faq": ("FAQ", None),
}
faq_html = md(FAQ)
faq_html = re.sub(r'<h3[^>]*>(.*?)</h3>\s*(.*?)(?=<h3|<h2|\Z)', lambda m: f'<details class="faq"><summary>{m.group(1)}</summary>{m.group(2)}</details>', faq_html, flags=re.S)
sections["faq"] = ("FAQ", fix_links(faq_html))

chips = "".join(f'<button class="chip2" type="button" data-cat="{c["slug"]}" aria-pressed="false">{html.escape(c["name"])} · {len(c["entities"])}</button>' for c in categories)
sections["reference"] = ("Reference", f"""
<p>{total} entities in {len(categories)} API groups: {editable} read / write, {readonly} read-only. Open an entity for its source table, URL, keys and every field. Search matches entity names, BC table names, page IDs and field identifiers.</p>
<div class="ref-tools"><input id="ref-search" type="search" placeholder="Search entities, tables, fields…" aria-label="Search the reference"><span class="cnt" id="ref-count"></span></div>
<div class="chips">{chips}</div>
<p class="legend2">Field legend: 🔑 key · ✅ writable stored field · 🧮 computed (FlowField, read-only) · 🔍 filter (FlowFilter) · — stored field on a read-only entity.</p>
<div id="ref-list"></div>
""")

tabs = "".join(f'<button class="tab" role="tab" data-tab="{k}" aria-selected="false">{html.escape(t)}</button>' for k, (t, _) in sections.items())
panels = "".join(f'<section class="panel" id="panel-{k}" role="tabpanel" hidden><h1>{html.escape(t)}</h1>{b}</section>' for k, (t, b) in sections.items())

# ─────────────────────────── SEO files: JSON-LD, sitemap.xml, llms.txt ───────────────────────────
SITE = "https://bcapi.ai/"
def plain(t):
    """Markdown answer -> the plain text a reader sees."""
    t = re.sub(r"\[([^\]]+)\]\([^)]+\)", r"\1", t)
    t = re.sub(r"[`*]", "", t)
    return " ".join(t.split())
faq_items = [(q.strip(), plain(a)) for q, a in re.findall(r"### (.+?)\n\n(.*?)(?=\n### |\Z)", FAQ, re.S)]
assert len(faq_items) == 10, len(faq_items)
JSONLD = json.dumps({"@context": "https://schema.org", "@graph": [
    {"@type": "WebSite", "@id": SITE + "#website", "name": "bcapi.ai", "url": SITE, "inLanguage": "en",
     "description": f"BC API Catalog v3: {total} standard Business Central tables as OData v4 API pages.",
     "publisher": {"@id": SITE + "#author"}},
    {"@type": "Person", "@id": SITE + "#author", "name": "AJ Ansari", "url": "https://github.com/ajansari"},
    {"@type": "SoftwareApplication", "@id": SITE + "#app", "name": "BC API Catalog v3 (OCPF APIs v3)", "url": SITE,
     "description": f"Free, open source Business Central extension that exposes {total} standard tables as OData v4 API pages, localization-neutral.",
     "softwareVersion": APP_VERSION, "applicationCategory": "DeveloperApplication",
     "operatingSystem": "Microsoft Dynamics 365 Business Central", "downloadUrl": DOWNLOAD_URL,
     "license": "https://opensource.org/licenses/MIT", "image": SITE + "assets/og-image.png",
     "author": {"@id": SITE + "#author"}, "isAccessibleForFree": True,
     "offers": {"@type": "Offer", "price": "0", "priceCurrency": "USD"}},
    {"@type": "SoftwareSourceCode", "@id": SITE + "#source", "name": "ocpfBCAPIsV3", "codeRepository": REPO,
     "programmingLanguage": "AL", "license": "https://opensource.org/licenses/MIT", "author": {"@id": SITE + "#author"},
     "targetProduct": {"@id": SITE + "#app"}},
    {"@type": "FAQPage", "@id": SITE + "#faq", "mainEntity": [
        {"@type": "Question", "name": q, "acceptedAnswer": {"@type": "Answer", "text": a}} for q, a in faq_items]},
]}, ensure_ascii=False, separators=(",", ":")).replace("</", "<\\/")

import datetime
TODAY = datetime.date.today().isoformat()
(HERE / "sitemap.xml").write_text(f'''<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
  <url>
    <loc>{SITE}</loc>
    <lastmod>{TODAY}</lastmod>
  </url>
</urlset>
''')
llms = [f"# bcapi.ai: BC API Catalog v3", "",
        f"> Free, open source Business Central extension (MIT) that exposes {total} standard Microsoft Dynamics 365 Business Central tables as OData v4 API pages: {editable} read/write and {readonly} read-only. Every W1 field, localization-neutral, served at /v3.0/ and /v3.1/. Version {APP_VERSION}, by AJ Ansari.", "",
        "## Key links", "",
        f"- [Website and documentation]({SITE}): landing page, install steps, full reference of every entity and field",
        f"- [Getting Started]({SITE}#docs): install, permissions and first request",
        f"- [Reference]({SITE}#docs/reference): every entity, source table, page ID, key and field",
        f"- [FAQ]({SITE}#docs/faq)",
        f"- [Changelog]({SITE}#docs/changelog)",
        f"- [Source code and issues]({REPO})",
        f"- [Download the .app]({DOWNLOAD_URL})", "",
        "## API groups", ""]
for c in categories:
    names = ", ".join(e["name"] for e in c["entities"][:4])
    llms.append(f"- {c['name']} ({c['group']}): {len(c['entities'])} entities, {c['editable']} read/write, e.g. {names}")
llms += ["", "## Notes", "",
         f"- URL pattern: https://api.businesscentral.dynamics.com/v2.0/<tenantId>/<environment>/api/OnlyCopilotFans/<apiGroup>/v{API_VERSION}/companies(<companyId>)/<entitySetName>",
         f"- Requires Business Central {BC_VERSION} or later (SaaS or on-premises). Request $metadata on any API group to discover fields.", ""]
(HERE / "llms.txt").write_text("\n".join(llms))

page = (HERE / "template.html").read_text()
for k, v in {
    "{{TOTAL}}": str(total), "{{EDITABLE}}": str(editable), "{{READONLY}}": str(readonly), "{{NCATS}}": str(len(categories)),
    "{{APP_VERSION}}": APP_VERSION, "{{API_VERSION}}": API_VERSION, "{{BC_VERSION}}": BC_VERSION, "{{DATE}}": DATE,
    "{{DOWNLOAD_URL}}": DOWNLOAD_URL, "{{CAT_BARS}}": bars, "{{TABS}}": tabs, "{{PANELS}}": panels, "{{CATALOG_JSON}}": CATALOG_JSON,
    "{{JSONLD}}": JSONLD, "{{IMG_LOGO}}": data_uri("app-logo.png"), "{{IMG_BC}}": data_uri("bc-icon.png"),
    "{{IMG_OCPF}}": data_uri("onlycopilotfans-logo.png"), "{{IMG_OBCF}}": data_uri("onlybcfans-logo.png"), "{{IMG_OBCF_ICON}}": data_uri("onlybcfans-icon.png"), "{{IMG_OCPF_DAY}}": data_uri("app-logo.png"),
}.items():
    page = page.replace(k, v)
assert "{{" not in page, re.findall(r"\{\{[A-Z_]+\}\}", page)
desc = re.search(r'<meta name="description" content="([^"]*)"', page).group(1)
assert len(desc) <= 160, (len(desc), desc)
(HERE / "index.html").write_text(page)
print(f"wrote docs/index.html: {len(page):,} bytes · {total} entities · {sum(len(e['fields']) for c in categories for e in c['entities']):,} fields · app {APP_VERSION} · {DATE}")
