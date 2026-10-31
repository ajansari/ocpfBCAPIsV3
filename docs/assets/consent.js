// Cookie consent for bcapi.ai (vanilla-cookieconsent v3). Shared by every page.
// Analytics is opted in by default; the visitor can opt out at any time from the banner,
// or later from the "Cookie settings" button pinned in the footer.
// To wire up analytics, add your loader inside applyConsent below.
CookieConsent.run({
  guiOptions: {
    consentModal: { layout: 'bar inline', position: 'bottom', equalWeightButtons: true, flipButtons: false },
    preferencesModal: { layout: 'box', equalWeightButtons: true, flipButtons: false }
  },
  cookie: { name: 'bcapi_cc', expiresAfterDays: 182 },
  categories: {
    necessary: { enabled: true, readOnly: true },
    analytics: {
      enabled: true,
      readOnly: false,
      autoClear: { cookies: [{ name: /^_ga/ }, { name: '_gid' }] }
    }
  },
  onConsent: function (p) { applyConsent(p.cookie.categories); },
  onChange: function (p) { applyConsent(p.cookie.categories); },
  language: {
    default: 'en',
    translations: {
      en: {
        consentModal: {
          title: 'Cookies on bcapi.ai',
          description: 'This site uses cookies for anonymous usage stats. Opt out any time from Cookie settings in the footer.',
          acceptAllBtn: 'OK',
          acceptNecessaryBtn: 'Opt out',
          showPreferencesBtn: 'Settings',
          footer: '<a href="privacy-policy.html">Privacy Policy</a> <a href="cookie-policy.html">Cookie Policy</a>'
        },
        preferencesModal: {
          title: 'Cookie preferences',
          acceptAllBtn: 'Accept all',
          acceptNecessaryBtn: 'Opt out of all',
          savePreferencesBtn: 'Save preferences',
          closeIconLabel: 'Close',
          sections: [
            { title: 'How we use cookies', description: 'bcapi.ai uses a small number of cookies. Strictly necessary cookies keep the site working, such as remembering your theme and your cookie choices. Analytics cookies help us understand which parts of the catalog people find useful. See the <a href="cookie-policy.html">Cookie Policy</a> for details.' },
            { title: 'Strictly necessary', description: 'Required for the site to work. These cannot be switched off.', linkedCategory: 'necessary' },
            { title: 'Analytics', description: 'Anonymous usage statistics that tell us which pages are visited. Switched on by default; turn it off to opt out.', linkedCategory: 'analytics' },
            { title: 'More information', description: 'Questions about cookies or privacy? Email <a href="mailto:aj@onlycopilotfans.com">aj@onlycopilotfans.com</a>.' }
          ]
        }
      }
    }
  }
});

function applyConsent(categories) {
  var analytics = categories.indexOf('analytics') !== -1;
  document.documentElement.setAttribute('data-analytics', analytics ? 'on' : 'off');
  // Example: load an analytics script only when allowed.
  // if (analytics && !window.__analyticsLoaded) { window.__analyticsLoaded = true; /* inject loader here */ }
}
