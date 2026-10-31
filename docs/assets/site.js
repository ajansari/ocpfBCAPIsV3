/* Shared by every generated page (landing and documentation). */
(function () {
  var root = document.documentElement;

  /* Theme toggle. */
  var btn = document.getElementById('themeToggle');
  if (btn) {
    var label = function () {
      var t = root.getAttribute('data-theme') !== 'light' ? 'Switch to day mode' : 'Switch to night mode';
      btn.setAttribute('aria-label', t); btn.setAttribute('title', t);
    };
    btn.addEventListener('click', function () {
      var next = root.getAttribute('data-theme') === 'light' ? 'dark' : 'light';
      root.setAttribute('data-theme', next);
      try { localStorage.setItem('bcapi-theme', next); } catch (e) {}
      label();
    });
    label();
  }
  var yr = document.getElementById('year'); if (yr) yr.textContent = new Date().getFullYear();

  /* Every external link opens in a new tab. */
  Array.prototype.forEach.call(document.querySelectorAll('a[href]'), function (a) {
    if (a.host && a.host !== location.host && /^https?:/.test(a.protocol)) { a.target = '_blank'; a.rel = (a.rel ? a.rel + ' ' : '') + 'noopener'; }
  });

  /* Open the entity (<details>) that the URL fragment points at. */
  function openTarget() {
    var id; try { id = decodeURIComponent(location.hash.slice(1)); } catch (e) { return; }
    var el = id && document.getElementById(id);
    if (el && el.tagName === 'DETAILS') { el.open = true; el.scrollIntoView(); }
  }
  openTarget();
  window.addEventListener('hashchange', openTarget);

  /* Reference hub: search every entity, table, page ID and field. catalog.json is fetched on first use. */
  var input = document.getElementById('ref-search'), list = document.getElementById('ref-results');
  if (input && list) {
    var hub = document.getElementById('ref-hub'), count = document.getElementById('ref-count'), data = null, loading = false;
    var esc = function (s) { return String(s).replace(/[&<>"]/g, function (c) { return { '&': '&amp;', '<': '&lt;', '>': '&gt;', '"': '&quot;' }[c]; }); };
    var load = function (cb) {
      if (data) return cb();
      if (loading) return;
      loading = true;
      fetch('/catalog.json').then(function (r) { return r.json(); }).then(function (j) { data = j; cb(); })
        .catch(function () { loading = false; count.textContent = 'Search is unavailable right now; browse the categories below.'; });
    };
    var run = function () {
      var q = input.value.trim().toLowerCase();
      if (!q) { list.innerHTML = ''; hub.hidden = false; count.textContent = ''; return; }
      var html = '', n = 0, total = 0;
      data.categories.forEach(function (c) {
        c.entities.forEach(function (e) {
          var hit = e.n.toLowerCase().indexOf(q) >= 0 || e.t.toLowerCase().indexOf(q) >= 0 || String(e.i) === q;
          for (var k = 0; !hit && k < e.f.length; k++) hit = e.f[k][0].toLowerCase().indexOf(q) >= 0 || e.f[k][1].toLowerCase().indexOf(q) >= 0;
          if (!hit) return;
          total++;
          if (n < 100) { n++; html += '<li><a href="/reference/' + c.slug + '/#' + esc(e.n) + '">' + esc(e.n) + '</a><small>' + esc(e.t) + ' · page ' + e.i + ' · ' + esc(c.name) + '</small></li>'; }
        });
      });
      hub.hidden = true;
      list.innerHTML = html || '<li class="empty">Nothing matches. Try an entity name, a BC table name, a page ID or a field identifier.</li>';
      count.textContent = total + ' of ' + data.total + ' endpoints' + (total > n ? ' (showing ' + n + ')' : '');
    };
    input.addEventListener('focus', function () { load(function () {}); });
    input.addEventListener('input', function () { load(run); });
  }
})();
