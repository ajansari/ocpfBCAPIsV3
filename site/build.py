#!/usr/bin/env python3
"""Builds the bcapi.ai site into docs/ (the folder GitHub Pages serves) from this repository:
app.json, Documentation/Documentation.md, Documentation/ChangeLog.md, Documentation/BC_Table_Relationship_Schema.md,
and the templates in site/ (template.html = landing, page.html = documentation pages, partials/ = shared header and footer,
site.css, site.js). Output: docs/index.html, one static page per documentation tab and per reference category
(getting-started/, reference/, reference/<category>/, access-control/, schema/, changelog/, faq/), catalog.json,
sitemap.xml, llms.txt and assets/site.{css,js}. Nothing else in docs/ is touched.
Needs Node (npx fetches marked 12.0.2 for the Markdown sections; set MARKED_CMD to use a local copy).
Run from anywhere: python3 site/build.py"""
import re, subprocess, html, pathlib, json, os, shlex, shutil, datetime

HERE = pathlib.Path(__file__).resolve().parent
ROOT = HERE.parent
OUT = ROOT / "docs"
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
    return subprocess.run(shlex.split(os.environ.get("MARKED_CMD", "npx --yes marked@12.0.2 --gfm")), input=text, capture_output=True, text=True, check=True).stdout

def inline(text):
    """Tiny inline Markdown for entity notes: code, bold, italic."""
    t = html.escape(text)
    t = re.sub(r"`([^`]+)`", r"<code>\1</code>", t)
    t = re.sub(r"\*\*([^*]+)\*\*", r"<b>\1</b>", t)
    t = re.sub(r"(?<![\w*])\*([^*\n]+)\*(?!\w)", r"<i>\1</i>", t)
    return t

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

