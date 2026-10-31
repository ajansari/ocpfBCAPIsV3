// Cookie consent for bcapi.ai (vanilla-cookieconsent v3). Shared by every page.
// Opt-in: the analytics category is OFF until the visitor clicks Accept. Accept and Reject carry equal weight.
// The visitor can change the choice at any time from the "Cookie settings" button pinned in the footer.
// No analytics loader exists today. If one is ever added, load it only inside applyConsent when analytics is true,
// and update the privacy and cookie policies at the same time.
CookieConsent.run({
  guiOptions: {
    consentModal: { layout: 'bar inline', position: 'bottom', equalWeightButtons: true, flipButtons: false },
    preferencesModal: { layout: 'box', equalWeightButtons: true, flipButtons: false }
  },
  cookie: { name: 'bcapi_cc', expiresAfterDays: 182 },
  categories: {
    necessary: { enabled: true, readOnly: true },
    analytics: {
      enabled: false,
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
          description: 'bcapi.ai sets only the cookies it needs to work. Anonymous usage statistics stay off unless you accept them, and no analytics service is connected today. Change your choice any time from Cookie settings in the footer.',
          acceptAllBtn: 'Accept',
          acceptNecessaryBtn: 'Reject',
          showPreferencesBtn: 'Settings',
          footer: '<a href="/privacy-policy.html">Privacy Policy</a> <a href="/cookie-policy.html">Cookie Policy</a>'
        },
        preferencesModal: {
          title: 'Cookie preferences',
          acceptAllBtn: 'Accept all',
          acceptNecessaryBtn: 'Reject all',
          savePreferencesBtn: 'Save preferences',
          closeIconLabel: 'Close',
          sections: [
            { title: 'How we use cookies', description: 'bcapi.ai uses a small number of cookies. Strictly necessary cookies keep the site working, such as remembering your theme and your cookie choices. Analytics cookies would help us understand which parts of the catalog people find useful; they are off unless you accept them, and no analytics service is connected today. See the <a href="/cookie-policy.html">Cookie Policy</a> for details.' },
            { title: 'Strictly necessary', description: 'Required for the site to work. These cannot be switched off.', linkedCategory: 'necessary' },
            { title: 'Analytics', description: 'Anonymous usage statistics that would tell us which pages are visited. Off by default; switch it on only if you want to allow it. No analytics service is wired in at present.', linkedCategory: 'analytics' },
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
  // No analytics loader exists. Example for the future, only when allowed:
  // if (analytics && !window.__analyticsLoaded) { window.__analyticsLoaded = true; /* inject loader here */ }
}
