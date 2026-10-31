# bcapi.ai — the website for the BC API Catalog

`index.html` is the whole site in one file: the landing page (night mode by default, day mode on the toggle) with an **Install** button and a **Documentation** button, and the documentation view behind `#docs` with tabs for Getting Started, Reference, Access Control, Schema, Changelog and FAQ. Images are inlined, so the file has no dependencies beyond Google Fonts, the cookie consent library (jsDelivr) and Mermaid (cdnjs) for the schema diagram. The jsDelivr and cdnjs tags are pinned to exact versions and carry SRI hashes; recompute the hash when you change a version.

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
| `docs/assets/` | App icon, brand logos (inlined as base64), `og-image.png` (social preview, served as a file) |

`build.py` also writes `sitemap.xml` and `llms.txt` and emits the JSON-LD block (WebSite, SoftwareApplication, SoftwareSourceCode, FAQPage from the visible FAQ) into the page head. Static files maintained by hand: `robots.txt`, `404.html`, `site.webmanifest`, `favicon.ico`, `apple-touch-icon.png`, `icon-192.png`, `icon-512.png` (icons are derived from `assets/app-logo.png`).

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

Settings → Pages → Source: *Deploy from a branch*, branch `main`, folder `/docs`. `docs/CNAME` holds `bcapi.ai`, so the site is served at **https://bcapi.ai/** (HTTPS enforced) and that is the canonical origin. The old `https://ajansari.github.io/ocpfBCAPIsV3/` URL, `www.bcapi.ai` and plain `http://` all 301 to it. Use `https://bcapi.ai/` for every absolute URL (canonical, `og:url`, `og:image`, sitemap, JSON-LD).

## Cookies and legal pages

Cookie consent uses [vanilla-cookieconsent](https://github.com/orestbida/cookieconsent) v3 from jsDelivr, configured in `assets/consent.js` and themed in `assets/consent.css` (shared by every page). The analytics category is on by default and the visitor can opt out from the banner or from the **Cookie settings** button in the footer. No analytics script is wired yet; add the loader inside `applyConsent()` when you have one, and update the policies at the same time.

Third parties contacted when a page loads (each sees the visitor's IP address, and the policies disclose them): GitHub Pages (hosting), Google Fonts (Archivo, Inter, JetBrains Mono), jsDelivr (cookie consent library) and cdnjs/Cloudflare (Mermaid, index page only).

`privacy-policy.html`, `terms-of-service.html` and `cookie-policy.html` are static pages (not built by `build.py`) copied from bctools.ai and reworded for this site.
