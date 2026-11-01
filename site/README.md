# bcapi.ai: the website for the BC API Catalog

The site is static HTML served by GitHub Pages from `main:/docs`. This folder (`site/`, at the repository root, outside the published root) holds the build sources, so none of them is publicly served. `docs/` holds only the output and the hand-maintained files.

Pages (directory-index URLs, canonical origin `https://bcapi.ai/`):

| URL | Content |
|---|---|
| `/` | Landing page: hero, catalog table, How to deploy |
| `/getting-started/`, `/access-control/`, `/schema/`, `/changelog/`, `/faq/` | One real page per documentation tab |
| `/reference/` | Hub: the 9 categories with entity counts, links to every entity, client-side search |
| `/reference/<category-slug>/` (9) | Every entity of the category, fully rendered in the HTML (description, URL, operations, full field table). Each entity has an anchor id equal to its name, e.g. `/reference/master-data/#ocpfCustomers` |

Old hash links (`#docs`, `#docs/reference/<entity>`, `#docs/reference/<category>`, `#docs/<tab>`) are redirected to these paths by a small script in the head of `/`. `#install` and `#deploy` point at the How to deploy section of the landing page.

## Rebuilding after a release

`docs/` output is generated. Do not edit generated files by hand; edit the inputs and rebuild:

```
python3 site/build.py
```

Needs Python 3 and Node (`npx` fetches `marked` 12.0.2 to convert the Markdown sections; set `MARKED_CMD` to a local command, for example `node /path/to/marked/bin/marked.js --gfm`, to run offline).

| Input | Feeds |
|---|---|
| `app.json` | App version, download button (the `.app` in the repo root must exist) |
| `Documentation/Documentation.md` | Reference pages (every entity and field), Access Control page, counts on the landing page |
| `Documentation/ChangeLog.md` | Changelog page |
| `Documentation/BC_Table_Relationship_Schema.md` | Schema page (Mermaid, rendered in the browser) |
| `site/template.html` | Landing page markup and the hash-redirect shim |
| `site/page.html` | Shared layout of every documentation page |
| `site/partials/header.html`, `footer.html` | Shared header and footer navigation |
| `site/site.css`, `site/site.js` | Styles and scripts, copied to `docs/assets/` |
| `site/build.py` | Getting Started and FAQ text, the hero ticker (every entity with its verbs), and the build itself |

`build.py` writes into `docs/`: `index.html`, the page folders `getting-started/`, `reference/`, `access-control/`, `schema/`, `changelog/`, `faq/`, `catalog.json` (the search index fetched lazily by `/reference/`), `sitemap.xml` (all pages; the legal pages are left out), `llms.txt`, and `assets/site.css` and `assets/site.js`. It overwrites those six page folders in place (never delete-and-recreate: the folder is iCloud-synced, and that produced `index 2.html` duplicates), removes any file in them it did not write, and removes any `name 2.html` iCloud duplicate under `docs/`. It never touches `docs/CNAME`, the legal pages, `robots.txt`, `404.html`, the icons, `site.webmanifest` or the rest of `docs/assets/`.

Each page carries one H1, a unique title and description, a self-referencing canonical, Open Graph and Twitter tags, and BreadcrumbList JSON-LD. `/` carries WebSite, Person, SoftwareApplication and SoftwareSourceCode; `/faq/` carries FAQPage.

Hand-maintained in `docs/`: `robots.txt`, `404.html`, `site.webmanifest`, `favicon.ico`, `apple-touch-icon.png`, `icon-192.png`, `icon-512.png` (derived from `assets/app-logo.png`), `assets/` (logos, `og-image.png`, `consent.js`, `consent.css`, `fonts.css`) and the three legal pages.

## Self-hosted assets (no third-party requests)

| Path | What |
|---|---|
| `docs/assets/fonts/*.woff2`, `docs/assets/fonts.css` | Archivo, Inter and JetBrains Mono, latin subset, variable weights, `font-display: swap`; the Archivo face is preloaded |
| `docs/assets/vendor/mermaid.min.js` | Mermaid 11.4.0, loaded only on `/schema/` |
| `docs/assets/vendor/cookieconsent.{css,umd.js}` | vanilla-cookieconsent 3.1.0 |

No SRI attributes are needed for self-hosted files. To upgrade a library, replace the file in `docs/assets/vendor/`.

## Publishing on GitHub Pages

Settings → Pages → Source: *Deploy from a branch*, branch `main`, folder `/docs`. `docs/CNAME` holds `bcapi.ai`, so the site is served at **https://bcapi.ai/** (HTTPS enforced) and that is the canonical origin. The old `https://ajansari.github.io/ocpfBCAPIsV3/` URL, `www.bcapi.ai` and plain `http://` all 301 to it. Use `https://bcapi.ai/` for every absolute URL (canonical, `og:url`, `og:image`, sitemap, JSON-LD).

## Cookies and legal pages

Cookie consent uses vanilla-cookieconsent v3 (self-hosted), configured in `docs/assets/consent.js` and themed in `docs/assets/consent.css`. It is opt-in: the analytics category is **off by default** and stays off until the visitor clicks **Accept**. Accept and Reject have equal visual weight, and the visitor can change the choice from the **Cookie settings** button in the footer. **No analytics service is wired in and no loader exists**; if you add one, load it only inside `applyConsent()` when analytics is true, and update the policies at the same time.

Hosting on GitHub Pages is the only third party contacted when a page loads, and it still receives the visitor's IP address. Fonts, the consent library and Mermaid are served from bcapi.ai itself.

`docs/privacy-policy.html`, `terms-of-service.html` and `cookie-policy.html` are hand-written static pages (not built by `build.py`) copied from bctools.ai and reworded for this site. Their head and footer link to the self-hosted assets and the documentation pages. The terms of service content is unchanged.
