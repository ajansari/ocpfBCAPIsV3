# bcapi.ai — the website for the BC API Catalog

`index.html` is the whole site in one file: the landing page (night mode by default, day mode on the toggle) with an **Install** button and a **Documentation** button, and the documentation view behind `#docs` with tabs for Getting Started, Reference, Access Control, Schema, Changelog and FAQ. Images are inlined, so the file has no dependencies beyond Google Fonts and the Mermaid CDN for the schema diagram.

## Rebuilding after a release

`index.html` is generated. Do not edit it by hand; edit the inputs and rebuild:

```
python3 docs/build.py
```

Inputs (all in this repository):

| Input | Feeds |
|---|---|
| `app.json` | App version, download button (the `.app` in the repo root must exist) |
| `Documentation/Documentation.md` | Reference tab (every entity and field, parsed into the embedded catalog JSON), Access Control tab, counts on the landing page |
| `Documentation/ChangeLog.md` | Changelog tab |
| `Documentation/BC_Table_Relationship_Schema.md` | Schema tab (Mermaid rendered in the browser) |
| `docs/template.html` | Markup, styles and scripts of both views |
| `docs/build.py` | Getting Started and FAQ text, and the build itself |
| `docs/assets/` | App icon, brand logos, favicon (inlined as base64) |

Needs Python 3 and Node (`npx` fetches `marked` to convert the Markdown sections).

## Links

| Hash | Opens |
|---|---|
| `#install` | Install section of the landing page |
| `#docs` | Documentation, Getting Started tab |
| `#docs/reference/ocpfCustomers` | Reference tab with that entity expanded |
| `#docs/reference/master-data` | Reference tab scrolled to a category |
| `#docs/changelog`, `#docs/faq`, … | The other tabs |

## Publishing on GitHub Pages

Settings → Pages → Source: *Deploy from a branch*, branch `main`, folder `/docs`. The site is served at `https://ajansari.github.io/ocpfBCAPIsV3/`. The `bcapi.ai` domain is a 301 redirect to that URL (no `CNAME` file here), so use `bcapi.ai` only as the site's name: every absolute link must use the GitHub Pages URL, never `https://bcapi.ai/<path>`.

## Cookies and legal pages

Cookie consent uses [vanilla-cookieconsent](https://github.com/orestbida/cookieconsent) v3 from jsDelivr, configured in `assets/consent.js` and themed in `assets/consent.css` (shared by every page). Analytics is opted in by default and the visitor can opt out from the banner or from the **Cookie settings** button in the footer. No analytics script is wired yet; add the loader inside `applyConsent()` when you have one.

`privacy-policy.html`, `terms-of-service.html` and `cookie-policy.html` are static pages (not built by `build.py`) copied from bctools.ai and reworded for this site.