GETTING_STARTED = f"""
## Install

1. Download [{appfile}]({DOWNLOAD_URL}), or build it from the [source on GitHub]({REPO}).
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
| `{{entitySetName}}` | The entity name from the [Reference](/reference/), for example `ocpfCustomers` |

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

Every endpoint that existed in v3.0 is served unchanged at both `/v3.0/` and `/v3.1/`; the entities added in v3.1 exist at `/v3.1/` only. Releases are additive: fields are added, never removed or renamed. The [Changelog](/changelog/) lists every change by version, and the git tags `v3.0.0.0` and `v3.1.0.0` in the repository let you diff the full contract.
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

No. You can list permission sets and their permissions, look up users, and assign or revoke an *existing* set for an *individual user*. Creating or editing permission sets and assigning sets to security groups stay in the Business Central UI. See the [Access Control](/access-control/) section.

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
""" + "".join(f'| [{e["name"]}](/reference/access-control/#{e["name"]}) | {e["table"]} | {e["id"]} | {"GET · POST · DELETE" if e["editable"] else "GET"} |\n' for e in categories[-1]["entities"]) + """
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

# ─────────────────────────── helpers for the static pages ───────────────────────────
SITE = "https://bcapi.ai/"
esc = html.escape
ENT = {}   # lower-case entity name -> (category dict, entity dict)
for _c in categories:
    for _e in _c["entities"]:
        ENT[_e["name"].lower()] = (_c, _e)

def heading_ids(h):
    """Give h2-h4 an id (slug of their text) so sections can be deep-linked; duplicates get -2, -3 ..."""
    seen = {}
    def one(m):
        lvl, inner = m.group(1), m.group(2)
        base = slug(html.unescape(re.sub(r"<[^>]+>", "", inner))) or "section"
        if not base[0].isalpha(): base = "s-" + base   # HTML ids should start with a letter
        seen[base] = seen.get(base, 0) + 1
        sid = base if seen[base] == 1 else f"{base}-{seen[base]}"
        return f'<h{lvl} id="{sid}">{inner}</h{lvl}>'
    return re.sub(r"<h([234])>(.*?)</h\1>", one, h, flags=re.S)

def fix_links(h):
    h = h.replace('href="ChangeLog.md"', 'href="/changelog/"').replace('href="Documentation.md"', 'href="/reference/"')
    def ent(m):
        hit = ENT.get(m.group(1))
        return f'href="/reference/{hit[0]["slug"]}/#{hit[1]["name"]}"' if hit else m.group(0)
    h = re.sub(r'href="#(ocpf[a-z0-9]+)"', ent, h)
    return re.sub(r'href="#table-of-contents"', 'href="/reference/"', h)

def post(h):
    h = re.sub(r'<pre><code class="language-mermaid">(.*?)</code></pre>', lambda m: '<pre class="mermaid">' + html.escape(html.unescape(m.group(1)), quote=False) + "</pre>", h, flags=re.S)
    h = h.replace("<th>", '<th scope="col">')
    h = re.sub(r"<table>", '<div class="table-wrap"><table>', h).replace("</table>", "</table></div>")
    h = re.sub(r"<(/?)h1>", r"<\1h2>", h)
    return heading_ids(fix_links(h))

GLYPH_LABEL = {"key": "🔑 Key", "rw": "✅ writable", "calc": "🧮 computed", "filter": "🔍 filter", "ro": "— read-only"}

def entity_html(c, e):
    """One entity as a <details> card with the whole body in the HTML (port of entityBody()/entityCard() in the old template)."""
    badges = f'<span class="b {"rw" if e["editable"] else "ro"}">{"Read / write" if e["editable"] else "Read-only"}</span>'
    if e["v31only"]: badges += '<span class="b new">New in v3.1</span>'
    if e["replica"]: badges += '<span class="b rep">Read replica</span>'
    badges += f'<span class="b id">{e["id"]}</span>'
    if not e["editable"]: ops = "GET"
    elif c["slug"] == "access-control": ops = "GET · POST · DELETE"
    else: ops = "GET · POST · PATCH · DELETE"
    n = len(e["fields"])
    h = [f'<details class="ent" id="{esc(e["name"])}"><summary><h3><span class="en">{esc(e["name"])}</span><span class="eb">{badges}</span>'
         f'<span class="es">{esc(e["table"])} · {n} fields</span></h3></summary><div class="body"><p class="desc">{esc(e["desc"])}</p><div class="props">']
    props = [("Source table", esc(e["table"])), ("Page ID", str(e["id"])), ("API group", f'<code>{esc(c["group"])}</code>'),
             ("API versions", "v3.1 only" if e["v31only"] else "v3.0 and v3.1"), ("Operations", ops),
             ("OData key", e["key"] or "<code>systemId</code>")]
    if e["replica"]: props.append(("Data access intent", "ReadOnly (SQL read replica)"))
    props.append(("Fields", str(n)))
    h += [f"<div><span>{k}</span><b>{v}</b></div>" for k, v in props]
    h.append("</div>")
    h.append(f'<div class="url"><span>GET {{base}}/api/OnlyCopilotFans/</span>{esc(c["group"])}<span>/</span><em>v{API_VERSION}</em>'
             f'<span>/companies({{companyId}})/</span>{esc(e["name"])}</div>')
    h.append('<div class="table-wrap"><table><thead><tr><th scope="col">#</th><th scope="col">Identifier</th><th scope="col">BC field</th><th scope="col">Caption</th><th scope="col">Editable</th></tr></thead><tbody>')
    for i, f in enumerate(e["fields"], 1):
        h.append(f"<tr><td>{i}</td><td><code>{esc(f[0])}</code></td><td>{esc(f[1])}</td><td>{esc(f[2])}</td><td>{GLYPH_LABEL.get(f[3], f[3])}</td></tr>")
    h.append("</tbody></table></div>")
    for note in e["notes"]: h.append(f'<p class="note">{note}</p>')
    h.append("</div></details>")
    return "".join(h)

TAB_DEFS = [("getting-started", "Getting Started"), ("reference", "Reference"), ("access-control", "Access Control"),
            ("schema", "Schema"), ("changelog", "Changelog"), ("faq", "FAQ")]

def tabs_html(active):
    return "".join(f'<a class="tab" href="/{k}/"' + (' aria-current="page"' if k == active else "") + f'>{t}</a>' for k, t in TAB_DEFS)

LEGEND = '<p class="legend2">Field legend: 🔑 key · ✅ writable stored field · 🧮 computed (FlowField, read-only) · 🔍 filter (FlowFilter) · — stored field on a read-only entity.</p>'

# ─────────────────────────── page definitions ───────────────────────────
pages = []   # path (with trailing slash), title, desc, h1, body, crumbs [(name, path)], tab, extra_ld, scripts
def cat_title(c):
    n = len(c["entities"])
    for t in (f'{c["name"]} API Reference: {n} Business Central Entities | bcapi.ai',
              f'{c["name"]} API Reference: {n} Business Central APIs | bcapi.ai',
              f'{c["name"]} Business Central API Reference ({n}) | bcapi.ai',
              f'{c["name"]} API Reference ({n} entities) | bcapi.ai'):
        if len(esc(t)) <= 70: return t
    return t

def add(path, title, desc, h1, body, crumbs, tab, extra_ld=None, scripts=""):
    assert len(desc) <= 160, (path, len(desc), desc)
    assert len(esc(title)) <= 70, (path, len(title), title)
    pages.append(dict(path=path, title=title, desc=desc, h1=h1, body=body, crumbs=crumbs, tab=tab, extra_ld=extra_ld or [], scripts=scripts))

DOCS_CRUMB = ("Home", "/")

gs_html = post(md(GETTING_STARTED))
add("/getting-started/", "Getting Started: Install and Call the BC API Catalog | bcapi.ai",
    f"Install the BC API Catalog extension, assign permissions, authenticate and send your first OData v4 request to {total} Business Central tables.",
    "Getting Started with the BC API Catalog", gs_html, [DOCS_CRUMB, ("Getting Started", "/getting-started/")], "getting-started")

# Reference hub
hub = [f"<p class=\"lede\">{total} entities in {len(categories)} API groups: {editable} read / write, {readonly} read-only. "
       "Open a group for every entity's source table, URL, keys and fields, or search all of them below.</p>",
       '<div class="ref-tools"><input id="ref-search" type="search" placeholder="Search entities, tables, page IDs, fields…" aria-label="Search the reference" autocomplete="off">'
       '<span class="cnt" id="ref-count" aria-live="polite"></span></div>',
       '<ul class="results" id="ref-results"></ul>', '<div id="ref-hub">', LEGEND]
for c in categories:
    hub.append(f'<section class="hubcat"><h2><a href="/reference/{c["slug"]}/">{esc(c["name"])}</a> <small><code>{esc(c["group"])}</code> · {len(c["entities"])} entities · {c["editable"]} read / write · {c["readonly"]} read-only</small></h2><ul class="entlist">')
    hub += [f'<li><a href="/reference/{c["slug"]}/#{esc(e["name"])}">{esc(e["name"])}</a></li>' for e in c["entities"]]
    hub.append("</ul></section>")
hub.append("</div>")
add("/reference/", f"Reference: {total} Business Central API Entities | bcapi.ai",
    f"Reference for all {total} Business Central API entities in {len(categories)} groups: source tables, page IDs, keys, operations and fields. Searchable.",
    f"BC API Catalog Reference: All {total} Entities", "".join(hub), [DOCS_CRUMB, ("Reference", "/reference/")], "reference")

# One page per category, every entity rendered
for c in categories:
    nav = "".join(f'<a href="/reference/{o["slug"]}/"' + (' aria-current="page"' if o is c else "") + f'>{esc(o["name"])} · {len(o["entities"])}</a>' for o in categories)
    body = (f'<p class="lede">{len(c["entities"])} entities in the <code>{esc(c["group"])}</code> API group: {c["editable"]} read / write and {c["readonly"]} read-only. '
            f'Each entity lists its source table, page ID, OData key, supported operations, URL and every field.</p>'
            f'<nav class="catnav" aria-label="API groups">{nav}</nav>{LEGEND}'
            + "".join(entity_html(c, e) for e in c["entities"]))
    add(f'/reference/{c["slug"]}/', cat_title(c),
        f'{len(c["entities"])} {c["name"]} tables as OData v4 API pages ({c["editable"]} read/write): source tables, page IDs, keys and every field.',
        f'{c["name"]} API Reference', body, [DOCS_CRUMB, ("Reference", "/reference/"), (c["name"], f'/reference/{c["slug"]}/')], "reference")

add("/access-control/", "Business Central Access Control API: Users, Permission Sets | bcapi.ai",
    "What the four Access Control API pages can and cannot do: list users and permission sets, and assign or revoke a permission set for a user.",
    "Access Control API", post(md(ac_tab)), [DOCS_CRUMB, ("Access Control", "/access-control/")], "access-control")

schema_scripts = ('<script src="/assets/vendor/mermaid.min.js" defer></script>\n'
                  '<script>window.addEventListener("load", function () { if (!window.mermaid) return; try { '
                  'window.mermaid.initialize({ startOnLoad: false, theme: "neutral", flowchart: { useMaxWidth: false }, er: { useMaxWidth: false } }); '
                  'window.mermaid.run({ querySelector: "pre.mermaid" }); } catch (e) { /* the diagram text stays visible */ } });</script>\n')
add("/schema/", "Business Central Table Relationship Schema | bcapi.ai",
    "Entity-relationship diagrams of the standard Business Central tables behind the BC API Catalog and how they relate to each other.",
    "Business Central Table Relationship Schema", post(md(schema_md)), [DOCS_CRUMB, ("Schema", "/schema/")], "schema", scripts=schema_scripts)

add("/changelog/", "Changelog: BC API Catalog Release History | bcapi.ai",
    "Release history of the BC API Catalog: new entities, fields and fixes in every version from v3.0 to the latest release.",
    "BC API Catalog Changelog", post(md(changelog_md)), [DOCS_CRUMB, ("Changelog", "/changelog/")], "changelog")

faq_html = md(FAQ)
faq_html = re.sub(r'<h3[^>]*>(.*?)</h3>\s*(.*?)(?=<h3|<h2|\Z)', lambda m: f'<details class="faq"><summary>{m.group(1)}</summary>{m.group(2)}</details>', faq_html, flags=re.S)
def plain(t):
    """Markdown answer -> the plain text a reader sees."""
    t = re.sub(r"\[([^\]]+)\]\([^)]+\)", r"\1", t)
    t = re.sub(r"[`*]", "", t)
    return " ".join(t.split())
faq_items = [(q.strip(), plain(a)) for q, a in re.findall(r"### (.+?)\n\n(.*?)(?=\n### |\Z)", FAQ, re.S)]
assert len(faq_items) == 10, len(faq_items)
faq_ld = {"@type": "FAQPage", "@id": SITE + "faq/#faq", "mainEntity": [
    {"@type": "Question", "name": q, "acceptedAnswer": {"@type": "Answer", "text": a}} for q, a in faq_items]}
add("/faq/", "FAQ: BC API Catalog for Business Central | bcapi.ai",
    "Answers about the BC API Catalog: licensing, localization, v3.0 versus v3.1, writable entities, read replica lag and Access Control limits.",
    "BC API Catalog FAQ", fix_links(faq_html), [DOCS_CRUMB, ("FAQ", "/faq/")], "faq", extra_ld=[faq_ld])

# ─────────────────────────── landing page ───────────────────────────
COLORS = ["#0F6CBD", "#0A7C85", "#6B4FC4", "#C10E72"]  # the catalog cells keep the original four colours by design
bars = ""
for n, c in enumerate(categories):
    cells = "".join('<i class="ro"></i>' if not e["editable"] else "<i></i>" for e in c["entities"])
    new = ' <small>new</small>' if all(e["v31only"] for e in c["entities"]) else ""
    bars += (f'<a href="/reference/{c["slug"]}/" style="--cc:{COLORS[n % 4]}"><span class="cn">{html.escape(c["name"])}{new}</span>'
             f'<span class="cells">{cells}</span><span class="ct"><b>{len(c["entities"])}</b> · {c["editable"]} rw</span></a>')

def ld(graph): return json.dumps({"@context": "https://schema.org", "@graph": graph}, ensure_ascii=False, separators=(",", ":")).replace("</", "<\\/")

LANDING_LD = [
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
]

header_tpl = (HERE / "partials" / "header.html").read_text()
footer_tpl = (HERE / "partials" / "footer.html").read_text()

# Stylesheet and script URLs carry a hash of their content, so a browser never pairs a new page with a cached old file.
import hashlib
def bust(html):
    for name in ("site.css", "site.js"):
        h = hashlib.sha1((HERE / name).read_bytes()).hexdigest()[:8]
        html = html.replace(f"/assets/{name}\"", f"/assets/{name}?v={h}\"")
    return html
page = bust((HERE / "template.html").read_text())

def dither(W=1920, H=900, start=0.05, end=0.95, touch=0.62, p=2.6, s_left=38, s_mid=12, s_right=26, angle=15):
    """Hero background: a classic halftone screen, as on a printed can. Ink dots sit on a hexagonal lattice and simply
    grow from left to right: tiny and widely spaced at the left edge, touching at `touch` of the ramp, then overlapping
    until only specks of paper survive between them at the right. There is no switch from dots to holes, so there is no
    seam: the paper specks on the right are the gaps the dots leave. The lattice spacing shrinks from s_left to s_mid at
    the touching point and widens again to s_right, so both sparse ends are also loosely spaced. One <g> holds the
    geometry; the one-column hero uses it rotated. Fills are inline custom properties, so the pattern follows the theme."""
    import math
    def ramp(x): return min(1, max(0, (x / W - start) / (end - start)))
    def spacing(t):
        return s_left - (s_left - s_mid) * (t / touch) ** 0.8 if t < touch else s_mid + (s_right - s_mid) * ((t - touch) / (1 - touch)) ** 0.8
    # The screen is a square lattice sheared to `angle`, as a printed halftone is, so the specks that survive between
    # overlapping dots run on a diagonal instead of lining up in columns. Dots touch at r = s/2 and the paper is gone
    # at the half-diagonal, r = s * sqrt(1 + tan(angle)^2 + ...) / 2, which the right-hand ramp runs up to slowly.
    shear = math.tan(math.radians(angle))
    gone = math.sqrt(1 + (1 + shear) ** 2) / 2
    def radius(t, sp):
        if t < touch: return sp * 0.5 * (t / touch) ** p
        return sp * (0.5 + (gone - 0.5) * ((t - touch) / (1 - touch)) ** 1.6)
    dots, x, phase = [], 0.0, 0.0
    while x < W:
        t = ramp(x); sp = spacing(t)
        if 0 < t < 1:
            r = radius(t, sp)
            if r >= 0.6:
                y = phase % sp - sp
                while y < H + sp:
                    dots.append(f'<circle cx="{x:.0f}" cy="{y:.0f}" r="{r:.1f}"/>'); y += sp
        phase += sp * shear; x += sp
    P, I = 'style="fill:var(--paper)"', 'style="fill:var(--ink)"'
    g = f'<g id="ht"><rect {P} width="{W}" height="{H}"/><rect {I} x="{W * end:.0f}" width="{W * (1 - end):.0f}" height="{H}"/><g {I}>{"".join(dots)}</g></g>'
    return (f'<svg class="defs" width="0" height="0" aria-hidden="true"><defs>{g}</defs></svg>'
            f'<svg class="h" viewBox="0 0 {W} {H}" preserveAspectRatio="xMinYMid slice" aria-hidden="true"><use href="#ht"/></svg>'
            f'<svg class="v" viewBox="0 0 {H} {W}" preserveAspectRatio="xMidYMin slice" aria-hidden="true"><use href="#ht" transform="rotate(90) translate(0 -{H})"/></svg>')
# Hero ticker: every entity with its verbs (the same rule as entity_html()).
def verbs(c, e):
    if not e["editable"]: return '<i class="get">GET</i><i class="ro">READ-ONLY</i>'
    if c["slug"] == "access-control": return '<i class="get">GET</i><i class="post">POST</i><i class="del">DEL</i>'
    return '<i class="get">GET</i><i class="post">POST</i><i class="patch">PATCH</i><i class="del">DEL</i>'
ticker = "".join(f'<span class="e">{esc(e["name"])}<span class="v">{verbs(c, e)}</span></span>' for c in categories for e in c["entities"])
ENTMAP = {k: [c["slug"], e["name"]] for k, (c, e) in ENT.items()}
for k, v in {
    "{{HEADER}}": header_tpl.replace("{{HDR_SCROLLED}}", ""), "{{FOOTER}}": footer_tpl,
    "{{TOTAL}}": str(total), "{{EDITABLE}}": str(editable), "{{READONLY}}": str(readonly), "{{NCATS}}": str(len(categories)),
    "{{APP_VERSION}}": APP_VERSION, "{{API_VERSION}}": API_VERSION, "{{BC_VERSION}}": BC_VERSION, "{{DATE}}": DATE,
    "{{DOWNLOAD_URL}}": DOWNLOAD_URL, "{{CAT_BARS}}": bars, "{{JSONLD}}": ld(LANDING_LD),
    "{{CAT_SLUGS_JSON}}": json.dumps([c["slug"] for c in categories]),
    "{{ENTMAP_JSON}}": json.dumps(ENTMAP, separators=(",", ":")),
    "{{TICKER}}": ticker, "{{DITHER}}": dither(),
}.items():
    page = page.replace(k, v)
assert "{{" not in page, re.findall(r"\{\{[A-Z_]+\}\}", page)
desc = re.search(r'<meta name="description" content="([^"]*)"', page).group(1)
assert len(desc) <= 160, (len(desc), desc)

# ─────────────────────────── write everything into docs/ ───────────────────────────
# Only files this script generates are written; docs/CNAME, the legal pages, robots.txt, icons and the
# hand-maintained assets (fonts, vendor, logos, consent.*) are never touched.
# The page folders are overwritten in place rather than deleted and recreated: docs/ lives in an iCloud-synced
# folder, and deleting a file that iCloud is still syncing brings it back as "index 2.html". Files that this run
# did not write are removed at the end, and so is any "name 2.html" duplicate iCloud has left anywhere in docs/.
GENERATED_DIRS = ["getting-started", "reference", "access-control", "schema", "changelog", "faq"]
WRITTEN = set()

def write(rel, text):
    p = OUT / rel
    p.parent.mkdir(parents=True, exist_ok=True)
    p.write_text(text)
    WRITTEN.add(p)

write("index.html", page)
(OUT / "assets").mkdir(exist_ok=True)
shutil.copyfile(HERE / "site.css", OUT / "assets" / "site.css")
shutil.copyfile(HERE / "site.js", OUT / "assets" / "site.js")

page_tpl = bust((HERE / "page.html").read_text())
for p in pages:
    url = SITE.rstrip("/") + p["path"]
    crumbs = "".join(
        (f'<li><a href="{u}">{esc(n)}</a></li>' if i < len(p["crumbs"]) - 1 else f'<li aria-current="page">{esc(n)}</li>')
        for i, (n, u) in enumerate(p["crumbs"]))
    bc = {"@type": "BreadcrumbList", "@id": url + "#breadcrumb", "itemListElement": [
        {"@type": "ListItem", "position": i, "name": n, "item": SITE.rstrip("/") + u} for i, (n, u) in enumerate(p["crumbs"], 1)]}
    out = page_tpl
    for k, v in {
        "{{HEADER}}": header_tpl.replace("{{HDR_SCROLLED}}", " scrolled"), "{{FOOTER}}": footer_tpl,
        "{{TABS}}": tabs_html(p["tab"]), "{{CRUMBS}}": crumbs, "{{JSONLD}}": ld([bc] + p["extra_ld"]),
        "{{PAGE_SCRIPTS}}": p["scripts"], "{{TITLE}}": esc(p["title"]), "{{DESC}}": esc(p["desc"]), "{{URL}}": url,
        "{{H1}}": esc(p["h1"]), "{{BODY}}": p["body"],
    }.items():
        out = out.replace(k, v)
    assert "{{" not in out.replace("{{base}}", "").replace("{{companyId}}", ""), (p["path"], re.findall(r"\{\{[A-Za-z_]+\}\}", out)[:5])
    write(p["path"].lstrip("/") + "index.html", out)

# catalog.json: the search index fetched lazily by /reference/ (name, table, page ID and field identifiers only)
search_index = {"total": total, "categories": [
    {"slug": c["slug"], "name": c["name"], "entities": [{"n": e["name"], "t": e["table"], "i": e["id"], "f": [[f[0], f[1]] for f in e["fields"]]} for e in c["entities"]]}
    for c in categories]}
write("catalog.json", json.dumps(search_index, ensure_ascii=False, separators=(",", ":")))

# sitemap.xml: every indexable page (the legal pages are noindex and stay out)
LASTMOD = datetime.datetime.strptime(DATE, "%B %d, %Y").date().isoformat()
urls = [SITE] + [SITE.rstrip("/") + p["path"] for p in pages]
write("sitemap.xml", '<?xml version="1.0" encoding="UTF-8"?>\n<urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">\n'
      + "".join(f"  <url>\n    <loc>{u}</loc>\n    <lastmod>{LASTMOD}</lastmod>\n  </url>\n" for u in urls) + "</urlset>\n")

llms = [f"# bcapi.ai: BC API Catalog v3", "",
        f"> Free, open source Business Central extension (MIT) that exposes {total} standard Microsoft Dynamics 365 Business Central tables as OData v4 API pages: {editable} read/write and {readonly} read-only. Every W1 field, localization-neutral, served at /v3.0/ and /v3.1/. Version {APP_VERSION}, by AJ Ansari.", "",
        "## Key links", "",
        f"- [Home and install]({SITE}): what it is, install steps, catalog overview",
        f"- [Getting Started]({SITE}getting-started/): install, permissions, authentication and first request",
        f"- [Reference]({SITE}reference/): every entity, source table, page ID, key and field, searchable",
        f"- [Access Control]({SITE}access-control/): users and permission-set assignment endpoints",
        f"- [Schema]({SITE}schema/): table relationship diagrams",
        f"- [FAQ]({SITE}faq/)",
        f"- [Changelog]({SITE}changelog/)",
        f"- [Source code and issues]({REPO})",
        f"- [Download the .app]({DOWNLOAD_URL})", "",
        "## API groups", ""]
for c in categories:
    names = ", ".join(e["name"] for e in c["entities"][:4])
    llms.append(f"- [{c['name']}]({SITE}reference/{c['slug']}/) ({c['group']}): {len(c['entities'])} entities, {c['editable']} read/write, e.g. {names}")
llms += ["", "## Notes", "",
         f"- URL pattern: https://api.businesscentral.dynamics.com/v2.0/<tenantId>/<environment>/api/OnlyCopilotFans/<apiGroup>/v{API_VERSION}/companies(<companyId>)/<entitySetName>",
         f"- Requires Business Central {BC_VERSION} or later (SaaS or on-premises). Request $metadata on any API group to discover fields.", ""]
write("llms.txt", "\n".join(llms))

for d in GENERATED_DIRS:
    for f in (OUT / d).rglob("*"):
        if f.is_file() and f not in WRITTEN: f.unlink()
    for e in sorted((OUT / d).rglob("*"), reverse=True):
        if e.is_dir() and not any(e.iterdir()): e.rmdir()
for f in OUT.rglob("* [0-9].html"):
    f.unlink()

print(f"wrote docs/index.html ({len(page):,} bytes) + {len(pages)} pages + catalog.json · {total} entities · "
      f"{sum(len(e['fields']) for c in categories for e in c['entities']):,} fields · app {APP_VERSION} · {DATE}")
